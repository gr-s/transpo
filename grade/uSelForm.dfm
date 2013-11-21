object SelForm: TSelForm
  Left = 539
  Top = 189
  Width = 309
  Height = 348
  Caption = 'SelForm'
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
    Width = 293
    Height = 310
    Options.ButtonBorders = False
    Options.Minimize = False
    Options.Maximize = False
    Options.SystemMenu = False
    object SpTBXPanel1: TSpTBXPanel
      Left = 8
      Top = 261
      Width = 277
      Height = 41
      Caption = 'SpTBXPanel1'
      Align = alBottom
      TabOrder = 1
      object SpTBXButton1: TSpTBXButton
        Left = 128
        Top = 8
        Width = 75
        Height = 25
        Caption = 'OK'
        TabOrder = 0
        ModalResult = 1
      end
      object SpTBXButton2: TSpTBXButton
        Left = 208
        Top = 8
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 1
        ModalResult = 2
      end
    end
    object SpTBXListBox1: TSpTBXListBox
      Left = 8
      Top = 29
      Width = 277
      Height = 232
      Align = alClient
      ItemHeight = 16
      Sorted = True
      TabOrder = 2
      OnDblClick = SpTBXListBox1DblClick
      OnKeyDown = SpTBXListBox1KeyDown
    end
  end
end
