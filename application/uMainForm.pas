unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXSkins, GRUtils, GRString, rrfile_mod_api, SpTBXItem, ati, transpo_classes;

type
  TForm1 = class(TForm)
    spMainForm: TSpTBXTitleBar;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy;override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

constructor TForm1.Create(AOwner: TComponent);
var cls1:TFMClass;
begin
  inherited;
  FileModLibName:= ExtractFilePath(Application.ExeName) + FileModLibName;
  if not InitFM then
  begin
    MessageBox(Application.Handle,PChar('Не найден один из компонентов приложения' +  '(file_mod_dll.dll).' + #13 + 'Приложение будет закрыто'),PChar('Ошибка'), MB_OK	 OR MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;
  SkinManager.SetSkin('Xito');

  cls_templates:= TFMClass.Create(Self);
  cls_templates.FileName:= AppDir + 'templates.dat';
  cls_templates.Open;

  app_sett:= TFMClass.Create(Self);
  app_sett.FileName:= AppDir + 'transpo.dat';
  app_sett.Open;

  cls1:= cls_templates.FindClassByName('app_sett');
  cls1.CopyClass(app_sett,cls1,False,True);

  ati_service:= TATI.Create(Self);
  ati_service.Init;
end;

destructor TForm1.Destroy;
begin
  app_sett.Save;
  inherited;
end;

end.
