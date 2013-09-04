object MainForm: TMainForm
  Left = 167
  Top = 101
  Width = 1062
  Height = 669
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
    Width = 1046
    Height = 631
    Caption = 'TRANSPO'
    FixedSize = True
    object SpTBXPanel1: TSpTBXPanel
      Left = 8
      Top = 565
      Width = 1030
      Height = 58
      Caption = 'SpTBXPanel1'
      Align = alBottom
      TabOrder = 1
      object SpTBXButton1: TSpTBXButton
        Left = 860
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
        TabOrder = 1
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
        TabOrder = 0
        OnClick = SpTBXButton2Click
      end
      object SpTBXButton3: TSpTBXButton
        Left = 944
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
      Width = 1030
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
        Left = 680
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
      object SpTBXPanel8: TSpTBXPanel
        Left = 332
        Top = 2
        Width = 348
        Height = 37
        Caption = 'SpTBXPanel3'
        Align = alRight
        TabOrder = 1
        Borders = False
        object SpTBXLabel11: TSpTBXLabel
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
        object SpTBXLabel12: TSpTBXLabel
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
        object SpTBXLabel13: TSpTBXLabel
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
        object SpTBXLabel14: TSpTBXLabel
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
      Height = 494
      Cursor = crSizeWE
    end
    object tcLeft: TSpTBXTabControl
      Left = 8
      Top = 71
      Width = 289
      Height = 494
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
        Height = 469
        ImageIndex = -1
        TabVisible = False
        TabItem = ''
      end
    end
    object tcClient: TSpTBXTabControl
      Left = 312
      Top = 71
      Width = 726
      Height = 494
      Align = alClient
      ActiveTabIndex = 0
      TabVisible = False
      HiddenItems = <>
      object SpTBXTabItem3: TSpTBXTabItem
        Caption = 'f_ati_par'
        Checked = True
      end
      object SpTBXTabItem1: TSpTBXTabItem
        Caption = 'f_ati'
      end
      object SpTBXTabSheet1: TSpTBXTabSheet
        Left = 0
        Top = 25
        Width = 726
        Height = 469
        Caption = 'f_ati'
        ImageIndex = -1
        DesignSize = (
          726
          469)
        TabItem = 'SpTBXTabItem1'
        object SpTBXButton27: TSpTBXButton
          Left = 49
          Top = 40
          Width = 640
          Height = 65
          Caption = #1056#1091#1095#1085#1086#1081' '#1087#1086#1080#1089#1082
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = SpTBXButton27Click
        end
        object SpTBXButton28: TSpTBXButton
          Left = 49
          Top = 128
          Width = 640
          Height = 65
          Caption = #1059#1084#1085#1099#1081' '#1087#1086#1080#1089#1082
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object SpTBXTabSheet3: TSpTBXTabSheet
        Left = 0
        Top = 25
        Width = 726
        Height = 469
        Caption = 'f_ati_par'
        ImageIndex = -1
        TabItem = 'SpTBXTabItem3'
        object SpTBXPanel4: TSpTBXPanel
          Left = 2
          Top = 0
          Width = 119
          Height = 424
          Caption = 'SpTBXPanel4'
          Align = alLeft
          TabOrder = 0
          Borders = False
          object SpTBXButton4: TSpTBXButton
            Left = 8
            Top = 8
            Width = 89
            Height = 33
            Caption = #1047#1072#1075#1088#1091#1079#1082#1072
            TabOrder = 0
            OnClick = SpTBXButton4Click
          end
          object SpTBXButton5: TSpTBXButton
            Left = 8
            Top = 231
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
          Width = 288
          Height = 424
          Caption = 'SpTBXPanel4'
          Align = alLeft
          TabOrder = 1
          Borders = False
          DesignSize = (
            288
            424)
          object tblATIFromGeo: TRRAdvTable
            Left = 1
            Top = 45
            Width = 272
            Height = 129
            Anchors = [akLeft, akTop, akRight]
            Color = clWhite
            Constraints.MinWidth = 100
            TabOrder = 0
            TabStop = True
            FixedColShow = False
            AlwaysFixedColShow = True
            TemplateFileAppDir = False
            TemplateFileExceptions = True
            FixedCellHeight = 18
            FixedCellFontEnabled = False
            FixedCellFont.Charset = DEFAULT_CHARSET
            FixedCellFont.Color = clWindowText
            FixedCellFont.Height = -11
            FixedCellFont.Name = 'MS Sans Serif'
            FixedCellFont.Style = []
            DefaultCellWidth = 100
            DefaultCellHeight = 18
            AutoCellWidthEnabled = True
            CellLineDragMethod = rrdmSingleLine
            Painter.FixedCellBorderColor = clBlack
            Painter.FixedCellBorderWidth = 1
            Painter.FixedCellColor = clBtnFace
            Painter.FixedCellInnerFrameColor = clWhite
            Painter.FixedCellInnerFrameRectLeftOffset = 0
            Painter.FixedCellInnerFrameRectTopOffset = 0
            Painter.FixedCellInnerFrameRectRightOffset = 1
            Painter.FixedCellInnerFrameRectBottomOffset = 1
            Painter.FixedSeparatorColor = clGray
            Painter.FixedSeparatorSubColor = clWhite
            Painter.FixedSeparatorOffset1 = 1
            Painter.SplitLineColor = clBlack
            Painter.SplitLinePenStyle = psDot
            Painter.SortTriangleLine1Color = clWhite
            Painter.SortTriangleLine2Color = clWhite
            Painter.SortTriangleLine3Color = clBlack
            Painter.SortTriangleBorderAreaColor = clGray
            Painter.SortTriangleBorderEdgeAreaColor = clWhite
            Painter.SortActiveTriangleColor = clRed
            Painter.FilterCaptionFontColor = clBlack
            Painter.FilterActiveFrameColor = clYellow
            Painter.PreActiveFramesColor = clCream
            Painter.TechZoneWidth = 20
            Painter.TechZoneColor1 = 14211288
            Painter.TechZoneColor2 = 14211288
            Painter.TechZoneLineColor = clBlack
            Painter.TechZoneCursorRowColor = clBlack
            Painter.TechZoneCursorRowLineMainColor = clWhite
            Painter.TechZoneCursorRowLineColor = clBlack
            Painter.TechZoneCursorRecColor = clSilver
            Painter.TechZoneSymbolVisible = True
            Painter.TechZoneSymbolFontColor = clBlack
            Painter.TechZoneLineWidth = 1
            Painter.CellHorzLineColor = clSilver
            Painter.CellVertLineColor = clSilver
            Painter.CellHorzLineWidth = 1
            Painter.CellVertLineWidth = 1
            Painter.SelFrameMainColor = clNavy
            Painter.SelFrameMainFontColor = clWhite
            Painter.SelFrameMainWidth = 1
            Painter.SelFrameMainPenStyle = psDot
            Painter.SelFrameColColor = clBlack
            Painter.SelFrameColWidth = 1
            Painter.SelFrameColPenStyle = psSolid
            Painter.BoolCellRectColor = clBlack
            Painter.BoolCellRectSymbColor = clBlack
            Painter.BoolCellRectSymbol = #0
            Painter.VertCtrlsModeUseSelRowFrame = False
            Painter.VertCtrlsModeSelRowFrameColor = clGray
            Painter.VertCtrlsModeSelRowFrameFont.Charset = DEFAULT_CHARSET
            Painter.VertCtrlsModeSelRowFrameFont.Color = clBlue
            Painter.VertCtrlsModeSelRowFrameFont.Height = -11
            Painter.VertCtrlsModeSelRowFrameFont.Name = 'MS Sans Serif'
            Painter.VertCtrlsModeSelRowFrameFont.Style = []
            Painter.ChessPaintModeColor = 16250357
            Painter.ChessPaintModeCellMainColor = clWhite
            Options.AllowVertLineSplit = True
            Options.AllowHorzLineSplit = True
            Options.TechZoneVisible = False
            Options.TechZoneAlwaysVisible = False
            Options.TechZoneCursorRowVisible = False
            Options.TechZoneCursorRowView = tcvTriangle
            Options.TechZoneCursorRecVisible = True
            Options.TechZoneCursorRecView = tcvTriangle
            Options.EmptyPromtVisible = False
            Options.EmptyPromtFont.Charset = DEFAULT_CHARSET
            Options.EmptyPromtFont.Color = clWindowText
            Options.EmptyPromtFont.Height = -11
            Options.EmptyPromtFont.Name = 'MS Sans Serif'
            Options.EmptyPromtFont.Style = []
            Options.EmptyPromtCaption = 'No items ...'
            Options.CellHorzLineVisible = True
            Options.CellVertLineVisible = True
            Options.SelFrameMainVisible = False
            Options.SelFrameMainType = msftSolid
            Options.SelFrameColVisible = True
            Options.SelFrameColType = csftFocusedFrame
            Options.EmmediatelyEditing = True
            Options.WantEditorOnSelReClick = False
            Options.WantEditor = False
            Options.WantCuttingText = True
            Options.WantShowEditorWhenIReadOnly = False
            Options.WantDirectBoolChange = False
            Options.CuttingText = '....'
            Options.ScrollBars = ssBoth
            Options.UseDesignerSettingsOpenning = False
            Options.MultiSelecting = False
            Options.ChessPaintMode = False
            Options.ChessPaintModeIncludeImageCell = True
            TestDraw = False
            MinCellHeight = 16
            MinCellWidth = 5
            SplitOption.VertCtrlsModeEnabled = False
            SplitOption.VertCtrlsModeWantEnter = True
            SplitOption.DBModeEnabled = False
            SplitOption.DBCreateCellsMode = ccmRowBlocks
            SplitOption.DBSelectingMoveCursor = True
            SplitOption.DBRowBlockIndex = 0
            Active = True
            ServiceButtonFlat = False
            ServiceButtonText = 'F1'
            ReadOnly = False
            DesignModeEnabled = False
            HideSelection = True
            SelectComboAutoDropDown = False
            object Memo1: TMemo
              Left = 24
              Top = 8
              Width = 217
              Height = 97
              Lines.Strings = (
                'Memo1')
              TabOrder = 0
            end
          end
          object SpTBXButton6: TSpTBXButton
            Left = 104
            Top = 8
            Width = 89
            Height = 27
            Caption = #1091#1076#1072#1083
            TabOrder = 1
            OnClick = SpTBXButton6Click
          end
          object SpTBXButton8: TSpTBXButton
            Left = 199
            Top = 8
            Width = 65
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 2
            OnClick = SpTBXButton8Click
          end
          object SpTBXLabel5: TSpTBXLabel
            Left = 11
            Top = 192
            Width = 36
            Height = 13
            Caption = #1056#1072#1076#1080#1091#1089
          end
          object SpTBXEdit1: TSpTBXEdit
            Left = 53
            Top = 184
            Width = 121
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object SpTBXButton9: TSpTBXButton
            Left = 176
            Top = 184
            Width = 40
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 5
            OnClick = SpTBXButton9Click
          end
          object SpTBXButton10: TSpTBXButton
            Left = 220
            Top = 184
            Width = 40
            Height = 27
            Caption = #1091#1089#1090
            TabOrder = 6
            OnClick = SpTBXButton10Click
          end
          object tblATIToGeo: TRRAdvTable
            Left = 1
            Top = 269
            Width = 272
            Height = 129
            Anchors = [akLeft, akTop, akRight]
            Color = clWhite
            Constraints.MinWidth = 100
            TabOrder = 7
            TabStop = True
            FixedColShow = False
            AlwaysFixedColShow = True
            TemplateFileAppDir = False
            TemplateFileExceptions = True
            FixedCellHeight = 18
            FixedCellFontEnabled = False
            FixedCellFont.Charset = DEFAULT_CHARSET
            FixedCellFont.Color = clWindowText
            FixedCellFont.Height = -11
            FixedCellFont.Name = 'MS Sans Serif'
            FixedCellFont.Style = []
            DefaultCellWidth = 100
            DefaultCellHeight = 18
            AutoCellWidthEnabled = True
            CellLineDragMethod = rrdmSingleLine
            Painter.FixedCellBorderColor = clBlack
            Painter.FixedCellBorderWidth = 1
            Painter.FixedCellColor = clBtnFace
            Painter.FixedCellInnerFrameColor = clWhite
            Painter.FixedCellInnerFrameRectLeftOffset = 0
            Painter.FixedCellInnerFrameRectTopOffset = 0
            Painter.FixedCellInnerFrameRectRightOffset = 1
            Painter.FixedCellInnerFrameRectBottomOffset = 1
            Painter.FixedSeparatorColor = clGray
            Painter.FixedSeparatorSubColor = clWhite
            Painter.FixedSeparatorOffset1 = 1
            Painter.SplitLineColor = clBlack
            Painter.SplitLinePenStyle = psDot
            Painter.SortTriangleLine1Color = clWhite
            Painter.SortTriangleLine2Color = clWhite
            Painter.SortTriangleLine3Color = clBlack
            Painter.SortTriangleBorderAreaColor = clGray
            Painter.SortTriangleBorderEdgeAreaColor = clWhite
            Painter.SortActiveTriangleColor = clRed
            Painter.FilterCaptionFontColor = clBlack
            Painter.FilterActiveFrameColor = clYellow
            Painter.PreActiveFramesColor = clCream
            Painter.TechZoneWidth = 20
            Painter.TechZoneColor1 = 14211288
            Painter.TechZoneColor2 = 14211288
            Painter.TechZoneLineColor = clBlack
            Painter.TechZoneCursorRowColor = clBlack
            Painter.TechZoneCursorRowLineMainColor = clWhite
            Painter.TechZoneCursorRowLineColor = clBlack
            Painter.TechZoneCursorRecColor = clSilver
            Painter.TechZoneSymbolVisible = True
            Painter.TechZoneSymbolFontColor = clBlack
            Painter.TechZoneLineWidth = 1
            Painter.CellHorzLineColor = clSilver
            Painter.CellVertLineColor = clSilver
            Painter.CellHorzLineWidth = 1
            Painter.CellVertLineWidth = 1
            Painter.SelFrameMainColor = clNavy
            Painter.SelFrameMainFontColor = clWhite
            Painter.SelFrameMainWidth = 1
            Painter.SelFrameMainPenStyle = psDot
            Painter.SelFrameColColor = clBlack
            Painter.SelFrameColWidth = 1
            Painter.SelFrameColPenStyle = psSolid
            Painter.BoolCellRectColor = clBlack
            Painter.BoolCellRectSymbColor = clBlack
            Painter.BoolCellRectSymbol = #0
            Painter.VertCtrlsModeUseSelRowFrame = False
            Painter.VertCtrlsModeSelRowFrameColor = clGray
            Painter.VertCtrlsModeSelRowFrameFont.Charset = DEFAULT_CHARSET
            Painter.VertCtrlsModeSelRowFrameFont.Color = clBlue
            Painter.VertCtrlsModeSelRowFrameFont.Height = -11
            Painter.VertCtrlsModeSelRowFrameFont.Name = 'MS Sans Serif'
            Painter.VertCtrlsModeSelRowFrameFont.Style = []
            Painter.ChessPaintModeColor = 16250357
            Painter.ChessPaintModeCellMainColor = clWhite
            Options.AllowVertLineSplit = True
            Options.AllowHorzLineSplit = True
            Options.TechZoneVisible = False
            Options.TechZoneAlwaysVisible = False
            Options.TechZoneCursorRowVisible = False
            Options.TechZoneCursorRowView = tcvTriangle
            Options.TechZoneCursorRecVisible = True
            Options.TechZoneCursorRecView = tcvTriangle
            Options.EmptyPromtVisible = False
            Options.EmptyPromtFont.Charset = DEFAULT_CHARSET
            Options.EmptyPromtFont.Color = clWindowText
            Options.EmptyPromtFont.Height = -11
            Options.EmptyPromtFont.Name = 'MS Sans Serif'
            Options.EmptyPromtFont.Style = []
            Options.EmptyPromtCaption = 'No items ...'
            Options.CellHorzLineVisible = True
            Options.CellVertLineVisible = True
            Options.SelFrameMainVisible = False
            Options.SelFrameMainType = msftSolid
            Options.SelFrameColVisible = True
            Options.SelFrameColType = csftFocusedFrame
            Options.EmmediatelyEditing = True
            Options.WantEditorOnSelReClick = False
            Options.WantEditor = False
            Options.WantCuttingText = True
            Options.WantShowEditorWhenIReadOnly = False
            Options.WantDirectBoolChange = False
            Options.CuttingText = '....'
            Options.ScrollBars = ssBoth
            Options.UseDesignerSettingsOpenning = False
            Options.MultiSelecting = False
            Options.ChessPaintMode = False
            Options.ChessPaintModeIncludeImageCell = True
            TestDraw = False
            MinCellHeight = 16
            MinCellWidth = 5
            SplitOption.VertCtrlsModeEnabled = False
            SplitOption.VertCtrlsModeWantEnter = True
            SplitOption.DBModeEnabled = False
            SplitOption.DBCreateCellsMode = ccmRowBlocks
            SplitOption.DBSelectingMoveCursor = True
            SplitOption.DBRowBlockIndex = 0
            Active = True
            ServiceButtonFlat = False
            ServiceButtonText = 'F1'
            ReadOnly = False
            DesignModeEnabled = False
            HideSelection = True
            SelectComboAutoDropDown = False
          end
          object SpTBXButton11: TSpTBXButton
            Left = 104
            Top = 232
            Width = 89
            Height = 27
            Caption = #1091#1076#1072#1083
            TabOrder = 8
            OnClick = SpTBXButton11Click
          end
          object SpTBXButton13: TSpTBXButton
            Left = 199
            Top = 232
            Width = 65
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 9
            OnClick = SpTBXButton13Click
          end
          object SpTBXLabel6: TSpTBXLabel
            Left = 11
            Top = 416
            Width = 36
            Height = 13
            Caption = #1056#1072#1076#1080#1091#1089
          end
          object SpTBXEdit2: TSpTBXEdit
            Left = 53
            Top = 408
            Width = 121
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object SpTBXButton14: TSpTBXButton
            Left = 176
            Top = 408
            Width = 40
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 12
            OnClick = SpTBXButton14Click
          end
          object SpTBXButton15: TSpTBXButton
            Left = 220
            Top = 408
            Width = 40
            Height = 27
            Caption = #1091#1089#1090
            TabOrder = 13
            OnClick = SpTBXButton15Click
          end
          object GRFormPanel1: TGRFormPanel
            Left = 16
            Top = 208
            Width = 257
            Height = 177
            Caption = 'GRFormPanel1'
            TabOrder = 14
            CaptionPosition = dpTop
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWhite
            CaptionFont.Height = -9
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = [fsBold]
            CaptionColor = clBlack
            CaptionOffsetX = 5
            CaptionOffsetY = 5
            CaptionTextOffsetX = 5
            CaptionTextOffsetY = 2
            CaptionHeight = 20
            PanelCaptionVisible = False
            CaptionBlockVisible = True
            GradientEnabled = True
            GradientStyle = grHorizontal
            GradientStartColor = clBlue
            GradientEndColor = clBlack
            GradientSteps = 100
            ButtonCloseVisible = False
            ButtonCloseTransparent = True
            ButtonCloseFlat = True
            ButtonCloseFont.Charset = DEFAULT_CHARSET
            ButtonCloseFont.Color = clWindowText
            ButtonCloseFont.Height = -11
            ButtonCloseFont.Name = 'MS Sans Serif'
            ButtonCloseFont.Style = []
            ButtonCloseCaption = 'x'
            ButtonMaximizeVisible = False
            ButtonMaximizeTransparent = False
            ButtonMaximizeFlat = False
            ButtonMaximizeFont.Charset = DEFAULT_CHARSET
            ButtonMaximizeFont.Color = clWindowText
            ButtonMaximizeFont.Height = -11
            ButtonMaximizeFont.Name = 'MS Sans Serif'
            ButtonMaximizeFont.Style = []
            ButtonMaximizeCaption = '[]'
            Resizable = True
            Static = False
            PanelBehavior = pbFormPanel
          end
        end
        object SpTBXPanel6: TSpTBXPanel
          Left = 409
          Top = 0
          Width = 313
          Height = 424
          Caption = 'SpTBXPanel4'
          Align = alClient
          TabOrder = 2
          Borders = False
          object tblATIGeos: TRRAdvTable
            Left = 9
            Top = 80
            Width = 296
            Height = 241
            Color = clWhite
            Constraints.MinWidth = 100
            TabOrder = 0
            TabStop = True
            OnMouseMove = tblATIGeosMouseMove
            FixedColShow = False
            AlwaysFixedColShow = True
            TemplateFileAppDir = False
            TemplateFileExceptions = True
            FixedCellHeight = 18
            FixedCellFontEnabled = False
            FixedCellFont.Charset = DEFAULT_CHARSET
            FixedCellFont.Color = clWindowText
            FixedCellFont.Height = -11
            FixedCellFont.Name = 'MS Sans Serif'
            FixedCellFont.Style = []
            DefaultCellWidth = 100
            DefaultCellHeight = 18
            AutoCellWidthEnabled = True
            CellLineDragMethod = rrdmSingleLine
            Painter.FixedCellBorderColor = clBlack
            Painter.FixedCellBorderWidth = 1
            Painter.FixedCellColor = clBtnFace
            Painter.FixedCellInnerFrameColor = clWhite
            Painter.FixedCellInnerFrameRectLeftOffset = 0
            Painter.FixedCellInnerFrameRectTopOffset = 0
            Painter.FixedCellInnerFrameRectRightOffset = 1
            Painter.FixedCellInnerFrameRectBottomOffset = 1
            Painter.FixedSeparatorColor = clGray
            Painter.FixedSeparatorSubColor = clWhite
            Painter.FixedSeparatorOffset1 = 1
            Painter.SplitLineColor = clBlack
            Painter.SplitLinePenStyle = psDot
            Painter.SortTriangleLine1Color = clWhite
            Painter.SortTriangleLine2Color = clWhite
            Painter.SortTriangleLine3Color = clBlack
            Painter.SortTriangleBorderAreaColor = clGray
            Painter.SortTriangleBorderEdgeAreaColor = clWhite
            Painter.SortActiveTriangleColor = clRed
            Painter.FilterCaptionFontColor = clBlack
            Painter.FilterActiveFrameColor = clYellow
            Painter.PreActiveFramesColor = clCream
            Painter.TechZoneWidth = 20
            Painter.TechZoneColor1 = 14211288
            Painter.TechZoneColor2 = 14211288
            Painter.TechZoneLineColor = clBlack
            Painter.TechZoneCursorRowColor = clBlack
            Painter.TechZoneCursorRowLineMainColor = clWhite
            Painter.TechZoneCursorRowLineColor = clBlack
            Painter.TechZoneCursorRecColor = clSilver
            Painter.TechZoneSymbolVisible = True
            Painter.TechZoneSymbolFontColor = clBlack
            Painter.TechZoneLineWidth = 1
            Painter.CellHorzLineColor = clSilver
            Painter.CellVertLineColor = clSilver
            Painter.CellHorzLineWidth = 1
            Painter.CellVertLineWidth = 1
            Painter.SelFrameMainColor = clNavy
            Painter.SelFrameMainFontColor = clWhite
            Painter.SelFrameMainWidth = 1
            Painter.SelFrameMainPenStyle = psDot
            Painter.SelFrameColColor = clBlack
            Painter.SelFrameColWidth = 1
            Painter.SelFrameColPenStyle = psSolid
            Painter.BoolCellRectColor = clBlack
            Painter.BoolCellRectSymbColor = clBlack
            Painter.BoolCellRectSymbol = #0
            Painter.VertCtrlsModeUseSelRowFrame = False
            Painter.VertCtrlsModeSelRowFrameColor = clGray
            Painter.VertCtrlsModeSelRowFrameFont.Charset = DEFAULT_CHARSET
            Painter.VertCtrlsModeSelRowFrameFont.Color = clBlue
            Painter.VertCtrlsModeSelRowFrameFont.Height = -11
            Painter.VertCtrlsModeSelRowFrameFont.Name = 'MS Sans Serif'
            Painter.VertCtrlsModeSelRowFrameFont.Style = []
            Painter.ChessPaintModeColor = 16250357
            Painter.ChessPaintModeCellMainColor = clWhite
            Options.AllowVertLineSplit = True
            Options.AllowHorzLineSplit = True
            Options.TechZoneVisible = False
            Options.TechZoneAlwaysVisible = False
            Options.TechZoneCursorRowVisible = False
            Options.TechZoneCursorRowView = tcvTriangle
            Options.TechZoneCursorRecVisible = True
            Options.TechZoneCursorRecView = tcvTriangle
            Options.EmptyPromtVisible = False
            Options.EmptyPromtFont.Charset = DEFAULT_CHARSET
            Options.EmptyPromtFont.Color = clWindowText
            Options.EmptyPromtFont.Height = -11
            Options.EmptyPromtFont.Name = 'MS Sans Serif'
            Options.EmptyPromtFont.Style = []
            Options.EmptyPromtCaption = 'No items ...'
            Options.CellHorzLineVisible = True
            Options.CellVertLineVisible = True
            Options.SelFrameMainVisible = False
            Options.SelFrameMainType = msftSolid
            Options.SelFrameColVisible = True
            Options.SelFrameColType = csftFocusedFrame
            Options.EmmediatelyEditing = True
            Options.WantEditorOnSelReClick = False
            Options.WantEditor = False
            Options.WantCuttingText = True
            Options.WantShowEditorWhenIReadOnly = False
            Options.WantDirectBoolChange = True
            Options.CuttingText = '....'
            Options.ScrollBars = ssBoth
            Options.UseDesignerSettingsOpenning = False
            Options.MultiSelecting = False
            Options.ChessPaintMode = True
            Options.ChessPaintModeIncludeImageCell = True
            TestDraw = False
            MinCellHeight = 16
            MinCellWidth = 5
            SplitOption.VertCtrlsModeEnabled = False
            SplitOption.VertCtrlsModeWantEnter = True
            SplitOption.DBModeEnabled = False
            SplitOption.DBCreateCellsMode = ccmRowBlocks
            SplitOption.DBSelectingMoveCursor = True
            SplitOption.DBRowBlockIndex = 0
            Active = True
            ServiceButtonFlat = False
            ServiceButtonText = 'F1'
            ReadOnly = False
            DesignModeEnabled = False
            HideSelection = False
            SelectComboAutoDropDown = False
            OnAfterCellEdit = tblATIGeosAfterCellEdit
            OnChangeSelectedCell = tblATIGeosChangeSelectedCell
          end
          object SpTBXButton16: TSpTBXButton
            Left = 216
            Top = 8
            Width = 89
            Height = 27
            Caption = #1091#1076#1072#1083
            TabOrder = 1
            OnClick = SpTBXButton16Click
          end
          object SpTBXButton17: TSpTBXButton
            Left = 121
            Top = 8
            Width = 89
            Height = 27
            Caption = #1076#1086#1073#1072#1074
            TabOrder = 2
            OnClick = SpTBXButton17Click
          end
          object SpTBXButton18: TSpTBXButton
            Left = 1
            Top = 8
            Width = 89
            Height = 27
            Caption = '<<<<<'
            TabOrder = 3
            OnClick = SpTBXButton18Click
          end
          object SpTBXEdit3: TSpTBXEdit
            Left = 3
            Top = 40
            Width = 230
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object SpTBXButton19: TSpTBXButton
            Left = 239
            Top = 40
            Width = 65
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 5
            OnClick = SpTBXButton19Click
          end
          object SpTBXLabel7: TSpTBXLabel
            Left = 11
            Top = 336
            Width = 19
            Height = 13
            Caption = #1042#1077#1089
          end
          object SpTBXEdit4: TSpTBXEdit
            Left = 37
            Top = 328
            Width = 68
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object SpTBXButton20: TSpTBXButton
            Left = 112
            Top = 328
            Width = 40
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 8
            OnClick = SpTBXButton20Click
          end
          object SpTBXLabel8: TSpTBXLabel
            Left = 163
            Top = 336
            Width = 14
            Height = 13
            Caption = #1054#1073
          end
          object SpTBXEdit5: TSpTBXEdit
            Left = 189
            Top = 328
            Width = 68
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object SpTBXButton21: TSpTBXButton
            Left = 264
            Top = 328
            Width = 40
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 11
            OnClick = SpTBXButton21Click
          end
          object SpTBXLabel9: TSpTBXLabel
            Left = 11
            Top = 376
            Width = 40
            Height = 13
            Caption = #1044#1072#1090#1072' '#1086#1090
          end
          object SpTBXEdit6: TSpTBXEdit
            Left = 61
            Top = 368
            Width = 124
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object SpTBXButton22: TSpTBXButton
            Left = 192
            Top = 368
            Width = 40
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 14
            OnClick = SpTBXButton22Click
          end
          object SpTBXButton23: TSpTBXButton
            Left = 236
            Top = 368
            Width = 40
            Height = 27
            Caption = #1091#1089#1090
            TabOrder = 15
            OnClick = SpTBXButton23Click
          end
          object SpTBXLabel10: TSpTBXLabel
            Left = 11
            Top = 408
            Width = 41
            Height = 13
            Caption = #1044#1072#1090#1072' '#1076#1086
          end
          object SpTBXEdit7: TSpTBXEdit
            Left = 61
            Top = 400
            Width = 124
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object SpTBXButton24: TSpTBXButton
            Left = 192
            Top = 400
            Width = 40
            Height = 27
            Caption = #1086#1095#1080#1089#1090
            TabOrder = 18
            OnClick = SpTBXButton24Click
          end
          object SpTBXButton25: TSpTBXButton
            Left = 236
            Top = 400
            Width = 40
            Height = 27
            Caption = #1091#1089#1090
            TabOrder = 19
            OnClick = SpTBXButton25Click
          end
        end
        object SpTBXPanel7: TSpTBXPanel
          Left = 2
          Top = 424
          Width = 720
          Height = 41
          Caption = 'SpTBXPanel7'
          Align = alBottom
          TabOrder = 3
          Borders = False
          object SpTBXButton26: TSpTBXButton
            Left = 2
            Top = 2
            Width = 716
            Height = 37
            Caption = #1057' '#1058' '#1040' '#1056' '#1058
            Align = alClient
            TabOrder = 0
            OnClick = SpTBXButton26Click
          end
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
