unit uBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXItem, ati, transpo_classes, SpTBXControls, StdCtrls,
  SpTBXEditors, cefvcl;

type
  TBrowser = class(TForm)
    spMainForm: TSpTBXTitleBar;
    SpTBXPanel1: TSpTBXPanel;
    SpTBXButton1: TSpTBXButton;
    SpTBXEdit1: TSpTBXEdit;
    SpTBXButton2: TSpTBXButton;
    Chromium1: TChromium;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure SpTBXButton1Click(Sender: TObject);
    procedure SpTBXButton2Click(Sender: TObject);
  private
    { Private declarations }
  public

    constructor Create(AOwner: TComponent);override;
    destructor  Destroy;override;
  end;

var
  Browser: TBrowser;

implementation
uses uMainForm;
{$R *.dfm}

{ TBrowser }

constructor TBrowser.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TBrowser.Destroy;
begin

  inherited;
end;

procedure TBrowser.FormShow(Sender: TObject);
begin
  TMainForm(Application.MainForm).spMainForm.RemoveControl(ati_service.wb);
  spMainForm.InsertControl(ati_service.wb);
  ati_service.wb.Align:= alClient;
end;

procedure TBrowser.FormHide(Sender: TObject);
begin
  spMainForm.RemoveControl(ati_service.wb);
  TMainForm(Application.MainForm).spMainForm.InsertControl(ati_service.wb);
  ati_service.wb.Align:= alNone;
  ati_service.wb.Width:= 0;
  ati_service.wb.Height:= 0;
end;

procedure TBrowser.SpTBXButton1Click(Sender: TObject);
begin
  Hide;
end;

procedure TBrowser.SpTBXButton2Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= ati_service.wb.LocationURL;
end;

end.
