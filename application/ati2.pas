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

    GetTickOption:TGetTickOption;
    GetTickResult:TFMClass;

    StopFlag: Boolean;

    Chromium: {$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF};

    property OnAutorizCode:TOnAutorizCode read FOnAutorizCode write SetOnAutorizCode;
    property OnEndGetTickets:TNotifyEvent read FOnEndGetTickets write SetOnEndGetTickets;
    property OnCaptcha:TOnCaptcha read FOnCaptcha write SetOnCaptcha;
    property OnOperProgress:TOnOperProgress read FOnOperProgress write SetOnOperProgress;

    procedure login(a_login,a_passw:String; proc:TEndProcess);
    procedure GetTickets;

    procedure PushOperStack(OperationObject:TOperationObject);
    procedure PopOperStack;
    procedure ClearOperStack;

    procedure SetChromium(aChromium:{$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF});

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
  oo.id:= '_tickets1';
  oo.selector:= 'task';
  PushOperStack(oo);
  curr_page:= 1;
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
  _OperProgress('ati.su','авторизаци€');
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
      oo.id:= '_tickets1';
      oo.selector:= 'task';
      PushOperStack(oo);
      _OperProgress('','ѕолучение таблицы (страница '+ IntToStr(curr_page) + ')');
      _load('http',s);
    end
    else
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
    end;
  end;
end;

procedure TATI.DoipSetValue(Sender: TObject;
                  Identifier: String; const Value: Variant; Args: TJvInterpreterArgs;
                      var Done: Boolean);
begin
  Done:= True;
  if Args.ObjTyp = varObject then
  begin
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
  end;
end;

procedure TATI.SetChromium(aChromium: {$IFDEF _debug} TChromium {$ELSE} TChromiumOSR {$ENDIF});
begin
  Chromium:= aChromium;
  Chromium.OnLoadEnd:= DoChromiumLoadEnd;
  Chromium.OnConsoleMessage:= DoChromiumConsoleMessage;
end;

end.

