unit manage_stack;

interface
uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api, ExtCtrls, Controls,
     GRUtils, GRString;

type

  TSO = class;

  TStackProc = procedure (so:TSO) of object;
  
  TSO = class(TComponent)
  private

  protected


  public
    params:TFMClass;

    constructor Create(AOwner: TComponent; aTemplate:TFMClass);
    destructor Destroy;override;

    function Param(aName:String):TFMClassProperty;
    procedure ParamsUpdate(aTemplate:TFMClass);
    procedure AddProc(proc:TStackProc);
    procedure DelProc(aIndex:Integer);
  end;


  TStack = class(TComponent)
  private

  protected
    procedure _execute(stack_object:TSO);
  public
    _objects:TObjectList;

    ID:String;

    constructor Create(AOwner: TComponent);
    destructor Destroy;override;

    function NewObject(params_template:TFMClass = nil):TSO;
    function LastObject:TSO;
    function PopObject:TSO;
    function PushObject(stack_object:TSO):TSO;

    procedure PopAndExecute;
    procedure ExecuteLast;
  end;

  TManageStack = class(TComponent)
  private

  protected

  public
    _stacks:TObjectList;

    constructor Create(AOwner: TComponent);
    destructor Destroy;override;

    function NewStack(aID:String):TStack;
    function Stack(aID:String):TStack;
  end;

implementation

{ TManageStack }

constructor TManageStack.Create(AOwner: TComponent);
begin
  inherited;
  _stacks:= TObjectList.Create;  
end;

destructor TManageStack.Destroy;
begin

  inherited;
end;

function TManageStack.NewStack(aID: String): TStack;
begin
  Result:= TStack.Create(nil);
  Result.ID:= aID;
  _stacks.Add(Result);
end;

function TManageStack.Stack(aID: String): TStack;
var i:Integer;
begin
  Result:= nil;
  for i:= 0 to _stacks.Count - 1 do
  begin
    if TStack(_stacks.Items[i]).ID = aID then
    begin
      Result:= TStack(_stacks.Items[i]);
      Break;
    end;  
  end;
end;

{ TStack }

constructor TStack.Create(AOwner: TComponent);
begin
  inherited;
  ID:= '';
  _objects:= TObjectList.Create;
end;

destructor TStack.Destroy;
begin

  inherited;
end;

procedure TStack.ExecuteLast;
begin
  _execute(LastObject);
end;

function TStack.LastObject: TSO;
begin
  Result:= TSO(_objects.Items[_objects.Count-1]);
end;

function TStack.NewObject(params_template:TFMClass): TSO;
begin
  Result:= TSO.Create(nil,params_template);
  _objects.Add(Result);
end;

procedure TStack.PopAndExecute;
var so:TSO;
begin
  so:= PopObject;
  _execute(so);  
end;

function TStack.PopObject: TSO;
begin
  Result:= LastObject;
  _objects.Extract(Result);
end;

function TStack.PushObject(stack_object: TSO): TSO;
begin
  _objects.Add(stack_object);
  Result:= LastObject;  
end;

procedure TStack._execute(stack_object: TSO);
var i:Integer;
begin
  for i:= 0 to stack_object.params.FindClassByName('proc').MyClassCount - 1 do
  begin
    TStackProc(Pointer(stack_object.params.FindClassByName('proc').MyClass[i].FindPropertyByName('entry').ValueW)^)(stack_object);
  end;
end;

{ TSO }

procedure TSO.AddProc(proc: TStackProc);
var cls1:TFMClass;
begin
  cls1:= params.FindClassByName('proc').CreateClassItem('','');
  cls1.CreateClassPropertyItem('entry',ptDWord,'0').ValueW:= DWORD(@proc);
end;

constructor TSO.Create(AOwner: TComponent; aTemplate:TFMClass);
begin
  inherited Create(AOwner);

  params:= TFMClass.Create(nil);
  params.CreateClassItem('proc','');

  if Assigned(aTemplate) then
    ParamsUpdate(aTemplate);
end;

procedure TSO.DelProc(aIndex: Integer);
begin
  params.FindClassByName('proc').DeleteClassItem(params.FindClassByName('proc').MyClass[aIndex]);
end;

destructor TSO.Destroy;
begin

  inherited;
end;

function TSO.Param(aName: String): TFMClassProperty;
begin
  Result:= params.FindPropertyByName(aName);
end;

procedure TSO.ParamsUpdate(aTemplate: TFMClass);
begin
  aTemplate.CopyClass(params,aTemplate,False,True);
end;

end.
