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
    curr_page:Integer;
    OperStack: array of TOperationObject;

    function StringToByteString(str:String):String;

    procedure load_document(url:String);
    procedure wbDocumentComplete(ASender: TObject;const pDisp: IDispatch; var URL: OleVariant);

    function CreateGetTickUrl(option:TGetTickOption):String;
    procedure _GetTickets(params:TOperParams);

    procedure _OperProgress(Stage1,Stage2:String);

    function GetElementById(const Id: string): IDispatch;
    function GetElementById2(const Id: string; elm:IHTMLElement2): IDispatch;
  public
    wb:TEmbeddedWB;
    DOM_Index:Integer;

    login_s:String;
    passw_s:String;
    logined:Boolean;

    GetTickOption:TGetTickOption;
    GetTickResult:TFMClass;

    StopFlag: Boolean;

    property OnAutorizCode:TOnAutorizCode read FOnAutorizCode write SetOnAutorizCode;
    property OnEndGetTickets:TNotifyEvent read FOnEndGetTickets write SetOnEndGetTickets;
    property OnCaptcha:TOnCaptcha read FOnCaptcha write SetOnCaptcha;
    property OnOperProgress:TOnOperProgress read FOnOperProgress write SetOnOperProgress;

    procedure init(a_login,a_passw:String);
    procedure login(params:TOperParams);

    procedure GetTickets;

    procedure ThrowError(code:Integer;text:String);
    procedure PushOperStack(OperationObject:TOperationObject);
    procedure PopOperStack;
    procedure ClearOperStack;

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
  FOnCaptcha:= nil;
  FOnOperProgress:= nil;

  StopFlag:= False;

  Setlength(OperStack,0);
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

function TATI.GetElementById(const Id: string): IDispatch;
var
  Document: IHTMLDocument2;     // IHTMLDocument2 interface of Doc
  Body: IHTMLElement2;          // document body element
  Tags: IHTMLElementCollection; // all tags in document body
  Tag: IHTMLElement;            // a tag in document body
  I,n,n1,n2: Integer;                   // loops thru tags in document body
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
  for n:= 1 to 1 do
  begin
    case n of
      1:
      begin
        n1:= DOM_Index;
        n2:= Pred(Tags.length);
      end;
      2:
      begin
        n1:= 0;
        n2:= n1;
      end;
    end;
    for I := n1 to n2 do
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
    if Assigned(Result) then
      DOM_Index:= I;
    if Assigned(Result) then Break;
  end;
end;

procedure TATI.GetTickets;
var op:TOperParams;
begin
  FreeAndNil(GetTickResult);
  GetTickResult:= TFMClass.Create(nil);
  GetTickResult.CreateClassItem('items','');
  op.task:= 'GetTickets1';
  _GetTickets(op);
end;

procedure TATI.Init;
begin
  login_s:= a_login;
  passw_s:= a_passw;
  wb:= TEmbeddedWB.Create(Self);
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
    _OperProgress('Авторизация ati.su','Страница авторизации ati.su');
    oo.operation:= login;
    oo.task:= 'login_1';
    PushOperStack(oo);
    load_document('http://ati.su/Login/Login.aspx');
  end;

  if params.task = 'login_1' then
  begin
      //elm:= IHTMLElement(GetElementById('main_extLogin_lblUserName_ShortenedLbl'));
      elm:= IHTMLElement(GetElementById('main_extLogin_ucLoginView_lblUserName'));
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

        _OperProgress('','Запрос ...');

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
  if Assigned(wb.Document) then
    load_result:= 1;
  //ShowMessage(wb.LocationURL);
  DOM_Index:= 0;
  PopOperStack;
end;

procedure TATI.load_document(url: String);
begin
  wb.Go(url);
end;

