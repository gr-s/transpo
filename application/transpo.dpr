program transpo;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  ati in 'ati.pas',
  transpo_classes in 'transpo_classes.pas',
  uSelectWizard1 in 'uSelectWizard1.pas' {SelectWizard1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSelectWizard1, SelectWizard1);
  Application.Run;
end.
