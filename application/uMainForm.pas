unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXSkins, GRUtils, GRString, rrfile_mod_api, SpTBXItem, ati, transpo_classes,
  StdCtrls, ExtCtrls, uSelectWizard1, uBrowser, SpTBXControls, SpTBXTabs,
  SpTBXDkPanels, TB2Item, rrAdvTable, SpTBXEditors, uCalendarWizard,
  GRFormPanel, uInfoTimerForm;

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
    tcLeft: TSpTBXTabControl;
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
    SpTBXButton8: TSpTBXButton;
    SpTBXLabel5: TSpTBXLabel;
    SpTBXEdit1: TSpTBXEdit;
    SpTBXButton9: TSpTBXButton;
    SpTBXButton10: TSpTBXButton;
    tblATIToGeo: TRRAdvTable;
    SpTBXButton11: TSpTBXButton;
    SpTBXButton13: TSpTBXButton;
    SpTBXLabel6: TSpTBXLabel;
    SpTBXEdit2: TSpTBXEdit;
    SpTBXButton14: TSpTBXButton;
    SpTBXButton15: TSpTBXButton;
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
    SpTBXPanel8: TSpTBXPanel;
    SpTBXLabel11: TSpTBXLabel;
    SpTBXLabel12: TSpTBXLabel;
    SpTBXLabel13: TSpTBXLabel;
    SpTBXLabel14: TSpTBXLabel;
    tblATIGeos: TRRAdvTable;
    SpTBXTabItem4: TSpTBXTabItem;
    SpTBXTabSheet4: TSpTBXTabSheet;
    SpTBXButton7: TSpTBXButton;
    SpTBXTabControl1: TSpTBXTabControl;
    SpTBXTabItem2: TSpTBXTabItem;
    SpTBXTabSheet5: TSpTBXTabSheet;
    SpTBXTabItem5: TSpTBXTabItem;
    SpTBXTabSheet6: TSpTBXTabSheet;
    tblFinded: TRRAdvTable;
    SpTBXPanel9: TSpTBXPanel;
    SpTBXPanel10: TSpTBXPanel;
    SpTBXButton12: TSpTBXButton;
    SpTBXButton29: TSpTBXButton;
    SpTBXButton31: TSpTBXButton;
    SpTBXButton32: TSpTBXButton;
    SpTBXLabel15: TSpTBXLabel;
    SpTBXTabItem7: TSpTBXTabItem;
    SpTBXTabSheet8: TSpTBXTabSheet;
    tblFindedTickets: TRRAdvTable;
    SpTBXPanel11: TSpTBXPanel;
    SpTBXButton33: TSpTBXButton;
    SpTBXLabel16: TSpTBXLabel;
    SpTBXLabel17: TSpTBXLabel;
    SpTBXLabel18: TSpTBXLabel;
    SpTBXLabel19: TSpTBXLabel;
    SpTBXLabel20: TSpTBXLabel;
    SpTBXLabel21: TSpTBXLabel;
    SpTBXPanel12: TSpTBXPanel;
    SpTBXLabel22: TSpTBXLabel;
    SpTBXPanel13: TSpTBXPanel;
    SpTBXButton34: TSpTBXButton;
    SpTBXButton35: TSpTBXButton;
    SpTBXLabel23: TSpTBXLabel;
    tblFavor: TRRAdvTable;
    SpTBXButton36: TSpTBXButton;
    SpTBXLabel24: TSpTBXLabel;
    SpTBXLabel25: TSpTBXLabel;
    SpTBXLabel26: TSpTBXLabel;
    SpTBXTabItem8: TSpTBXTabItem;
    SpTBXTabSheet9: TSpTBXTabSheet;
    SpTBXPanel14: TSpTBXPanel;
    SpTBXButton37: TSpTBXButton;
    SpTBXLabel27: TSpTBXLabel;
    SpTBXLabel28: TSpTBXLabel;
    SpTBXLabel29: TSpTBXLabel;
    SpTBXLabel30: TSpTBXLabel;
    SpTBXLabel31: TSpTBXLabel;
    SpTBXLabel32: TSpTBXLabel;
    SpTBXPanel15: TSpTBXPanel;
    SpTBXLabel33: TSpTBXLabel;
    SpTBXLabel34: TSpTBXLabel;
    tblFavorTickets: TRRAdvTable;
    SpTBXButton38: TSpTBXButton;
    SpTBXButton39: TSpTBXButton;
    SpTBXTabItem6: TSpTBXTabItem;
    SpTBXTabSheet7: TSpTBXTabSheet;
    SpTBXPanel16: TSpTBXPanel;
    SpTBXButton30: TSpTBXButton;
    SpTBXLabel36: TSpTBXLabel;
    SpTBXLabel39: TSpTBXLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Shape1: TShape;
    SpTBXLabel37: TSpTBXLabel;
    SpTBXLabel38: TSpTBXLabel;
    Shape2: TShape;
    Memo4: TMemo;
    SpTBXLabel40: TSpTBXLabel;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    tblTicketStatuses: TRRAdvTable;
    SpTBXLabel41: TSpTBXLabel;
    SpTBXPanel17: TSpTBXPanel;
    SpTBXLabel35: TSpTBXLabel;
    Shape3: TShape;
    procedure SpTBXButton1Click(Sender: TObject);
    procedure SpTBXButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpTBXButton2Click(Sender: TObject);
    procedure SpTBXButton4Click(Sender: TObject);
    procedure SpTBXButton5Click(Sender: TObject);
    procedure SpTBXButton27Click(Sender: TObject);
    procedure SpTBXButton17Click(Sender: TObject);
    procedure SpTBXButton16Click(Sender: TObject);
    procedure SpTBXButton19Click(Sender: TObject);
    procedure tblATIGeosAfterCellEdit(aCell: TRRCell);
    procedure tblATIGeosChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton18Click(Sender: TObject);
    procedure SpTBXButton26Click(Sender: TObject);
    procedure SpTBXButton9Click(Sender: TObject);
    procedure SpTBXButton14Click(Sender: TObject);
    procedure SpTBXButton20Click(Sender: TObject);
    procedure SpTBXButton21Click(Sender: TObject);
    procedure SpTBXButton22Click(Sender: TObject);
    procedure SpTBXButton24Click(Sender: TObject);
    procedure SpTBXButton6Click(Sender: TObject);
    procedure SpTBXButton11Click(Sender: TObject);
    procedure SpTBXButton8Click(Sender: TObject);
    procedure SpTBXButton13Click(Sender: TObject);
    procedure SpTBXButton10Click(Sender: TObject);
    procedure SpTBXButton15Click(Sender: TObject);
    procedure SpTBXButton23Click(Sender: TObject);
    procedure SpTBXButton25Click(Sender: TObject);
    procedure SpTBXButton7Click(Sender: TObject);
    procedure tblATIFromGeoAfterCellEdit(aCell: TRRCell);
    procedure tblATIToGeoAfterCellEdit(aCell: TRRCell);
    procedure SpTBXButton12Click(Sender: TObject);
    procedure SpTBXButton29Click(Sender: TObject);
    procedure SpTBXButton31Click(Sender: TObject);
    procedure SpTBXButton32Click(Sender: TObject);
    procedure tblFindedChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton33Click(Sender: TObject);
    procedure SpTBXButton30Click(Sender: TObject);
    procedure tblFindedTicketsAfterCellEdit(aCell: TRRCell);
    procedure SpTBXButton34Click(Sender: TObject);
    procedure SpTBXButton35Click(Sender: TObject);
    procedure SpTBXButton36Click(Sender: TObject);
    procedure tblFavorDblClickCell(Sender: TObject);
    procedure tblFavorChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton38Click(Sender: TObject);
    procedure SpTBXLabel23Click(Sender: TObject);
    procedure SpTBXLabel15Click(Sender: TObject);
    procedure tblFavorTicketsAfterCellEdit(aCell: TRRCell);
    procedure SpTBXButton37Click(Sender: TObject);
    procedure SpTBXButton39Click(Sender: TObject);
    procedure tblFindedTicketsDblClickCell(Sender: TObject);
    procedure tblFindedTicketsChangeSelectedCell(Sender: TObject);
    procedure tblFavorTicketsDblClickCell(Sender: TObject);
    procedure tblTicketStatusesDblClickCell(Sender: TObject);
  private
    Fact_cls_block_favor: TFMClass;
    procedure Setact_cls_block_favor(const Value: TFMClass);
    { Private declarations }
  public
    curr_sel_cell_value:String;
    old_ticket_info_oper_id:Integer;
    _FromGeoIndex:Integer;
    _ToGeoIndex:Integer;

    cls_active_ticket:TFMClass;

    LockAllEventChangeSelCell:Boolean;

    property act_cls_block_favor:TFMClass read Fact_cls_block_favor write Setact_cls_block_favor;

    procedure Run;

    procedure DoATIAutorizCode(var Code:String);
    procedure DoATICaptcha(oper_code:Integer);
    procedure DoEndGetTickets(Sender: TObject);
    procedure DoOperProgress(Stage1,Stage2:String);
    procedure DoOperSub1Progress(Stage1,Stage2:String);

    procedure TblUpdateGeos(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateBlocks(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateTickets(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateTicketStatuses(aTable:TRRAdvTable; aClass:TFMClass);

    procedure TblCheckUnCheck(aTable:TRRAdvTable; Value:Boolean);
    procedure TblCheckWVolume(aTable:TRRAdvTable);

    procedure TblUpdateTicketInfo(aClass:TFMClass);

    procedure ATIGetTickets(FromGeoIndex, ToGeoIndex:Integer);
    procedure UpdateATI_f_Params;

    function  GetTicketByID(ID:String;aClass:TFMClass):TFMClass;
    function  GetStatusFontColor(statID:Integer):TColor;

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

  SpTBXTabControl1.ActiveTabIndex:= 0;

  curr_sel_cell_value:= '';
  LockAllEventChangeSelCell:= False;

  act_cls_block_favor:= nil;

  cls_templates:= TFMClass.Create(Self);
  cls_templates.FileName:= AppDir + 'templates.dat';
  cls_templates.Open;

  app_sett:= TFMClass.Create(Self);
  app_sett.FileName:= AppDir + 'transpo.dat';
  app_sett.Open;
  app_sett.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('app_sett');
  cls1.CopyClass(app_sett,cls1,False,True);

  cls_geos:= TFMClass.Create(Self);
  cls_geos.FileName:= AppDir + 'data\geos.dat';
  cls_geos.Open;
  cls_geos.FileType:= ftFullText;
  cls_geos.ClassSortType:= stAlpha;

  cls_data:= TFMClass.Create(Self);
  cls_data.FileName:= AppDir + 'data\data.dat';
  cls_data.Open;
  cls_data.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('data_file');
  cls1.CopyClass(cls_data,cls1,False,True);

  ToggleOperation(op_none);

  tblATIFromGeo.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIFromGeo.Open;
  tblATIToGeo.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIToGeo.Open;
  tblATIGeos.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIGeos.Open;

  tblFinded.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\blocks.tbl';
  tblFinded.Options.ForceNullSelecting:= False;
  tblFinded.Open;

  tblFavor.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\blocks.tbl';
  tblFavor.Options.ForceNullSelecting:= False;
  tblFavor.Open;

  tblFindedTickets.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\tickets.tbl';
  tblFindedTickets.Options.ForceNullSelecting:= False;
  tblFindedTickets.Open;

  tblFavorTickets.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\tickets.tbl';
  tblFavorTickets.Options.ForceNullSelecting:= False;
  tblFavorTickets.Open;

  tblTicketStatuses.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\statuses.tbl';
  tblTicketStatuses.Options.ForceNullSelecting:= False;
  tblTicketStatuses.Open;


  TblUpdateGeos(tblATIGeos,cls_geos);
  TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
  TblUpdateBlocks(tblFavor,cls_data.FindClassByName('blocks').FindClassByName('favor'));
  TblUpdateTicketStatuses(tblTicketStatuses,cls_templates.FindClassByName('ticket_statuses'));
  UpdateATI_f_Params;
  

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
  SpTBXButton26.Enabled:= True;
end;

procedure TMainForm.SpTBXButton3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.DoEndGetTickets(Sender: TObject);
var cls1,cls2:TFMClass;
    s:String;
begin
  cls2:= ati_service.GetTickResult.CutClassItem(ati_service.GetTickResult.FindClassByName('items'));
  cls1:= cls_data.FindClassByName('blocks').FindClassByName('finded').CreateClassItem('','');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('data_block'),False,True);
  s:= Copy(ati_service.GetTickOption.FromGeo,1,4) + '-' + Copy(ati_service.GetTickOption.ToGeo,1,4);
  cls1.FindPropertyByName('Caption').ValueS:= s;
  cls1.FindPropertyByName('Date').ValueS:= DateToStr(ati_service.GetTickOption.DateBegin); 
  cls1.AddClass(cls2);
  cls_data.Save;
  TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
  Application.ProcessMessages;
  ATIGetTickets(-1,-1);
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
  if not SpTBXPanel2.Visible then
    SpTBXPanel2.Show;

  if Length(Stage1) > 0 then
    SpTBXLabel2.Caption:= Stage1;

  SpTBXLabel4.Caption:= Stage2;

  Application.ProcessMessages;
end;

procedure TMainForm.ToggleOperation(op_code: Integer);
begin

  LockAllEventChangeSelCell:= True;

  LockWindowUpdate(Handle);

  if op_code = op_none then
  begin
    tcLeft.Hide;
    tcClient.Hide;
  end;

  if op_code = op_ati then
  begin
    tcLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 1;
  end;

  if op_code = op_ati_get_ticks then
  begin
    tcLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 0;
    SpTBXButton4Click(SpTBXButton4);
  end;

  if op_code = op_finded_ticks then
  begin
    tcClient.ActiveTabIndex:= 2;
  end;

  if op_code = op_favor_ticks then
  begin
    tcClient.ActiveTabIndex:= 3;
  end;

  if op_code = op_ticket_info then
  begin
    tcClient.ActiveTabIndex:= 4;
  end;

  LockWindowUpdate(0);

  LockAllEventChangeSelCell:= False;

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

procedure TMainForm.TblUpdateGeos(aTable: TRRAdvTable; aClass:TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    if Assigned(aClass.MyClass[i].FindPropertyByName('Enabled')) then
      if aClass.MyClass[i].FindPropertyByName('Enabled').ValueB then
        aTable.Cell[0,aTable.RowCount-1].TextString:= '1';
    aTable.Cell[1,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('Caption').ValueS;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[1,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    if aTable.Cell[1,aTable.RowCount-1].TextString = curr_sel_cell_value then
      sel_cell:= aTable.Cell[1,aTable.RowCount-1];
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton17Click(Sender: TObject);
var cls1:TFMClass;
    s:String;
begin
  s:= DelAllSpace(AnsiUpperCase(SpTBXEdit3.Text));
  cls1:= cls_geos.CreateClassItem(s,'');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('geo'),False,True);
  cls1.SysName:= s;
  cls1.FindPropertyByName('Caption').ValueS:= AnsiUpperCase(SpTBXEdit3.Text);
  cls_geos.Save;
  curr_sel_cell_value:= s;
  TblUpdateGeos(tblATIGeos,cls_geos);
end;

procedure TMainForm.SpTBXButton16Click(Sender: TObject);
begin
  if Assigned(tblATIGeos.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'Подтвердите действие !!!','Подтверждение',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      TFMClass(tblATIGeos.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblATIGeos.SelectedCell.Data1));
      tblATIGeos.DelRow(tblATIGeos.SelectedCell.Row);
      cls_geos.Save;
    end;
  end;
end;

procedure TMainForm.SpTBXButton19Click(Sender: TObject);
begin
  SpTBXEdit3.Text:= '';
end;

procedure TMainForm.tblATIGeosAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'geo' then
  begin
    {TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS:= AnsiUpperCase(aCell.TextString);
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIGeos,cls_geos);
    cls_geos.Save;}
  end;
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('Enabled').ValueB:= aCell.TextString = '1';
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIGeos,TFMClass(aCell.Data1).ParentClass);
    cls_geos.Save;
  end;
end;

procedure TMainForm.tblATIGeosChangeSelectedCell(Sender: TObject);
begin
  if Assigned(tblATIGeos.SelectedCell) then
  begin
    SpTBXEdit3.Text:= tblATIGeos.SelectedCell.TextString;
    SpTBXEdit3.SelStart:= 1;
    SpTBXEdit3.SelLength:= Length(SpTBXEdit3.Text);
    SpTBXEdit3.SelectAll; 
  end;
end;

procedure TMainForm.SpTBXButton18Click(Sender: TObject);
var cls1:TFMClass;
begin
  if Length(SpTBXEdit3.Text) > 0 then
  begin
    if SpTBXButton4.Checked then
    begin
      cls1:= app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos').CreateClassItem('','');
      cls_templates.CopyClass(cls1,cls_templates.FindClassByName('geo'),False,True);
      cls1.FindPropertyByName('Caption').ValueS:= AnsiUpperCase(SpTBXEdit3.Text);
      app_sett.Save;
      TblUpdateGeos(tblATIFromGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos'));
    end
    else
    begin
      cls1:= app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos').CreateClassItem('','');
      cls_templates.CopyClass(cls1,cls_templates.FindClassByName('geo'),False,True);
      cls1.FindPropertyByName('Caption').ValueS:= AnsiUpperCase(SpTBXEdit3.Text);
      app_sett.Save;
      TblUpdateGeos(tblATIToGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos'));
    end;
  end;
end;

procedure TMainForm.UpdateATI_f_Params;
begin
  TblUpdateGeos(tblATIFromGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos'));
  TblUpdateGeos(tblATIToGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos'));
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('FromRadius').ValueI > 0 then
    SpTBXEdit1.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('FromRadius').ValueI);
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('ToRadius').ValueI > 0 then
    SpTBXEdit2.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('ToRadius').ValueI);
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('WeightEnd').ValueI > 0 then
    SpTBXEdit4.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('WeightEnd').ValueI);
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('VolumeEnd').ValueI > 0 then
    SpTBXEdit5.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('VolumeEnd').ValueI);
  SpTBXEdit6.Text:= app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateBegin').ValueS;
  SpTBXEdit7.Text:= app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateEnd').ValueS;
end;

procedure TMainForm.SpTBXButton26Click(Sender: TObject);
var i:Integer;
    dt:TDateTime;
begin
  ati_service.GetTickOption:= GetTickOptionDefault;

  if TryStrToInt(SpTBXEdit1.Text,i) then
  begin
    ati_service.GetTickOption.FromRadius:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('FromRadius').ValueI:= i;
  end;
  if TryStrToInt(SpTBXEdit2.Text,i) then
  begin
    ati_service.GetTickOption.ToRadius:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('ToRadius').ValueI:= i;
  end;
  if TryStrToInt(SpTBXEdit4.Text,i) then
  begin
    ati_service.GetTickOption.WeightEnd:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('WeightEnd').ValueI:= i;
  end;
  if TryStrToInt(SpTBXEdit5.Text,i) then
  begin
    ati_service.GetTickOption.VolumeEnd:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('VolumeEnd').ValueI:= i;
  end;

  if TryStrToDate(SpTBXEdit6.Text,dt) then
  begin
    ati_service.GetTickOption.DateBegin:= dt;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateBegin').ValueS:= SpTBXEdit6.Text;
  end;
  if TryStrToDate(SpTBXEdit7.Text,dt) then
  begin
    ati_service.GetTickOption.DateEnd:= dt;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateEnd').ValueS:= SpTBXEdit7.Text;
  end;

  app_sett.Save;

  SpTBXButton26.Enabled:= False;
  ATIGetTickets(0,0);
end;

procedure TMainForm.SpTBXButton9Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '';
end;

procedure TMainForm.SpTBXButton14Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '';
end;

procedure TMainForm.SpTBXButton20Click(Sender: TObject);
begin
  SpTBXEdit4.Text:= '';
end;

procedure TMainForm.SpTBXButton21Click(Sender: TObject);
begin
  SpTBXEdit5.Text:= '';
end;

procedure TMainForm.SpTBXButton22Click(Sender: TObject);
begin
  SpTBXEdit6.Text:= '';
end;

procedure TMainForm.SpTBXButton24Click(Sender: TObject);
begin
  SpTBXEdit7.Text:= '';
end;

procedure TMainForm.SpTBXButton6Click(Sender: TObject);
begin
  if Assigned(tblATIFromGeo.SelectedCell) then
  begin
    TFMClass(tblATIFromGeo.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblATIFromGeo.SelectedCell.Data1));
    tblATIFromGeo.DelRow(tblATIFromGeo.SelectedCell.Row);
    app_sett.Save;
  end;
end;

procedure TMainForm.SpTBXButton11Click(Sender: TObject);
begin
  if Assigned(tblATIToGeo.SelectedCell) then
  begin
    TFMClass(tblATIToGeo.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblATIToGeo.SelectedCell.Data1));
    tblATIToGeo.DelRow(tblATIToGeo.SelectedCell.Row);
    app_sett.Save;
  end;
