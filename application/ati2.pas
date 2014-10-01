unit ati2;

interface
uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api,
     OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, IEAddress,  Mshtml_Ewb, ExtCtrls, Controls,
     GRUtils, GRString, cefvcl, ceflib, JvInterpreterFm,JvJCLUtils, JvInterpreter, GR32_Image, uBrowser,
     IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdMultipartFormData, JPEG;

type

  TOperationObject = record
    id:String;
    selector:String;
  end;

  TTicket = class(TObject)
    _class:TFMClass;
  end;

  TOperationObjectClass = class(TObject)
    id:String;
    selector:String;
  end;

  TLog = class(TObject)
    sl:TStringList;
    constructor Create;
    procedure Add(s:String);
    procedure Save;
  end;

  TOperProc = procedure(params:TOperationObject) of object;
  TEndProcess = procedure();

  TOnAutorizCode = procedure(var Code:String) of object;
  TOnCaptcha = procedure(oper_code:Integer) of object;
  TOnOperProgress = procedure(Stage1,Stage2:String) of object;

  TGetTickOption = record
    FromGeo:String;
    FromRadius:Integer;
    ToGeo:String;
    ToRadius:Integer;
    WeightEnd:Integer;
    VolumeEnd:Integer;
    DateBegin:TDate;
    DateEnd:TDate;
    LoadType:Integer;
  end;

  TATI = class(TComponent)
  private
    FOnAutorizCode: TOnAutorizCode;
    FOnEndGetTickets: TNotifyEvent;
    FOnCaptcha: TOnCaptcha;
    FOnOperProgress: TOnOperProgress;
    procedure SetOnAutorizCode(const Value: TOnAutorizCode);
    procedure SetOnEndGetTickets(const Value: TNotifyEvent);
    procedure SetOnCaptcha(const Value: TOnCaptcha);
    procedure SetOnOperProgress(const Value: TOnOperProgress);

  protected
    _proc:TEndProcess;
    ip:TJvInterpreterFm;
    _frame:ICefFrame;

    curr_page:Integer;
    page_count:Integer;
    contact_count:Integer;
    contact_curr:Integer;
    curr_ticket:TTicket;
    OperStack: array of TOperationObject;

    procedure _load(selector,url:String);

    function StringToByteString(str:String):String;
    function CreateGetTickUrl(option: TGetTickOption): String;
    procedure _OperProgress(Stage1,Stage2:String);

    procedure DoChromiumLoadEnd(Sender: TObject; const browser: ICefBrowser;
                  const frame: ICefFrame; httpStatusCode: Integer;
                      out Result: Boolean);

    procedure Do_ChromiumLoadEnd(Sender: TObject; const browser: ICefBrowser;
                  const frame: ICefFrame; httpStatusCode: Integer;
                      out Result: Boolean);

    procedure DoChromiumConsoleMessage(Sender: TObject;
                  const browser: ICefBrowser; message, source: ustring; line: Integer;
                      out Result: Boolean);

    procedure DoipGetValue(Sender: TObject;
                  Identifier: String; var Value: Variant; Args: TJvInterpreterArgs;
                      var Done: Boolean);

    procedure DoipSetValue(Sender: TObject;
                  Identifier: String; const Value: Variant; Args: TJvInterpreterArgs;
                      var Done: Boolean);

    procedure tmCapchaServiceTimer(Sender: TObject);

    procedure tmLoadTimer(Sender: TObject);
    procedure timer1Timer(Sender: TObject);

  public
    _log:TLog;

    login_s:String;
    passw_s:String;
    logined:Boolean;

    sel_ticket:TFMClass;

    GetTickOption:TGetTickOption;
    GetTickResult:TFMClass;

    StopFlag: Boolean;

    _capcha_img:String;
    capcha:Boolean;
    capcha_code:String;

    _Chromium:TChromium;
    _idHTTP:TidHTTP;

    _tmCapchaService:TTimer;
    _tmLoadService:TTimer;
    _timer1:TTimer;

    _ro:TOperationObject;

    _capcha_id:String;
    _capcha_fn:String;
    _capcha_count:Integer;
    _capcha_re_count:Integer;

    _last_url:String;

    _loading_url:String;

    Chromium: {$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF};
    PaintBox: TPaintBox32;

    property OnAutorizCode:TOnAutorizCode read FOnAutorizCode write SetOnAutorizCode;
    property OnEndGetTickets:TNotifyEvent read FOnEndGetTickets write SetOnEndGetTickets;
    property OnCaptcha:TOnCaptcha read FOnCaptcha write SetOnCaptcha;
    property OnOperProgress:TOnOperProgress read FOnOperProgress write SetOnOperProgress;

    procedure SetChromium(aChromium:{$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF});
    procedure Set_Chromium(aChromium:TChromium);

    procedure _process(OperationObject:TOperationObject);

    procedure login(a_login,a_passw:String; proc:TEndProcess);
    procedure GetTickets;
    procedure GetContacts(aTicket:TFMClass);

    procedure PushOperStack(OperationObject:TOperationObject);
    procedure PopOperStack;
    procedure ClearOperStack;

    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
  end;

