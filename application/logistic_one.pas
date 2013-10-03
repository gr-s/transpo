unit logistic_one;

interface

uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api, ExtCtrls, Controls,
     GRUtils, GRString, IdHTTP, uLkJSON, manage_stack;

type

  TOnOperProgress = procedure(Stage1,Stage2:String) of object;
  TWorkMode = (wmPoint,wmWay);

  TLogisticOne = class(TComponent)
  private
    FOnOperProgress: TOnOperProgress;
    FOnEndOperProgress: TOnOperProgress;
    procedure SetOnOperProgress(const Value: TOnOperProgress);
    procedure SetOnEndOperProgress(const Value: TOnOperProgress);

  protected

    procedure tmPassTimer(Sender: TObject);
    procedure DoATICaptcha(oper_code:Integer);
    procedure DoOperProgress(Stage1,Stage2:String);
    procedure DoEndGetTickets(Sender: TObject);

  public
    ManageStack:TManageStack;
    tmPass:TTimer;

    WorkMode:TWorkMode; //режим (на точке, в пути)
    FromGeo:String;
    ToGeo:String;
    Weight:Single;
    Volume:Single;
    DateBegin:TDate;
    DateEnd:TDate;

    from_radius1:Integer;
    from_radius2:Integer;

    cls_lo_templates:TFMClass;
    cls_geo_objects:TFMClass;
    cls_ways:TFMClass;
    IdHTTP:TIdHTTP;
    cls_pass:TFMClass;

    stopped:Boolean;

    property OnOperProgress:TOnOperProgress read FOnOperProgress write SetOnOperProgress;
    property OnEndOperProgress:TOnOperProgress read FOnEndOperProgress write SetOnEndOperProgress;


    function IsGeoAdmin(aGeoObject:TFMClass):Boolean;
    function GetGeoObject(aName:String):TFMClass;

    procedure _pass1(so:TSO);

    procedure IndexingGeo(GeoName:String; IsAdmin:Boolean; AdminName:String);
    procedure IndexingGeosFromWays;

    procedure LoadTickets(so:TSO);

    procedure Pass;
    procedure Stop;

    constructor Create(AOwner: TComponent);
    destructor Destroy;override;
  end;

var
  logisticone:TLogisticOne;


implementation
uses ati;
{ TLogisticOne }

constructor TLogisticOne.Create(AOwner: TComponent);
begin
  inherited;

  FOnOperProgress:= nil;
  FOnEndOperProgress:= nil;

  tmPass:= TTimer.Create(nil);
  tmPass.Enabled:= False;
  tmPass.OnTimer:= tmPassTimer;

  WorkMode:= wmPoint;
  stopped:= False;

  cls_pass:= nil;

  cls_lo_templates:= TFMClass.Create(Self);
  cls_lo_templates.FileName:= AppDir + 'logistic_one\lo_templates.dat';
  cls_lo_templates.Open;

  cls_geo_objects:= TFMClass.Create(Self);
  cls_geo_objects.FileName:= AppDir + 'logistic_one\geo_objects.dat';
  cls_geo_objects.Open;
  cls_geo_objects.FileType:= ftFullText;
  cls_lo_templates.CopyClass(cls_geo_objects,cls_lo_templates.FindClassByName('geo_objects_file'),False,True);

  cls_ways:= TFMClass.Create(Self);
  cls_ways.FileName:= AppDir + 'logistic_one\ways.dat';
  cls_ways.Open;
  cls_ways.FileType:= ftFullText;
  cls_lo_templates.CopyClass(cls_ways,cls_lo_templates.FindClassByName('ways_file'),False,True);

  IdHTTP:= TIdHTTP.Create(nil);

  ManageStack:= TManageStack.Create(nil);
  ManageStack.NewStack('get_tickets');
  ManageStack.NewStack('pass1');
end;

destructor TLogisticOne.Destroy;
begin

  inherited;
end;


procedure TLogisticOne.DoATICaptcha(oper_code: Integer);
begin

end;

procedure TLogisticOne.DoEndGetTickets(Sender: TObject);
begin
  ManageStack.Stack('get_tickets').PopAndExecute;