procedure TATI._GetTickets(params:TOperParams);
var s,s1,s2,s3:String;
    oo:TOperationObject;
    op:TOperParams;
    elm,elm1,elm2,elm3,elm4,elm5:IHTMLElement2;
    elm_,elm_2,elm_3,elm_4,elm_5:IHTMLElement;
    i,k,n:Integer;
    cls1,cls2:TFMClass;
    Tags: IHTMLElementCollection;
    f1:Single;
    page_count:Integer;
    ov:OleVariant;
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
      _OperProgress('Сканирование ati.su','Страница костыль ati.su');
      oo.operation:= _GetTickets;
      oo.task:= 'GetTickets3';
      PushOperStack(oo);
      curr_page:= 1;
      wb.WaitWhileBusy;
      Application.ProcessMessages;
      params.task:= 'GetTickets3';
      //load_document('http://google.ru');
    end;
    if params.task = 'GetTickets3' then
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
        oo.operation:= _GetTickets;
        oo.task:= 'GetTickets4';
        PushOperStack(oo);
        _OperProgress('','Получение таблицы (страница '+ IntToStr(curr_page) + ')');
        load_document(s);
      end
      else
        if Assigned(OnEndGetTickets) then
          OnEndGetTickets(Self);
    end;

    if params.task = 'GetTickets4' then
    begin
      elm:= IHTMLElement2(GetElementById('lblSearchPrompt'));
      if Assigned(elm) then
      begin
        if AnsiUpperCase(IHTMLElement(elm).innerText) = AnsiUpperCase('Для продолжения поиска введите символы, изображенные на картинке слева') then
        begin
          _OperProgress('','');
          ClearOperStack;
          if Assigned(OnCaptcha) then
            OnCaptcha(10);
        end
        else
          params.task:= 'GetTickets5';
      end
      else
        params.task:= 'GetTickets5';
    end;

    if params.task = 'GetTickets5' then
    begin
      page_count:= 1;

      if StopFlag then
      begin
        if Assigned(OnEndGetTickets) then
          OnEndGetTickets(Self);
        StopFlag:= False;
        Exit;
      end;
      
      elm:= IHTMLElement2(GetElementById('cphMain_hlpTop_pnlPager'));
      if Assigned(elm) then
      begin
        page_count:= IHTMLElementCollection(IHTMLElement(elm).children).length-2;
      end;

      elm:= IHTMLElement2(GetElementById('pnlTable'));
      if Assigned(elm) then
      begin
        i:= 0;
        while True do
        begin
          if StopFlag then
          begin
            if Assigned(OnEndGetTickets) then
              OnEndGetTickets(Self);
            StopFlag:= False;
            Exit;
          end;

          _OperProgress('Страница ' + IntToStr(curr_page) + ' из ' + IntToStr(page_count),'Обработка таблицы, заявка № ' + IntToStr(i));

          elm:= IHTMLElement2(GetElementById('item_r1_'+IntToStr(i)));
          if not Assigned(elm) then break;


          cls1:= GetTickResult.FindClassByName('items').CreateClassItem('','');
          cls_templates.CopyClass(cls1,cls_templates.FindClassByName('ticket'),False,True);

          elm2:= IHTMLElement2(GetElementById2('item_itGeoDir_' + IntToStr(i) + '_hlkDistance_'+IntToStr(i),elm));
          if Assigned(elm2) then
          begin
            s:= IHTMLElement(elm2).innerText;
            cls1.FindPropertyByName('Dist').ValueS:= s;
            k:= GetFirstUnDigitalChar(s,1,s2);
            if TryStrToInt(s2,n) then
              cls1.FindPropertyByName('DistI').ValueI:= n;
          end;

          s:= '';
          elm2:= IHTMLElement2(GetElementById2('item_itTruckDetails_' + IntToStr(i) + '_lblLoadCarTypes_'+IntToStr(i),elm));
          if Assigned(elm2) then
          begin
            s:= IHTMLElement(elm2).innerText;
          end;
          elm2:= IHTMLElement2(GetElementById2('item_itTruckDetails_' + IntToStr(i) + '_lblLoadingTypes_'+IntToStr(i),elm));
          if Assigned(elm2) then
          begin
            s:= s + ' (' + IHTMLElement(elm2).innerText + ')';
          end;
          cls1.FindPropertyByName('TruckType').ValueS:= s;

          elm2:= IHTMLElement2(GetElementById2('item_pWeight_' + IntToStr(i),elm));
          if Assigned(elm2) then
          begin
            s:= '';
            Supports(IHTMLElementCollection(IHTMLElement(elm2).children).item(0,EmptyParam), IHTMLElement, elm1);

            Supports(IHTMLElementCollection(IHTMLElement(elm1).children).item(0,EmptyParam), IHTMLElement, elm2);
            Supports(IHTMLElementCollection(IHTMLElement(elm2).children).item(0,EmptyParam), IHTMLElement, elm2);

            Supports(IHTMLElementCollection(IHTMLElement(elm2).children).item(1,EmptyParam), IHTMLElement, elm3);
            if AnsiUpperCase(IHTMLElement(elm3).tagName) = 'B' then
            begin
              s:= s + IHTMLElement(elm3).innerText;
              s2:= DelAllSpace(IHTMLElement(elm3).innerText);
              if TryStrToFloat(s2,f1) then
                cls1.FindPropertyByName('Weight').ValueF:= f1;
            end;

            Supports(IHTMLElementCollection(IHTMLElement(elm2).children).item(2,EmptyParam), IHTMLElement, elm3);
            if AnsiUpperCase(IHTMLElement(elm3).tagName) = 'B' then
            begin
              s:= s + ' / ' + IHTMLElement(elm3).innerText;
              s2:= DelAllSpace(IHTMLElement(elm3).innerText);
              if TryStrToFloat(s2,f1) then
                cls1.FindPropertyByName('Volume').ValueF:= f1;
            end;

            Supports(IHTMLElementCollection(IHTMLElement(elm1).children).item(2,EmptyParam), IHTMLElement, elm3);
            if Length(IHTMLElement(elm3).innerText) > 0 then
              s:= s + ' (' + IHTMLElement(elm3).innerText + ')';
            cls1.FindPropertyByName('CargoName').ValueS:= IHTMLElement(elm3).innerText;

            Supports(IHTMLElementCollection(IHTMLElement(elm1).children).item(5,EmptyParam), IHTMLElement, elm3);
            if Assigned(elm3) then
            begin
              if Length(IHTMLElement(elm3).innerText) > 0 then
                s:= s + ' (' + IHTMLElement(elm3).innerText + ')';
              cls1.FindPropertyByName('CargoNote').ValueS:= IHTMLElement(elm3).innerText;
            end;

            cls1.FindPropertyByName('CargoDesc').ValueS:= s;
          end;

          elm2:= IHTMLElement2(GetElementById2('item_itLoading_' + IntToStr(i) + '_pnlLoad_' + IntToStr(i),elm));
          if Assigned(elm2) then
          begin
            elm3:= IHTMLElement2(GetElementById2('item_itLoading_' + IntToStr(i) + '_rptLoadGeoData_' + IntToStr(i) + '_lblFrom_0',elm2));
            if Assigned(elm3) then
            begin
              cls1.FindPropertyByName('FromGeo').ValueS:= IHTMLElement(elm3).innerText;
            end;

            s:= IHTMLElement(elm2).innerText;

            cls1.FindPropertyByName('FromGeoDesc1').ValueS:= s;

            k:= GetFirstChar(s,#$A,Length(s),True,s2);
            s1:= s2;
            n:= GetFirstChar(s2,':',1,False,s3);
            if n > 0 then
            begin
              s1:= DelAllSpace(s1);
              k:= GetFirstChar(s,#$A,k-2,True,s2);
              s1:= s2 + ' (' + s1 + ')';
            end;
            cls1.FindPropertyByName('DateDesc').ValueS:= s1;
          end;

          elm2:= IHTMLElement2(GetElementById2('item_itUnloading_' + IntToStr(i) + '_pnlLoad_' + IntToStr(i),elm));
          if Assigned(elm2) then
          begin
            elm3:= IHTMLElement2(GetElementById2('item_itUnloading_' + IntToStr(i) + '_rptLoadGeoData_' + IntToStr(i) + '_divTo_0',elm2));
            if Assigned(elm3) then
            begin
              cls1.FindPropertyByName('ToGeo').ValueS:= IHTMLElement(elm3).innerText;
            end;

            s:= IHTMLElement(elm2).innerText;
            cls1.FindPropertyByName('ToGeoDesc1').ValueS:= s;
          end;

          elm2:= IHTMLElement2(GetElementById2('item_pRate_' + IntToStr(i),elm));
          if Assigned(elm2) then
          begin
            elm3:= IHTMLElement2(GetElementById2('item_itRate_' + IntToStr(i) + '_divLoadPrice_' + IntToStr(i),elm2));
            if Assigned(elm3) then
            begin
              s:= IHTMLElement(elm3).innerText;

              k:= GetFirstChar(s,' ',1,False,s2);
              if k > 0 then
              begin
                s:= Copy(s,1,k-1);
                s:= DelAllSpace(s);
              end;

              if Length(s) = 0 then
              begin
                elm3:= IHTMLElement2(GetElementById2('item_itRate_' + IntToStr(i) + '_divLoadPriceWithNDS_' + IntToStr(i),elm2));
                if Assigned(elm3) then
                begin
                  s:= IHTMLElement(elm3).innerText;
                  k:= GetFirstChar(s,' ',1,False,s2);
                  s:= Copy(s,1,k-1);
                  s:= DelAllSpace(s);
                end;
              end;
              if Length(s) = 0 then
              begin
                elm3:= IHTMLElement2(GetElementById2('item_itRate_' + IntToStr(i) + '_divLoadPriceWithoutNDS_' + IntToStr(i),elm2));
                if Assigned(elm3) then
                begin
                  s:= IHTMLElement(elm3).innerText;
                  k:= GetFirstChar(s,' ',1,False,s2);
                  s:= Copy(s,1,k-1);
                  s:= DelAllSpace(s);
                end;
              end;

              cls1.FindPropertyByName('Price1').ValueS:= s;
            end;

            s:= IHTMLElement(elm2).innerText;
            s:= ReplaceSymb(s,' ','озвуч.ставка');
            cls1.FindPropertyByName('PriceDesc').ValueS:= s;
          end;

          elm:= IHTMLElement2(GetElementById('item_r2_'+IntToStr(i)));
          if Assigned(elm) then
          begin
            elm2:= IHTMLElement2(GetElementById2('item_itFirmInfo_' + IntToStr(i) + '_tblNote_' + IntToStr(i),elm));
            if Assigned(elm2) then
            begin
              s:= IHTMLElement(elm2).innerText;
              s:= ReplaceSymb(s,' ','Примечание:');
              cls1.FindPropertyByName('Note').ValueS:= s;
            end;

            elm2:= IHTMLElement2(GetElementById2('item_itFirmInfo_' + IntToStr(i) + '_tblFirm_' + IntToStr(i),elm));
            if Assigned(elm2) then
            begin
              s:= IHTMLElement(elm2).innerText;
              cls1.FindPropertyByName('ControllerInfo').ValueS:= s;
            end;

            elm2:= IHTMLElement2(GetElementById2('item_itFirmInfo_' + IntToStr(i) + '_starReliabilityName_' + IntToStr(i)
                                  + '_ctlStarControl_' + IntToStr(i),elm));
            if Assigned(elm2) then
            begin
              s:= IHTMLElement(elm2).outerHTML;
              ov:= IHTMLElement(elm2).getAttribute('RateDescription',-1);
              //Tags:= IHTMLElementCollection(elm2.getElementsByTagName('*'));
              //elm2:= IHTMLElement2(Tags.item(0, EmptyParam));
              //s:= IHTMLElement(elm2).innerHTML;
              //s:= IHTMLElement(elm2).getAttribute('title',-1);
              if TVarData(ov).VDispatch <> nil then
                cls1.FindPropertyByName('Reliability').ValueS:= String(ov);
            end;

            elm2:= IHTMLElement2(GetElementById2('item_itFirmInfo_' + IntToStr(i) + '_tblContacts_' + IntToStr(i),elm));
            if Assigned(elm2) then
            begin
              k:= 1;
              while True do
              begin
                if k = 1 then
                  elm3:= IHTMLElement2(GetElementById2('item_itFirmInfo_' + IntToStr(i) + '_tblContactsData_' + IntToStr(i),elm2))
                else
                  elm3:= IHTMLElement2(GetElementById2('item_itFirmInfo_' + IntToStr(i) + '_tblContacts' + IntToStr(k) + 'Data_' + IntToStr(i),elm2));
                if not Assigned(elm3) then Break;

                s:= IHTMLElement(elm3).innerText;
                cls2:= cls1.FindClassByName('controller_contacts').CreateClassItem('controller_contacts','');
                cls_templates.CopyClass(cls2,cls_templates.FindClassByName('controller_contact'),False,True);
                cls2.FindPropertyByName('Str1').ValueS:= s;

                Inc(k);
              end;
            end;
          end;

          s:= StringToByteString(cls1.FindPropertyByName('FromGeo').ValueS + cls1.FindPropertyByName('ToGeo').ValueS
                + cls1.FindPropertyByName('CargoDesc').ValueS + cls1.FindPropertyByName('Price1').ValueS);
          cls1.FindPropertyByName('ID').ValueS:= s;

          Inc(i);
        end;
      end;

      Inc(curr_page);
      if curr_page <= page_count then
      begin
        op.task:= 'GetTickets3';
        _GetTickets(op);
      end
      else
      begin
        params.task:= 'GetTickets6';
      end;
    end;

    if params.task = 'GetTickets6' then
    begin
      if Assigned(OnEndGetTickets) then
        OnEndGetTickets(Self);
    end;

  end
  else
    if Assigned(OnEndGetTickets) then
      OnEndGetTickets(Self);
end;

function TATI.GetElementById2(const Id: string;
  elm: IHTMLElement2): IDispatch;
var
  Document: IHTMLDocument2;     // IHTMLDocument2 interface of Doc
  Body: IHTMLElement2;          // document body element
  Tags: IHTMLElementCollection; // all tags in document body
  Tag: IHTMLElement;            // a tag in document body
  I: Integer;                   // loops thru tags in document body
begin
  Result:= GetElementById(Id);
  Exit;
  Result := nil;
  if not Supports(elm, IHTMLElement2, Body) then
    raise Exception.Create('Can''t find <body> element');
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
    Result:= GetElementById2(Id,IHTMLElement2(Tag));
    if Assigned(Result) then Break;
  end;
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

end.

