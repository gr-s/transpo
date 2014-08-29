object Form1: TForm1
  Left = 364
  Top = 124
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 288
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 424
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 192
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Chromium2: TChromium
    Left = 32
    Top = 16
    Width = 809
    Height = 529
    TabOrder = 3
    Options.AcceleratedPaintingDisabled = False
    Options.AcceleratedFiltersDisabled = False
    Options.AcceleratedPluginsDisabled = False
  end
  object Chromium1: TChromiumOSR
    OnLoadEnd = Chromium12LoadEnd
    Options.AcceleratedPaintingDisabled = False
    Options.AcceleratedFiltersDisabled = False
    Options.AcceleratedPluginsDisabled = False
    Left = 144
    Top = 88
  end
end
