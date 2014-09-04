unit ati2;

interface
uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api,
     OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, IEAddress,  Mshtml_Ewb, ExtCtrls, Controls,
     GRUtils, GRString, cefvcl, ceflib, JvInterpreterFm,JvJCLUtils, JvInterpreter;

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
    procedure _process(OperationObject:TOperationObject);

    function StringToByteString(str:String):String;
    function CreateGetTickUrl(option: TGetTickOption): String;
    procedure _OperProgress(Stage1,Stage2:String);

    procedure DoChromiumLoadEnd(Sender: TObject; const browser: ICefBrowser;
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


  public
    login_s:String;
    passw_s:String;
    logined:Boolean;

    sel_ticket:TFMClass;

    GetTickOption:TGetTickOption;
    GetTickResult:TFMClass;

    StopFlag: Boolean;

    Chromium: {$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF};

    property OnAutorizCode:TOnAutorizCode read FOnAutorizCode write SetOnAutorizCode;
    property OnEndGetTickets:TNotifyEvent read FOnEndGetTickets write SetOnEndGetTickets;
    property OnCaptcha:TOnCaptcha read FOnCaptcha write SetOnCaptcha;
    property OnOperProgress:TOnOperProgress read FOnOperProgress write SetOnOperProgress;

    procedure SetChromium(aChromium:{$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF});

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
end;

function TATI.CreateGetTickUrl(option: TGetTickOption): String;
var Year,Month,Day,DOW:Word;
begin
  Result:= 'http://ati.su/Tables/Default.aspx?EntityType=Load';
  Result:= Result + '&FromGeo=' + ReplaceSymb(option.FromGeo,'%20',' ');
  Result:= Result + '&ToGeo=' + ReplaceSymb(option.ToGeo,'%20',' ');
  Result:= Result + '&FromGeoRadius=' + IntToStr(option.FromRadius);
  Result:= Result + '&ToGeoRadius=' + IntToStr(option.ToRadius);
  Result:= Result + '&CarType=115&LoadType=4';
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

  oo.id:= '_login1';
  oo.selector:= 'http';
  PushOperStack(oo);
  _OperProgress('ati.su','авторизация');
  _load('http','http://ati.su/Login/Login.aspx');
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
begin
  if OperationObject.id = '_login1' then
  begin
    oo.id:= '_login2';
    oo.selector:= 'script';
    PushOperStack(oo);
    oo.id:= '_login2';
    oo.selector:= 'script';
    PushOperStack(oo);
    _load('script','http://yandex.st/jquery/1.8.2/jquery.min.js');
    _load('script','http://109.120.140.206/transpo/__ati.js');
  end;

  if OperationObject.id = '_login2' then
  begin
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
    _load('script','http://yandex.st/jquery/1.8.2/jquery.min.js');
    _load('script','http://109.120.140.206/transpo/__ati.js');
  end;

  if OperationObject.id = '_login4' then
  begin
    _frame.ExecuteJavaScript('__login();','',1);
  end;

  if OperationObject.id = '_login_ok' then
  begin
    _OperProgress('','');
    if Assigned(_proc) then
      _proc();
    PopOperStack;
  end;

  if OperationObject.id = '_tickets1' then
  begin
    s:= CreateGetTickUrl(GetTickOption) + '&PageNumber=' + IntToStr(curr_page);
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
    _load('script','http://yandex.st/jquery/1.8.2/jquery.min.js');
    _load('script','http://109.120.140.206/transpo/__ati.js');
  end;

  if OperationObject.id = '_tickets3' then
  begin
    _frame.ExecuteJavaScript('__tickets();','',1);
  end;

  if OperationObject.id = '_tickets4' then
  begin
    Inc(curr_page);
    if (curr_page <= page_count) then
    begin
      OperationObject.id:= '_tickets1';
      _process(OperationObject);
      Exit;
    end
    else
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
    _load('script','http://109.120.140.206/transpo/__ati.js');
  end;

  if OperationObject.id = '_contacts3' then
  begin
    _frame.ExecuteJavaScript('__contacts();','',1);
  end;

  if OperationObject.id = '_contacts4' then
  begin
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

procedure TATI.DoChromiumLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  httpStatusCode: Integer; out Result: Boolean);
begin
  _frame:= frame;
  PopOperStack;
end;

procedure TATI.DoChromiumConsoleMessage(Sender: TObject;
                  const browser: ICefBrowser; message, source: ustring; line: Integer;
                      out Result: Boolean);
var s:String;
begin
  s:= message;
  if Copy(s,1,4) = 'cmd:' then
  begin
    Delete(s,1,4);
    s:= Trim(s);
    s:= DelSymb(s,#$A);
    s:= DelSymb(s,#9);
    ip.Pas.Text:= s;
    ip.Run;
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
      if Cmp(Identifier, 'script_loaded') then
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
        if Assigned(OnCaptcha) then
        begin
          OnCaptcha(0);
        end;
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
    s,s2:String;
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
        k:= GetFirstChar(s,'постоянно по раб',1,False,s2);
        if k > 0 then
          s:= 'постоянно по раб. дням';
        TTicket(Args.Obj)._class.FindPropertyByName('DateDesc').ValueS:= s;
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

end.

