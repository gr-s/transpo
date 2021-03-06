unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXControls, TB2Dock, TB2Toolbar, SpTBXItem, TB2Item,
  ActnList, ImgList, rrfile_mod_api, SpTBXSkins, SpTBXDkPanels,
  ExtCtrls, ComCtrls, RRClassInspector, rrAppPanelSaver, SpTBXTabs,
  GRFormPanel, Menus, rrAdvTable, uSelForm, TeEngine, Series, TeeProcs,
  Chart, StdCtrls, Buttons;

type
  TMainForm = class(TForm)
    ImageList1: TImageList;
    alMain: TActionList;
    actNewFile: TAction;
    actOpenFile: TAction;
    actSave: TAction;
    actSaveAs: TAction;
    actExitApplication: TAction;
    actFilePropsShow: TAction;
    actCloseFile: TAction;
    actTreeAddObjectSelecting: TAction;
    actTreeDelObject: TAction;
    spMainForm: TSpTBXTitleBar;
    StatusBar1: TSpTBXStatusBar;
    SpTBXLabelItem2: TSpTBXLabelItem;
    SpTBXSeparatorItem2: TSpTBXSeparatorItem;
    SpTBXLabelItem1: TSpTBXLabelItem;
    SpTBXDock1: TSpTBXDock;
    SpTBXToolbar1: TSpTBXToolbar;
    SpTBXItem1: TSpTBXItem;
    SpTBXSubmenuItem6: TSpTBXSubmenuItem;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    SpTBXItem3: TSpTBXItem;
    SpTBXItem8: TSpTBXItem;
    SpTBXToolbar2: TSpTBXToolbar;
    SpTBXSubmenuItem3: TSpTBXSubmenuItem;
    SpTBXItem6: TSpTBXItem;
    SpTBXSeparatorItem3: TSpTBXSeparatorItem;
    SpTBXItem5: TSpTBXItem;
    SpTBXItem7: TSpTBXItem;
    SpTBXItem4: TSpTBXItem;
    SpTBXSeparatorItem7: TSpTBXSeparatorItem;
    SpTBXItem12: TSpTBXItem;
    SpTBXSeparatorItem4: TSpTBXSeparatorItem;
    SpTBXItem9: TSpTBXItem;
    SpTBXSubmenuItem4: TSpTBXSubmenuItem;
    SpTBXPanel1: TSpTBXPanel;
    SpTBXMultiDock3: TSpTBXMultiDock;
    SpTBXDockablePanel2: TSpTBXDockablePanel;
    SpTBXPanel3: TSpTBXPanel;
    TreeView1: TTreeView;
    actShowTree: TAction;
    SpTBXItem10: TSpTBXItem;
    actShowContent: TAction;
    SpTBXItem11: TSpTBXItem;
    SpTBXSeparatorItem6: TSpTBXSeparatorItem;
    SpTBXItem2: TSpTBXItem;
    SpTBXSeparatorItem8: TSpTBXSeparatorItem;
    SpTBXLabelItem3: TSpTBXLabelItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    SpTBXDockablePanel4: TSpTBXDockablePanel;
    pnlContent: TSpTBXPanel;
    SpTBXSplitter1: TSpTBXSplitter;
    SpTBXPopupMenu1: TSpTBXPopupMenu;
    SpTBXSubmenuItem1: TSpTBXSubmenuItem;
    SpTBXItem13: TSpTBXItem;
    tblContent: TRRAdvTable;
    SpTBXPopupMenu2: TSpTBXPopupMenu;
    SpTBXItem14: TSpTBXItem;
    SpTBXItem15: TSpTBXItem;
    SpTBXDockablePanel1: TSpTBXDockablePanel;
    SpTBXPanel2: TSpTBXPanel;
    Chart1: TChart;
    Series1: TLineSeries;
    SpTBXDockablePanel3: TSpTBXDockablePanel;
    SpTBXPanel4: TSpTBXPanel;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    SpTBXPopupMenu3: TSpTBXPopupMenu;
    SpTBXItem16: TSpTBXItem;
    SpTBXSeparatorItem5: TSpTBXSeparatorItem;
    SpTBXItem17: TSpTBXItem;
    procedure actExitApplicationExecute(Sender: TObject);
    procedure SpTBXDockablePanel2Resize(Sender: TObject);
    procedure actShowTreeExecute(Sender: TObject);
    procedure SpTBXDockablePanel2VisibleChanged(Sender: TObject);
    procedure actForceDefaultViewExecute(Sender: TObject);
    procedure actNewFileExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actOpenFileExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actShowContentExecute(Sender: TObject);
    procedure actCloseFileExecute(Sender: TObject);
    procedure SpTBXPopupMenu1Popup(Sender: TObject);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpTBXItem13Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure tblContentAfterCellEdit(aCell: TRRCell);
    procedure tblContentDblClickCell(Sender: TObject);
    procedure SpTBXItem15Click(Sender: TObject);
    procedure SpTBXItem14Click(Sender: TObject);
    procedure Chart1DblClick(Sender: TObject);
    procedure SpTBXItem17Click(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Chart2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tblContentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    FModified: Boolean;
    FEmpty: Boolean;
    FProjectDir: String;
    FProjectName: String;
    FProjectFileName: String;
    procedure SetEmpty(const Value: Boolean);
    procedure SetModified(const Value: Boolean);
    procedure SetProjectDir(const Value: String);
    procedure SetProjectFileName(const Value: String);
    procedure SetProjectName(const Value: String);
    function GetProjectFullFileName: String;
    function GetActiveNode: TFMClass;

  protected
    cls_sett:TFMClass;
    cls_templates:TFMClass;
    cls_project:TFMClass;
    RRAppPanelSaver:TRRAppPanelSaver;

    procedure UpdateActions;
    procedure UpdateCaption;

    procedure UpdateReopenGroup;
    procedure DoReopenItemClick(Sender:TObject);
    function  CheckReopenItem(a_str:String):Boolean;
    procedure CreateReopenItem(a_str:String);

    procedure NewFile;
    function  CloseFile:Boolean;
    procedure OpenFile(aFileName:String);
    function  SaveAs:Boolean;
    procedure SaveFile(aFileName:String);
    function  CheckModified:Boolean;

  public
    TreeBook:TFMClass;

    procedure DoTreePopupAddItemClick(Sender: TObject);

    property ProjectName:String read FProjectName write SetProjectName;
    property ProjectDir:String read FProjectDir write SetProjectDir;
    property ProjectFileName:String read FProjectFileName write SetProjectFileName;
    property ProjectFullFileName:String read GetProjectFullFileName;
    property Empty:Boolean read FEmpty write SetEmpty;
    property Modified:Boolean read FModified write SetModified;

    property ActiveNode:TFMClass read GetActiveNode;

    constructor Create(AOwner: TComponent);override;
    destructor  Destroy;override;

    procedure DoOpenProject;
    procedure DoCloseProject;

    function GetCorrectCoef(proc:Single):Single;

    function AddTreeViewItem(cls_tree_object:TFMClass; ParentNode:TTreeNode):TTreeNode;
    function AddTreeObject(cls_book_link_tree_object:TFMClass):TFMClass;
    function GetTreeObject(guid:string):TFMClass;
    procedure RenameTreeObject(cls_tree_object:TFMClass; NewCaption:String);
    procedure DeleteTreeObject(cls_tree_object:TFMClass);
    procedure UpdateTreeObjectContent(cls_tree_object:TFMClass);

    function GetStuff(guid:string):TFMClass;
    function GetStuffGroup(guid:string):TFMClass;

    procedure UpdateTree(cls_tree_object:TFMClass; ParentNode:TTreeNode);

    procedure UpdateChart1(cls_tree_object:TFMClass);
    procedure SelGroupForCharts;
  end;

const
  unnamed1:Integer = 666666666;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

function TMainForm.CheckModified: Boolean;
var i:Integer;
    s1,s2:String;
begin
  Result:= True;
  if not Empty then
  begin
    if Modified then
    begin
      i:= MessageBoxW(Handle, '���������� ������ ��� �������. ��������� ��������� ?','��������', MB_YESNOCANCEL	 OR MB_ICONINFORMATION);
      if i = IDYES then
      begin
        actSaveExecute(nil);
      end;
      if i = IDCANCEL then
        Result:= False;
    end;
  end;
end;

function TMainForm.CloseFile: Boolean;
begin
  Result:= True;
  if not Empty then
  begin
    if not CheckModified then
    begin
      Result:= False;
      Exit;
    end;
  end;
  DoCloseProject;
  FreeAndNil(cls_project);
  Modified:= False;
  Empty:= True;
  UpdateCaption;
  UpdateActions;
  UpdateReopenGroup;
end;

constructor TMainForm.Create(AOwner: TComponent);
var cls1:TFMClass;
begin
  inherited;

  FileModLibName:= ExtractFilePath(Application.ExeName) + FileModLibName;
  if not InitFM then
  begin
    MessageBoxW(Application.Handle,'�� ������ ���� �� ����������� ���������� (file_mod_dll.dll). ���������� ����� �������','������', MB_OK	 OR MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;

  cls_project:= nil;

  cls_templates:= TFMClass.Create(Self);
  cls_templates.FileName:= AppDir + 'templates.dat';
  cls_templates.Open;


  cls_sett:= TFMClass.Create(Self);
  cls_sett.FileName:= AppDir + 'grade.dat';
  cls_sett.Open;
  cls_sett.FileType:= ftFullText;
  cls_templates.CopyClass(cls_sett,cls_templates.FindClassByName('app_sett'),False,True);

  SkinManager.SkinsList.AddSkinFromFile(AppDir + 'skins\sk1.skn');
  SkinManager.SetSkin(cls_sett.FindClassByName('Common').FindPropertyByName('Skin').ValueS);

  TreeBook:= cls_templates.FindClassByName('treebook');

  FEmpty:= True;

  SpTBXDockablePanel4.Floating:= True;

  RRAppPanelSaver:= TRRAppPanelSaver.Create(Self);
  RRAppPanelSaver.AddPanel(SpTBXDockablePanel1);
  RRAppPanelSaver.AddPanel(SpTBXDockablePanel2);
  RRAppPanelSaver.AddPanel(SpTBXDockablePanel3);
  RRAppPanelSaver.AddPanel(SpTBXDockablePanel4);
  RRAppPanelSaver.AddDock(SpTBXMultiDock3);
  RRAppPanelSaver.AddToolBar(SpTBXToolbar1);
  RRAppPanelSaver.AddToolBar(SpTBXToolbar2);
  RRAppPanelSaver.AddToolDock(SpTBXDock1);
  if not FileExists(AppDir + 'grade.dat') then
  begin
    cls1:= TFMClass.Create(Self);
    cls1.FileName:= AppDir + 'panels_def.dat';
    cls1.Open;
    RRAppPanelSaver.FMO:= cls1;
    RRAppPanelSaver.Open;
    FreeAndNil(cls1);
  end;
  RRAppPanelSaver.FMO:= cls_sett;
  RRAppPanelSaver.Save(True);
  RRAppPanelSaver.Open;


  FProjectName:= '';
  FProjectDir:= '';
  FProjectFileName:= '';

  UpdateCaption;
  UpdateActions;

  UpdateReopenGroup;

  tblContent.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\content.tbl';
  tblContent.Open;

  if FileExists(cls_sett.FindClassByName('Common').FindPropertyByName('last_project_file').ValueS) then
    OpenFile(cls_sett.FindClassByName('Common').FindPropertyByName('last_project_file').ValueS);
end;

destructor TMainForm.Destroy;
begin
  CloseFile;
  RRAppPanelSaver.Save;
  cls_sett.Save;
  FreeAndNil(cls_sett);
  FreeAndNil(cls_templates);
  CleanupFM;
  inherited;
end;

procedure TMainForm.NewFile;
begin
  if not CloseFile then Exit;

  FProjectName:= '';
  FProjectDir:= '';
  FProjectFileName:= '';

  cls_project:= TFMClass.Create(Self);
  cls_templates.CopyClass(cls_project,cls_templates.FindClassByName('project_file'),False,True);

  Modified:= False;
  Empty:= False;
  UpdateCaption;
  UpdateActions;
  DoOpenProject;    
end;

procedure TMainForm.OpenFile(aFileName: String);
begin
  if not CloseFile then Exit;
  ProjectDir:= ExtractFilePath(aFileName);
  ProjectFileName:= ExtractFileName(aFileName);
  cls_project:= TFMClass.Create(Self);
  cls_project.FileName:= ProjectFullFileName;
  cls_project.Open;
  cls_templates.CopyClass(cls_project,cls_templates.FindClassByName('project_file'),False,True);
  Empty:= False; 
  Modified:= False;
  UpdateCaption;
  UpdateActions;
  CheckReopenItem(ProjectFullFileName);
  UpdateReopenGroup;
  DoOpenProject;
end;

function TMainForm.SaveAs: Boolean;
begin
  Result:= True;
  if SaveDialog1.Execute  then
    SaveFile(SaveDialog1.FileName);  
end;

procedure TMainForm.SaveFile(aFileName: String);
begin
  ProjectDir:= ExtractFilePath(aFileName);
  ProjectFileName:= ExtractFileName(aFileName);  
  RRAppPanelSaver.Save;
  cls_sett.Save;
  cls_project.FileName:= ProjectFullFileName;
  cls_project.FileType:= ftFullText;
  cls_project.Save;
  Modified:= False;
  UpdateCaption;
  UpdateActions;
  CheckReopenItem(ProjectFullFileName);
  UpdateReopenGroup; 
end;

procedure TMainForm.UpdateCaption;
begin
  Caption:= '���������� �����������';
  spMainForm.Caption:= Caption;
  SpTBXLabelItem2.Caption:= '';
  SpTBXLabelItem1.Caption:= '';
  if Empty then Exit;
  if Length(ProjectDir) > 0 then
  begin
    Caption:= Caption + '  [' + ProjectDir + ProjectFileName + ']';
  end;
  if Modified then
    SpTBXLabelItem2.Caption:= '�������';
  spMainForm.Caption:= Caption;
end;

procedure TMainForm.actExitApplicationExecute(Sender: TObject);
var Action: TCloseAction;
begin
  FormClose(nil,Action);
  if Action <> caNone then
    Application.Terminate;
end;

procedure TMainForm.SetEmpty(const Value: Boolean);
begin
  FEmpty := Value;
end;

procedure TMainForm.SpTBXDockablePanel2Resize(Sender: TObject);
begin
  TreeView1.Left:= 5;
  TreeView1.Top:= 5;
  TreeView1.Width:= SpTBXDockablePanel2.Width - 15;
  TreeView1.Height:= SpTBXDockablePanel2.Height - 33;
end;

procedure TMainForm.actShowTreeExecute(Sender: TObject);
begin
  SpTBXDockablePanel2.Show;
  UpdateActions;
end;

procedure TMainForm.UpdateActions;
begin
  LockWindowUpdate(Handle);
  actSave.Enabled:= not Empty;
  actSaveAs.Enabled:= not Empty;
  actCloseFile.Enabled:= not Empty;
  LockWindowUpdate(0);
end;

procedure TMainForm.SpTBXDockablePanel2VisibleChanged(Sender: TObject);
begin
  UpdateActions;
end;

procedure TMainForm.SetModified(const Value: Boolean);
begin
  FModified := Value;
  if Modified then
    SpTBXLabelItem2.Caption:= '�������';
end;


procedure TMainForm.actForceDefaultViewExecute(Sender: TObject);
var cls1:TFMClass;
begin
  if MessageBoxW(Application.Handle,'�� ������������� ������ ������� �������� ��������� �������� ����� ? ������� ��� ����� ������������ ������.','�������������', MB_YESNO OR MB_ICONQUESTION) = IDYES then
  begin
    cls1:= TFMClass.Create(Self);
    cls1.FileName:= AppDir + 'panels_def.dat';
    cls1.Open;
    RRAppPanelSaver.FMO:= cls1;
    RRAppPanelSaver.Open;
    FreeAndNil(cls1);
    RRAppPanelSaver.FMO:= cls_sett;
    UpdateActions; 
  end;
end;

procedure TMainForm.SetProjectDir(const Value: String);
begin
  FProjectDir := Value;
end;

procedure TMainForm.SetProjectFileName(const Value: String);
begin
  FProjectFileName := Value;
end;

procedure TMainForm.SetProjectName(const Value: String);
begin
  FProjectName := Value;
end;

procedure TMainForm.actNewFileExecute(Sender: TObject);
begin
  NewFile;
end;

procedure TMainForm.actSaveAsExecute(Sender: TObject);
begin
  SaveAs;
end;

procedure TMainForm.actSaveExecute(Sender: TObject);
var b:Boolean;
begin
  b:= Length(ProjectDir) > 0;
  if b then
    b:= Length(ProjectFileName) > 0;
  if b then
    SaveFile(ProjectFullFileName)
  else
    SaveAs; 
end;

function TMainForm.GetProjectFullFileName: String;
begin
  Result:= ProjectDir + ProjectFileName; 
end;

procedure TMainForm.actOpenFileExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
    OpenFile(OpenDialog1.FileName);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Empty then
  begin
    cls_sett.FindClassByName('Common').FindPropertyByName('last_project_file').ValueS:= ProjectFullFileName;
  end
  else
  begin
    cls_sett.FindClassByName('Common').FindPropertyByName('last_project_file').ValueS:= '';
  end;
  if not CloseFile then Action:= caNone;
end;

procedure TMainForm.UpdateReopenGroup;
var i:Integer;
    blk,ReopenGroup:TFMClass;
    mn:TMenuItem;
    b:Boolean;
    tbi:TSpTBXItem;
begin
  ReopenGroup:= cls_sett.FindClassByName('OpenedHistory');
  SpTBXSubmenuItem6.Clear;
  for i:= 0 to ReopenGroup.MyClassCount - 1 do
  begin
    b:= True;
    if not Empty then
      b:= ReopenGroup.MyClass[i].FindPropertyByName('file_name').ValueS <> ProjectFullFileName;

    if b then b:= FileExists(ReopenGroup.MyClass[i].FindPropertyByName('file_name').ValueS);

    if b then
    begin
      tbi:= TSpTBXItem.Create(nil);
      tbi.Caption:= ReopenGroup.MyClass[i].FindPropertyByName('file_name').ValueS;
      tbi.Tag:= i;
      tbi.OnClick:= DoReopenItemClick;
      SpTBXSubmenuItem6.Add(tbi);
    end;
  end;
  SpTBXSubmenuItem6.DropdownCombo:= (SpTBXSubmenuItem6.Count > 0);
end;

procedure TMainForm.DoReopenItemClick(Sender: TObject);
var mn:TMenuItem;
begin
  mn:= TMenuItem(Sender);
  OpenFile(cls_sett.FindClassByName('OpenedHistory').MyClass[mn.Tag].FindPropertyByName('file_name').ValueS);
end;

function TMainForm.CheckReopenItem(a_str: String): Boolean;
var i:Integer;
    cls:Pointer;
    ReopenGroup:TFMClass;
begin
  Result:= False;
  ReopenGroup:= cls_sett.FindClassByName('OpenedHistory');
  for i:= 0 to ReopenGroup.MyClassCount - 1 do
  begin
    if ReopenGroup.MyClass[i].FindPropertyByName('file_name').ValueS = a_str then
    begin
      cls:= ReopenGroup.CutClassItem(ReopenGroup.MyClass[i]);
      ReopenGroup.InsertClassItem(cls,0);
      Result:= True;
      Break;
    end;
  end;
  if not Result then
  begin
    CreateReopenItem(a_str);
    if ReopenGroup.MyClassCount > 1 then
    begin
      cls:= ReopenGroup.CutClassItem(ReopenGroup.MyClass[ReopenGroup.MyClassCount - 1]);
      ReopenGroup.InsertClassItem(cls,0);
    end;
  end;
end;

procedure TMainForm.CreateReopenItem(a_str: String);
var cls:TFMClass;
    ReopenGroup:TFMClass;
begin
  ReopenGroup:= cls_sett.FindClassByName('OpenedHistory');
  if ReopenGroup.MyClassCount > 10 then ReopenGroup.DeleteClassItem(ReopenGroup.MyClass[ReopenGroup.MyClassCount-1]);
  cls:= ReopenGroup.CreateClassItem('item','');
  cls.CreateClassPropertyItem('file_name',ptChar,a_str);
end;

procedure TMainForm.actShowContentExecute(Sender: TObject);
begin
  SpTBXDockablePanel4.Show;
end;

procedure TMainForm.actCloseFileExecute(Sender: TObject);
begin
  CloseFile;
end;

procedure TMainForm.DoCloseProject;
begin
  TreeView1.Enabled:= False;
  TreeView1.Color:= $00EEEDEE;
  tblContent.Hide;
  UpdateChart1(nil);
end;

procedure TMainForm.DoOpenProject;
begin
  TreeView1.Enabled:= True;
  TreeView1.Color:= clWhite;
  UpdateTree(nil,nil);
  UpdateChart1(nil);
end;

function TMainForm.GetActiveNode: TFMClass;
begin
  Result:= nil;
  if Assigned(TreeView1.Selected) then
   Result:= TFMClass(TreeView1.Selected.Data);
end;

procedure TMainForm.SpTBXPopupMenu1Popup(Sender: TObject);         
var it1:TSpTBXSubmenuItem;
    it2:TSpTBXItem;
    cls1,cls2:TFMClass;
    i:Integer;
begin
  it1:= TSpTBXSubmenuItem(SpTBXPopupMenu1.Items.Items[0]);
  it1.Clear;
  cls1:= nil;
  if not Assigned(ActiveNode) then
  begin
    cls1:= TreeBook.FindClassByName('links').FindClassByName('root');
    SpTBXPopupMenu1.Items.Items[1].Enabled:= False;
  end
  else
  begin
    for i:= 0 to TreeBook.FindClassByName('links').MyClassCount - 1 do
    begin
      if TreeBook.FindClassByName('links').MyClass[i].SysName = 'root' then Continue;
      if TreeBook.FindClassByName('links').MyClass[i].FindPropertyByName('guid').ValueS = ActiveNode.FindPropertyByName('guid').ValueS then
      begin
        cls1:= TreeBook.FindClassByName('links').MyClass[i];
        Break;
      end;
    end;
  end;
  if Assigned(cls1) then
  begin
    for i:= 0 to cls1.MyClassCount - 1 do
    begin
      it2:= TSpTBXItem.Create(SpTBXPopupMenu1);
      it1.Add(it2);
      cls2:= GetTreeObject(cls1.MyClass[i].FindPropertyByName('guid').ValueS);
      it2.Caption:= cls2.FindPropertyByName('caption').ValueS;
      it2.VCLComObject:= cls1.MyClass[i];
      it2.OnClick:= DoTreePopupAddItemClick;
    end;
  end;
end;

function TMainForm.GetTreeObject(guid: string): TFMClass;
var cls1:TFMClass;
    i:Integer;
begin
  Result:= nil;
  cls1:= TreeBook.FindClassByName('tree_objects');
  for i:= 0 to cls1.MyClassCount - 1 do
  begin
    if cls1.MyClass[i].FindPropertyByName('guid').ValueS = guid then
    begin
      Result:= cls1.MyClass[i];
      Break;
    end;
  end;
end;

procedure TMainForm.DoTreePopupAddItemClick(Sender: TObject);
begin
   AddTreeObject(TFMClass(TSpTBXItem(Sender).VCLComObject));
end;

function TMainForm.AddTreeObject(cls_book_link_tree_object: TFMClass): TFMClass;
var cls1,cls2:TFMClass;
begin
  if not Assigned(ActiveNode) then
  begin
    cls1:= cls_project.FindClassByName('tree');
  end
  else
  begin
    cls1:= ActiveNode;
  end;
  Result:= cls1.CreateClassItem('','');
  cls_templates.CopyClass(Result,cls_templates.FindClassByName('tree_object'),False,True);
  cls2:= GetTreeObject(cls_book_link_tree_object.FindPropertyByName('guid').ValueS);
  cls2.CopyClass(Result,cls2,True,True);
  AddTreeViewItem(Result,TreeView1.Selected);
  if Assigned(TreeView1.Selected) then
    TreeView1.Selected.Expand(False);
  Modified:= True;
end;

function TMainForm.AddTreeViewItem(cls_tree_object: TFMClass; ParentNode:TTreeNode): TTreeNode;
begin
  Result:= TreeView1.Items.AddChild(ParentNode,'');
  Result.Text:= cls_tree_object.FindPropertyByName('caption').ValueS;
  Result.Data:= cls_tree_object;
  cls_tree_object.Point1:= Result;
end;

procedure TMainForm.UpdateTree(cls_tree_object:TFMClass; ParentNode:TTreeNode);
var cls1:TFMClass;
    i:Integer;                                                 
    tn1:TTreeNode;
begin
  if not Assigned(cls_tree_object) then
  begin
    cls_tree_object:= cls_project.FindClassByName('tree');
    TreeView1.Items.Clear;
  end;

  for i:= 0 to cls_tree_object.MyClassCount - 1 do
  begin
    if not Assigned(cls_tree_object.MyClass[i].FindPropertyByName('sys')) then
    begin
      cls_templates.CopyClass(cls_tree_object.MyClass[i],cls_templates.FindClassByName('tree_object'),False,True);
      tn1:= AddTreeViewItem(cls_tree_object.MyClass[i],ParentNode);
      UpdateTree(cls_tree_object.MyClass[i],tn1);
    end;
  end;

end;

procedure TMainForm.RenameTreeObject(cls_tree_object: TFMClass;
  NewCaption: String);
begin
  cls_tree_object.FindPropertyByName('caption').ValueS:= NewCaption;
  TTreeNode(cls_tree_object.Point1).Text:= NewCaption;
  Modified:= True;
end;

procedure TMainForm.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
  RenameTreeObject(ActiveNode,S);
end;

procedure TMainForm.TreeView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cls1,cls2:TFMClass;
begin
  if Key = VK_F2 then
    TreeView1.Selected.EditText;

  if Assigned(TreeView1.Selected) then
  begin
    if (Key = 67) and (ssCtrl in Shift) then
    begin
      ActiveNode.SaveToCB2;
    end;

    if (Key = 86) and (ssCtrl in Shift) then
    begin
      cls1:= TFMClass.Create(nil);
      if cls1.OpenFromCB2 then
      begin
        if Assigned(cls1.FindPropertyByName('type')) then
        begin
          if cls1.FindPropertyByName('type').ValueS = 'training' then
          begin
            if Assigned(ActiveNode) then
            begin
              if ActiveNode.FindPropertyByName('type').ValueS = 'training' then
              begin
                if ActiveNode.FindPropertyByName('type').ValueS = 'training' then
                begin
                  cls1.CopyClass(ActiveNode,cls1,False,True);
                  UpdateTreeObjectContent(ActiveNode);
                  UpdateChart1(nil);
                  Modified:= True;
                end;
              end;
            end;
          end;
          if cls1.FindPropertyByName('type').ValueS = 'cycle' then
          begin
            if ActiveNode.FindPropertyByName('type').ValueS = 'cycle' then
            begin
              cls2:= ActiveNode.CreateClassItem('','');
              cls1.CopyClass(cls2,cls1,True,True);
              UpdateTree(cls2,AddTreeViewItem(cls2,TreeView1.Selected));
              UpdateChart1(nil);
              Modified:= True;
            end;
          end;
        end;
      end;
      FreeAndNil(cls1);
    end;
    
  end;
end;

procedure TMainForm.DeleteTreeObject(cls_tree_object: TFMClass);
begin
  if MessageBoxW(Handle, '����������� ��������','��������', MB_OKCANCEL	 OR MB_ICONQUESTION) = ID_OK then
  begin
    TTreeNode(cls_tree_object.Point1).Delete;
    cls_tree_object.ParentClass.DeleteClassItem(cls_tree_object);
    Modified:= True;
  end;
end;

procedure TMainForm.SpTBXItem13Click(Sender: TObject);
begin
  if Assigned(TreeView1.Selected) then
    DeleteTreeObject(ActiveNode);
end;

procedure TMainForm.UpdateTreeObjectContent(cls_tree_object: TFMClass);
var aTable: TRRAdvTable;
    cls1,cls2:TFMClass;
    i:Integer;
begin
  aTable:= tblContent;

  aTable.ClearRows(True);
  Application.ProcessMessages;

  aTable.BeginUpdate;

  cls1:= cls_tree_object.FindClassByName('content');
  for i:= 0 to cls1.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    cls_templates.CopyClass(cls1.MyClass[i],cls_templates.FindClassByName('train_content'),False,True);
    aTable.Cell[0,aTable.RowCount-1].Data1:= cls1.MyClass[i];
    aTable.Cell[0,aTable.RowCount-1].TextString:= IntToStr(i+1);
    cls2:= GetStuff(cls1.MyClass[i].FindPropertyByName('stuff_guid').ValueS);
    if Assigned(cls2) then
      aTable.Cell[1,aTable.RowCount-1].TextString:= cls2.FindPropertyByName('caption').ValueS;
    if cls1.MyClass[i].FindPropertyByName('weight').ValueF >= 0 then
      aTable.Cell[2,aTable.RowCount-1].TextString:= FloatToStrF(cls1.MyClass[i].FindPropertyByName('weight').ValueF,fffixed,10,1);
    if cls1.MyClass[i].FindPropertyByName('weight_proc').ValueF >= 0 then
      aTable.Cell[3,aTable.RowCount-1].TextString:= FloatToStrF(cls1.MyClass[i].FindPropertyByName('weight_proc').ValueF,fffixed,10,0);
    if cls1.MyClass[i].FindPropertyByName('set_count').ValueI >= 0 then
      aTable.Cell[4,aTable.RowCount-1].TextString:= IntToStr(cls1.MyClass[i].FindPropertyByName('set_count').ValueI);
    if cls1.MyClass[i].FindPropertyByName('rep_count').ValueI >= 0 then
      aTable.Cell[5,aTable.RowCount-1].TextString:= IntToStr(cls1.MyClass[i].FindPropertyByName('rep_count').ValueI);
    if cls1.MyClass[i].FindPropertyByName('weight_max').ValueF >= 0 then
      aTable.Cell[6,aTable.RowCount-1].TextString:= FloatToStrF(cls1.MyClass[i].FindPropertyByName('weight_max').ValueF,fffixed,10,1);
  end;

  aTable.EndUpdate;
  aTable.Show;
end;

procedure TMainForm.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if ActiveNode.FindPropertyByName('type').ValueS = 'training' then
    UpdateTreeObjectContent(ActiveNode)
  else
    tblContent.Hide;
end;

function TMainForm.GetStuff(guid: string): TFMClass;
var cls1:TFMClass;
    i:Integer;
begin
  Result:= nil;
  cls1:= TreeBook.FindClassByName('stuff');
  for i:= 0 to cls1.MyClassCount - 1 do
  begin
    if cls1.MyClass[i].FindPropertyByName('guid').ValueS = guid then
    begin
      Result:= cls1.MyClass[i];
      Break;
    end;
  end;
end;

procedure TMainForm.tblContentAfterCellEdit(aCell: TRRCell);
var cls1:TFMClass;
    f1:Single;
    i1:Integer;
    b1:Boolean;
begin
  cls1:= TFMClass(tblContent.Cell[0,aCell.Row].Data1);
  if aCell.MyTag = 'weight' then
  begin
    if TryStrToFloat(aCell.TextString,f1) then
    begin
      cls1.FindPropertyByName('weight').ValueF:= f1;
      if cls1.FindPropertyByName('weight_max').ValueF >= 0 then
      begin
        cls1.FindPropertyByName('weight_proc').ValueF:= (cls1.FindPropertyByName('weight').ValueF/cls1.FindPropertyByName('weight_max').ValueF)*100;
        tblContent.Cell[3,aCell.Row].TextString:= FloatToStrF(cls1.FindPropertyByName('weight_proc').ValueF,fffixed,10,0);
      end;
    end
    else
    begin
      aCell.MyText:= '';
      cls1.FindPropertyByName('weight').ValueF:= -1;
    end;
  end;
  if aCell.MyTag = 'weight_proc' then
  begin
    if TryStrToFloat(aCell.TextString,f1) then
    begin
      cls1.FindPropertyByName('weight_proc').ValueF:= f1;
      if cls1.FindPropertyByName('weight_max').ValueF >= 0 then
      begin
        cls1.FindPropertyByName('weight').ValueF:= Round(((cls1.FindPropertyByName('weight_proc').ValueF/100)*cls1.FindPropertyByName('weight_max').ValueF)/2.5)*2.5;
        tblContent.Cell[2,aCell.Row].TextString:= FloatToStrF(cls1.FindPropertyByName('weight').ValueF,fffixed,10,1);
      end;
    end
    else
    begin
      aCell.MyText:= '';
      cls1.FindPropertyByName('weight_proc').ValueF:= -1;
    end;
  end;
  if aCell.MyTag = 'weight_max' then
  begin
    if TryStrToFloat(aCell.TextString,f1) then
    begin
      cls1.FindPropertyByName('weight_max').ValueF:= f1;
      if cls1.FindPropertyByName('weight_proc').ValueF >= 0 then
      begin
        cls1.FindPropertyByName('weight').ValueF:= Round(((cls1.FindPropertyByName('weight_proc').ValueF/100)*cls1.FindPropertyByName('weight_max').ValueF)/2.5)*2.5;
        tblContent.Cell[2,aCell.Row].TextString:= FloatToStrF(cls1.FindPropertyByName('weight').ValueF,fffixed,10,1);
      end
      else
      begin
        if cls1.FindPropertyByName('weight').ValueF >= 0 then
        begin
          cls1.FindPropertyByName('weight_proc').ValueF:= (cls1.FindPropertyByName('weight').ValueF/cls1.FindPropertyByName('weight_max').ValueF)*100;
          tblContent.Cell[3,aCell.Row].TextString:= FloatToStrF(cls1.FindPropertyByName('weight_proc').ValueF,fffixed,10,0);
        end;
      end;
    end
    else
    begin
      aCell.MyText:= '';
      cls1.FindPropertyByName('weight_max').ValueF:= -1;
    end;
  end;
  if aCell.MyTag = 'set_count' then
  begin
    if TryStrToInt(aCell.TextString,i1) then
    begin
      cls1.FindPropertyByName('set_count').ValueI:= i1;
    end
    else
    begin
      aCell.MyText:= '';
      cls1.FindPropertyByName('set_count').ValueI:= -1;
    end;
  end;
  if aCell.MyTag = 'rep_count' then
  begin
    if TryStrToInt(aCell.TextString,i1) then
    begin
      cls1.FindPropertyByName('rep_count').ValueI:= i1;
    end
    else
    begin
      aCell.MyText:= '';
      cls1.FindPropertyByName('rep_count').ValueI:= -1;
    end;
  end;
  Modified:= True;
  UpdateChart1(nil);
end;

procedure TMainForm.tblContentDblClickCell(Sender: TObject);
var aCell: TRRCell;
    cls1:TFMClass;
begin
  aCell:= tblContent.SelectedCell;
  if Assigned(aCell) then                              
  begin
    if aCell.MyTag = 'stuff' then
    begin
      if SelForm.Execute(TreeBook.FindClassByName('stuff')) = mrOk then
      begin
        cls1:= TFMClass(tblContent.Cell[0,aCell.Row].Data1);
        cls1.FindPropertyByName('stuff_guid').ValueS:= SelForm.Result.FindPropertyByName('guid').ValueS;
        tblContent.BeginUpdate;
        aCell.TextString:= SelForm.Result.FindPropertyByName('caption').ValueS;
        tblContent.EndUpdate;
        Modified:= True; 
      end;
    end;
  end;
end;

procedure TMainForm.SpTBXItem15Click(Sender: TObject);
var aCell: TRRCell;
    cls1:TFMClass;
begin
  aCell:= tblContent.SelectedCell;
  if Assigned(aCell) then
  begin
    if MessageBoxW(Handle, '����������� ��������','��������', MB_OKCANCEL	 OR MB_ICONQUESTION) = ID_OK then
    begin
      cls1:= TFMClass(tblContent.Cell[0,aCell.Row].Data1);
      cls1.ParentClass.DeleteClassItem(cls1);
      tblContent.BeginUpdate;
      tblContent.DelRow(aCell.Row);
      tblContent.EndUpdate;
      Modified:= True;
      UpdateChart1(nil);
    end;
  end;
end;

procedure TMainForm.SpTBXItem14Click(Sender: TObject);
var cls1:TFMClass;
begin
  cls1:= ActiveNode.FindClassByName('content').CreateClassItem('','');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('train_content'),True,True);
  UpdateTreeObjectContent(ActiveNode);
  Modified:= True;
end;

procedure TMainForm.UpdateChart1(cls_tree_object:TFMClass);
var cls1,cls2,cls3:TFMClass;
    i,n,i1:Integer;
    f1,f2,f2_1:Single;
    is_yes:Boolean;
    _weight:Single;
begin    
  if not Assigned(cls_tree_object) then
  begin
    Chart1.Series[0].Clear;
    Chart1.Series[0].AddXY(0,0);
    Chart2.Series[0].Clear;
    Chart2.Series[0].AddXY(0,0);
    if not Empty then
    begin
      SpTBXDockablePanel1.Caption:= '������';
      SpTBXDockablePanel3.Caption:= '�������������';
      if Length(cls_sett.FindClassByName('Common').FindPropertyByName('chart_group_guid').ValueS) > 0 then
      begin
        cls1:= GetStuffGroup(cls_sett.FindClassByName('Common').FindPropertyByName('chart_group_guid').ValueS);
        SpTBXDockablePanel1.Caption:= SpTBXDockablePanel1.Caption + ' (' + cls1.FindPropertyByName('caption').ValueS + ')';
        SpTBXDockablePanel3.Caption:= SpTBXDockablePanel3.Caption + ' (' + cls1.FindPropertyByName('caption').ValueS + ')';
      end;
    end
    else
      Exit;
  end;
    
  if Length(cls_sett.FindClassByName('Common').FindPropertyByName('chart_group_guid').ValueS) = 0 then Exit;

  if not Assigned(cls_tree_object) then
    cls_tree_object:= cls_project.FindClassByName('tree');

  for i:= 0 to cls_tree_object.MyClassCount - 1 do
  begin
    if Assigned(cls_tree_object.MyClass[i].FindPropertyByName('type')) then
    begin
      if cls_tree_object.MyClass[i].FindPropertyByName('type').ValueS = 'training' then
      begin
        f1:= 0; f2:= 0; is_yes:= False;
        for n:= 0 to cls_tree_object.MyClass[i].FindClassByName('content').MyClassCount - 1 do
        begin
          cls1:= cls_tree_object.MyClass[i].FindClassByName('content').MyClass[n];

          if Length(cls1.FindPropertyByName('stuff_guid').ValueS) = 0 then Continue;

          cls2:= GetStuff(cls1.FindPropertyByName('stuff_guid').ValueS);
          if cls_sett.FindClassByName('Common').FindPropertyByName('chart_group_guid').ValueS = cls2.FindPropertyByName('group_guid').ValueS then
          begin
            if cls1.FindPropertyByName('weight').ValueF >= 0 then
              if cls1.FindPropertyByName('set_count').ValueI >= 0 then
                if cls1.FindPropertyByName('rep_count').ValueI >= 0 then
                begin
                  _weight:= (cls1.FindPropertyByName('set_count').ValueI*cls1.FindPropertyByName('rep_count').ValueI)*cls1.FindPropertyByName('weight').ValueF;
                  f1:= f1 + _weight;
                  if cls1.FindPropertyByName('weight_max').ValueF >= 0 then
                    if cls1.FindPropertyByName('weight_proc').ValueF >= 0 then
                    begin
                      f2_1:= GetCorrectCoef((cls1.FindPropertyByName('weight').ValueF/cls1.FindPropertyByName('weight_max').ValueF)*100);
                      f2:= f2 + (_weight*f2_1*cls2.FindPropertyByName('int_coef').ValueF);
                    end;
                end;
            is_yes:= True;
          end;
        end;
        if is_yes then
        begin
          Chart1.Series[0].AddXY(Chart1.Series[0].XValues.Count,f1);
          Chart2.Series[0].AddXY(Chart2.Series[0].XValues.Count,f2);
        end;
      end
      else
        if cls_tree_object.MyClass[i].FindPropertyByName('type').ValueS = 'cycle' then
        begin
          UpdateChart1(cls_tree_object.MyClass[i]);
        end;
    end;
  end;
end;

function TMainForm.GetCorrectCoef(proc: Single): Single;
var cls1,cls2,cls3:TFMClass;
    i:Integer;
    b:Boolean;
    f1,f2:Single;
begin
  Result:= 0;
  cls1:= TreeBook.FindClassByName('correct_cf_table');
  for i:= 0 to cls1.MyClassCount - 1 do
  begin
    cls2:= cls1.MyClass[i]; cls3:= nil; b:= False;
    if i < cls1.MyClassCount - 1 then cls3:= cls1.MyClass[i+1];
    if Assigned(cls3) then
      b:= (proc >= cls2.FindPropertyByName('proc').ValueD) and (proc < cls3.FindPropertyByName('proc').ValueD)
    else
      b:= (proc >= cls2.FindPropertyByName('proc').ValueD);
    if b then
    begin
      if not Assigned(cls3) then
        Result:= cls2.FindPropertyByName('f').ValueD
      else
      begin
        f1:= (proc-cls2.FindPropertyByName('proc').ValueD) / (cls3.FindPropertyByName('proc').ValueD - cls2.FindPropertyByName('proc').ValueD);
        f2:= (cls3.FindPropertyByName('f').ValueD-cls2.FindPropertyByName('f').ValueD)*f1;
        Result:= cls2.FindPropertyByName('f').ValueD + f2;  
      end;
      Break; 
    end;
  end;
end;

procedure TMainForm.Chart1DblClick(Sender: TObject);
begin
  SelGroupForCharts;
end;

procedure TMainForm.SelGroupForCharts;
begin
  if SelForm.Execute(TreeBook.FindClassByName('stuff_group')) = mrOk then
  begin
    cls_sett.FindClassByName('Common').FindPropertyByName('chart_group_guid').ValueS:= SelForm.Result.FindPropertyByName('guid').ValueS;
    UpdateChart1(nil);
    cls_sett.Save;
  end;
end;

function TMainForm.GetStuffGroup(guid: string): TFMClass;
var cls1:TFMClass;
    i:Integer;
begin
  Result:= nil;
  cls1:= TreeBook.FindClassByName('stuff_group');
  for i:= 0 to cls1.MyClassCount - 1 do
  begin
    if cls1.MyClass[i].FindPropertyByName('guid').ValueS = guid then
    begin
      Result:= cls1.MyClass[i];
      Break;
    end;
  end;
end;

procedure TMainForm.SpTBXItem17Click(Sender: TObject);
begin
  ActiveNode.FindPropertyByName('is_selected').ValueB:= not ActiveNode.FindPropertyByName('is_selected').ValueB;
  Modified:= True;
  TreeView1.Repaint;
end;

procedure TMainForm.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var _color:TColor;
begin
  if (TFMClass(Node.Data).FindPropertyByName('is_selected').ValueB) then
  begin
    _color:= TreeView1.Canvas.Brush.Color;
    TreeView1.Canvas.Brush.Color:= clSilver;
    TreeView1.Canvas.FillRect(Node.DisplayRect(True));
    TreeView1.Canvas.Brush.Color:= _color;
  end;
end;

procedure TMainForm.Chart2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var i,k:Integer;
begin
  Chart2.Repaint;
  k:= 15;
  for i:= 0 to Chart2.Series[0].Count - 1 do
  begin
    if (X >= Chart2.Series[0].CalcXPos(i)-k) and (X <= Chart2.Series[0].CalcXPos(i)+k) then
      if (Y >= Chart2.Series[0].CalcYPos(i)-k) and (Y <= Chart2.Series[0].CalcYPos(i)+k) then
        Chart2.Canvas.TextOut(Chart2.Series[0].CalcXPos(i)-10,Chart2.Series[0].CalcYPos(i)-25,FloatToStrF(Chart2.Series[0].YValue[i],fffixed,10,0));
  end;
end;

procedure TMainForm.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var i,k:Integer;
begin
  Chart1.Repaint;
  k:= 15;
  for i:= 0 to Chart1.Series[0].Count - 1 do
  begin
    if (X >= Chart1.Series[0].CalcXPos(i)-k) and (X <= Chart1.Series[0].CalcXPos(i)+k) then
      if (Y >= Chart1.Series[0].CalcYPos(i)-k) and (Y <= Chart1.Series[0].CalcYPos(i)+k) then
        Chart1.Canvas.TextOut(Chart1.Series[0].CalcXPos(i)-10,Chart1.Series[0].CalcYPos(i)-25,FloatToStrF(Chart1.Series[0].YValue[i],fffixed,10,0));
  end;
end;

procedure TMainForm.tblContentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cls1,cls2:TFMClass;
begin
  if Assigned(tblContent.SelectedCell) then
  begin
    if (Key = 67) and (ssCtrl in Shift) then
    begin
      TFMClass(tblContent.Cell[0,tblContent.SelectedCell.Row].Data1).SaveToCB2;
    end;
  end;

  if (Key = 86) and (ssCtrl in Shift) then
  begin
    cls1:= TFMClass.Create(nil);
    if cls1.OpenFromCB2 then
    begin
      if Assigned(cls1.FindPropertyByName('type')) then
      begin
        if cls1.FindPropertyByName('type').ValueS = 'train_content' then
        begin
          cls2:= ActiveNode.FindClassByName('content').CreateClassItem('','');
          cls_templates.CopyClass(cls2,cls_templates.FindClassByName('train_content'),True,True);
          cls1.CopyClass(cls2,cls1,True,True);
          UpdateTreeObjectContent(ActiveNode);
          UpdateChart1(nil);
          Modified:= True;
        end;
      end;
    end;
    FreeAndNil(cls1);
  end;
  
end;

end.
