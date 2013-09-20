unit logistic_one;

interface

uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api,
     OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, IEAddress,  Mshtml_Ewb, ExtCtrls, Controls,
     GRUtils, GRString;

type

  TOnOperProgress = procedure(Stage1,Stage2:String) of object;

  TLogisticOne = class(TComponent)
  private
    FOnOperProgress: TOnOperProgress;
    FOnEndOperProgress: TOnOperProgress;
    procedure SetOnOperProgress(const Value: TOnOperProgress);
    procedure SetOnEndOperProgress(const Value: TOnOperProgress);

  protected

  public
    cls_lo_templates:TFMClass;
    cls_geo_objects:TFMClass;
    cls_ways:TFMClass;

    property OnOperProgress:TOnOperProgress read FOnOperProgress write SetOnOperProgress;
    property OnEndOperProgress:TOnOperProgress read FOnEndOperProgress write SetOnEndOperProgress;


    function IsGeoAdmin(aGeoObject:TFMClass):Boolean;
    function GetGeoObject(aName:String):TFMClass;

    procedure IndexingGeo(GeoName:String; IsAdmin:Boolean; AdminName:String);
    procedure IndexingGeosFromWays;

    constructor Create(AOwner: TComponent);
    destructor Destroy;override;
  end;

var
  logisticone:TLogisticOne;

implementation

{ TLogisticOne }

constructor TLogisticOne.Create(AOwner: TComponent);
begin
  inherited;

  FOnOperProgress:= nil;
  FOnEndOperProgress:= nil;

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
end;

destructor TLogisticOne.Destroy;
begin

  inherited;
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
begin
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

  end;
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

procedure TLogisticOne.SetOnEndOperProgress(const Value: TOnOperProgress);
begin
  FOnEndOperProgress := Value;
end;

procedure TLogisticOne.SetOnOperProgress(const Value: TOnOperProgress);
begin
  FOnOperProgress := Value;
end;

end.
