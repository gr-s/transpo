object CalendarWizard: TCalendarWizard
  Left = 630
  Top = 274
  Width = 209
  Height = 311
  Caption = 'CalendarWizard'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object spMainForm: TSpTBXTitleBar
    Left = 0
    Top = 0
    Width = 193
    Height = 273
    FixedSize = True
    Options.ButtonBorders = False
    Options.Minimize = False
    Options.Maximize = False
    Options.SystemMenu = False
    object MonthCalendar1: TMonthCalendar
      Left = 8
      Top = 30
      Width = 183
      Height = 199
      Date = 0.774401909722655500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowToday = False
      TabOrder = 1
      OnDblClick = MonthCalendar1DblClick
    end
    object SpTBXButton1: TSpTBXButton
      Left = 17
      Top = 234
      Width = 161
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      ModalResult = 2
    end
  end
end
