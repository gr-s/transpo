unit uSelectWizard1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXItem, SpTBXControls, StdCtrls, SpTBXEditors;

type
  TSelectWizard1 = class(TForm)
    spMainForm: TSpTBXTitleBar;
    SpTBXEdit1: TSpTBXEdit;
    SpTBXButton1: TSpTBXButton;
    SpTBXButton2: TSpTBXButton;
  private
    { Private declarations }
  public
    function Execute(aCaption:String):Integer;
  end;

var
  SelectWizard1: TSelectWizard1;

implementation

{$R *.dfm}

{ TSelectWizard1 }

function TSelectWizard1.Execute(aCaption: String): Integer;
begin
  spMainForm.Caption:= aCaption;
  Result:= ShowModal;
end;

end.