end;

procedure TMainForm.SpTBXButton8Click(Sender: TObject);
begin
  app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos').Close;
  tblATIFromGeo.ClearRows;
  app_sett.Save;
end;

procedure TMainForm.SpTBXButton13Click(Sender: TObject);
begin
  app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos').Close;
  tblATIToGeo.ClearRows;
  app_sett.Save;
end;

procedure TMainForm.SpTBXButton10Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '100';
end;

procedure TMainForm.SpTBXButton15Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '100';
end;

procedure TMainForm.DoOperSub1Progress(Stage1, Stage2: String);
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
      SpTBXLabel12.Caption:= Stage1;

    SpTBXLabel14.Caption:= Stage2;
  end;

  Application.ProcessMessages;
end;

procedure TMainForm.ATIGetTickets(FromGeoIndex, ToGeoIndex:Integer);
begin
  if (FromGeoIndex = 0) and (ToGeoIndex = 0) then
  begin
    if tblATIFromGeo.RowCount = 0 then
      ati_service.GetTickOption.FromGeo:= ''
    else
      ati_service.GetTickOption.FromGeo:= tblATIFromGeo.Cell[1,0].TextString;
    if tblATIToGeo.RowCount = 0 then
      ati_service.GetTickOption.ToGeo:= ''
    else
      ati_service.GetTickOption.ToGeo:= tblATIToGeo.Cell[1,0].TextString;

    _FromGeoIndex:= 0;
    _ToGeoIndex:= 0;
  end;

  if (FromGeoIndex = -1) and (ToGeoIndex = -1) then
  begin
    Inc(_FromGeoIndex);
    if _FromGeoIndex > tblATIFromGeo.RowCount - 1 then
    begin
      _FromGeoIndex:= 0;
      Inc(_ToGeoIndex);
    end;
  end;

  if (_ToGeoIndex > tblATIToGeo.RowCount - 1) then
  begin
    SpTBXButton26.Enabled:= True;
    DoOperSub1Progress('','');
    Exit;
  end;

  if tblATIFromGeo.Cell[0,_FromGeoIndex].TextString <> '1' then
  begin
    ATIGetTickets(-1,-1);
    Exit;
  end;

  if tblATIToGeo.Cell[0,_ToGeoIndex].TextString <> '1' then
  begin
    Inc(_ToGeoIndex);
    ATIGetTickets(_FromGeoIndex,_ToGeoIndex);
    Exit;
  end;
  
  ati_service.GetTickOption.FromGeo:= tblATIFromGeo.Cell[1,_FromGeoIndex].TextString;
  ati_service.GetTickOption.ToGeo:= tblATIToGeo.Cell[1,_ToGeoIndex].TextString;
  DoOperSub1Progress(ati_service.GetTickOption.FromGeo + ' - ' + ati_service.GetTickOption.ToGeo,'');
  ati_service.GetTickets;
