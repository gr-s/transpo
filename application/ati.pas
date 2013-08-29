unit ati;

interface
uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api,
     OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, IEAddress,  Mshtml_Ewb, ExtCtrls;

type

  TEndProc = procedure() of object;
  TProc = procedure(task:String;EndProc:TEndProc=nil) of object;

  TATI = class(TComponent)
  private

  protected
    loaded:Boolean;
    load_result:Integer;
    load_task:String;
    load_proc:TProc;

    end_proc:TEndProc;

    procedure load_document(url:String;task:String;Proc:TProc);
    procedure wbDocumentComplete(ASender: TObject;const pDisp: IDispatch; var URL: OleVariant);

    function GetElementById(const Id: string): IDispatch;
  public
    wb:TEmbeddedWB;
    
    login_s:String;
    passw_s:String;
    logined:Boolean;

    procedure init(a_login,a_passw:String);
    procedure login(task:String = '';EndProc:TEndProc=nil);

    procedure ThrowError(code:Integer;text:String);

    constructor Create(AOwner: TComponent);
    destructor Destroy;override;
  end;

var
  ati_service:TATI;

implementation

{ TATI }


{ TATI }

constructor TATI.Create(AOwner: TComponent);
begin
  inherited;
  
  logined:= False;
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

procedure TATI.Init;
begin
  login_s:= a_login;
  passw_s:= a_passw;
  wb:= TEmbeddedWB.Create(Self);
  wb.Width:= 0; wb.Height:= 0;
  wb.OnDocumentComplete:= wbDocumentComplete;
end;

procedure TATI.load_document(url: String;task:String;Proc:TProc);
begin
  loaded:= False;
  load_result:= 0;
  load_task:= task;
  load_proc:= Proc;
  if Length(url) > 0 then
    wb.Go(url);
end;


procedure TATI.login(task:String;EndProc:TEndProc);
var elm:IHTMLElement;
begin
  if Assigned(EndProc) then end_proc:= EndProc;
  if logined then
  begin
    if Assigned(end_proc) then
      end_proc();
    Exit;
  end;

  if Length(task) = 0 then
  begin
    load_document('http://ati.su/Login/Login.aspx','login_1',login);
  end;

  if task = 'login_1' then
  begin
    if (load_result = 1) then
    begin
      elm:= IHTMLElement(GetElementById('ctl00_ctl00_main_PlaceHolderMain_extLogin_ctlPageLogin_UserName'));
      if Assigned(elm) then
      begin
        elm.setAttribute('value',login_s,-1);
        elm:= IHTMLElement(GetElementById('ctl00_ctl00_main_PlaceHolderMain_extLogin_ctlPageLogin_Password'));
        elm.setAttribute('value',passw_s,-1);
        elm:= IHTMLElement(GetElementById('ctl00_ctl00_main_PlaceHolderMain_extLogin_ctlPageLogin_btnPageLogin'));
        load_document('','login_2',login);
        elm.click;
      end
      else
      begin 
        elm:= IHTMLElement(GetElementById('main_extLogin_lblUserName_ShortenedLbl'));
        if Assigned(elm) then
        begin
          logined:= True;
          if Assigned(end_proc) then
            end_proc();
        end
        else
        begin
          ThrowError(-1,'<Нет регистрации (ati.su)>');
          if Assigned(end_proc) then
            end_proc();
        end;
      end;
    end
    else
    begin
      if Assigned(end_proc) then
        end_proc();
    end;
  end;

  if task = 'login_2' then
  begin
    elm:= IHTMLElement(GetElementById('main_extLogin_lblUserName_ShortenedLbl'));
    if Assigned(elm) then
    begin
      logined:= True;
      if Assigned(end_proc) then
        end_proc();
    end
    else
    begin
      ThrowError(-1,'<Нет регистрации (ati.su)>');
      if Assigned(end_proc) then
        end_proc();
    end;
  end;
end;

procedure TATI.ThrowError(code: Integer; text: String);
begin

end;

procedure TATI.wbDocumentComplete(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
begin
  loaded:= True;
  if Assigned(wb.Document) then
    load_result:= 1;
  if Assigned(load_proc) then
    load_proc(load_task);
end;

end.
