unit uBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXItem, ati, transpo_classes;

type
  TBrowser = class(TForm)
    spMainForm: TSpTBXTitleBar;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
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

end.