end;

procedure TMainForm.SpTBXButton23Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y-CalendarWizard.spMainForm.Height) = mrOk then
    SpTBXEdit6.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton25Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y-CalendarWizard.spMainForm.Height) = mrOk then
    SpTBXEdit7.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton7Click(Sender: TObject);
begin
  ati_service.StopFlag:= True;
  Application.ProcessMessages; 
end;

procedure TMainForm.tblATIFromGeoAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('Enabled').ValueB:= aCell.TextString = '1';
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIFromGeo,TFMClass(aCell.Data1).ParentClass);
    app_sett.Save;
  end;
end;

procedure TMainForm.tblATIToGeoAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('Enabled').ValueB:= aCell.TextString = '1';
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIToGeo,TFMClass(aCell.Data1).ParentClass);
    app_sett.Save;
  end;
end;

procedure TMainForm.TblUpdateBlocks(aTable: TRRAdvTable; aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    if Length(aClass.MyClass[i].FindPropertyByName('Caption').ValueS) > 0 then
      aTable.Cell[1,aTable.RowCount-1].TextSrings.Add(aClass.MyClass[i].FindPropertyByName('Caption').ValueS)
    else
      aTable.Cell[1,aTable.RowCount-1].TextSrings.Add('Без имени');
    aTable.Cell[1,aTable.RowCount-1].TextSrings.Add(aClass.MyClass[i].FindPropertyByName('Date').ValueS);
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[1,aTable.RowCount-1].Data1:= aClass.MyClass[i];
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton12Click(Sender: TObject);
begin
  SpTBXTabControl1.ActiveTabIndex:= 0;
  ToggleOperation(op_finded_ticks);
end;

procedure TMainForm.SpTBXButton29Click(Sender: TObject);
begin
  SpTBXTabControl1.ActiveTabIndex:= 1;
  ToggleOperation(op_favor_ticks);
end;

procedure TMainForm.SpTBXButton31Click(Sender: TObject);
begin
  if MessageBox(Application.Handle,'Подтвердите действие !!!','Подтверждение',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
  begin
    cls_data.FindClassByName('blocks').FindClassByName('finded').Close;
    cls_data.Save;
    TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
  end;
end;

procedure TMainForm.SpTBXButton32Click(Sender: TObject);
begin
  if Assigned(tblFinded.SelectedCell) then
  begin
    TFMClass(tblFinded.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblFinded.SelectedCell.Data1));
    tblFinded.DelRow(tblFinded.SelectedCell.Row);
    cls_data.Save;
  end;
end;

procedure TMainForm.tblFindedChangeSelectedCell(Sender: TObject);
var cls1:TFMClass;
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblFinded.SelectedCell) then
  begin
    ToggleOperation(op_finded_ticks);
    Application.ProcessMessages;
    cls1:= TFMClass(tblFinded.Cell[0,tblFinded.SelectedCell.Row].Data1);
    TblUpdateTickets(tblFindedTickets,cls1);
    if Assigned(cls1.FindPropertyByName('_sel_row')) then
      if cls1.FindPropertyByName('_sel_row').ValueI >= 0 then
        tblFindedTickets.SetSelectedCell(cls1.FindPropertyByName('_sel_col').ValueI,cls1.FindPropertyByName('_sel_row').ValueI);
  end;
