unit uBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXItem, SpTBXControls, StdCtrls,
  SpTBXEditors, cefvcl, GR32_Image, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TBrowser = class(TForm)
    spMainForm: TSpTBXTitleBar;
    SpTBXPanel1: TSpTBXPanel;
    SpTBXButton1: TSpTBXButton;
    SpTBXEdit1: TSpTBXEdit;
    SpTBXButton2: TSpTBXButton;
    Chromium1: TChromium;
    PaintBox: TPaintBox32;
    Chromium2: TChromium;
    IdHTTP1: TIdHTTP;
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
uses uMainForm,ati2,ceflib;
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
  {$IFDEF _IE}
  TMainForm(Application.MainForm).spMainForm.RemoveControl(ati_service.wb);
  spMainForm.InsertControl(ati_service.wb);
  ati_service.wb.Align:= alClient;
  {$ENDIF}
end;

procedure TBrowser.FormHide(Sender: TObject);
begin
  {$IFDEF _IE}
  spMainForm.RemoveControl(ati_service.wb);
  TMainForm(Application.MainForm).spMainForm.InsertControl(ati_service.wb);
  ati_service.wb.Align:= alNone;
  ati_service.wb.Width:= 0;
  ati_service.wb.Height:= 0;
  {$ENDIF}
end;

procedure TBrowser.SpTBXButton1Click(Sender: TObject);
begin
  Hide;
end;

procedure TBrowser.SpTBXButton2Click(Sender: TObject);
begin
  {$IFDEF _IE}
  SpTBXEdit1.Text:= ati_service.wb.LocationURL;
  {$ELSE}
  SpTBXEdit1.Text:= ati_service._last_url;
  {$ENDIF}
end;

end.
