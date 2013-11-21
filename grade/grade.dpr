program grade;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {Form1},
  uSelForm in 'uSelForm.pas' {SelForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSelForm, SelForm);
  Application.Run;
end.
