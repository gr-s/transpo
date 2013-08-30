unit ati;

interface
uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api,
     OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, IEAddress,  Mshtml_Ewb, ExtCtrls, Controls,
     GRUtils, GRString;

type

  TOperParams = record
    task:String;
  end;

  TOperProc = procedure(params:TOperParams) of object;

  TOperationObject = record
    operation:TOperProc;
    task:String;
  end;

  TOnAutorizCode = procedure(var Code:String) of object;

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
    procedure SetOnAutorizCode(const Value: TOnAutorizCode);
    procedure SetOnEndGetTickets(const Value: TNotifyEvent);

  protected
    OperStack: array of TOperationObject;

    procedure load_document(url:String);
    procedure wbDocumentComplete(ASender: TObject;const pDisp: IDispatch; var URL: OleVariant);

    function CreateGetTickUrl(option:TGetTickOption):String;
    procedure _GetTickets(params:TOperParams);

    function GetElementById(const Id: string): IDispatch;
  public
    wb:TEmbeddedWB;

    login_s:String;
    passw_s:String;
    logined:Boolean;

    GetTickOption:TGetTickOption;
    GetTickResult:TFMClass;

    property OnAutorizCode:TOnAutorizCode read FOnAutorizCode write SetOnAutorizCode;
    property OnEndGetTickets:TNotifyEvent read FOnEndGetTickets write SetOnEndGetTickets;

    procedure init(a_login,a_passw:String);
    procedure login(params:TOperParams);

    procedure GetTickets;

    procedure ThrowError(code:Integer;text:String);
    procedure PushOperStack(OperationObject:TOperationObject);
    procedure PopOperStack;

    constructor Create(AOwner: TComponent);
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

  Setlength(OperStack,0);
end;

function TATI.CreateGetTickUrl(option: TGetTickOption): String;
var Year,Month,Day,DOW:Word;
begin
  Result:= 'http://ati.su/Tables/Default.aspx?EntityType=Load';
  Result:= Result + '&FromGeo=' + ReplaceSymb(option.FromGeo,'%20',' ');
  Result:= Result + '&ToGeo=' + ReplaceSymb(option.ToGeo,'%20',' ');
  Result:= Result + '&FromGeoRadius=' + IntToStr(option.FromRadius);
  Result:= Result + '&ToGeoRadius=' + IntToStr(option.FromRadius);
  Result:= Result + '&CarType=115&LoadType=4';
  Result:= Result + '&Weight2=' + IntToStr(option.WeightEnd);
  Result:= Result + '&Volume2=' + IntToStr(option.VolumeEnd);

  DecodeDate(option.DateBegin,Year,Month,Day);
  Result:= Result + '&FirstDate=' + IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);

  DecodeDate(option.DateEnd,Year,Month,Day);
  Result:= Result + '&FirstDate2=' + IntToStr(Year) + '-' + IntToStr(Month) + '-' + IntToStr(Day);

  Result:= Result + '&qdsv=-1&ExactFromGeos=true&ExactToGeos=true&SortingType=2&PageSize=100';
end;

destructor TATI.Destroy;
begin

  inherited;
end;

function TATI.GetElementById(const Id: string): IDispatch;
var
  Document: IHTMLDocument2;     // IHTMLDocument2 interface of Doc
  Body: IHTMLElement2;          // document body element
  Tags: IHTMLElementCollection; // all tags in document body
  Tag: IHTMLElement;            // a tag in document body
  I: Integer;                   // loops thru tags in document body
begin
  Result := nil;
  // Check for valid document: require IHTMLDocument2 interface to it
  if not Supports(wb.Document, IHTMLDocument2, Document) then
    raise Exception.Create('Invalid HTML document');
  // Check for valid body element: require IHTMLElement2 interface to it
  if not Supports(Document.body, IHTMLElement2, Body) then
    raise Exception.Create('Can''t find <body> element');
  // Get all tags in body element ('*' => any tag name)
  Tags := Body.getElementsByTagName('*');
  // Scan through all tags in body
  for I := 0 to Pred(Tags.length) do
  begin
    // Get reference to a tag
    Tag := Tags.item(I, EmptyParam) as IHTMLElement;
    // Check tag's id and return it if id matches
    if AnsiSameText(Tag.id, Id) then
    begin
      Result := Tag;
      Break;
    end;
  end;
end;

procedure TATI.GetTickets;
var op:TOperParams;
begin
  FreeAndNil(GetTickResult);
  op.task:= 'GetTickets1';
  _GetTickets(op);
end;

procedure TATI.Init;
begin
  login_s:= a_login;
  passw_s:= a_passw;
  wb:= TEmbeddedWB.Create(Self); 
  //wb.Width:= 0; wb.Height:= 0;
  wb.OnDocumentComplete:= wbDocumentComplete;
end;


procedure TATI.login(params:TOperParams);
var elm:IHTMLElement;
    check_code:String;
    oo:TOperationObject;
