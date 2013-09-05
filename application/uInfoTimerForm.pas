unit uInfoTimerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXItem, SpTBXControls, ExtCtrls;

type
  TInfoTimerForm = class(TForm)
    spMainForm: TSpTBXTitleBar;
    SpTBXLabel1: TSpTBXLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Execute(aText:String);
  end;

var
  InfoTimerForm: TInfoTimerForm;

implementation

{$R *.dfm}

{ TInfoTimerForm }

procedure TInfoTimerForm.Execute(aText: String);
begin
  SpTBXLabel1.Caption:= aText;
  Show;
  Timer1.Enabled:= True;
end;

procedure TInfoTimerForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  Hide;
end;

end.