end;

procedure TMainForm.TblUpdateTickets(aTable: TRRAdvTable;
  aClass: TFMClass);
var i,n,k,k1,j:Integer;
    sel_cell:TRRCell;
    cls1,cls2:TFMClass;
    b:Boolean;
    ds:Char;
    s1,s2:String;
    buff,buff2: TStringList;
begin
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  aTable.ClearRows(True);
  Application.ProcessMessages;
  
  aTable.BeginUpdate;

  LockAllEventChangeSelCell:= True;
  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;


  cls1:= aClass.FindClassByName('items');

  if Assigned(cls1) then
  begin
    buff:= TStringList.Create;
    buff2:= TStringList.Create;

    if aTable = tblFindedTickets then
    begin
      for i:= 0 to cls1.MyClassCount - 1 do
      begin
        cls1.MyClass[i].Tag:= 0;
        if TryStrToInt(cls1.MyClass[i].FindPropertyByName('Price1').ValueS,k1) then
        begin
          buff.AddObject('',cls1.MyClass[i]);
        end;
      end;

      while buff.Count > 0 do
      begin
        b:= False;
        for n:= 0 to buff2.Count - 1 do
        begin
          if StrToFloat(TFMClass(buff.Objects[0]).FindPropertyByName('Price1').ValueS) > StrToFloat(TFMClass(buff2.Objects[n]).FindPropertyByName('Price1').ValueS) then
          begin
            buff2.InsertObject(n,'',buff.Objects[0]);
            TFMClass(buff.Objects[0]).Tag:= 10;
            buff.Delete(0);
            b:= True;
            Break;
          end;
        end;
        if not b then
        begin
          buff2.AddObject('',buff.Objects[0]);
          TFMClass(buff.Objects[0]).Tag:= 10;
          buff.Delete(0);
        end
      end;
      for i:= 0 to cls1.MyClassCount - 1 do
      begin
        if cls1.MyClass[i].Tag = 0 then
        begin
          buff2.AddObject('',cls1.MyClass[i]);
          cls1.MyClass[i].Tag:= 10;
        end;
      end;
    end
    else
    begin
      for i:= 0 to cls1.MyClassCount - 1 do
      begin
        buff2.AddObject('',cls1.MyClass[i]);
        cls1.MyClass[i].Tag:= 10;
      end;
    end;

    k:= -1;

    for i:= 0 to buff2.Count - 1 do
    begin
      aTable.CreateRowBlock(0);
      
      Inc(k,2);

      cls1:= TFMClass(buff2.Objects[i]);

      aTable.Cell[0,k-1].Data1:= cls1;

      if Assigned(cls1.FindPropertyByName('_checked')) then
        if cls1.FindPropertyByName('_checked').ValueB then
          aTable.Cell[0,k-1].TextString:= '1';

      aTable.Cell[1,k-1].TextString:= IntToStr(cls1.FindPropertyByName('DistI').ValueI) + ' км';

      aTable.Cell[2,k-1].TextString:= cls1.FindPropertyByName('Price1').ValueS;
      if TryStrToInt(aTable.Cell[2,k-1].TextString,k1) then
        aTable.Cell[2,k-1].TextString:= aTable.Cell[2,k-1].TextString + ' р';

      s1:= FloatToStrF(cls1.FindPropertyByName('Weight').ValueF,fffixed,10,1);
      s1:= DelSymb(s1,'.0');

      if cls1.FindPropertyByName('Volume').ValueF > 0 then
      begin
        s2:= FloatToStrF(cls1.FindPropertyByName('Volume').ValueF,fffixed,10,1);
        s2:= DelSymb(s2,'.0');
      end
      else
        s2:= '--';

      aTable.Cell[3,k-1].TextString:= s1 + ' / ' + s2;

      aTable.Cell[4,k-1].TextString:= cls1.FindPropertyByName('DateDesc').ValueS;
      aTable.Cell[5,k-1].TextString:= cls1.FindPropertyByName('FromGeo').ValueS;
      aTable.Cell[6,k-1].TextString:= cls1.FindPropertyByName('ToGeo').ValueS;
      aTable.Cell[7,k-1].TextString:= cls1.FindPropertyByName('CargoName').ValueS;

      if Assigned(cls1.FindPropertyByName('_status_id')) then
      begin
        aTable.Cell[7,k].Font.Color:= GetStatusFontColor(cls1.FindPropertyByName('_status_id').ValueI);
        aTable.Cell[7,k].TextString:= cls1.FindPropertyByName('_status_str').ValueS;
      end;
    end;

    FreeAndNil(buff);
    FreeAndNil(buff2);
  end;

  aTable.EndUpdate;

  DecimalSeparator:= ds;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
  LockAllEventChangeSelCell:= False;

  if aTable = tblFindedTickets then
  begin
    TblCheckWVolume(aTable);
    SpTBXLabel22.Caption:= IntToStr(aTable.RowCount div 2) + ' записей';
  end;
  if aTable = tblFavorTickets then
  begin
    TblCheckWVolume(aTable);
    SpTBXLabel33.Caption:= IntToStr(aTable.RowCount div 2) + ' записей';
  end;
