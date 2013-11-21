unit uSelForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXItem, StdCtrls, TntStdCtrls, SpTBXEditors, SpTBXControls, rrfile_mod_api;

type
  TSelForm = class(TForm)
    spMainForm: TSpTBXTitleBar;
    SpTBXPanel1: TSpTBXPanel;
    SpTBXListBox1: TSpTBXListBox;
    SpTBXButton1: TSpTBXButton;
    SpTBXButton2: TSpTBXButton;
    procedure SpTBXListBox1DblClick(Sender: TObject);
    procedure SpTBXListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetResult: TFMClass;
    { Private declarations }
  public
    property Result:TFMClass read GetResult;
    function Execute(aGroup:TFMClass):Integer;
  end;

var
  SelForm: TSelForm;

implementation

{$R *.dfm}

{ TSelForm }

function TSelForm.Execute(aGroup: TFMClass): Integer;
var i:Integer;
begin
  SpTBXListBox1.Clear;
  for i:= 0 to aGroup.MyClassCount - 1 do
  begin
    SpTBXListBox1.AddItem(aGroup.MyClass[i].FindPropertyByName('caption').ValueS,aGroup.MyClass[i]);
  end;
  Result:= ShowModal;
end;

function TSelForm.GetResult: TFMClass;
begin
  Result:= TFMClass(SpTBXListBox1.Items.Objects[SpTBXListBox1.ItemIndex]);
end;

procedure TSelForm.SpTBXListBox1DblClick(Sender: TObject);
begin
  if SpTBXListBox1.ItemIndex >= 0 then
  begin
    ModalResult:= mrOk;
  end;
end;

procedure TSelForm.SpTBXListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SpTBXListBox1DblClick(nil);
end;

end.
