object Browser: TBrowser
  Left = 308
  Top = 202
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
      object SpTBXEdit1: TSpTBXEdit
        Left = 16
        Top = 8
        Width = 585
        Height = 21
        TabOrder = 1
      end
      object SpTBXButton2: TSpTBXButton
        Left = 608
        Top = 5
        Width = 97
        Height = 25
        Caption = 'GetUrl'
        TabOrder = 2
        OnClick = SpTBXButton2Click
      end
    end
    object Chromium1: TChromium
      Left = 8
      Top = 65
      Width = 848
      Height = 433
      Align = alClient
      TabOrder = 2
      Options.AcceleratedPaintingDisabled = False
      Options.AcceleratedFiltersDisabled = False
      Options.AcceleratedPluginsDisabled = False
    end
  end
end