end;

procedure TMainForm.SpTBXButton33Click(Sender: TObject);
begin
  TblCheckUnCheck(tblFindedTickets,False);
end;

procedure TMainForm.TblCheckUnCheck(aTable: TRRAdvTable; Value: Boolean);
var i,n:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  n:= 2;

  if aTable = tblFavor then n:= 1;

  i:= 0;
  while i <= aTable.RowCount-1 do
  begin
    if Value then
    begin
      if Assigned(aTable.Cell[0,i].Data1) then
        if Assigned(TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked')) then
          TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked').ValueB:= True;
      aTable.Cell[0,i].TextString:= '1'
    end
    else
    begin
      if Assigned(aTable.Cell[0,i].Data1) then
        if Assigned(TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked')) then
          TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked').ValueB:= False;
      aTable.Cell[0,i].TextString:= '';
    end;
    Inc(i,n);
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row);

  aTable.LockEventChangeSelCell:= False;

  if aTable = tblFindedTickets then
  begin
    TblCheckWVolume(aTable);
    cls_data.Save;
  end;
end;

procedure TMainForm.TblCheckWVolume(aTable: TRRAdvTable);
var f1,f2,f3,f4:Single;
    i:Integer;
    ds:Char;
begin
  f1:= 0; f2:= 0; f3:= 0;
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  i:= 0;
  while i <= aTable.RowCount-1 do
  begin
    if TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked').ValueB then
    begin
      if TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Weight').ValueF > 0 then
        f1:= f1 + TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Weight').ValueF;
      if TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Volume').ValueF > 0 then
        f2:= f2 + TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Volume').ValueF;
      if TryStrToFloat(TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Price1').ValueS,f4) then
        f3:= f3 + f4;
    end;
    Inc(i,2);
  end;

  if aTable = tblFindedTickets then
  begin
    SpTBXLabel17.Caption:= FloatToStrF(f1,fffixed,10,1) + ' т';
    SpTBXLabel17.Caption:= DelSymb(SpTBXLabel17.Caption,'.0');
    SpTBXLabel19.Caption:= FloatToStrF(f2,fffixed,10,1) + ' м3';
    SpTBXLabel19.Caption:= DelSymb(SpTBXLabel19.Caption,'.0');
    SpTBXLabel21.Caption:= FloatToStrF(f3,fffixed,10,0) + ' р';
  end;

  if aTable = tblFavorTickets then
  begin
    SpTBXLabel28.Caption:= FloatToStrF(f1,fffixed,10,1) + ' т';
    SpTBXLabel28.Caption:= DelSymb(SpTBXLabel28.Caption,'.0');
    SpTBXLabel30.Caption:= FloatToStrF(f2,fffixed,10,1) + ' м3';
    SpTBXLabel30.Caption:= DelSymb(SpTBXLabel30.Caption,'.0');
    SpTBXLabel32.Caption:= FloatToStrF(f3,fffixed,10,0) + ' р';
  end;

  DecimalSeparator:= ds;
end;

procedure TMainForm.SpTBXButton30Click(Sender: TObject);
begin
  ToggleOperation(old_ticket_info_oper_id);
end;

procedure TMainForm.tblFindedTicketsAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('_checked').ValueB:= aCell.TextString = '1';
    cls_data.Save;
    TblCheckWVolume(tblFindedTickets);
  end;
end;

procedure TMainForm.SpTBXButton34Click(Sender: TObject);
begin
  if MessageBox(Application.Handle,'Подтвердите действие !!!','Подтверждение',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
  begin
    cls_data.FindClassByName('blocks').FindClassByName('favor').Close;
    cls_data.Save;
    TblUpdateBlocks(tblFavor,cls_data.FindClassByName('blocks').FindClassByName('favor'));
  end;
end;

procedure TMainForm.SpTBXButton35Click(Sender: TObject);
begin
  if Assigned(tblFavor.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'Подтвердите действие !!!','Подтверждение',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      TFMClass(tblFavor.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblFavor.SelectedCell.Data1));
      tblFavor.DelRow(tblFavor.SelectedCell.Row);
      cls_data.Save;
    end;
  end;
end;

procedure TMainForm.SpTBXButton36Click(Sender: TObject);
var cls1:TFMClass;
begin
  cls1:= cls_data.FindClassByName('blocks').FindClassByName('favor').CreateClassItem('','');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('data_block'),False,True);
  cls_data.Save;
  TblUpdateBlocks(tblFavor,cls_data.FindClassByName('blocks').FindClassByName('favor'));
end;

procedure TMainForm.tblFavorDblClickCell(Sender: TObject);
begin
  if Assigned(tblFavor.SelectedCell) then
  begin
    act_cls_block_favor:= TFMClass(tblFavor.SelectedCell.Data1);
    TblCheckUnCheck(tblFavor,False);
    tblFavor.Cell[0,tblFavor.SelectedCell.Row].MyText:= '1';
  end;
end;

procedure TMainForm.Setact_cls_block_favor(const Value: TFMClass);
begin
  Fact_cls_block_favor := Value;
  if Assigned(act_cls_block_favor) then
  begin
    SpTBXLabel25.Caption:= act_cls_block_favor.FindPropertyByName('Caption').ValueS;
    if Length(SpTBXLabel25.Caption) = 0 then
      SpTBXLabel25.Caption:= 'Без имени';
  end
  else
  begin
    SpTBXLabel25.Caption:= '';
  end;
end;

procedure TMainForm.tblFavorChangeSelectedCell(Sender: TObject);
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblFavor.SelectedCell) then
  begin
    ToggleOperation(op_favor_ticks);
    Application.ProcessMessages;
    TblUpdateTickets(tblFavorTickets,TFMClass(tblFavor.SelectedCell.Data1));
  end;
end;

procedure TMainForm.SpTBXButton38Click(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblFindedTickets.SelectedCell) then
  begin
    if not Assigned(act_cls_block_favor) then
    begin
      MessageBox(Application.Handle,'Не задан активный блок избранного!','', MB_OK OR MB_ICONWARNING);
    end
    else
    begin
      cls2:= TFMClass(tblFindedTickets.Cell[0,tblFindedTickets.SelectedCell.Row].Data1);
      if not Assigned(act_cls_block_favor.FindClassByName('items')) then
        act_cls_block_favor.CreateClassItem('items','');
      if not Assigned(GetTicketByID(cls2.FindPropertyByName('ID').ValueS,act_cls_block_favor.FindClassByName('items'))) then
      begin
        cls1:= act_cls_block_favor.FindClassByName('items').CreateClassItem('','');
        cls2.CopyClass(cls1,cls2,True,True);
        if Length(act_cls_block_favor.FindPropertyByName('Caption').ValueS) = 0 then
        begin
          act_cls_block_favor.FindPropertyByName('Caption').ValueS:=
              Copy(cls1.FindPropertyByName('FromGeo').ValueS,1,4) + '-' + Copy(cls1.FindPropertyByName('ToGeo').ValueS,1,4);
          for i:= 0 to tblFavor.RowCount - 1 do
          begin
            if tblFavor.Cell[0,i].TextString = '1' then
            begin
              tblFavor.Cell[1,i].MyText:= act_cls_block_favor.FindPropertyByName('Caption').ValueS; 
            end;
            act_cls_block_favor:= act_cls_block_favor;
          end;
        end;
        cls_data.Save;
        InfoTimerForm.Execute('добавлено');
      end
      else
        MessageBox(Application.Handle,'Заявка уже в активном блоке','', MB_OK OR MB_ICONINFORMATION);
    end;
  end;
end;

function TMainForm.GetTicketByID(ID: String; aClass: TFMClass): TFMClass;
var i:Integer;
begin
  Result:= nil;
  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    if aClass.MyClass[i].FindPropertyByName('ID').ValueS = ID then
    begin
      Result:= aClass.MyClass[i];
      Break;
    end;
  end;
end;

procedure TMainForm.SpTBXLabel23Click(Sender: TObject);
begin
  tblFavorChangeSelectedCell(nil);
end;

procedure TMainForm.SpTBXLabel15Click(Sender: TObject);
begin
  tblFindedChangeSelectedCell(nil);
end;

procedure TMainForm.tblFavorTicketsAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('_checked').ValueB:= aCell.TextString = '1';
    cls_data.Save;
    TblCheckWVolume(tblFavorTickets);
  end;
end;

procedure TMainForm.SpTBXButton37Click(Sender: TObject);
begin
  TblCheckUnCheck(tblFavorTickets,False);
end;

procedure TMainForm.SpTBXButton39Click(Sender: TObject);
var cls1:TFMClass;
    i:Integer;
begin
  if Assigned(tblFavorTickets.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'Подтвердите действие !!!','Подтверждение',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      cls1:= TFMClass(tblFavorTickets.Cell[0,tblFavorTickets.SelectedCell.Row].Data1);
      cls1.ParentClass.DeleteClassItem(cls1);
      i:= tblFavorTickets.SelectedCell.Row;
      tblFavorTickets.DelRow(i);
      tblFavorTickets.DelRow(i);
      cls_data.Save;
    end;
  end;
end;

procedure TMainForm.tblFindedTicketsDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblFindedTickets.SelectedCell) then
  begin
    cls1:= TFMClass(tblFindedTickets.Cell[0,tblFindedTickets.SelectedCell.Row].Data1);
    cls_active_ticket:= cls1;
    old_ticket_info_oper_id:= op_finded_ticks;
    TblUpdateTicketInfo(cls1);
    ToggleOperation(op_ticket_info);
  end;
end;

procedure TMainForm.tblFindedTicketsChangeSelectedCell(Sender: TObject);
var cls1:TFMClass;
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblFinded.SelectedCell) then
  begin
    cls1:= TFMClass(tblFinded.Cell[0,tblFinded.SelectedCell.Row].Data1);
    cls_templates.CopyClass(cls1,cls_templates.FindClassByName('data_block'),False,True);
    cls1.FindPropertyByName('_sel_col').ValueI:= tblFindedTickets.SelectedCell.Col;
    cls1.FindPropertyByName('_sel_row').ValueI:= tblFindedTickets.SelectedCell.Row;
  end;
