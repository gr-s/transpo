program transpo;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  ati in 'ati.pas',
  transpo_classes in 'transpo_classes.pas',
  uSelectWizard1 in 'uSelectWizard1.pas' {SelectWizard1},
  uBrowser in 'uBrowser.pas' {Browser},
  uCalendarWizard in 'uCalendarWizard.pas' {CalendarWizard};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSelectWizard1, SelectWizard1);
  Application.CreateForm(TBrowser, Browser);
  Application.CreateForm(TCalendarWizard, CalendarWizard);
  MainForm.Run;
  Application.Run;
end.