var
  ati_service:TATI;

const GetTickOptionDefault:TGetTickOption = ( FromGeo: '';
                                              FromRadius: -1;
                                              ToGeo: '';
                                              ToRadius: -1;
                                              WeightEnd: -1;
                                              VolumeEnd: -1;
                                              DateBegin: 0;
                                              DateEnd: 0);

implementation
uses uMainForm;
{ TATI }


{ TATI }

constructor TATI.Create(AOwner: TComponent);
begin
  inherited;
  logined:= False;

  FOnAutorizCode:= nil;
  FOnEndGetTickets:= nil;
  FOnCaptcha:= nil;
  FOnOperProgress:= nil;

  StopFlag:= False;

  Setlength(OperStack,0);

  ip:= TJvInterpreterFm.Create(Self);
  ip.OnGetValue:= DoipGetValue;
  ip.OnSetValue:= DoipSetValue;

  PaintBox:= nil;

  _Chromium:= nil;
  _idHTTP:= nil;

  _tmCapchaService:= TTimer.Create(Self);
  _tmCapchaService.Enabled:= False;
  _tmCapchaService.Interval:= 1000*10;
  _tmCapchaService.OnTimer:= tmCapchaServiceTimer;

  _tmLoadService:= TTimer.Create(Self);
  _tmLoadService.Enabled:= False;
  _tmLoadService.Interval:= 1000*60;
  _tmLoadService.OnTimer:= tmLoadTimer;

  _timer1:= TTimer.Create(Self);
  _timer1.Enabled:= False;
  _timer1.Interval:= 1000*30;
  _timer1.OnTimer:= timer1Timer;

  _log:= TLog.Create;

  capcha_code:= '';
  _capcha_count:= 0;
  _capcha_re_count:= 0;
end;

function TATI.CreateGetTickUrl(option: TGetTickOption): String;
var Year,Month,Day,DOW:Word;
    _lt:String;
begin
  Result:= 'http://ati.su/Tables/Default.aspx?EntityType=Load';
  Result:= Result + '&FromGeo=' + ReplaceSymb(option.FromGeo,'%20',' ');
  Result:= Result + '&ToGeo=' + ReplaceSymb(option.ToGeo,'%20',' ');
  Result:= Result + '&FromGeoRadius=' + IntToStr(option.FromRadius);
  Result:= Result + '&ToGeoRadius=' + IntToStr(option.ToRadius);
  _lt:= '4';
  if option.LoadType = 0 then
    _lt:= '4';
  if option.LoadType = 1 then
    _lt:= '7';
  Result:= Result + '&CarType=115&LoadType=' + _lt;
  if option.WeightEnd > 0 then 
    Result:= Result + '&Weight2=' + IntToStr(option.WeightEnd);
  if option.VolumeEnd > 0 then
    Result:= Result + '&Volume2=' + IntToStr(option.VolumeEnd);

  if option.DateBegin <> 0 then
  begin
    DecodeDate(option.DateBegin,Year,Month,Day);
    Result:= Result + '&FirstDate=' + IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
  end;

  if option.DateEnd <> 0 then
  begin
    DecodeDate(option.DateEnd,Year,Month,Day);
    Result:= Result + '&FirstDate2=' + IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);
  end;

  Result:= Result + '&ExactFromGeos=true&ExactToGeos=true&qdsv=-1&SortingType=2&PageSize=100';
end;

destructor TATI.Destroy;
begin
  inherited;
end;


procedure TATI.GetTickets;
var oo:TOperationObject;
begin
  FreeAndNil(GetTickResult);
  _capcha_count:= 0;
  _capcha_re_count:= 0;
  GetTickResult:= TFMClass.Create(nil);
  GetTickResult.CreateClassItem('items','');
  oo.id:= '_tickets1';
  oo.selector:= 'task';
  PushOperStack(oo);
  curr_page:= 1;
  page_count:= 1;
  login(login_s,passw_s,nil);
