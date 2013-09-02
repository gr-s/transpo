object Browser: TBrowser
  Left = 282
  Top = 125
  Width = 880
  Height = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spMainForm: TSpTBXTitleBar
    Left = 0
    Top = 0
    Width = 864
    Height = 506
    FixedSize = True
    Options.Minimize = False
    object SpTBXPanel1: TSpTBXPanel
      Left = 8
      Top = 30
      Width = 848
      Height = 35
      Caption = 'SpTBXPanel1'
      Align = alTop
      TabOrder = 1
      object SpTBXButton1: TSpTBXButton
        Left = 771
        Top = 2
        Width = 75
        Height = 31
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Align = alRight
        TabOrder = 0
        OnClick = SpTBXButton1Click
      end
    end
  end
end
