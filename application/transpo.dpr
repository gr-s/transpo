program transpo;

uses
  Forms,
  SysUtils,
  uMainForm in 'uMainForm.pas' {MainForm},
  ati in 'ati.pas',
  transpo_classes in 'transpo_classes.pas',
  uSelectWizard1 in 'uSelectWizard1.pas' {SelectWizard1},
  uBrowser in 'uBrowser.pas' {Browser},
  uCalendarWizard in 'uCalendarWizard.pas' {CalendarWizard},
  uInfoTimerForm in 'uInfoTimerForm.pas' {InfoTimerForm},
  logistic_one in 'logistic_one.pas',
  manage_stack in 'manage_stack.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  MainForm.Init;
  Application.CreateForm(TSelectWizard1, SelectWizard1);
  Application.CreateForm(TBrowser, Browser);
  Application.CreateForm(TCalendarWizard, CalendarWizard);
  Application.CreateForm(TInfoTimerForm, InfoTimerForm);
  MainForm.Run;
  Application.Run;
end.
