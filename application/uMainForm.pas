unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXSkins, GRUtils, GRString, rrfile_mod_api, SpTBXItem, ati, transpo_classes,
  StdCtrls, ExtCtrls, uSelectWizard1, uBrowser, SpTBXControls, SpTBXTabs,
  SpTBXDkPanels, TB2Item, rrAdvTable, SpTBXEditors;

type
  TMainForm = class(TForm)
    spMainForm: TSpTBXTitleBar;
    SpTBXPanel1: TSpTBXPanel;
    SpTBXButton1: TSpTBXButton;
    SpTBXButton2: TSpTBXButton;
    SpTBXButton3: TSpTBXButton;
    Timer1: TTimer;
    SpTBXPanel2: TSpTBXPanel;
    SpTBXPanel3: TSpTBXPanel;
    SpTBXLabel1: TSpTBXLabel;
    SpTBXLabel2: TSpTBXLabel;
    SpTBXLabel3: TSpTBXLabel;
    SpTBXLabel4: TSpTBXLabel;
    tcSplitterLeft: TSpTBXSplitter;
    tcLeft: TSpTBXTabControl;
    SpTBXTabItem2: TSpTBXTabItem;
    SpTBXTabSheet2: TSpTBXTabSheet;
    tcClient: TSpTBXTabControl;
    SpTBXTabItem3: TSpTBXTabItem;
    SpTBXTabSheet3: TSpTBXTabSheet;
    SpTBXPanel4: TSpTBXPanel;
    SpTBXButton4: TSpTBXButton;
    SpTBXButton5: TSpTBXButton;
    SpTBXPanel5: TSpTBXPanel;
    SpTBXPanel6: TSpTBXPanel;
    tblATIFromGeo: TRRAdvTable;
    SpTBXButton6: TSpTBXButton;
    SpTBXButton7: TSpTBXButton;
    SpTBXButton8: TSpTBXButton;
    SpTBXLabel5: TSpTBXLabel;
    SpTBXEdit1: TSpTBXEdit;
    SpTBXButton9: TSpTBXButton;
    SpTBXButton10: TSpTBXButton;
    tblATIToGeo: TRRAdvTable;
    SpTBXButton11: TSpTBXButton;
    SpTBXButton12: TSpTBXButton;
    SpTBXButton13: TSpTBXButton;
    SpTBXLabel6: TSpTBXLabel;
    SpTBXEdit2: TSpTBXEdit;
    SpTBXButton14: TSpTBXButton;
    SpTBXButton15: TSpTBXButton;
    tblATIGeos: TRRAdvTable;
    SpTBXButton16: TSpTBXButton;
    SpTBXButton17: TSpTBXButton;
    SpTBXButton18: TSpTBXButton;
    SpTBXEdit3: TSpTBXEdit;
    SpTBXButton19: TSpTBXButton;
    SpTBXLabel7: TSpTBXLabel;
    SpTBXEdit4: TSpTBXEdit;
    SpTBXButton20: TSpTBXButton;
    SpTBXLabel8: TSpTBXLabel;
    SpTBXEdit5: TSpTBXEdit;
    SpTBXButton21: TSpTBXButton;
    SpTBXLabel9: TSpTBXLabel;
    SpTBXEdit6: TSpTBXEdit;
    SpTBXButton22: TSpTBXButton;
    SpTBXButton23: TSpTBXButton;
    SpTBXLabel10: TSpTBXLabel;
    SpTBXEdit7: TSpTBXEdit;
    SpTBXButton24: TSpTBXButton;
    SpTBXButton25: TSpTBXButton;
    SpTBXPanel7: TSpTBXPanel;
    SpTBXButton26: TSpTBXButton;
    SpTBXTabItem1: TSpTBXTabItem;
    SpTBXTabSheet1: TSpTBXTabSheet;
    SpTBXButton27: TSpTBXButton;
    SpTBXButton28: TSpTBXButton;
    procedure SpTBXButton1Click(Sender: TObject);
    procedure SpTBXButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpTBXButton2Click(Sender: TObject);
    procedure SpTBXButton4Click(Sender: TObject);
    procedure SpTBXButton5Click(Sender: TObject);
    procedure SpTBXButton27Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Run;

    procedure DoATIAutorizCode(var Code:String);
    procedure DoATICaptcha(oper_code:Integer);
    procedure DoEndGetTickets(Sender: TObject);
    procedure DoOperProgress(Stage1,Stage2:String);

    procedure ToggleOperation(op_code:Integer);

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
  app_sett.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('app_sett');
  cls1.CopyClass(app_sett,cls1,False,True);

  ToggleOperation(op_none);

  tblATIFromGeo.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIFromGeo.Open;
  tblATIToGeo.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIToGeo.Open;
  tblATIGeos.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIGeos.Open;

  ati_service:= TATI.Create(Self);
  ati_service.OnAutorizCode:= DoATIAutorizCode;
  ati_service.OnCaptcha:= DoATICaptcha;
  ati_service.OnEndGetTickets:= DoEndGetTickets;
  ati_service.OnOperProgress:= DoOperProgress;

  

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

procedure TMainForm.DoATIAutorizCode(var Code: String);
begin
  if SelectWizard1.Execute('Код проверки') = mrOk then
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
  DoOperProgress('','');
  ShowMessage('DoEndGetTickets');
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  Browser.Show;
  Browser.Hide;
end;

procedure TMainForm.Run;
begin
  Timer1.Enabled:= True;
end;

procedure TMainForm.DoOperProgress(Stage1, Stage2: String);
begin
  if (Length(Stage1) = 0) and (Length(Stage2) = 0) then
  begin
    SpTBXPanel2.Hide;
  end
  else
  begin
    if not SpTBXPanel2.Visible then
      SpTBXPanel2.Show;

    if Length(Stage1) > 0 then
      SpTBXLabel2.Caption:= Stage1;

    SpTBXLabel4.Caption:= Stage2;
  end;

  Application.ProcessMessages;
end;

procedure TMainForm.ToggleOperation(op_code: Integer);
begin

  LockWindowUpdate(Handle);

  if op_code = op_none then
  begin
    tcLeft.Hide;
    tcSplitterLeft.Hide;
    tcClient.Hide;
  end;

  if op_code = op_ati_get_ticks then
  begin
    tcLeft.Show;
    tcSplitterLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 0;
  end;

  if op_code = op_ati then
  begin
    tcLeft.Show;
    tcSplitterLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 1;
  end;

  LockWindowUpdate(0);

end;

procedure TMainForm.SpTBXButton2Click(Sender: TObject);
begin
  ToggleOperation(op_ati);
end;

procedure TMainForm.SpTBXButton4Click(Sender: TObject);
begin
  if SpTBXButton5.Checked then SpTBXButton5Click(SpTBXButton5);

  SpTBXButton4.Checked:= not SpTBXButton4.Checked;
  if SpTBXButton4.Checked then
    SpTBXButton4.Color:= clRed
  else
    SpTBXButton4.Color:= clNone;
end;

procedure TMainForm.SpTBXButton5Click(Sender: TObject);
begin
  if SpTBXButton4.Checked then SpTBXButton4Click(SpTBXButton5);

  SpTBXButton5.Checked:= not SpTBXButton5.Checked;
  if SpTBXButton5.Checked then
    SpTBXButton5.Color:= clRed
  else
    SpTBXButton5.Color:= clNone;
end;

procedure TMainForm.SpTBXButton27Click(Sender: TObject);
begin
  ToggleOperation(op_ati_get_ticks);  
end;

end.
