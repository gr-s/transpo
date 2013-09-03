object MainForm: TMainForm
  Left = 154
  Top = 124
  Width = 1102
  Height = 646
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object spMainForm: TSpTBXTitleBar
    Left = 0
    Top = 0
    Width = 1086
    Height = 608
    Caption = 'TRANSPO'
    FixedSize = True
    object SpTBXPanel1: TSpTBXPanel
      Left = 8
      Top = 542
      Width = 1070
      Height = 58
      Caption = 'SpTBXPanel1'
      Align = alBottom
      TabOrder = 1
      object SpTBXButton1: TSpTBXButton
        Left = 900
        Top = 2
        Width = 84
        Height = 54
        Caption = #1041#1088#1072#1091#1079#1077#1088
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = SpTBXButton1Click
      end
      object SpTBXButton2: TSpTBXButton
        Left = 2
        Top = 2
        Width = 95
        Height = 54
        Caption = #1055#1086#1080#1089#1082' (ATI)'
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = SpTBXButton2Click
      end
      object SpTBXButton3: TSpTBXButton
        Left = 984
        Top = 2
        Width = 84
        Height = 54
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = SpTBXButton3Click
      end
    end
    object SpTBXPanel2: TSpTBXPanel
      Left = 8
      Top = 30
      Width = 1070
      Height = 41
      Caption = 'SpTBXPanel2'
      Color = clWhite
      SkinType = sknNone
      Align = alTop
      TabOrder = 2
      Visible = False
      Borders = False
      BorderType = pbrRaised
      object SpTBXPanel3: TSpTBXPanel
        Left = 720
        Top = 2
        Width = 348
        Height = 37
        Caption = 'SpTBXPanel3'
        Align = alRight
        TabOrder = 0
        Borders = False
        object SpTBXLabel1: TSpTBXLabel
          Left = 10
          Top = 5
          Width = 63
          Height = 13
          Caption = #1054#1087#1077#1088#1072#1094#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpTBXLabel2: TSpTBXLabel
          Left = 82
          Top = 5
          Width = 263
          Height = 13
          Caption = #1054#1087#1077#1088#1072#1094#1080#1103':'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpTBXLabel3: TSpTBXLabel
          Left = 10
          Top = 19
          Width = 63
          Height = 13
          Caption = #1064#1072#1075':'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Alignment = taRightJustify
        end
        object SpTBXLabel4: TSpTBXLabel
          Left = 81
          Top = 19
          Width = 264
          Height = 13
          Caption = #1054#1087#1077#1088#1072#1094#1080#1103':'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object tcSplitterLeft: TSpTBXSplitter
      Left = 297
      Top = 71
      Width = 15
      Height = 471
      Cursor = crSizeWE
    end
    object tcLeft: TSpTBXTabControl
      Left = 8
      Top = 71
      Width = 289
      Height = 471
      Align = alLeft
      ActiveTabIndex = 0
      TabVisible = False
      HiddenItems = <>
      object SpTBXTabItem2: TSpTBXTabItem
        Caption = 'f_tcks'
        Checked = True
      end
      object SpTBXTabSheet2: TSpTBXTabSheet
        Left = 0
        Top = 25
        Width = 289
        Height = 446
        ImageIndex = -1
        TabVisible = False
        TabItem = ''
      end
    end
    object tcClient: TSpTBXTabControl
      Left = 312
      Top = 71
      Width = 766
      Height = 471
      Align = alClient
      ActiveTabIndex = 0
      TabVisible = False
      HiddenItems = <>
      object SpTBXTabItem3: TSpTBXTabItem
        Caption = 'f_ati'
        Checked = True
      end
      object SpTBXTabSheet3: TSpTBXTabSheet
        Left = 0
        Top = 25
        Width = 766
        Height = 446
        Caption = 'f_ati'
        ImageIndex = -1
        TabItem = 'SpTBXTabItem3'
        object SpTBXPanel4: TSpTBXPanel
          Left = 2
          Top = 0
          Width = 119
          Height = 442
          Caption = 'SpTBXPanel4'
          Align = alLeft
          TabOrder = 0
          Borders = False
          object SpTBXButton4: TSpTBXButton
            Left = 16
            Top = 24
            Width = 89
            Height = 33
            Caption = #1047#1072#1075#1088#1091#1079#1082#1072
            TabOrder = 0
            OnClick = SpTBXButton4Click
          end
          object SpTBXButton5: TSpTBXButton
            Left = 16
            Top = 136
            Width = 89
            Height = 33
            Caption = #1056#1072#1079#1075#1088#1091#1079#1082#1072
            TabOrder = 1
            OnClick = SpTBXButton5Click
          end
        end
        object SpTBXPanel5: TSpTBXPanel
          Left = 121
          Top = 0
          Width = 327
          Height = 442
          Caption = 'SpTBXPanel4'
          Align = alClient
          TabOrder = 1
          Borders = False
        end
        object SpTBXPanel6: TSpTBXPanel
          Left = 448
          Top = 0
          Width = 314
          Height = 442
          Caption = 'SpTBXPanel4'
          Align = alRight
          TabOrder = 2
          Borders = False
        end
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 216
    Top = 152
  end
end