end;


procedure TATI.GetContacts(aTicket:TFMClass);
var oo:TOperationObject;
begin
  contact_count:= 0;
  contact_curr:= 0;
  curr_ticket:= TTicket.Create();
  curr_ticket._class:= aTicket;
  oo.id:= '_contacts1';
  oo.selector:= 'http';
  PushOperStack(oo);
  sel_ticket:= aTicket;
  login(login_s,passw_s,nil);
end;



procedure TATI.login(a_login,a_passw:String; proc:TEndProcess);
var oo:TOperationObject;
begin
  _proc:= proc;

  login_s:= a_login;
  passw_s:= a_passw;

  oo.id:= '_login0';
  _process(oo);
end;

procedure TATI.PopOperStack;
var oo,oo1:TOperationObject;
    i:Integer;
    b:Boolean;
begin
  if Length(OperStack) = 0 then Exit;

  oo:= OperStack[Length(OperStack)-1];
  SetLength(OperStack,Length(OperStack)-1);
  if oo.selector = 'script' then
  begin
    for i:=0 to Length(OperStack) - 1 do
    begin
      b:= True;
      oo1:= OperStack[i];
      if oo1.selector = 'script' then
      begin
        b:= False;
        Break;
      end;
    end;
    if b then
      _process(oo);
  end
  else
    _process(oo);
end;

procedure TATI.PushOperStack(OperationObject: TOperationObject);
begin
  SetLength(OperStack,Length(OperStack)+1);
  OperStack[Length(OperStack)-1]:= OperationObject;
end;

procedure TATI.SetOnAutorizCode(const Value: TOnAutorizCode);
begin
  FOnAutorizCode := Value;
end;

procedure TATI.SetOnEndGetTickets(const Value: TNotifyEvent);
begin
  FOnEndGetTickets := Value;
end;


procedure TATI.SetOnCaptcha(const Value: TOnCaptcha);
begin
  FOnCaptcha := Value;
end;

procedure TATI.SetOnOperProgress(const Value: TOnOperProgress);
begin
  FOnOperProgress := Value;
end;

procedure TATI._OperProgress(Stage1, Stage2: String);
begin
  if Assigned(OnOperProgress) then
    OnOperProgress(Stage1,Stage2);
end;

procedure TATI.ClearOperStack;
begin
  SetLength(OperStack,0);
end;

function TATI.StringToByteString(str: String): String;
var i:Integer;
begin
  Result:= '';
  for i:= 1 to Length(str) do
    Result:= Result + IntToStr(Ord(str[i]));
end;

procedure TATI._process(OperationObject: TOperationObject);
var oo:TOperationObject;
    s:String;
    k:Integer;
    capfile:TIdMultiPartFormDataStream;
    response:String;
