unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXSkins, GRUtils, GRString, rrfile_mod_api, SpTBXItem, ati, transpo_classes,
  StdCtrls, ExtCtrls, uSelectWizard1, uBrowser, SpTBXControls;

type
  TMainForm = class(TForm)
    spMainForm: TSpTBXTitleBar;
    Button1: TButton;
    SpTBXPanel1: TSpTBXPanel;
    SpTBXButton1: TSpTBXButton;
    SpTBXButton2: TSpTBXButton;
    SpTBXButton3: TSpTBXButton;
    procedure Button1Click(Sender: TObject);
    procedure SpTBXButton1Click(Sender: TObject);
    procedure SpTBXButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoATIAutorizCode(var Code:String);
    procedure DoATICaptcha(oper_code:Integer);
    procedure DoEndGetTickets(Sender: TObject);

    constructor Create(AOwner: TComponent);override;
    destructor  Destroy;override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TForm1 }

constructor TMainForm.Create(AOwner: TComponent);
var cls1:TFMClass;
begin
  inherited;
  FileModLibName:= ExtractFilePath(Application.ExeName) + FileModLibName;
  if not InitFM then
  begin
    MessageBox(Application.Handle,PChar('�� ������ ���� �� ����������� ����������' +  '(file_mod_dll.dll).' + #13 + '���������� ����� �������'),PChar('������'), MB_OK	 OR MB_ICONERROR);
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
  app_sett.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('app_sett');
  cls1.CopyClass(app_sett,cls1,False,True);

  ati_service:= TATI.Create(Self);
  ati_service.OnAutorizCode:= DoATIAutorizCode;
  ati_service.OnCaptcha:= DoATICaptcha;
  ati_service.OnEndGetTickets:= DoEndGetTickets;

  

  ati_service.init(app_sett.FindClassByName('ati').FindPropertyByName('login').ValueS,
                    app_sett.FindClassByName('ati').FindPropertyByName('passw').ValueS);
  spMainForm.InsertControl(ati_service.wb);
  ati_service.wb.Align:= alNone;
  ati_service.wb.Width:= 0;
  ati_service.wb.Height:= 0;
end;

destructor TMainForm.Destroy;
begin
  app_sett.Save;
  inherited;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  ati_service.GetTickets();
end;

procedure TMainForm.DoATIAutorizCode(var Code: String);
begin
  if SelectWizard1.Execute('��� ��������') = mrOk then
  begin
    Code:= SelectWizard1.SpTBXEdit1.Text;
  end;
end;

procedure TMainForm.DoATICaptcha(oper_code: Integer);
begin
  Browser.Show;
end;

procedure TMainForm.SpTBXButton1Click(Sender: TObject);
begin
  Browser.Show;
end;

procedure TMainForm.SpTBXButton3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.DoEndGetTickets(Sender: TObject);
begin
  ShowMessage('DoEndGetTickets');
end;

end.
