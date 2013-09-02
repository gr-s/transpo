object MainForm: TMainForm
  Left = 205
  Top = 55
  Width = 870
  Height = 640
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object spMainForm: TSpTBXTitleBar
    Left = 0
    Top = 0
    Width = 854
    Height = 602
    Caption = 'TRANSPO'
    FixedSize = True
    object Button1: TButton
      Left = 152
      Top = 256
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object SpTBXPanel1: TSpTBXPanel
      Left = 8
      Top = 536
      Width = 838
      Height = 58
      Caption = 'SpTBXPanel1'
      Align = alBottom
      TabOrder = 2
      object SpTBXButton1: TSpTBXButton
        Left = 752
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
        Width = 84
        Height = 54
        Caption = #1055#1086#1080#1089#1082
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = SpTBXButton1Click
      end
    end
  end
end