begin
  _timer1.Enabled:= False;

  if OperationObject.id = '_login0' then
  begin
    oo.id:= '_login1';
    oo.selector:= 'http';
    PushOperStack(oo);
    _ro.id:= '_login0';
    _timer1.Enabled:= True;
    _OperProgress('ati.su','авторизация');
    _log.Add('http://ati.su/Login/Login.aspx');
    _load('http','http://ati.su/Login/Login.aspx');
  end;

  if OperationObject.id = '_login1' then
  begin
    oo.id:= '_login2';
    oo.selector:= 'script';
    PushOperStack(oo);
    oo.id:= '_login2';
    oo.selector:= 'script';
    PushOperStack(oo);
    _ro.id:= '_login1';
    _timer1.Enabled:= True;
    _log.Add('http://yandex.st/jquery/1.8.2/jquery.min.js');
    _load('script','http://yandex.st/jquery/1.8.2/jquery.min.js');
    _log.Add('http://divan-nn.ru/__ati.js');
    _load('script','http://divan-nn.ru/__ati.js');
  end;

  if OperationObject.id = '_login2' then
  begin
    _log.Add('__login()');
    _frame.ExecuteJavaScript('__login("' + login_s + '","' + passw_s + '");','',1);
  end;

  if OperationObject.id = '_login3' then
  begin
    oo.id:= '_login4';
    oo.selector:= 'script';
    PushOperStack(oo);
    oo.id:= '_login4';
    oo.selector:= 'script';
    PushOperStack(oo);
    _ro.id:= '_login3';
    _timer1.Enabled:= True;
    _log.Add('http://yandex.st/jquery/1.8.2/jquery.min.js');
    _load('script','http://yandex.st/jquery/1.8.2/jquery.min.js');
    _log.Add('http://divan-nn.ru/__ati.js');
    _load('script','http://divan-nn.ru/__ati.js');
  end;

  if OperationObject.id = '_login4' then
  begin
    _log.Add('__login()');
    _frame.ExecuteJavaScript('__login();','',1);
  end;

  if OperationObject.id = '_login_ok' then
  begin
    _OperProgress('','');
    if Assigned(_proc) then
      _proc();
    PopOperStack;
  end;

  if OperationObject.id = '_tickets_capcha_error' then
  begin
    _log.Add('_tickets_capcha_error');
    if Assigned(OnCaptcha) then
    begin
      OnCaptcha(0);
    end;
  end;

  if OperationObject.id = '_tickets_capcha1' then
  begin
    Inc(_capcha_count);
    if _capcha_count <= 3 then
    begin
      s:= CreateGetTickUrl(GetTickOption) + '&PageNumber=' + IntToStr(curr_page);
      oo.id:= '_tickets_capcha2';
      oo.selector:= 'http';
      PushOperStack(oo);
      _OperProgress('','Капча, обновляем страницу ...');
      _log.Add('_tickets_capcha1');
      _load('http',s);
    end
    else
    begin
      Inc(_capcha_re_count);
      if _capcha_re_count <= 3 then
      begin
        _capcha_count:= 0;
        _ro.id:= '_tickets_capcha1';
        _timer1.Enabled:= True;
      end
      else
      begin
        OperationObject.id:= '_tickets_capcha_error';
        _process(OperationObject);
      end;
    end;
  end;

  if OperationObject.id = '_tickets_capcha2' then
  begin
    oo.id:= '_tickets_capcha3';
    oo.selector:= 'script';
    PushOperStack(oo);
    _ro.id:= '_tickets_capcha1';
    _timer1.Enabled:= True;
    _log.Add('http://divan-nn.ru/__ati.js');
    _load('script','http://divan-nn.ru/__ati.js');
  end;

  if OperationObject.id = '_tickets_capcha3' then
  begin
    _capcha_img:= '';
    capcha:= False;
    capcha_code:= '';
    _log.Add('__tickets_capcha();');
    _frame.ExecuteJavaScript('__tickets_capcha();','',1);
  end;

  if OperationObject.id = '_tickets_capcha4' then
  begin
    _log.Add('http://ati.su' + _capcha_img);
    _Chromium.Load('http://ati.su' + _capcha_img);
  end;

  if OperationObject.id = '_tickets_capcha5' then
  begin
    capfile:= TIdMultiPartFormDataStream.Create;
    capfile.AddFormField('method','post');
    capfile.AddFile('file',AppDir + 'tmp_files\' + _capcha_fn,'application/octet-stream');
    capfile.AddFormField('key','c3b21928935b7e9df52f8c77939b068c');
    while True do
    begin
      response:= _idHTTP.Post('http://antigate.com/in.php',capfile);
      if response <> 'ERROR_NO_SLOT_AVAILABLE' then
        Break;
    end;
    if GetFirstChar(response,'OK|',1,False,s) > 0 then
    begin
      k:= GetFirstChar(response,'|',1,False,s);
      GetFirstChar(response,'|',k+1,False,_capcha_id);
      _log.Add('http://antigate.com/in.php');
      _OperProgress('','Ждем капчу... ');
      _tmCapchaService.Enabled:= True;
    end
    else
    begin
      capcha:= True;
      if Assigned(OnCaptcha) then
      begin
        OnCaptcha(0);
      end;
    end;
  end;

  if OperationObject.id = '_tickets_capcha6' then
  begin
    _OperProgress('','Вводим капчу: ' + capcha_code);
    oo.id:= '_tickets_capcha7';
    oo.selector:= 'http';
    PushOperStack(oo);
    _log.Add('__tickets_enter_capcha("' + capcha_code + '");');
    _frame.ExecuteJavaScript('__tickets_enter_capcha("' + capcha_code + '");','',1);
  end;

  if OperationObject.id = '_tickets_capcha7' then
  begin
    capcha:= False;
    OperationObject.id:= '_tickets1';
    _process(OperationObject);
    Exit;
  end;


  if OperationObject.id = '_tickets1' then
  begin
    s:= CreateGetTickUrl(GetTickOption) + '&PageNumber=' + IntToStr(curr_page);
    _last_url:= s;
    if Length(s) > 0 then
    begin
      if StopFlag then
      begin
        if Assigned(OnEndGetTickets) then
          OnEndGetTickets(Self);
        StopFlag:= False;
        Exit;
      end;
      oo.id:= '_tickets2';
      oo.selector:= 'http';
      PushOperStack(oo);
      _OperProgress('','Получение таблицы (страница '+ IntToStr(curr_page) + ' из ' + IntToStr(page_count) + ')');
      _log.Add('load ' + s);
      _load('http',s);
    end
    else
      if Assigned(OnEndGetTickets) then
        OnEndGetTickets(Self);
  end;

  if OperationObject.id = '_tickets2' then
  begin
    oo.id:= '_tickets3';
    oo.selector:= 'script';
    PushOperStack(oo);
    oo.id:= '_tickets3';
    oo.selector:= 'script';
    PushOperStack(oo);
    _ro.id:= '_tickets1';
    _timer1.Enabled:= True;
    _log.Add('http://yandex.st/jquery/1.8.2/jquery.min.js');
    _load('script','http://yandex.st/jquery/1.8.2/jquery.min.js');
    _log.Add('http://divan-nn.ru/__ati.js');
    _load('script','http://divan-nn.ru/__ati.js');
  end;

  if OperationObject.id = '_tickets3' then
  begin
    _ro.id:= '_tickets1';
    _timer1.Enabled:= True;
    _log.Add('__tickets(' + IntToStr(curr_page) + ');');
    _frame.ExecuteJavaScript('__tickets(' + IntToStr(curr_page) + ');','',1);
  end;

  if OperationObject.id = '_tickets4' then
  begin
    _capcha_count:= 0;
    _log.Add('_tickets4');
    Inc(curr_page);
    OperationObject.id:= '_tickets1';
    _process(OperationObject);
    Exit;
  end;

  if OperationObject.id = '_tickets_end' then
  begin
    _log.Add('_tickets_end');
    _timer1.Enabled:= False;
    _log.Save;
    if Assigned(OnEndGetTickets) then
      OnEndGetTickets(Self);
  end;

  if OperationObject.id = '_contacts1' then
  begin
    oo.id:= '_contacts2';
    oo.selector:= 'http';
    PushOperStack(oo);
    _OperProgress('ati.su','получение контактов');
    _load('http','http://ati.su' + sel_ticket.FindPropertyByName('ControllerLink').ValueS);
  end;

  if OperationObject.id = '_contacts2' then
  begin
    oo.id:= '_contacts3';
    oo.selector:= 'script';
    PushOperStack(oo);
    _load('script','http://divan-nn.ru/__ati.js');
  end;

  if OperationObject.id = '_contacts3' then
  begin
    _frame.ExecuteJavaScript('__contacts();','',1);
  end;

  if OperationObject.id = '_contacts4' then
  begin
    _log.Save;
    if Assigned(OnEndGetTickets) then
      OnEndGetTickets(Self);
  end;
end;

procedure TATI._load(selector, url: String);
var sl:TStringList;
    s:String;
begin
  if selector = 'http' then
  begin
    _loading_url:= url;
    _tmLoadService.Enabled:= True;
    Chromium.Load(url);
  end;

  if selector = 'script' then
  begin
    url:= '"' + url + '"';
    sl:= TStringList.Create;
    sl.LoadFromFile(ExtractFilePath(Application.ExeName) + '/js/loadscript.js');
    s:= sl.Text;
    s:= ReplaceSymb(s,url,'//script//');
    _frame.ExecuteJavaScript(s,'',0);
    FreeAndNil(sl);
  end;
end;


procedure TATI.Do_ChromiumLoadEnd(Sender: TObject; const browser: ICefBrowser;
                  const frame: ICefFrame; httpStatusCode: Integer;
                      out Result: Boolean);
var oo:TOperationObject;
    JPEGImage:TJPEGImage;
    AData:TMemoryStream;
    image:TImage;
begin
  uBrowser.Browser.Show;
  _Chromium.Show;
  PaintBox.Show;
  _Chromium.Repaint;
  Application.ProcessMessages;
  PaintBox.Buffer.Width:= PaintBox.Width;
  PaintBox.Buffer.Height:= PaintBox.Height;
  PaintBox.Buffer.BeginUpdate;
  _Chromium.Browser.GetImage(PET_VIEW, PaintBox.Width, PaintBox.Height, PaintBox.Buffer.Bits);
  PaintBox.Invalidate;
  PaintBox.Buffer.EndUpdate;
  image:= TImage.Create(nil);
  AData:= TMemoryStream.Create;
  PaintBox.Buffer.SaveToStream(AData);
  AData.Position := 0;
  image.Picture.Bitmap.LoadFromStream(AData);
  JPEGImage:= TJPEGImage.Create;
  JPEGImage.Assign(image.Picture.Graphic);
  _capcha_fn:= GenerateGUID2 + '.jpg';
  JPEGImage.SaveToFile(AppDir + 'tmp_files\' + _capcha_fn);
  FreeAndNil(AData);
  FreeAndNil(JPEGImage);
  FreeAndNil(image);
  _Chromium.Hide;
  PaintBox.Hide;
  uBrowser.Browser.Hide;
  oo.id:= '_tickets_capcha5';
  _process(oo);
end;


procedure TATI.DoChromiumLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  httpStatusCode: Integer; out Result: Boolean);
begin
  _tmLoadService.Enabled:= False;
  _frame:= frame;
  PopOperStack;
end;

procedure TATI.DoChromiumConsoleMessage(Sender: TObject;
                  const browser: ICefBrowser; message, source: ustring; line: Integer;
                      out Result: Boolean);
var s,s2:String;
begin
  s:= message;
  if Copy(s,1,4) = 'cmd:' then
  begin
    Delete(s,1,4);
    s:= Trim(s);
    if GetFirstChar(s,'DateDesc',1,False,s2) > 0 then
    begin
      s:= ReplaceSymb(s,'/\',#$A);
    end
    else
    begin
      s:= DelSymb(s,#$A);
      s:= DelSymb(s,#9);
    end;
    ip.Pas.Text:= s;
    try
      ip.Run;
    except
    end;
  end;
end;


procedure TATI.DoipGetValue(Sender: TObject;
                  Identifier: String; var Value: Variant; Args: TJvInterpreterArgs;
                      var Done: Boolean);
var ooc:TOperationObjectClass;
    oo:TOperationObject;
    code:String;
    obj:TTicket;
begin
  Done:= True;
  if Args.ObjTyp = varObject then
  begin
    if Args.Obj = Self then
    begin
      if (Cmp(Identifier, 'script_loaded')) or (Cmp(Identifier, 'PopOperStack')) then
      begin
        PopOperStack;
      end;
      if Cmp(Identifier, 'aut_need_code') then
      begin
        if Assigned(OnAutorizCode) then
        begin
          OnAutorizCode(code);
        end;
      end;
      if Cmp(Identifier, 'need_captcha') then
      begin
        _capcha_img:= Args.Values[0];
        capcha:= True;
        capcha_code:= '';
      end;
      if Cmp(Identifier, 'aut_ok') then
      begin
        oo.id:= '_login_ok';
        _process(oo);
      end;
      if Cmp(Identifier, 'PushOperStack') then
      begin
        oo.id:= TOperationObjectClass(V2O(Args.Values[0])).id;
        oo.selector:= TOperationObjectClass(V2O(Args.Values[0])).selector;
        PushOperStack(oo);
      end;
      if Cmp(Identifier, '_process') then
      begin
        oo.id:= TOperationObjectClass(V2O(Args.Values[0])).id;
        _process(oo);
      end;
      if Cmp(Identifier, 'ticket') then
      begin
        Value:= O2V(curr_ticket);
      end;
    end
    else
    begin
      if Cmp(Identifier, 'id') then
      begin
        if Cmp(Args.Obj.ClassName, 'TOperationObject') then
        begin
          Value:= TOperationObjectClass(Args.Obj).id;
        end;
      end;
      if Cmp(Identifier, 'selector') then
      begin
        if Cmp(Args.Obj.ClassName, 'TOperationObject') then
        begin
          Value:= TOperationObjectClass(Args.Obj).selector;
        end;
      end;
    end;
  end
  else
  begin
    if Args.ObjTyp = varClass then
    begin
      if Cmp(Identifier, 'Create') then
      begin
        if TClass(Args.Obj) = TOperationObjectClass then
          Value:= O2V(TOperationObjectClass.Create());
        if TClass(Args.Obj) = TTicket then
        begin
          obj:= TTicket.Create();
          curr_ticket:= obj;
          Value:= O2V(obj);
          obj._class:= GetTickResult.FindClassByName('items').CreateClassItem('','');
          cls_templates.CopyClass(obj._class,cls_templates.FindClassByName('ticket'),False,True);
        end;
      end;
    end
    else
    begin
      if Cmp(Identifier, 'this') then
      begin
        Value:= O2V(Self);
      end;
      if Cmp(Identifier, 'TOperationObject') then
      begin
        Value:= C2V(TOperationObjectClass);
      end;
      if Cmp(Identifier, 'TTicket') then
      begin
        Value:= C2V(TTicket);
      end;
    end;
  end;
end;

procedure TATI.DoipSetValue(Sender: TObject;
                  Identifier: String; const Value: Variant; Args: TJvInterpreterArgs;
                      var Done: Boolean);
var k,n:Integer;
    s,s1,s2,s3:String;
    f1:Single;
    cls2:TFMClass;
    oo:TOperationObject;
begin
  Done:= True;

  if Args.ObjTyp = varObject then
  begin
    if Args.Obj = Self then
    begin
      if Cmp(Identifier, 'page_count') then
      begin
        page_count:= Value;
      end;
      if Cmp(Identifier, 'contact_count') then
      begin
        contact_count:= Value;
      end;
    end;

    if Args.Obj.ClassType = TOperationObjectClass then
    begin
      if Cmp(Identifier, 'id') then
      begin
        TOperationObjectClass(Args.Obj).id:= Value;
      end;
      if Cmp(Identifier, 'selector') then
      begin
        TOperationObjectClass(Args.Obj).selector:= Value;
      end;
    end;
    
    if Args.Obj.ClassType = TTicket then
    begin
      if Cmp(Identifier, 'dist') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('Dist').ValueS:= Value;
        k:= GetFirstUnDigitalChar(Value,1,s2);
        if TryStrToInt(s2,n) then
          TTicket(Args.Obj)._class.FindPropertyByName('DistI').ValueI:= n;
      end;
      if Cmp(Identifier, 'TruckType') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('TruckType').ValueS:= Value;
      end;
      if Cmp(Identifier, 'Weight') then
      begin
        s:= Value;
        s2:= DelAllSpace(s);
        if TryStrToFloat(s2,f1) then
          TTicket(Args.Obj)._class.FindPropertyByName('Weight').ValueF:= f1;
      end;
      if Cmp(Identifier, 'Volume') then
      begin
        s:= Value;
        s2:= DelAllSpace(s);
        if TryStrToFloat(s2,f1) then
          TTicket(Args.Obj)._class.FindPropertyByName('Volume').ValueF:= f1;
      end;
      if Cmp(Identifier, 'CargoName') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('CargoName').ValueS:= Value;
      end;
      if Cmp(Identifier, 'CargoNote') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('CargoNote').ValueS:= Value;
      end;
      if Cmp(Identifier, 'CargoDesc') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('CargoDesc').ValueS:= Value;
      end;
      if Cmp(Identifier, 'FromGeo') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('FromGeo').ValueS:= Value;
      end;
      if Cmp(Identifier, 'FromGeoDesc1') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('FromGeoDesc1').ValueS:= TTicket(Args.Obj)._class.FindPropertyByName('FromGeo').ValueS + ' ' + #$A + #$D + Value;
      end;
      if Cmp(Identifier, 'DateDesc') then
      begin
        s:= Value;
        k:= GetFirstChar(s,'/\',Length(s)-1,True,s2);
        s1:= s2;
        n:= GetFirstChar(s2,':',1,False,s3);
        s1:= DelAllSpace(s1);
        if n > 0 then
        begin
          k:= GetFirstChar(s,'/\',k-2,True,s2);
          s1:= s2 + ' (' + s1 + ')';
        end;
        s:= DelSymb(s1,'\');
        s:= DelSymb(s,'/');
        TTicket(Args.Obj)._class.FindPropertyByName('DateDesc').ValueS:= s;

        (*s:= Value;
        k:= GetFirstChar(s,'постоянно по раб',1,False,s2);
        if k > 0 then
          s:= 'постоянно по раб. дням';
        TTicket(Args.Obj)._class.FindPropertyByName('DateDesc').ValueS:= s;*)
      end;
      if Cmp(Identifier, 'ToGeo') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('ToGeo').ValueS:= Value;
      end;
      if Cmp(Identifier, 'ToGeoDesc1') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('ToGeoDesc1').ValueS:= TTicket(Args.Obj)._class.FindPropertyByName('ToGeo').ValueS + ' ' + #$A + #$D + Value;
      end;
      if Cmp(Identifier, 'Price1') then
      begin
        s:= Value;
        k:= GetFirstChar(s,' ',1,False,s2);
        s:= Copy(s,1,k-1);
        s:= DelAllSpace(s);
        TTicket(Args.Obj)._class.FindPropertyByName('Price1').ValueS:= s;
        TTicket(Args.Obj)._class.FindPropertyByName('PriceDesc').ValueS:= Value;
      end;
      if Cmp(Identifier, 'Note') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('Note').ValueS:= Value;
      end;
      if Cmp(Identifier, 'ControllerInfo') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('ControllerInfo').ValueS:= Value;
      end;
      if Cmp(Identifier, 'ControllerLink') then
      begin
        TTicket(Args.Obj)._class.FindPropertyByName('ControllerLink').ValueS:= Value;
      end;
      if Cmp(Identifier, 'controller_contacts') then
      begin
        cls2:= TTicket(Args.Obj)._class.FindClassByName('controller_contacts').CreateClassItem('controller_contacts','');
        cls_templates.CopyClass(cls2,cls_templates.FindClassByName('controller_contact'),False,True);
        cls2.FindPropertyByName('Str1').ValueS:= Value;
      end;
      if Cmp(Identifier, 'id') then
      begin
        s:= StringToByteString(TTicket(Args.Obj)._class.FindPropertyByName('FromGeo').ValueS + TTicket(Args.Obj)._class.FindPropertyByName('ToGeo').ValueS
                + TTicket(Args.Obj)._class.FindPropertyByName('CargoDesc').ValueS + TTicket(Args.Obj)._class.FindPropertyByName('Price1').ValueS);
        TTicket(Args.Obj)._class.FindPropertyByName('ID').ValueS:= s;
      end;
      if Cmp(Identifier, 'Contact') then
      begin
        cls2:= TTicket(Args.Obj)._class.FindClassByName('controller_mails').CreateClassItem('controller_mails','');
        cls_templates.CopyClass(cls2,cls_templates.FindClassByName('controller_contact'),False,True);
        cls2.FindPropertyByName('Str1').ValueS:= Value;
        Inc(contact_curr);
        if contact_curr >= contact_count then
        begin
          oo.id:= '_contacts4';
          _process(oo);
        end;
      end;
    end;
  end;
end;

procedure TATI.SetChromium(aChromium: {$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF});
begin
  Chromium:= aChromium;
  Chromium.OnLoadEnd:= DoChromiumLoadEnd;
  Chromium.OnConsoleMessage:= DoChromiumConsoleMessage;
end;

procedure TATI.Set_Chromium(aChromium:TChromium);
begin
  _Chromium:= aChromium;
  _Chromium.OnLoadEnd:= Do_ChromiumLoadEnd;
end;

procedure TATI.tmLoadTimer(Sender: TObject);
begin
  _tmLoadService.Enabled:= False;
  _log.Add('tmLoadTimer');
  _load('http',_loading_url);
end;

procedure TATI.timer1Timer(Sender: TObject);
var oo:TOperationObject;
begin
  _timer1.Enabled:= False;
  _log.Add('timer1Timer');
  _process(_ro);
end;

procedure TATI.tmCapchaServiceTimer(Sender: TObject);
var result,s:String;
    k:Integer;
    oo:TOperationObject;
begin
  {capcha_code:= 'sdf';
  oo.id:= '_tickets_capcha6';
  _process(oo);
  exit;}
  _tmCapchaService.Enabled:= False;
  result:= _idHTTP.Get('http://antigate.com/res.php?key=c3b21928935b7e9df52f8c77939b068c&action=get&id=' + _capcha_id);
  if GetFirstChar(result,'OK|',1,False,s) > 0 then
  begin
    k:= GetFirstChar(result,'|',1,False,s);
    GetFirstChar(result,'|',k+1,False,capcha_code);
    oo.id:= '_tickets_capcha6';
    _process(oo);
  end
  else
  begin
    if result = 'CAPCHA_NOT_READY' then
    begin
      _tmCapchaService.Enabled:= True;
    end
    else
    begin
      capcha:= True;
      if Assigned(OnCaptcha) then
      begin
        OnCaptcha(0);
      end;
    end;
  end;
end;

constructor TLog.Create();
begin
  inherited;
  sl:= TStringList.Create;
  if FileExists(AppDir + 'log.txt') then
    sl.LoadFromFile(AppDir + 'log.txt');
end;

procedure TLog.Add(s:String);
begin
  sl.Add(DateTimeToStr(Now) + ' ' +  s);
end;

procedure TLog.Save;
begin
  sl.SaveToFile(AppDir + 'log.txt');
end;

end.