begin
  if logined then
  begin
    PopOperStack;
    Exit;
  end;

  if Length(params.task) = 0 then
  begin
    oo.operation:= login;
    oo.task:= 'login_1';
    PushOperStack(oo);
    load_document('http://ati.su/Login/Login.aspx');
  end;

  if params.task = 'login_1' then
  begin
      elm:= IHTMLElement(GetElementById('main_extLogin_lblUserName_ShortenedLbl'));
      if Assigned(elm) then
      begin
        logined:= True;
        PopOperStack;
        Exit;
      end;

      elm:= IHTMLElement(GetElementById('ctl00_ctl00_main_PlaceHolderMain_extLogin_ctlPageLogin_UserName'));
      if Assigned(elm) then
      begin
        elm.setAttribute('value',login_s,-1);
        elm:= IHTMLElement(GetElementById('ctl00_ctl00_main_PlaceHolderMain_extLogin_ctlPageLogin_Password'));
        elm.setAttribute('value',passw_s,-1);
        elm:= IHTMLElement(GetElementById('ctl00_ctl00_main_PlaceHolderMain_extLogin_ctlPageLogin_btnPageLogin'));

        oo.operation:= login;
        oo.task:= 'login_2';
        PushOperStack(oo);

        elm.click;
        Exit;
      end;

      elm:= IHTMLElement(GetElementById('main_cphMain_txtCode'));
      if Assigned(elm) then
      begin
        check_code:= '';
        elm:= IHTMLElement(GetElementById('main_cphMain_btnTrySendSms'));
        elm.click;
        if Assigned(OnAutorizCode) then
          OnAutorizCode(check_code);
        if Length(check_code) > 0 then
        begin
          elm:= IHTMLElement(GetElementById('main_cphMain_txtCode'));
          elm.setAttribute('value',check_code,-1);
          elm:= IHTMLElement(GetElementById('main_cphMain_btnValidateCode'));

          oo.operation:= login;
          oo.task:= 'login_1';
          PushOperStack(oo);
          
          elm.click;
          Exit;
        end;
      end;

      ThrowError(-1,'<Нет регистрации (ati.su)>');
      PopOperStack;
      Exit;
  end;

  if params.task = 'login_2' then
  begin
    elm:= IHTMLElement(GetElementById('main_extLogin_lblUserName_ShortenedLbl'));
    if Assigned(elm) then
    begin
      logined:= True;
      PopOperStack;
    end
    else
    begin
      ThrowError(-1,'<Нет регистрации (ati.su)>');
      PopOperStack;
    end;
  end;
end;

procedure TATI.PopOperStack;
var OperationObject:TOperationObject;
    params:TOperParams;
    proc:TOperProc;
begin
  OperationObject:= OperStack[Length(OperStack)-1];
  params.task:= OperationObject.task;
  proc:= OperationObject.operation;
  SetLength(OperStack,Length(OperStack)-1);
  proc(params);
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

procedure TATI.ThrowError(code: Integer; text: String);
begin

end;

procedure TATI.wbDocumentComplete(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
var load_result:Integer;
begin
  load_result:= 0;
  Application.ProcessMessages;
//  ShowMessage(URL);
  if Assigned(wb.Document) then
    load_result:= 1;
  PopOperStack;
end;

procedure TATI.load_document(url: String);
var w_url:WideString;
begin
  w_url:= WideString(url);
  wb.Go(url);
end;

procedure TATI._GetTickets(params:TOperParams);
var s:String;
    oo:TOperationObject;
    op:TOperParams;
begin
  if params.task = 'GetTickets1' then
  begin
    oo.operation:= _GetTickets;
    oo.task:= 'GetTickets2';
    PushOperStack(oo);
    op.task:= '';
    login(op);
    Exit;
  end;
  if logined then
  begin
    if params.task = 'GetTickets2' then
    begin
      GetTickOption:= GetTickOptionDefault;
      GetTickOption.FromGeo:= 'Нижний Новгород';
      GetTickOption.ToGeo:= 'Москва';
      GetTickOption.FromGeo:= '';
      GetTickOption.ToGeo:= '';
      GetTickOption.WeightEnd:= 5;
      GetTickOption.VolumeEnd:= 35;
      GetTickOption.DateBegin:= StrToDateTime('30.08.2013');
      GetTickOption.DateEnd:= StrToDateTime('31.08.2013');
      s:= CreateGetTickUrl(GetTickOption);
      MainForm.Memo1.Text:= s;
      if Length(s) > 0 then
      begin
        oo.operation:= _GetTickets;
        oo.task:= 'GetTickets3';
        PushOperStack(oo);
        load_document(s);
      end
      else
        if Assigned(OnEndGetTickets) then
          OnEndGetTickets(Self);
    end;
  end
  else
    if Assigned(OnEndGetTickets) then
      OnEndGetTickets(Self);
end;

end.
