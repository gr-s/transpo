unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXSkins, GRUtils, GRString, rrfile_mod_api, SpTBXItem, ati, transpo_classes,
  StdCtrls, ExtCtrls, uSelectWizard1, uBrowser, SpTBXControls, SpTBXTabs,
  SpTBXDkPanels, TB2Item, rrAdvTable, SpTBXEditors, uCalendarWizard,
  GRFormPanel;

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
    SpTBXTabItem6: TSpTBXTabItem;
    SpTBXTabSheet7: TSpTBXTabSheet;
    tblFinded: TRRAdvTable;
    SpTBXPanel9: TSpTBXPanel;
    SpTBXPanel10: TSpTBXPanel;
    SpTBXButton12: TSpTBXButton;
    SpTBXButton29: TSpTBXButton;
    SpTBXButton30: TSpTBXButton;
    SpTBXButton31: TSpTBXButton;
    SpTBXButton32: TSpTBXButton;
    SpTBXLabel15: TSpTBXLabel;
    SpTBXTabItem7: TSpTBXTabItem;
    SpTBXTabSheet8: TSpTBXTabSheet;
    tblFindedTickets: TRRAdvTable;
    SpTBXPanel11: TSpTBXPanel;
    SpTBXButton33: TSpTBXButton;
    SpTBXButton34: TSpTBXButton;
    SpTBXLabel16: TSpTBXLabel;
    SpTBXLabel17: TSpTBXLabel;
    SpTBXLabel18: TSpTBXLabel;
    SpTBXLabel19: TSpTBXLabel;
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
    procedure SpTBXButton30Click(Sender: TObject);
    procedure SpTBXButton31Click(Sender: TObject);
    procedure SpTBXButton32Click(Sender: TObject);
    procedure tblFindedChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton33Click(Sender: TObject);
  private
    { Private declarations }
  public
    curr_sel_cell_value:String;
    _FromGeoIndex:Integer;
    _ToGeoIndex:Integer;

    LockAllEventChangeSelCell:Boolean;

    procedure Run;

    procedure DoATIAutorizCode(var Code:String);
    procedure DoATICaptcha(oper_code:Integer);
    procedure DoEndGetTickets(Sender: TObject);
    procedure DoOperProgress(Stage1,Stage2:String);
    procedure DoOperSub1Progress(Stage1,Stage2:String);

    procedure ToggleOperation(op_code:Integer);

    procedure TblUpdateGeos(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateBlocks(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateTickets(aTable:TRRAdvTable; aClass:TFMClass);

    procedure TblCheckUnCheck(aTable:TRRAdvTable; Value:Boolean);
    procedure TblCheckWVolume(aTable:TRRAdvTable);

    procedure ATIGetTickets(FromGeoIndex, ToGeoIndex:Integer);
    procedure UpdateATI_f_Params;

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

  curr_sel_cell_value:= '';
  LockAllEventChangeSelCell:= False;

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

  tblFindedTickets.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\tickets.tbl';
  tblFindedTickets.Options.ForceNullSelecting:= False;
  tblFindedTickets.Open;


  TblUpdateGeos(tblATIGeos,cls_geos);
  TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
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
    tcSplitterLeft.Hide;
    tcClient.Hide;
  end;

  if op_code = op_ati then
  begin
    tcLeft.Show;
    tcSplitterLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 1;
  end;

  if op_code = op_ati_get_ticks then
  begin
    tcLeft.Show;
    tcSplitterLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 0;
    SpTBXButton4Click(SpTBXButton4);
  end;

  if op_code = op_finded_ticks then
  begin
    tcClient.ActiveTabIndex:= 2;
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
    aTable.Cell[0,aTable.RowCount-1].TextSrings.Add(aClass.MyClass[i].FindPropertyByName('Caption').ValueS);
    aTable.Cell[0,aTable.RowCount-1].TextSrings.Add(aClass.MyClass[i].FindPropertyByName('Date').ValueS);
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
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
end;

procedure TMainForm.SpTBXButton29Click(Sender: TObject);
begin
  SpTBXTabControl1.ActiveTabIndex:= 1;
end;

procedure TMainForm.SpTBXButton30Click(Sender: TObject);
begin
  SpTBXTabControl1.ActiveTabIndex:= 2;
end;

procedure TMainForm.SpTBXButton31Click(Sender: TObject);
begin
  if Assigned(tblFinded.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'Подтвердите действие !!!','Подтверждение',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      TFMClass(tblFinded.SelectedCell.Data1).ParentClass.Close;
      cls_data.Save;
      TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
    end;
  end;
end;

procedure TMainForm.SpTBXButton32Click(Sender: TObject);
begin
  TFMClass(tblFinded.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblFinded.SelectedCell.Data1));
  tblFinded.DelRow(tblFinded.SelectedCell.Row);
  cls_data.Save;
end;

procedure TMainForm.tblFindedChangeSelectedCell(Sender: TObject);
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblFinded.SelectedCell) then
  begin
    ToggleOperation(op_finded_ticks);
    Application.ProcessMessages;
    TblUpdateTickets(tblFindedTickets,TFMClass(tblFinded.SelectedCell.Data1));
  end;
end;

procedure TMainForm.TblUpdateTickets(aTable: TRRAdvTable;
  aClass: TFMClass);
var i,n:Integer;
    sel_cell:TRRCell;
    cls1,cls2:TFMClass;
    b:Boolean;
    ds:Char;
    s1,s2:String;
begin
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;


  cls1:= aClass.FindClassByName('items');

  for n:= 1 to 2 do
  begin
    for i:= 0 to cls1.MyClassCount - 1 do
    begin
      b:= True;
      if n = 1 then
        b:= AnsiUpperCase(cls1.MyClass[i].FindPropertyByName('Price1').ValueS) <> 'ЗАПРОС';
      if n = 2 then
        b:= cls1.MyClass[i].Tag <> 10;
      if b then
      begin
        cls1.MyClass[i].Tag:= 10;
        aTable.CreateRowBlock(0);
        aTable.Cell[0,aTable.RowCount-2].Data1:= cls1.MyClass[i];

        if Assigned(cls1.MyClass[i].FindPropertyByName('_checked')) then
          if cls1.MyClass[i].FindPropertyByName('_checked').ValueB then
            aTable.Cell[0,aTable.RowCount-1].TextString:= '1';

        aTable.Cell[1,aTable.RowCount-2].TextString:= cls1.MyClass[i].FindPropertyByName('Price1').ValueS;

        s1:= FloatToStrF(cls1.MyClass[i].FindPropertyByName('Weight').ValueF,fffixed,10,1);
        s1:= DelSymb(s1,'.0');

        if cls1.MyClass[i].FindPropertyByName('Volume').ValueF > 0 then
        begin
          s2:= FloatToStrF(cls1.MyClass[i].FindPropertyByName('Volume').ValueF,fffixed,10,1);
          s2:= DelSymb(s2,'.0');
        end
        else
          s2:= '--';

        aTable.Cell[2,aTable.RowCount-2].TextString:= s1 + ' / ' + s2;

        aTable.Cell[3,aTable.RowCount-2].TextString:= cls1.MyClass[i].FindPropertyByName('DateDesc').ValueS;
        aTable.Cell[4,aTable.RowCount-2].TextString:= cls1.MyClass[i].FindPropertyByName('FromGeo').ValueS;
        aTable.Cell[5,aTable.RowCount-2].TextString:= cls1.MyClass[i].FindPropertyByName('ToGeo').ValueS;
        aTable.Cell[6,aTable.RowCount-2].TextString:= cls1.MyClass[i].FindPropertyByName('CargoName').ValueS;
      end;
    end;
  end;

  aTable.EndUpdate;

  DecimalSeparator:= ds;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton33Click(Sender: TObject);
begin
  TblCheckUnCheck(tblFindedTickets,False);
end;

procedure TMainForm.TblCheckUnCheck(aTable: TRRAdvTable; Value: Boolean);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aTable.RowCount-1 do
  begin
    if Value then
      aTable.Cell[0,i].TextString:= '1'
    else
      aTable.Cell[0,i].TextString:= '';
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.TblCheckWVolume(aTable: TRRAdvTable);
var f1,f2:Single;
begin
  f1:= 0; f2:= 0;
  
  i:= 0;
  while i <= aTable.RowCount-1 do
  begin
    if TFMClass(aTable.Cell[0,i]).FindPropertyByName('_checked').ValueB then
    begin
      
    end;
    Inc(i,2);
  end;
  
end;

end.

