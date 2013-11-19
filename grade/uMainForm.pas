unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXControls, TB2Dock, TB2Toolbar, SpTBXItem, TB2Item,
  ActnList, ImgList, rrfile_mod_api, SpTBXSkins, SpTBXDkPanels,
  ExtCtrls, ComCtrls, RRClassInspector, rrAppPanelSaver, SpTBXTabs,
  GRFormPanel, Menus;

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
    SpTBXSplitter3: TSpTBXSplitter;
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

    function AddTreeViewItem(cls_tree_object:TFMClass; ParentNode:TTreeNode):TTreeNode;
    function AddTreeObject(cls_book_link_tree_object:TFMClass):TFMClass;
    function  GetTreeObject(guid:string):TFMClass;

    procedure UpdateTree(cls_tree_object:TFMClass; ParentNode:TTreeNode);
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
      i:= MessageBoxW(Handle, 'Предыдущий проект был изменен. Сохранить изменения ?','Внимание', MB_YESNOCANCEL	 OR MB_ICONINFORMATION);
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
  FreeAndNil(cls_project);
  Modified:= False;
  Empty:= True;
  UpdateCaption;
  UpdateActions;
  UpdateReopenGroup;
  DoCloseProject;
end;

constructor TMainForm.Create(AOwner: TComponent);
var cls1:TFMClass;
begin
  inherited;

  FileModLibName:= ExtractFilePath(Application.ExeName) + FileModLibName;
  if not InitFM then
  begin
    MessageBoxW(Application.Handle,'Не найден один из компонентов приложения (file_mod_dll.dll). Приложение будет закрыто','Ошибка', MB_OK	 OR MB_ICONERROR);
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
  RRAppPanelSaver.AddPanel(SpTBXDockablePanel2);
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
  Caption:= 'Спортивный планировщик';
  spMainForm.Caption:= Caption;
  SpTBXLabelItem2.Caption:= '';
  SpTBXLabelItem1.Caption:= '';
  if Empty then Exit;
  if Length(ProjectDir) > 0 then
  begin
    Caption:= Caption + '  [' + ProjectDir + ProjectFileName + ']';
  end;
  if Modified then
    SpTBXLabelItem2.Caption:= 'Изменен';
  spMainForm.Caption:= Caption;
end;

procedure TMainForm.actExitApplicationExecute(Sender: TObject);
begin
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
    SpTBXLabelItem2.Caption:= 'Изменен';
end;


procedure TMainForm.actForceDefaultViewExecute(Sender: TObject);
var cls1:TFMClass;
begin
  if MessageBoxW(Application.Handle,'Вы действительно хотите вернуть исходные настройки рабочего стола ? Прежний вид будет безвозвратно утерян.','Подтверждение', MB_YESNO OR MB_ICONQUESTION) = IDYES then
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
end;

procedure TMainForm.DoOpenProject;
begin
  TreeView1.Enabled:= True;
  TreeView1.Color:= clWhite;
  UpdateTree(nil,nil);
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
  Result.FindPropertyByName('guid').ValueS:= cls2.FindPropertyByName('guid').ValueS;
  Result.FindPropertyByName('caption').ValueS:= cls2.FindPropertyByName('caption').ValueS;
  AddTreeViewItem(Result,TreeView1.Selected);
  TreeView1.Selected.Expand(False);
  Modified:= True;
end;

function TMainForm.AddTreeViewItem(cls_tree_object: TFMClass; ParentNode:TTreeNode): TTreeNode;
begin
  Result:= TreeView1.Items.AddChild(ParentNode,'');
  Result.Text:= cls_tree_object.FindPropertyByName('caption').ValueS;
  Result.Data:= cls_tree_object;
end;

procedure TMainForm.UpdateTree(cls_tree_object:TFMClass; ParentNode:TTreeNode);
var cls1:TFMClass;
    i:Integer;
    tn1:TTreeNode;
begin
  if not Assigned(cls_tree_object) then
    cls_tree_object:= cls_project.FindClassByName('tree');

  for i:= 0 to cls_tree_object.MyClassCount - 1 do
  begin
    tn1:= AddTreeViewItem(cls_tree_object.MyClass[i],ParentNode);
    UpdateTree(cls_tree_object.MyClass[i],tn1);
  end;

end;

end.
