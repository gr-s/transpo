program transpo;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {Form1},
  ati in 'ati.pas',
  transpo_classes in 'transpo_classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