end;

procedure TLogisticOne.DoOperProgress(Stage1, Stage2: String);
begin
  if Assigned(OnOperProgress) then
    OnOperProgress(Stage1, Stage2);
end;

function TLogisticOne.GetGeoObject(aName: String): TFMClass;
var i,j:Integer;
    cls1,cls2:TFMClass;
begin
  Result:= nil;
  for j:= 1 to 2 do
  begin
    case j of
      1: cls1:= cls_geo_objects.FindClassByName('admins');
      2: cls1:= cls_geo_objects.FindClassByName('locals');
    end;
    for i:= 0 to cls1.MyClassCount-1 do
    begin
      if AnsiUpperCase(cls1.MyClass[i].FindPropertyByName('name').ValueS) = AnsiUpperCase(aName) then
      begin
        Result:= cls1.MyClass[i];
        Break;
      end;  
    end;
  end;
end;

procedure TLogisticOne.IndexingGeo(GeoName: String; IsAdmin:Boolean; AdminName:String);
var cls1,cls2:TFMClass;
    s:WideString;
    s1,s2:String;
    js,js2:TlkJSONobject;
    jl:TlkJSONlist;
    f1:Double;
    k:Integer;
    ds:Char;
begin
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  cls1:= GetGeoObject(GeoName);
  if not Assigned(cls1) then
  begin
    if IsAdmin then
      cls2:= cls_geo_objects.FindClassByName('admins')
    else
      cls2:= cls_geo_objects.FindClassByName('locals');
    cls1:= cls2.CreateClassItem('','');
    cls_lo_templates.CopyClass(cls1,cls_lo_templates.FindClassByName('geo_object'),False,True);
    cls1.FindPropertyByName('name').ValueS:= AnsiUpperCase(GeoName);
    if not IsAdmin then
      cls1.FindPropertyByName('admin_name').ValueS:= AdminName;
  end;
  if (cls1.FindPropertyByName('lon').ValueF = 0) or (cls1.FindPropertyByName('lat').ValueF = 0) then
  begin
    s1:= ReplaceSymb(GeoName,'+',' ');
    js:= TlkJSON.ParseText(IdHTTP.Get('http://geocode-maps.yandex.ru/1.x/?format=json&geocode=' + s1)) as TlkJSONobject;
    jl:= TlkJSONlist(TlkJSONobject(TlkJSONobject(js.Field['response']).Field['GeoObjectCollection']).Field['featureMember']);

    js:= TlkJSONobject(TlkJSONobject(jl.Child[0]).Field['GeoObject']);
    cls1.FindPropertyByName('description').ValueS:= AnsiUpperCase(js.getWideString('description'));

    js2:= TlkJSONobject(js.Field['Point']);
    s1:= TlkJSONstring(js2.Field['pos']).Value;
    k:= GetFirstChar(s1,' ',1,False,s2);
    if TryStrToFloat(s2,f1) then
      cls1.FindPropertyByName('lon').ValueF:= f1;
    k:= GetFirstChar(s1,' ',k+1,False,s2);
    if TryStrToFloat(s2,f1) then
      cls1.FindPropertyByName('lat').ValueF:= f1;
  end;

  DecimalSeparator:= ds;
end;

procedure TLogisticOne.IndexingGeosFromWays;
var i,j:Integer;
    cls1:TFMClass;
    b:Boolean;
    s:String;
begin
  for i:= 0 to cls_ways.FindClassByName('items').MyClassCount-1 do
  begin
    for j:= 0 to cls_ways.FindClassByName('items').MyClass[i].MyClassCount -1 do
    begin
      cls1:= cls_ways.FindClassByName('items').MyClass[i].MyClass[j];

      b:= True;

      if Assigned(cls1.FindPropertyByName('is_local')) then
        b:= not cls1.FindPropertyByName('is_local').ValueB;

      s:= '';
      if not b then
        s:= cls1.FindPropertyByName('admin_name').ValueS;

      if Assigned(OnOperProgress) then
        OnOperProgress(cls1.FindPropertyByName('geo').ValueS,'');
        
      IndexingGeo(cls1.FindPropertyByName('geo').ValueS,b,s);
    end;
  end;
  cls_geo_objects.Save;
  if Assigned(OnEndOperProgress) then
    OnEndOperProgress('','');