end;

procedure TMainForm.TblUpdateTicketInfo(aClass: TFMClass);
var i,i1,i2,_price,n:Integer;
    f1:Single;
    s,s1:String;
    ds:Char;
begin
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  cls_templates.CopyClass(aClass,cls_templates.FindClassByName('ticket'),False,True);

  SpTBXLabel36.Caption:= aClass.FindPropertyByName('Dist').ValueS;
  s:= '';
  for n:= 1 to 2 do
  begin
    i1:= 0; i2:= 0;
    if aClass.FindPropertyByName('DistI').ValueI > 0 then
    begin
      f1:= 1;
      if n = 1 then
        if aClass.FindPropertyByName('Weight').ValueF > 0 then
          f1:= aClass.FindPropertyByName('Weight').ValueF/5;
      i1:= Round(((aClass.FindPropertyByName('DistI').ValueI/100) * 17 * 30)*(f1));
    end;
    if TryStrToInt(aClass.FindPropertyByName('Price1').ValueS,_price) then
    begin
      i2:= Round(_price * 0.1);
    end;
    if (i1 > 0) or (i2 > 0) then
    begin
      i:= i1 + i2;
      s:= s + '-' + IntToStr(i) + ' р';
      if _price > 0 then
      begin
        i:= _price - i;
        s:= s + ' [' + IntToStr(i) + ' р]';
      end;
    end;
    if n = 1 then
      if Length(s) > 0 then
        s:= s + ' :: ';
  end;
  if Length(s) > 0 then
    SpTBXLabel36.Caption:= SpTBXLabel36.Caption + ' (' + s + ')';

  Memo1.Text:= aClass.FindPropertyByName('FromGeoDesc1').ValueS;
  Memo2.Text:= aClass.FindPropertyByName('ToGeoDesc1').ValueS;
  SpTBXLabel39.Caption:= aClass.FindPropertyByName('Price1').ValueS + ' р ';
  Memo3.Text:= aClass.FindPropertyByName('PriceDesc').ValueS;
  Memo7.Text:= 'Прим.: ' + aClass.FindPropertyByName('Note').ValueS;
  SpTBXLabel37.Caption:= aClass.FindPropertyByName('TruckType').ValueS;

  SpTBXLabel38.Caption:= '';

  if aClass.FindPropertyByName('Weight').ValueF > 0 then
  begin
    s1:= FloatToStrF(aClass.FindPropertyByName('Weight').ValueF,fffixed,10,1);
    s1:= DelSymb(s1,'.0');
    SpTBXLabel38.Caption:= SpTBXLabel38.Caption + s1;
  end
  else
    SpTBXLabel38.Caption:= '--';

  if aClass.FindPropertyByName('Volume').ValueF > 0 then
  begin
    s1:= FloatToStrF(aClass.FindPropertyByName('Volume').ValueF,fffixed,10,1);
    s1:= DelSymb(s1,'.0');
    SpTBXLabel38.Caption:= SpTBXLabel38.Caption + ' / ' + s1;
  end
  else
    SpTBXLabel38.Caption:= SpTBXLabel38.Caption + ' / --';

  Memo4.Text:= aClass.FindPropertyByName('CargoDesc').ValueS;

  SpTBXLabel40.Caption:= aClass.FindPropertyByName('DateDesc').ValueS;

  Memo5.Text:= aClass.FindPropertyByName('ControllerInfo').ValueS;

  Memo6.Lines.Clear;
  for i:= 0 to aClass.FindClassByName('controller_contacts').MyClassCount - 1 do
  begin
    Memo6.Lines.Add(aClass.FindClassByName('controller_contacts').MyClass[i].FindPropertyByName('Str1').ValueS);
  end;

  if aClass.FindPropertyByName('_status_id').ValueI = 0 then
  begin
    aClass.FindPropertyByName('_status_id').ValueI:= 10;
    aClass.FindPropertyByName('_status_str').ValueS:= 'Просм';
    cls_data.Save;
  end;

  SpTBXLabel35.Caption:= aClass.FindPropertyByName('_status_str').ValueS;
  SpTBXLabel35.Font.Color:= GetStatusFontColor(aClass.FindPropertyByName('_status_id').ValueI);

  DecimalSeparator:= ds;
