unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cefvcl, ceflib, grstring, ati2, cefgui;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Chromium1: TChromiumOSR;
    procedure Button1Click(Sender: TObject);
    procedure Chromium12LoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer;
      out Result: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    ati:TATI;
  public

  end;

var
  Form1: TForm1;

  procedure _process(op:TOperationObject);
  procedure domvisitorcallback(const doc: ICefDomDocument);

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  //Chromium1.Load('http://ati.su/Login/Login.aspx');
end;


procedure TForm1.Chromium12LoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  httpStatusCode: Integer; out Result: Boolean);
var sl:TStringList;
    s:String;
begin
  sl:= TStringList.Create;
  sl.LoadFromFile(ExtractFilePath(Application.ExeName) + 'loadscript.js');
  s:= sl.Text;
  s:= ReplaceSymb(s,'"http://109.120.140.206/test.js"','//script//');
  frame.ExecuteJavaScript(s,'',1);
  //frame.VisitDomProc(domvisitorcallback);
end;

procedure domvisitorcallback(const doc: ICefDomDocument);
begin
  ShowMessage(doc.Body.ElementInnerText);
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Chromium1.Browser.MainFrame.ExecuteJavaScript('__login();','',1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ati:= TATI.Create(nil);
  ati.Chromium:= Chromium1;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ati.login('_iveco','hjtu23iovb89',_process);
end;

procedure _process(op: TOperationObject);
begin
  ShowMessage(op.id);
end;

end.