end;

function TLogisticOne.IsGeoAdmin(aGeoObject: TFMClass): Boolean;
begin
  Result:= aGeoObject.ParentClass.SysName = 'admins';
end;

procedure TLogisticOne.LoadTickets(so: TSO);
begin
  ati_service.GetTickOption:= GetTickOptionDefault;
  ati_service.GetTickOption.FromGeo:= so.Param('FromGeo').ValueS;
  ati_service.GetTickOption.FromRadius:= so.Param('FromRadius').ValueI;
  ati_service.GetTickOption.ToGeo:= so.Param('ToGeo').ValueS;
  ati_service.GetTickOption.ToRadius:= so.Param('ToRadius').ValueI;
  ati_service.GetTickOption.WeightEnd:= 5;
  ati_service.GetTickOption.VolumeEnd:= 35;
  ati_service.GetTickOption.DateBegin:= StrToDate(so.Param('DateBegin').ValueS);
  ati_service.GetTickOption.DateEnd:= StrToDate(so.Param('DateEnd').ValueS);
  ati_service.GetTickets;
end;

procedure TLogisticOne.Pass;
type tst1 = ^TStackProc;
var so1,so2:TSO;
    dw1:DWORD;
    proc: tst1;
begin
  if Length(FromGeo) > 0 then
  begin
    if not Assigned(GetGeoObject(FromGeo)) then
    begin
      Stop;
      MessageBox(Application.Handle,'Город загрузки не найден !','Ошибка',MB_OK OR MB_ICONWARNING);
      Exit;
    end;
  end
  else
  begin
    Stop;
    MessageBox(Application.Handle,'Не задан город загрузки !','Ошибка',MB_OK OR MB_ICONWARNING);
    Exit;
  end;

  if Length(ToGeo) > 0 then
  begin
    if not Assigned(GetGeoObject(ToGeo)) then
    begin
      Stop;
      MessageBox(Application.Handle,'Город разгрузки не найден !','Ошибка',MB_OK OR MB_ICONWARNING);
      Exit;
    end;
  end;

  ati_service.OnCaptcha:= DoATICaptcha;
  ati_service.OnOperProgress:= DoOperProgress;
  ati_service.OnEndGetTickets:= DoEndGetTickets;

  FreeAndNil(cls_pass);
  cls_pass:= TFMClass.Create(Self);
  cls_lo_templates.CopyClass(cls_pass,cls_lo_templates.FindClassByName('pass_object'),False,True);

  so1:= ManageStack.Stack('get_tickets').NewObject(cls_lo_templates.FindClassByName('stack_objects_params').FindClassByName('get_tickets_params'));
  so1.Param('FromGeo').ValueS:= FromGeo;
  so1.Param('FromRadius').ValueI:= from_radius1;
  so1.Param('DateBegin').ValueS:= DateToStr(DateBegin);
  so1.Param('DateEnd').ValueS:= DateToStr(DateEnd);
  so1.AddProc(_pass1);
  proc:= tst1(_pass1);
  dw1:= DWORD(@proc);
  proc:= TStackProc(Pointer(dw1)^);
  proc(nil);

  so2:= ManageStack.Stack('pass1').NewObject(cls_lo_templates.FindClassByName('stack_objects_params').FindClassByName('pass1_params'));

  LoadTickets(so1);
end;

procedure TLogisticOne.SetOnEndOperProgress(const Value: TOnOperProgress);
begin
  FOnEndOperProgress := Value;
end;

procedure TLogisticOne.SetOnOperProgress(const Value: TOnOperProgress);
begin
  FOnOperProgress := Value;
end;

procedure TLogisticOne.Stop;
begin
  tmPass.Enabled:= False;
  stopped:= True;
end;

procedure TLogisticOne.tmPassTimer(Sender: TObject);
begin
  tmPass.Enabled:= False;
  Pass;
end;

procedure TLogisticOne._pass1(so:TSO);
begin
  ShowMessage('ok');
end;

end.