end;

procedure TMainForm.tblFavorTicketsDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblFavorTickets.SelectedCell) then
  begin
    cls1:= TFMClass(tblFavorTickets.Cell[0,tblFavorTickets.SelectedCell.Row].Data1);
    cls_active_ticket:= cls1;
    old_ticket_info_oper_id:= op_favor_ticks;
    TblUpdateTicketInfo(cls1);
    ToggleOperation(op_ticket_info);
  end;
end;

procedure TMainForm.TblUpdateTicketStatuses(aTable: TRRAdvTable;
  aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    aTable.Cell[0,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('str').ValueS;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[0,aTable.RowCount-1].Font.Color:= GetStatusFontColor(aClass.MyClass[i].FindPropertyByName('id').ValueI);
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

function TMainForm.GetStatusFontColor(statID: Integer): TColor;
begin
  Result:= clBlack;
  case statID of
    20,30: Result:= clRed;
    40: Result:= clBlue;
    50: Result:= clGreen;
    60: Result:= clFuchsia;
    70: Result:= clNavy;
  end;
end;

procedure TMainForm.tblTicketStatusesDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblTicketStatuses.SelectedCell) then
  begin
    cls1:= TFMClass(tblTicketStatuses.Cell[0,tblTicketStatuses.SelectedCell.Row].Data1);
    cls_templates.CopyClass(cls_active_ticket,cls_templates.FindClassByName('ticket'),False,True);
    cls_active_ticket.FindPropertyByName('_status_id').ValueI:= cls1.FindPropertyByName('id').ValueI;
    cls_active_ticket.FindPropertyByName('_status_str').ValueS:= cls1.FindPropertyByName('str').ValueS;
    SpTBXLabel35.Caption:= cls_active_ticket.FindPropertyByName('_status_str').ValueS;
    SpTBXLabel35.Font.Color:= GetStatusFontColor(cls_active_ticket.FindPropertyByName('_status_id').ValueI);
    cls_data.Save;
  end;
end;

end.

