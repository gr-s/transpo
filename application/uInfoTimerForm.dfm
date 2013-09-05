object InfoTimerForm: TInfoTimerForm
  Left = 427
  Top = 349
  Width = 234
  Height = 135
  AlphaBlend = True
  AlphaBlendValue = 180
  Caption = 'InfoTimerForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object spMainForm: TSpTBXTitleBar
    Left = 0
    Top = 0
    Width = 218
    Height = 97
    FixedSize = True
    Options.ButtonBorders = False
    Options.Caption = False
    Options.Close = False
    Options.Minimize = False
    Options.Maximize = False
    Options.SystemMenu = False
    object SpTBXLabel1: TSpTBXLabel
      Left = 16
      Top = 56
      Width = 185
      Height = 13
      Caption = 'SpTBXLabel1'
      AutoSize = False
      Alignment = taCenter
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 96
    Top = 8
  end
end
