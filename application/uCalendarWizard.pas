unit uCalendarWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXControls, SpTBXItem, ComCtrls;

type
  TCalendarWizard = class(TForm)
    spMainForm: TSpTBXTitleBar;
    MonthCalendar1: TMonthCalendar;
    SpTBXButton1: TSpTBXButton;
    procedure MonthCalendar1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    Result:TDate;
    function Execute(x,y:Integer):Integer;
  end;

var
  CalendarWizard: TCalendarWizard;

implementation

uses DateUtils;

{$R *.dfm}

{ TCalendarWizard }

function TCalendarWizard.Execute(x, y: Integer): Integer;
begin
  Left:= x;
  Top:= y;
  if YearOf(MonthCalendar1.Date) < 2000 then
    MonthCalendar1.Date:= Now;
  Result:= ShowModal;
  Self.Result:= MonthCalendar1.Date;
end;

procedure TCalendarWizard.MonthCalendar1DblClick(Sender: TObject);
begin
    ModalResult:= mrOK;
end;

end.
