unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpTBXSkins, GRUtils, GRString, rrfile_mod_api, SpTBXItem, transpo_classes,
  StdCtrls, ExtCtrls, uSelectWizard1, uBrowser, SpTBXControls, SpTBXTabs,
  SpTBXDkPanels, TB2Item, rrAdvTable, SpTBXEditors, uCalendarWizard,
  GRFormPanel, uInfoTimerForm, logistic_one, uSplashForm, IdSMTP, IdMessage, TntStdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdPOP3,
  cefgui, cefvcl, ceflib, Clipbrd, GR32_Image, GR32, AppEvnts, IdMessageParts, IdText;

type

  TMainForm = class(TForm)
    spMainForm: TSpTBXTitleBar;
    SpTBXPanel1: TSpTBXPanel;
    SpTBXButton1: TSpTBXButton;
    SpTBXButton2: TSpTBXButton;
    SpTBXButton3: TSpTBXButton;
    Timer1: TTimer;
    SpTBXPanel2: TSpTBXPanel;
    SpTBXPanel3: TSpTBXPanel;
    SpTBXLabel1: TSpTBXLabel;
    SpTBXLabel2: TSpTBXLabel;
    SpTBXLabel3: TSpTBXLabel;
    SpTBXLabel4: TSpTBXLabel;
    tcLeft: TSpTBXTabControl;
    SpTBXTabSheet2: TSpTBXTabSheet;
    tcClient: TSpTBXTabControl;
    SpTBXTabItem3: TSpTBXTabItem;
    SpTBXTabSheet3: TSpTBXTabSheet;
    SpTBXPanel7: TSpTBXPanel;
    SpTBXButton26: TSpTBXButton;
    SpTBXTabItem1: TSpTBXTabItem;
    SpTBXTabSheet1: TSpTBXTabSheet;
    SpTBXButton27: TSpTBXButton;
    SpTBXButton28: TSpTBXButton;
    SpTBXPanel8: TSpTBXPanel;
    SpTBXLabel11: TSpTBXLabel;
    SpTBXLabel12: TSpTBXLabel;
    SpTBXLabel13: TSpTBXLabel;
    SpTBXLabel14: TSpTBXLabel;
    SpTBXTabItem4: TSpTBXTabItem;
    SpTBXTabSheet4: TSpTBXTabSheet;
    SpTBXButton7: TSpTBXButton;
    SpTBXTabControl1: TSpTBXTabControl;
    SpTBXTabItem2: TSpTBXTabItem;
    SpTBXTabSheet5: TSpTBXTabSheet;
    SpTBXTabItem5: TSpTBXTabItem;
    SpTBXTabSheet6: TSpTBXTabSheet;
    tblFinded: TRRAdvTable;
    SpTBXPanel9: TSpTBXPanel;
    SpTBXButton31: TSpTBXButton;
    SpTBXButton32: TSpTBXButton;
    SpTBXLabel15: TSpTBXLabel;
    SpTBXTabItem7: TSpTBXTabItem;
    SpTBXTabSheet8: TSpTBXTabSheet;
    tblFindedTickets: TRRAdvTable;
    SpTBXPanel11: TSpTBXPanel;
    SpTBXButton33: TSpTBXButton;
    SpTBXLabel16: TSpTBXLabel;
    SpTBXLabel17: TSpTBXLabel;
    SpTBXLabel18: TSpTBXLabel;
    SpTBXLabel19: TSpTBXLabel;
    SpTBXLabel20: TSpTBXLabel;
    SpTBXLabel21: TSpTBXLabel;
    SpTBXPanel12: TSpTBXPanel;
    SpTBXLabel22: TSpTBXLabel;
    SpTBXPanel13: TSpTBXPanel;
    SpTBXButton34: TSpTBXButton;
    SpTBXButton35: TSpTBXButton;
    SpTBXLabel23: TSpTBXLabel;
    tblFavor: TRRAdvTable;
    SpTBXButton36: TSpTBXButton;
    SpTBXLabel24: TSpTBXLabel;
    SpTBXLabel25: TSpTBXLabel;
    SpTBXLabel26: TSpTBXLabel;
    SpTBXTabItem8: TSpTBXTabItem;
    SpTBXTabSheet9: TSpTBXTabSheet;
    SpTBXPanel14: TSpTBXPanel;
    SpTBXButton37: TSpTBXButton;
    SpTBXLabel27: TSpTBXLabel;
    SpTBXLabel28: TSpTBXLabel;
    SpTBXLabel29: TSpTBXLabel;
    SpTBXLabel30: TSpTBXLabel;
    SpTBXLabel31: TSpTBXLabel;
    SpTBXLabel32: TSpTBXLabel;
    SpTBXPanel15: TSpTBXPanel;
    SpTBXLabel33: TSpTBXLabel;
    SpTBXLabel34: TSpTBXLabel;
    tblFavorTickets: TRRAdvTable;
    SpTBXButton38: TSpTBXButton;
    SpTBXButton39: TSpTBXButton;
    SpTBXTabItem6: TSpTBXTabItem;
    SpTBXTabSheet7: TSpTBXTabSheet;
    SpTBXPanel16: TSpTBXPanel;
    SpTBXButton30: TSpTBXButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Shape1: TShape;
    SpTBXLabel38: TSpTBXLabel;
    Shape2: TShape;
    Memo4: TMemo;
    SpTBXLabel40: TSpTBXLabel;
    Memo5: TMemo;
    Memo7: TMemo;
    tblTicketStatuses: TRRAdvTable;
    SpTBXLabel41: TSpTBXLabel;
    SpTBXPanel17: TSpTBXPanel;
    SpTBXLabel35: TSpTBXLabel;
    Shape3: TShape;
    SpTBXLabel42: TSpTBXLabel;
    SpTBXLabel43: TSpTBXLabel;
    SpTBXLabel44: TSpTBXLabel;
    SpTBXLabel45: TSpTBXLabel;
    SpTBXLabel46: TSpTBXLabel;
    Memo9: TMemo;
    SpTBXTabControl2: TSpTBXTabControl;
    SpTBXTabItem9: TSpTBXTabItem;
    SpTBXTabSheet10: TSpTBXTabSheet;
    Memo8: TMemo;
    SpTBXTabItem10: TSpTBXTabItem;
    SpTBXTabSheet11: TSpTBXTabSheet;
    SpTBXLabel47: TSpTBXLabel;
    SpTBXLabel48: TSpTBXLabel;
    SpTBXButton40: TSpTBXButton;
    SpTBXCheckBox1: TSpTBXCheckBox;
    SpTBXTabItem11: TSpTBXTabItem;
    SpTBXTabSheet12: TSpTBXTabSheet;
    SpTBXPanel10: TSpTBXPanel;
    SpTBXButton29: TSpTBXButton;
    SpTBXLabel49: TSpTBXLabel;
    SpTBXButton41: TSpTBXButton;
    tblPeriods: TRRAdvTable;
    SpTBXButton12: TSpTBXButton;
    SpTBXTabItem13: TSpTBXTabItem;
    SpTBXTabSheet14: TSpTBXTabSheet;
    SpTBXLabel50: TSpTBXLabel;
    SpTBXEdit8: TSpTBXEdit;
    SpTBXButton46: TSpTBXButton;
    SpTBXLabel51: TSpTBXLabel;
    SpTBXEdit9: TSpTBXEdit;
    SpTBXButton48: TSpTBXButton;
    SpTBXButton45: TSpTBXButton;
    SpTBXButton47: TSpTBXButton;
    SpTBXButton42: TSpTBXButton;
    SpTBXTabItem12: TSpTBXTabItem;
    SpTBXTabSheet13: TSpTBXTabSheet;
    SpTBXPanel18: TSpTBXPanel;
    SpTBXPanel19: TSpTBXPanel;
    SpTBXLabel58: TSpTBXLabel;
    SpTBXLabel59: TSpTBXLabel;
    tblDebits: TRRAdvTable;
    SpTBXButton43: TSpTBXButton;
    SpTBXTabItem14: TSpTBXTabItem;
    SpTBXTabSheet15: TSpTBXTabSheet;
    SpTBXLabel52: TSpTBXLabel;
    SpTBXEdit10: TSpTBXEdit;
    SpTBXButton44: TSpTBXButton;
    SpTBXPanel20: TSpTBXPanel;
    SpTBXButton49: TSpTBXButton;
    SpTBXPanel21: TSpTBXPanel;
    SpTBXCheckBox2: TSpTBXCheckBox;
    SpTBXLabel53: TSpTBXLabel;
    SpTBXEdit11: TSpTBXEdit;
    tblDebitTypes: TRRAdvTable;
    SpTBXLabel54: TSpTBXLabel;
    SpTBXEdit12: TSpTBXEdit;
    SpTBXLabel55: TSpTBXLabel;
    SpTBXEdit13: TSpTBXEdit;
    SpTBXLabel56: TSpTBXLabel;
    SpTBXEdit14: TSpTBXEdit;
    SpTBXButton50: TSpTBXButton;
    SpTBXLabel57: TSpTBXLabel;
    SpTBXLabel60: TSpTBXLabel;
    SpTBXEdit15: TSpTBXEdit;
    tblSettlTypes: TRRAdvTable;
    SpTBXLabel61: TSpTBXLabel;
    SpTBXLabel62: TSpTBXLabel;
    SpTBXEdit16: TSpTBXEdit;
    SpTBXLabel63: TSpTBXLabel;
    SpTBXEdit17: TSpTBXEdit;
    tblCardTypes: TRRAdvTable;
    SpTBXLabel64: TSpTBXLabel;
    SpTBXLabel65: TSpTBXLabel;
    Memo10: TMemo;
    SpTBXLabel66: TSpTBXLabel;
    SpTBXButton51: TSpTBXButton;
    SpTBXButton52: TSpTBXButton;
    SpTBXButton53: TSpTBXButton;
    SpTBXTabItem15: TSpTBXTabItem;
    SpTBXTabSheet16: TSpTBXTabSheet;
    SpTBXPanel22: TSpTBXPanel;
    SpTBXPanel23: TSpTBXPanel;
    SpTBXLabel67: TSpTBXLabel;
    SpTBXLabel68: TSpTBXLabel;
    SpTBXButton54: TSpTBXButton;
    SpTBXButton55: TSpTBXButton;
    SpTBXButton56: TSpTBXButton;
    tblCredits: TRRAdvTable;
    SpTBXTabItem16: TSpTBXTabItem;
    SpTBXTabSheet17: TSpTBXTabSheet;
    SpTBXPanel24: TSpTBXPanel;
    SpTBXButton57: TSpTBXButton;
    SpTBXPanel25: TSpTBXPanel;
    SpTBXLabel69: TSpTBXLabel;
    SpTBXEdit18: TSpTBXEdit;
    SpTBXButton58: TSpTBXButton;
    SpTBXCheckBox3: TSpTBXCheckBox;
    SpTBXLabel70: TSpTBXLabel;
    SpTBXEdit19: TSpTBXEdit;
    tblCreditTypes: TRRAdvTable;
    SpTBXLabel71: TSpTBXLabel;
    SpTBXEdit20: TSpTBXEdit;
    SpTBXLabel72: TSpTBXLabel;
    SpTBXLabel73: TSpTBXLabel;
    SpTBXEdit21: TSpTBXEdit;
    Memo11: TMemo;
    SpTBXLabel74: TSpTBXLabel;
    SpTBXTabItem17: TSpTBXTabItem;
    SpTBXTabSheet18: TSpTBXTabSheet;
    SpTBXPanel26: TSpTBXPanel;
    SpTBXPanel27: TSpTBXPanel;
    SpTBXLabel76: TSpTBXLabel;
    SpTBXButton59: TSpTBXButton;
    tblDCBalance: TRRAdvTable;
    SpTBXButton60: TSpTBXButton;
    SpTBXTabItem18: TSpTBXTabItem;
    SpTBXTabSheet19: TSpTBXTabSheet;
    SpTBXPanel28: TSpTBXPanel;
    SpTBXButton61: TSpTBXButton;
    SpTBXLabel75: TSpTBXLabel;
    SpTBXButton62: TSpTBXButton;
    tblNotes: TRRAdvTable;
    SpTBXTabItem19: TSpTBXTabItem;
    SpTBXTabSheet20: TSpTBXTabSheet;
    SpTBXPanel29: TSpTBXPanel;
    SpTBXPanel30: TSpTBXPanel;
    SpTBXLabel77: TSpTBXLabel;
    SpTBXLabel78: TSpTBXLabel;
    SpTBXButton64: TSpTBXButton;
    SpTBXButton65: TSpTBXButton;
    tblNoteItems: TRRAdvTable;
    Memo12: TMemo;
    SpTBXButton63: TSpTBXButton;
    SpTBXButton66: TSpTBXButton;
    SpTBXTabItem20: TSpTBXTabItem;
    SpTBXTabSheet21: TSpTBXTabSheet;
    SpTBXButton73: TSpTBXButton;
    SpTBXButton74: TSpTBXButton;
    SpTBXComboBox1: TSpTBXComboBox;
    SpTBXLabel39: TSpTBXLabel;
    SpTBXButton75: TSpTBXButton;
    SpTBXButton76: TSpTBXButton;
    SpTBXLabel79: TSpTBXLabel;
    SpTBXEdit22: TSpTBXEdit;
    SpTBXLabel80: TSpTBXLabel;
    SpTBXEdit23: TSpTBXEdit;
    SpTBXLabel81: TSpTBXLabel;
    SpTBXEdit24: TSpTBXEdit;
    SpTBXLabel82: TSpTBXLabel;
    SpTBXEdit25: TSpTBXEdit;
    SpTBXLabel83: TSpTBXLabel;
    SpTBXEdit26: TSpTBXEdit;
    SpTBXLabel84: TSpTBXLabel;
    SpTBXLabel85: TSpTBXLabel;
    SpTBXCheckBox4: TSpTBXCheckBox;
    SpTBXLabel86: TSpTBXLabel;
    SpTBXEdit27: TSpTBXEdit;
    SpTBXLabel87: TSpTBXLabel;
    SpTBXEdit28: TSpTBXEdit;
    SpTBXLabel88: TSpTBXLabel;
    SpTBXEdit29: TSpTBXEdit;
    SpTBXButton77: TSpTBXButton;
    SpTBXLabel89: TSpTBXLabel;
    SpTBXEdit30: TSpTBXEdit;
    SpTBXButton78: TSpTBXButton;
    Memo13: TMemo;
    SpTBXCheckBox5: TSpTBXCheckBox;
    SpTBXButton79: TSpTBXButton;
    SpTBXTabControl3: TSpTBXTabControl;
    SpTBXTabItem21: TSpTBXTabItem;
    SpTBXTabSheet22: TSpTBXTabSheet;
    SpTBXTabItem22: TSpTBXTabItem;
    SpTBXTabSheet23: TSpTBXTabSheet;
    Memo6: TMemo;
    Memo14: TMemo;
    SpTBXTabControl4: TSpTBXTabControl;
    SpTBXTabItem24: TSpTBXTabItem;
    SpTBXTabItem23: TSpTBXTabItem;
    SpTBXTabSheet24: TSpTBXTabSheet;
    SpTBXTabSheet25: TSpTBXTabSheet;
    SpTBXPanel6: TSpTBXPanel;
    SpTBXButton16: TSpTBXButton;
    SpTBXButton17: TSpTBXButton;
    SpTBXButton18: TSpTBXButton;
    SpTBXEdit3: TSpTBXEdit;
    SpTBXButton19: TSpTBXButton;
    SpTBXLabel7: TSpTBXLabel;
    SpTBXEdit4: TSpTBXEdit;
    SpTBXLabel8: TSpTBXLabel;
    SpTBXEdit5: TSpTBXEdit;
    SpTBXLabel9: TSpTBXLabel;
    SpTBXEdit6: TSpTBXEdit;
    SpTBXButton23: TSpTBXButton;
    SpTBXLabel10: TSpTBXLabel;
    SpTBXEdit7: TSpTBXEdit;
    SpTBXButton25: TSpTBXButton;
    tblATIGeos: TRRAdvTable;
    SpTBXLabel36: TSpTBXLabel;
    SpTBXEdit31: TSpTBXEdit;
    SpTBXButton80: TSpTBXButton;
    SpTBXPanel4: TSpTBXPanel;
    SpTBXButton4: TSpTBXButton;
    SpTBXButton5: TSpTBXButton;
    SpTBXPanel5: TSpTBXPanel;
    tblATIFromGeo: TRRAdvTable;
    SpTBXButton6: TSpTBXButton;
    SpTBXButton8: TSpTBXButton;
    SpTBXLabel5: TSpTBXLabel;
    SpTBXEdit1: TSpTBXEdit;
    SpTBXButton9: TSpTBXButton;
    SpTBXButton10: TSpTBXButton;
    tblATIToGeo: TRRAdvTable;
    SpTBXButton11: TSpTBXButton;
    SpTBXButton13: TSpTBXButton;
    SpTBXLabel6: TSpTBXLabel;
    SpTBXEdit2: TSpTBXEdit;
    SpTBXButton14: TSpTBXButton;
    SpTBXButton15: TSpTBXButton;
    SpTBXButton20: TSpTBXButton;
    SpTBXButton21: TSpTBXButton;
    SpTBXButton22: TSpTBXButton;
    SpTBXButton24: TSpTBXButton;
    SpTBXButton67: TSpTBXButton;
    SpTBXButton68: TSpTBXButton;
    SpTBXButton69: TSpTBXButton;
    SpTBXButton70: TSpTBXButton;
    SpTBXButton71: TSpTBXButton;
    SpTBXButton72: TSpTBXButton;
    SpTBXGroupBox1: TSpTBXGroupBox;
    SpTBXButton81: TSpTBXButton;
    SpTBXButton82: TSpTBXButton;
    SpTBXLabel90: TSpTBXLabel;
    SpTBXEdit32: TSpTBXEdit;
    tmBPService: TTimer;
    SpTBXLabel91: TSpTBXLabel;
    SpTBXComboBox2: TSpTBXComboBox;
    Memo15: TMemo;
    procedure SpTBXButton1Click(Sender: TObject);
    procedure SpTBXButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpTBXButton2Click(Sender: TObject);
    procedure SpTBXButton4Click(Sender: TObject);
    procedure SpTBXButton5Click(Sender: TObject);
    procedure SpTBXButton27Click(Sender: TObject);
    procedure SpTBXButton17Click(Sender: TObject);
    procedure SpTBXButton16Click(Sender: TObject);
    procedure SpTBXButton19Click(Sender: TObject);
    procedure tblATIGeosAfterCellEdit(aCell: TRRCell);
    procedure tblATIGeosChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton18Click(Sender: TObject);
    procedure SpTBXButton26Click(Sender: TObject);
    procedure SpTBXButton9Click(Sender: TObject);
    procedure SpTBXButton14Click(Sender: TObject);
    procedure SpTBXButton20Click(Sender: TObject);
    procedure SpTBXButton21Click(Sender: TObject);
    procedure SpTBXButton22Click(Sender: TObject);
    procedure SpTBXButton24Click(Sender: TObject);
    procedure SpTBXButton6Click(Sender: TObject);
    procedure SpTBXButton11Click(Sender: TObject);
    procedure SpTBXButton8Click(Sender: TObject);
    procedure SpTBXButton13Click(Sender: TObject);
    procedure SpTBXButton10Click(Sender: TObject);
    procedure SpTBXButton15Click(Sender: TObject);
    procedure SpTBXButton23Click(Sender: TObject);
    procedure SpTBXButton25Click(Sender: TObject);
    procedure SpTBXButton7Click(Sender: TObject);
    procedure tblATIFromGeoAfterCellEdit(aCell: TRRCell);
    procedure tblATIToGeoAfterCellEdit(aCell: TRRCell);
    procedure SpTBXButton12Click(Sender: TObject);
    procedure SpTBXButton29Click(Sender: TObject);
    procedure SpTBXButton31Click(Sender: TObject);
    procedure SpTBXButton32Click(Sender: TObject);
    procedure tblFindedChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton33Click(Sender: TObject);
    procedure SpTBXButton30Click(Sender: TObject);
    procedure tblFindedTicketsAfterCellEdit(aCell: TRRCell);
    procedure SpTBXButton34Click(Sender: TObject);
    procedure SpTBXButton35Click(Sender: TObject);
    procedure SpTBXButton36Click(Sender: TObject);
    procedure tblFavorDblClickCell(Sender: TObject);
    procedure tblFavorChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton38Click(Sender: TObject);
    procedure SpTBXLabel23Click(Sender: TObject);
    procedure SpTBXLabel15Click(Sender: TObject);
    procedure tblFavorTicketsAfterCellEdit(aCell: TRRCell);
    procedure SpTBXButton37Click(Sender: TObject);
    procedure SpTBXButton39Click(Sender: TObject);
    procedure tblFindedTicketsDblClickCell(Sender: TObject);
    procedure tblFindedTicketsChangeSelectedCell(Sender: TObject);
    procedure tblFavorTicketsDblClickCell(Sender: TObject);
    procedure tblTicketStatusesDblClickCell(Sender: TObject);
    procedure Memo8Change(Sender: TObject);
    procedure SpTBXLabel49Click(Sender: TObject);
    procedure SpTBXButton41Click(Sender: TObject);
    procedure tblPeriodsChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton46Click(Sender: TObject);
    procedure SpTBXButton48Click(Sender: TObject);
    procedure SpTBXEdit8Change(Sender: TObject);
    procedure SpTBXEdit9Change(Sender: TObject);
    procedure tblPeriodsDblClickCell(Sender: TObject);
    procedure SpTBXButton40Click(Sender: TObject);
    procedure tblATIGeosDblClickCell(Sender: TObject);
    procedure SpTBXButton45Click(Sender: TObject);
    procedure SpTBXButton43Click(Sender: TObject);
    procedure SpTBXButton44Click(Sender: TObject);
    procedure SpTBXButton50Click(Sender: TObject);
    procedure SpTBXButton49Click(Sender: TObject);
    procedure tblDebitsDblClickCell(Sender: TObject);
    procedure tblDebitTypesDblClickCell(Sender: TObject);
    procedure tblCardTypesDblClickCell(Sender: TObject);
    procedure tblSettlTypesDblClickCell(Sender: TObject);
    procedure SpTBXCheckBox2Click(Sender: TObject);
    procedure SpTBXEdit10Change(Sender: TObject);
    procedure SpTBXEdit13Change(Sender: TObject);
    procedure SpTBXEdit12Change(Sender: TObject);
    procedure SpTBXEdit14Change(Sender: TObject);
    procedure SpTBXEdit16Change(Sender: TObject);
    procedure Memo10Change(Sender: TObject);
    procedure SpTBXButton51Click(Sender: TObject);
    procedure SpTBXButton52Click(Sender: TObject);
    procedure SpTBXButton53Click(Sender: TObject);
    procedure SpTBXButton54Click(Sender: TObject);
    procedure SpTBXButton47Click(Sender: TObject);
    procedure SpTBXButton56Click(Sender: TObject);
    procedure SpTBXButton55Click(Sender: TObject);
    procedure tblCreditsDblClickCell(Sender: TObject);
    procedure SpTBXButton57Click(Sender: TObject);
    procedure tblCreditTypesDblClickCell(Sender: TObject);
    procedure SpTBXCheckBox3Click(Sender: TObject);
    procedure SpTBXButton58Click(Sender: TObject);
    procedure SpTBXEdit18Change(Sender: TObject);
    procedure SpTBXEdit20Change(Sender: TObject);
    procedure SpTBXEdit21Change(Sender: TObject);
    procedure Memo11Change(Sender: TObject);
    procedure SpTBXButton42Click(Sender: TObject);
    procedure tblDCBalanceDblClickCell(Sender: TObject);
    procedure SpTBXButton59Click(Sender: TObject);
    procedure SpTBXButton60Click(Sender: TObject);
    procedure SpTBXButton62Click(Sender: TObject);
    procedure tblNotesAfterCellEdit(aCell: TRRCell);
    procedure tblNotesChangeSelectedCell(Sender: TObject);
    procedure SpTBXButton61Click(Sender: TObject);
    procedure SpTBXLabel75Click(Sender: TObject);
    procedure SpTBXButton65Click(Sender: TObject);
    procedure tblNoteItemsAfterCellEdit(aCell: TRRCell);
    procedure SpTBXButton64Click(Sender: TObject);
    procedure Memo12Change(Sender: TObject);
    procedure SpTBXTabControl1ActiveTabChange(Sender: TObject;
      TabIndex: Integer);
    procedure SpTBXButton63Click(Sender: TObject);
    procedure SpTBXButton67Click(Sender: TObject);
    procedure SpTBXButton68Click(Sender: TObject);
    procedure SpTBXButton69Click(Sender: TObject);
    procedure SpTBXButton70Click(Sender: TObject);
    procedure SpTBXButton71Click(Sender: TObject);
    procedure SpTBXButton72Click(Sender: TObject);
    procedure SpTBXButton73Click(Sender: TObject);
    procedure SpTBXButton28Click(Sender: TObject);
    procedure SpTBXButton74Click(Sender: TObject);
    procedure SpTBXButton75Click(Sender: TObject);
    procedure SpTBXButton76Click(Sender: TObject);
    procedure SpTBXButton77Click(Sender: TObject);
    procedure SpTBXButton78Click(Sender: TObject);
    procedure Memo13Change(Sender: TObject);
    procedure SpTBXButton79Click(Sender: TObject);
    procedure SpTBXButton80Click(Sender: TObject);
    procedure SpTBXButton81Click(Sender: TObject);
    procedure SpTBXButton82Click(Sender: TObject);
    procedure tmBPServiceTimer(Sender: TObject);
  private
    Fact_cls_block_favor: TFMClass;
    procedure Setact_cls_block_favor(const Value: TFMClass);
    { Private declarations }
  public
    SplashForm:TSplashForm;

    IdSMTP1:TIdSMTP;
    IdPOP1:TIdPOP3;

    curr_sel_cell_value:String;
    old_ticket_info_oper_id:Integer;
    old_debit_info_oper_id:Integer;
    old_credit_info_oper_id:Integer;
    _FromGeoIndex:Integer;
    _ToGeoIndex:Integer;

    bp_service_enabled:Boolean;
    last_capcha:TDateTime;

    cls_active_ticket:TFMClass;
    cls_active_period:TFMClass;
    cls_active_debit:TFMClass;
    cls_active_credit:TFMClass;

    cls_bp_service_file:TFMClass;
    bp_service_last_update:String;

    LockAllEventChangeSelCell:Boolean;

    property act_cls_block_favor:TFMClass read Fact_cls_block_favor write Setact_cls_block_favor;

    procedure Run;

    procedure DoATIAutorizCode(var Code:String);
    procedure DoATICaptcha(oper_code:Integer);
    procedure DoEndGetTickets(Sender: TObject);
    procedure DoEndGetContacts(Sender: TObject);
    procedure DoOperProgress(Stage1,Stage2:String);
    procedure DoOperSub1Progress(Stage1,Stage2:String);

    procedure DoEndOperProgress(Stage1,Stage2:String);

    procedure TblUpdateGeos(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateBlocks(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateTickets(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateTicketStatuses(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdatePeriods(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateDebits(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateCredits(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateStdItemsTable(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateNotes(aTable:TRRAdvTable; aClass:TFMClass);
    procedure TblUpdateNoteItems(aTable:TRRAdvTable; aClass:TFMClass);

    procedure TblUpdateDebCredBalance(aTable:TRRAdvTable; aClass:TFMClass);

    procedure TblCheckUnCheck(aTable:TRRAdvTable; Value:Boolean);
    procedure TblCheckWVolume(aTable:TRRAdvTable);

    procedure TblUpdateTicketInfo(aClass:TFMClass);
    procedure TblUpdatePeriodInfo(aClass:TFMClass);
    procedure TblUpdateDebitInfo(aClass:TFMClass);
    procedure TblUpdateCreditInfo(aClass:TFMClass);

    procedure ATIGetTickets(FromGeoIndex, ToGeoIndex:Integer);
    procedure UpdateATI_f_Params;
    procedure UpdateLogisticOne_f_Params;

    function  IsCashed(aClass:TFMClass):Boolean;
    function  GetForecast(aClass:TFMClass):Integer;

    function  GetTicketByID(ID:String;aClass:TFMClass):TFMClass;
    function  GetStatusFontColor(statID:Integer):TColor;
    function  GetDebitByID(ID:String;aClass:TFMClass):TFMClass;

    procedure SetActivePeriod;

    function  GetFMClassFromTable(aTable:TRRAdvTable):TFMClass;

    function  GetTicketMailText(aTicket:TFMClass;ShortView:Boolean):String;
    procedure SendMail(aSubject,aText:String);
    procedure GetMail();

    procedure ToggleOperation(op_code:Integer);

    procedure DoMessageInitializeISO(var VHeaderEncoding: Char; var VCharSet: string);

    procedure DoEndBPServiceUpdate(Sender: TObject);
    procedure StartBPService;
    procedure StopBPService;

    constructor Create(AOwner: TComponent);override;
    procedure   Init;
    destructor  Destroy;override;
  end;

var
  MainForm: TMainForm;

implementation
// _iveco
// hjtu23iovb89

//grstranspo
// hj45623cvvb89

//gr-s
//yVjubrPg

uses Math, DateUtils, {$IFDEF _IE}ati{$ELSE}ati2{$ENDIF};

{$R *.dfm}

{ TForm1 }

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  SplashForm:= TSplashForm.Create(nil);
  SplashForm.Show;
  Application.ProcessMessages;
  IdSMTP1:= TIdSMTP.Create(nil);
  IdPOP1:= TIdPOP3.Create(nil);
  if not DirectoryExists(AppDir + 'tmp_files') then
    ForceDirectories(AppDir + 'tmp_files');
end;

destructor TMainForm.Destroy;
begin
  FreeAndNil(ati_service);
  app_sett.Save;
  cls_params.Save;
  inherited;
end;

procedure TMainForm.DoATIAutorizCode(var Code: String);
begin
  if bp_service_enabled then
  begin
    StopBPService;
    last_capcha:= Now;
    SendMail('capcha','����� ��� ��������!');
    SpTBXButton26.Enabled:= True;
    DoOperSub1Progress('','');
  end;
end;

procedure TMainForm.DoATICaptcha(oper_code: Integer);
begin
  if bp_service_enabled then
  begin
    StopBPService;
    last_capcha:= Now;
    SendMail('capcha','����� �����!' + #$A + #$D + 'http://ati.su' + ati_service._capcha_img);
    SpTBXButton26.Enabled:= True;
    DoOperSub1Progress('','');
  end;
end;

procedure TMainForm.SpTBXButton1Click(Sender: TObject);
begin
  Browser.Show;
  SpTBXButton26.Enabled:= True;
end;

procedure TMainForm.SpTBXButton3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.DoEndGetTickets(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    s:String;
    i,sum,price:Integer;
begin
  if (Length(SpTBXEdit31.Text) > 0) and (TryStrToInt(SpTBXEdit31.Text,sum)) then
  begin
    cls2:= ati_service.GetTickResult.FindClassByName('items');
    i:= 0;
    while i <= cls2.MyClassCount - 1 do
    begin
      cls3:= cls2.MyClass[i];
      if TryStrToInt(cls3.FindPropertyByName('Price1').ValueS,price) then
      begin
        if price < sum then
          cls2.DeleteClassItem(cls3)
        else
          Inc(i);
      end
      else
        cls2.DeleteClassItem(cls3);
    end;
  end;

  if not bp_service_enabled then
  begin
    cls2:= ati_service.GetTickResult.CutClassItem(ati_service.GetTickResult.FindClassByName('items'));
    cls1:= cls_data.FindClassByName('blocks').FindClassByName('finded').CreateClassItem('','');
    cls_templates.CopyClass(cls1,cls_templates.FindClassByName('data_block'),False,True);
    s:= Copy(ati_service.GetTickOption.FromGeo,1,4) + '-' + Copy(ati_service.GetTickOption.ToGeo,1,4);
    cls1.FindPropertyByName('Caption').ValueS:= s;
    cls1.FindPropertyByName('Date').ValueS:= DateToStr(ati_service.GetTickOption.DateBegin);
    cls1.AddClass(cls2);
  end;

  if not bp_service_enabled then
  begin
    cls_data.Save;
    TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
    Application.ProcessMessages;
    ATIGetTickets(-1,-1);
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  Browser.Show;
  Browser.Hide;
end;

procedure TMainForm.Run;
begin
  //Timer1.Enabled:= True;
end;

procedure TMainForm.DoOperProgress(Stage1, Stage2: String);
begin
  if not SpTBXPanel2.Visible then
    SpTBXPanel2.Show;

  if Length(Stage1) > 0 then
    SpTBXLabel2.Caption:= Stage1;

  SpTBXLabel4.Caption:= Stage2;

  Application.ProcessMessages;
end;

procedure TMainForm.ToggleOperation(op_code: Integer);
begin

  LockAllEventChangeSelCell:= True;

  LockWindowUpdate(Handle);

  if op_code = op_none then
  begin
    tcLeft.Hide;
    tcClient.Hide;
  end;

  if op_code = op_ati then
  begin
    tcLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 1;
  end;

  if op_code = op_logistic_one then
  begin
    tcLeft.Hide;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 12;
  end;

  if op_code = op_ati_get_ticks then
  begin
    tcLeft.Show;
    tcLeft.ActiveTabIndex:= 0;
    tcClient.Show;
    tcClient.ActiveTabIndex:= 0;
  end;

  if op_code = op_finded_ticks then
  begin
    tcClient.ActiveTabIndex:= 2;
  end;

  if op_code = op_favor_ticks then
  begin
    tcClient.ActiveTabIndex:= 3;
  end;

  if op_code = op_ticket_info then
  begin
    tcClient.ActiveTabIndex:= 4;
  end;

  if op_code = op_per_info then
  begin
    tcLeft.Show;
    tcLeft.ActiveTabIndex:= 1;
    if Assigned(tblPeriods.SelectedCell) then
    begin
      tcClient.Show;
      tcClient.ActiveTabIndex:= 5;
    end
    else
      tcClient.Hide;
  end;

  if op_code = op_debits then
  begin
    tcClient.Show;
    tcClient.ActiveTabIndex:= 6;
  end;

  if op_code = op_debit_info then
  begin
    tcClient.Show;
    tcClient.ActiveTabIndex:= 7;
  end;

  if op_code = op_credits then
  begin
    tcClient.Show;
    tcClient.ActiveTabIndex:= 8;
  end;

  if op_code = op_credit_info then
  begin
    tcClient.Show;
    tcClient.ActiveTabIndex:= 9;
  end;

  if op_code = op_deb_cred_balance then
  begin
    tcClient.Show;
    tcClient.ActiveTabIndex:= 10;
  end;

  if op_code = op_notes then
  begin
    tcLeft.Show;
    tcLeft.ActiveTabIndex:= 2;
    if Assigned(tblNotes.SelectedCell) then
    begin
      tcClient.Show;
      tcClient.ActiveTabIndex:= 11;
    end
    else
      tcClient.Hide;
  end;

  if op_code = op_note_items then
  begin
    tcClient.Show;
    tcClient.ActiveTabIndex:= 11;
  end;

  LockWindowUpdate(0);

  LockAllEventChangeSelCell:= False;

end;

procedure TMainForm.SpTBXButton2Click(Sender: TObject);
begin
  ToggleOperation(op_ati);
end;

procedure TMainForm.SpTBXButton4Click(Sender: TObject);
begin
  if SpTBXButton5.Checked then SpTBXButton5Click(SpTBXButton5);

  SpTBXButton4.Checked:= not SpTBXButton4.Checked;
  if SpTBXButton4.Checked then
    SpTBXButton4.Color:= clRed
  else
    SpTBXButton4.Color:= clNone;
end;

procedure TMainForm.SpTBXButton5Click(Sender: TObject);
begin
  if SpTBXButton4.Checked then SpTBXButton4Click(SpTBXButton5);

  SpTBXButton5.Checked:= not SpTBXButton5.Checked;
  if SpTBXButton5.Checked then
    SpTBXButton5.Color:= clRed
  else
    SpTBXButton5.Color:= clNone;
end;

procedure TMainForm.SpTBXButton27Click(Sender: TObject);
begin
  SpTBXTabControl4.ActiveTabIndex:= 0;
  ToggleOperation(op_ati_get_ticks);
end;

procedure TMainForm.TblUpdateGeos(aTable: TRRAdvTable; aClass:TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    if Assigned(aClass.MyClass[i].FindPropertyByName('Enabled')) then
      if aClass.MyClass[i].FindPropertyByName('Enabled').ValueB then
        aTable.Cell[0,aTable.RowCount-1].TextString:= '1';
    aTable.Cell[1,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('Caption').ValueS;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[1,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    if aTable.Cell[1,aTable.RowCount-1].TextString = curr_sel_cell_value then
      sel_cell:= aTable.Cell[1,aTable.RowCount-1];
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton17Click(Sender: TObject);
var cls1:TFMClass;
    s:String;
begin
  s:= DelAllSpace(AnsiUpperCase(SpTBXEdit3.Text));
  cls1:= cls_geos.CreateClassItem(s,'');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('geo'),False,True);
  cls1.SysName:= s;
  cls1.FindPropertyByName('Caption').ValueS:= AnsiUpperCase(SpTBXEdit3.Text);
  cls_geos.Save;
  curr_sel_cell_value:= s;
  TblUpdateGeos(tblATIGeos,cls_geos);
end;

procedure TMainForm.SpTBXButton16Click(Sender: TObject);
begin
  if Assigned(tblATIGeos.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      TFMClass(tblATIGeos.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblATIGeos.SelectedCell.Data1));
      tblATIGeos.DelRow(tblATIGeos.SelectedCell.Row);
      cls_geos.Save;
    end;
  end;
end;

procedure TMainForm.SpTBXButton19Click(Sender: TObject);
begin
  SpTBXEdit3.Text:= '';
end;

procedure TMainForm.tblATIGeosAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'geo' then
  begin
    {TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS:= AnsiUpperCase(aCell.TextString);
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIGeos,cls_geos);
    cls_geos.Save;}
  end;
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('Enabled').ValueB:= aCell.TextString = '1';
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIGeos,TFMClass(aCell.Data1).ParentClass);
    cls_geos.Save;
  end;
end;

procedure TMainForm.tblATIGeosChangeSelectedCell(Sender: TObject);
begin
  if Assigned(tblATIGeos.SelectedCell) then
  begin
    SpTBXEdit3.Text:= tblATIGeos.SelectedCell.TextString;
    SpTBXEdit3.SelStart:= 1;
    SpTBXEdit3.SelLength:= Length(SpTBXEdit3.Text);
    SpTBXEdit3.SelectAll; 
  end;
end;

procedure TMainForm.SpTBXButton18Click(Sender: TObject);
var cls1:TFMClass;
begin
  if Length(SpTBXEdit3.Text) > 0 then
  begin
    if SpTBXButton4.Checked then
    begin
      cls1:= app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos').CreateClassItem('','');
      cls_templates.CopyClass(cls1,cls_templates.FindClassByName('geo'),False,True);
      cls1.FindPropertyByName('Caption').ValueS:= AnsiUpperCase(SpTBXEdit3.Text);
      app_sett.Save;
      TblUpdateGeos(tblATIFromGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos'));
    end
    else
    begin
      cls1:= app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos').CreateClassItem('','');
      cls_templates.CopyClass(cls1,cls_templates.FindClassByName('geo'),False,True);
      cls1.FindPropertyByName('Caption').ValueS:= AnsiUpperCase(SpTBXEdit3.Text);
      app_sett.Save;
      TblUpdateGeos(tblATIToGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos'));
    end;
  end;
end;

procedure TMainForm.UpdateATI_f_Params;
begin
  TblUpdateGeos(tblATIFromGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos'));
  TblUpdateGeos(tblATIToGeo,app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos'));
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('FromRadius').ValueI > 0 then
    SpTBXEdit1.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('FromRadius').ValueI);
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('ToRadius').ValueI > 0 then
    SpTBXEdit2.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('ToRadius').ValueI);
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('WeightEnd').ValueI > 0 then
    SpTBXEdit4.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('WeightEnd').ValueI);
  if app_sett.FindClassByName('ati_f_params').FindPropertyByName('VolumeEnd').ValueI > 0 then
    SpTBXEdit5.Text:= IntToStr(app_sett.FindClassByName('ati_f_params').FindPropertyByName('VolumeEnd').ValueI);
  SpTBXEdit6.Text:= app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateBegin').ValueS;
  SpTBXEdit7.Text:= app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateEnd').ValueS;
  SpTBXEdit31.Text:= app_sett.FindClassByName('ati_f_params').FindPropertyByName('MinPrice').ValueS;
end;

procedure TMainForm.SpTBXButton26Click(Sender: TObject);
var i:Integer;
    dt:TDateTime;
begin
  ati_service.capcha:= False;
  
  ati_service.OnAutorizCode:= DoATIAutorizCode;
  ati_service.OnCaptcha:= DoATICaptcha;
  if not bp_service_enabled then
    ati_service.OnEndGetTickets:= DoEndGetTickets;
  ati_service.OnOperProgress:= DoOperProgress;

  ati_service.GetTickOption:= GetTickOptionDefault;

  if TryStrToInt(SpTBXEdit1.Text,i) then
  begin
    ati_service.GetTickOption.FromRadius:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('FromRadius').ValueI:= i;
  end;
  if TryStrToInt(SpTBXEdit2.Text,i) then
  begin
    ati_service.GetTickOption.ToRadius:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('ToRadius').ValueI:= i;
  end;
  if TryStrToInt(SpTBXEdit4.Text,i) then
  begin
    ati_service.GetTickOption.WeightEnd:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('WeightEnd').ValueI:= i;
  end;
  if TryStrToInt(SpTBXEdit5.Text,i) then
  begin
    ati_service.GetTickOption.VolumeEnd:= i;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('VolumeEnd').ValueI:= i;
  end;

  if TryStrToDate(SpTBXEdit6.Text,dt) then
  begin
    ati_service.GetTickOption.DateBegin:= dt;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateBegin').ValueS:= SpTBXEdit6.Text;
  end;
  if TryStrToDate(SpTBXEdit7.Text,dt) then
  begin
    ati_service.GetTickOption.DateEnd:= dt;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateEnd').ValueS:= SpTBXEdit7.Text;
  end;

  if TryStrToInt(SpTBXEdit31.Text,i) then
  begin
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('MinPrice').ValueS:= SpTBXEdit31.Text;
  end;

  ati_service.GetTickOption.LoadType:= SpTBXComboBox2.ItemIndex;
  

  app_sett.Save;

  SpTBXButton26.Enabled:= False;
  ATIGetTickets(0,0);
end;

procedure TMainForm.SpTBXButton9Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '';
end;

procedure TMainForm.SpTBXButton14Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '';
end;

procedure TMainForm.SpTBXButton20Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '100';
end;

procedure TMainForm.SpTBXButton21Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '200';
end;

procedure TMainForm.SpTBXButton22Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '300';
end;

procedure TMainForm.SpTBXButton24Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '400';
end;

procedure TMainForm.SpTBXButton6Click(Sender: TObject);
begin
  if Assigned(tblATIFromGeo.SelectedCell) then
  begin
    TFMClass(tblATIFromGeo.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblATIFromGeo.SelectedCell.Data1));
    tblATIFromGeo.DelRow(tblATIFromGeo.SelectedCell.Row);
    app_sett.Save;
  end;
end;

procedure TMainForm.SpTBXButton11Click(Sender: TObject);
begin
  if Assigned(tblATIToGeo.SelectedCell) then
  begin
    TFMClass(tblATIToGeo.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblATIToGeo.SelectedCell.Data1));
    tblATIToGeo.DelRow(tblATIToGeo.SelectedCell.Row);
    app_sett.Save;
  end;
end;

procedure TMainForm.SpTBXButton8Click(Sender: TObject);
begin
  app_sett.FindClassByName('ati_f_params').FindClassByName('from_geos').Close;
  tblATIFromGeo.ClearRows;
  app_sett.Save;
end;

procedure TMainForm.SpTBXButton13Click(Sender: TObject);
begin
  app_sett.FindClassByName('ati_f_params').FindClassByName('to_geos').Close;
  tblATIToGeo.ClearRows;
  app_sett.Save;
end;

procedure TMainForm.SpTBXButton10Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '100';
end;

procedure TMainForm.SpTBXButton15Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '100';
end;

procedure TMainForm.DoOperSub1Progress(Stage1, Stage2: String);
begin
  if (Length(Stage1) = 0) and (Length(Stage2) = 0) then
  begin
    SpTBXPanel2.Hide;
  end
  else
  begin
    if not SpTBXPanel2.Visible then
      SpTBXPanel2.Show;

    if Length(Stage1) > 0 then
      SpTBXLabel12.Caption:= Stage1;

    SpTBXLabel14.Caption:= Stage2;
  end;

  Application.ProcessMessages;
end;

procedure TMainForm.ATIGetTickets(FromGeoIndex, ToGeoIndex:Integer);
begin
  if (FromGeoIndex = 0) and (ToGeoIndex = 0) then
  begin
    if tblATIFromGeo.RowCount = 0 then
      ati_service.GetTickOption.FromGeo:= ''
    else
      ati_service.GetTickOption.FromGeo:= tblATIFromGeo.Cell[1,0].TextString;
    if tblATIToGeo.RowCount = 0 then
      ati_service.GetTickOption.ToGeo:= ''
    else
      ati_service.GetTickOption.ToGeo:= tblATIToGeo.Cell[1,0].TextString;

    _FromGeoIndex:= 0;
    _ToGeoIndex:= 0;
  end;

  if (FromGeoIndex = -1) and (ToGeoIndex = -1) then
  begin
    Inc(_FromGeoIndex);
    if _FromGeoIndex > tblATIFromGeo.RowCount - 1 then
    begin
      _FromGeoIndex:= 0;
      Inc(_ToGeoIndex);
    end;
  end;

  if (_ToGeoIndex > tblATIToGeo.RowCount - 1) then
  begin
    SpTBXButton26.Enabled:= True;
    DoOperSub1Progress('','');
    if bp_service_enabled then
    begin
      SpTBXGroupBox1.Caption:= 'BPService ' + bp_service_last_update;
      tmBPService.Enabled:= True;
    end;
    Exit;
  end;

  if tblATIFromGeo.Cell[0,_FromGeoIndex].TextString <> '1' then
  begin
    ATIGetTickets(-1,-1);
    Exit;
  end;

  if tblATIToGeo.Cell[0,_ToGeoIndex].TextString <> '1' then
  begin
    Inc(_ToGeoIndex);
    ATIGetTickets(_FromGeoIndex,_ToGeoIndex);
    Exit;
  end;

  if not ati_service.capcha then
  begin
    ati_service.GetTickOption.FromGeo:= tblATIFromGeo.Cell[1,_FromGeoIndex].TextString;
    ati_service.GetTickOption.ToGeo:= tblATIToGeo.Cell[1,_ToGeoIndex].TextString;
    DoOperSub1Progress(ati_service.GetTickOption.FromGeo + ' - ' + ati_service.GetTickOption.ToGeo,'');
    ati_service.GetTickets;
  end
  else
  begin
    SpTBXButton26.Enabled:= True;
    _FromGeoIndex:= -1;
    _ToGeoIndex:= -1;
    DoOperSub1Progress('','');
  end;
end;

procedure TMainForm.SpTBXButton23Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y-CalendarWizard.spMainForm.Height) = mrOk then
    SpTBXEdit6.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton25Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y-CalendarWizard.spMainForm.Height) = mrOk then
    SpTBXEdit7.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton7Click(Sender: TObject);
begin
  ati_service.StopFlag:= True;
  Application.ProcessMessages; 
end;

procedure TMainForm.tblATIFromGeoAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('Enabled').ValueB:= aCell.TextString = '1';
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIFromGeo,TFMClass(aCell.Data1).ParentClass);
    app_sett.Save;
  end;
end;

procedure TMainForm.tblATIToGeoAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('Enabled').ValueB:= aCell.TextString = '1';
    curr_sel_cell_value:= TFMClass(aCell.Data1).FindPropertyByName('Caption').ValueS;
    TblUpdateGeos(tblATIToGeo,TFMClass(aCell.Data1).ParentClass);
    app_sett.Save;
  end;
end;

procedure TMainForm.TblUpdateBlocks(aTable: TRRAdvTable; aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    if Length(aClass.MyClass[i].FindPropertyByName('Caption').ValueS) > 0 then
      aTable.Cell[1,aTable.RowCount-1].TextSrings.Add(aClass.MyClass[i].FindPropertyByName('Caption').ValueS)
    else
      aTable.Cell[1,aTable.RowCount-1].TextSrings.Add('��� �����');
    aTable.Cell[1,aTable.RowCount-1].TextSrings.Add(aClass.MyClass[i].FindPropertyByName('Date').ValueS);
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[1,aTable.RowCount-1].Data1:= aClass.MyClass[i];
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton12Click(Sender: TObject);
begin
  ToggleOperation(op_per_info);
  tblPeriodsChangeSelectedCell(nil);
end;

procedure TMainForm.SpTBXButton29Click(Sender: TObject);
begin
  if Assigned(tblPeriods.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      TFMClass(tblPeriods.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblPeriods.SelectedCell.Data1));
      tblPeriods.DelRow(tblPeriods.SelectedCell.Row);
      cls_periods.Save;
      ToggleOperation(op_per_info);
      tblPeriodsChangeSelectedCell(nil);
    end;
  end;
end;

procedure TMainForm.SpTBXButton31Click(Sender: TObject);
begin
  if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
  begin
    cls_data.FindClassByName('blocks').FindClassByName('finded').Close;
    cls_data.Save;
    TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
  end;
end;

procedure TMainForm.SpTBXButton32Click(Sender: TObject);
begin
  if Assigned(tblFinded.SelectedCell) then
  begin
    TFMClass(tblFinded.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblFinded.SelectedCell.Data1));
    tblFinded.DelRow(tblFinded.SelectedCell.Row);
    cls_data.Save;
  end;
end;

procedure TMainForm.tblFindedChangeSelectedCell(Sender: TObject);
var cls1:TFMClass;
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblFinded.SelectedCell) then
  begin
    ToggleOperation(op_finded_ticks);
    Application.ProcessMessages;
    cls1:= TFMClass(tblFinded.Cell[0,tblFinded.SelectedCell.Row].Data1);
    cls_templates.CopyClass(cls1,cls_templates.FindClassByName('data_block'),False,True);
    TblUpdateTickets(tblFindedTickets,cls1);
    if cls1.FindPropertyByName('_sel_session').ValueS = cur_session then
      if cls1.FindPropertyByName('_sel_row').ValueI >= 0 then
        tblFindedTickets.SetSelectedCell(cls1.FindPropertyByName('_sel_col').ValueI,cls1.FindPropertyByName('_sel_row').ValueI);
  end;
end;

procedure TMainForm.TblUpdateTickets(aTable: TRRAdvTable;
  aClass: TFMClass);
var i,n,k,k1,j:Integer;
    sel_cell:TRRCell;
    cls1,cls2:TFMClass;
    b,b1:Boolean;
    ds:Char;
    s1,s2:String;
    buff,buff2: TStringList;
    f1,_tarif1,_tarif2:Single;
begin
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  aTable.ClearRows(True);
  Application.ProcessMessages;
  
  aTable.BeginUpdate;

  LockAllEventChangeSelCell:= True;
  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;


  cls1:= aClass.FindClassByName('items');

  if Assigned(cls1) then
  begin
    buff:= TStringList.Create;
    buff2:= TStringList.Create;

    if aTable = tblFindedTickets then
    begin
      for i:= 0 to cls1.MyClassCount - 1 do
      begin
        cls1.MyClass[i].Tag:= 0;
        if TryStrToInt(cls1.MyClass[i].FindPropertyByName('Price1').ValueS,k1) then
        begin
          buff.AddObject('',cls1.MyClass[i]);
        end;
      end;

      while buff.Count > 0 do
      begin
        b:= False;
        for n:= 0 to buff2.Count - 1 do
        begin
          if TFMClass(buff.Objects[0]).FindPropertyByName('DistI').ValueI > 0 then
          begin
            if SpTBXCheckBox5.Checked then
            begin
              _tarif1:= StrToFloat(TFMClass(buff.Objects[0]).FindPropertyByName('Price1').ValueS) / TFMClass(buff.Objects[0]).FindPropertyByName('DistI').ValueI;
              _tarif2:= StrToFloat(TFMClass(buff2.Objects[n]).FindPropertyByName('Price1').ValueS) / TFMClass(buff2.Objects[n]).FindPropertyByName('DistI').ValueI;
              b1:= _tarif1 > _tarif2;
            end
            else
            begin
              b1:= StrToFloat(TFMClass(buff.Objects[0]).FindPropertyByName('Price1').ValueS) > StrToFloat(TFMClass(buff2.Objects[n]).FindPropertyByName('Price1').ValueS);
            end;
            if b1 then
            begin
              buff2.InsertObject(n,'',buff.Objects[0]);
              TFMClass(buff.Objects[0]).Tag:= 10;
              buff.Delete(0);
              b:= True;
              Break;
            end;
          end;
        end;
        if not b then
        begin
          buff2.AddObject('',buff.Objects[0]);
          TFMClass(buff.Objects[0]).Tag:= 10;
          buff.Delete(0);
        end
      end;
      for i:= 0 to cls1.MyClassCount - 1 do
      begin
        if cls1.MyClass[i].Tag = 0 then
        begin
          buff2.AddObject('',cls1.MyClass[i]);
          cls1.MyClass[i].Tag:= 10;
        end;
      end;
    end
    else
    begin
      for i:= 0 to cls1.MyClassCount - 1 do
      begin
        buff2.AddObject('',cls1.MyClass[i]);
        cls1.MyClass[i].Tag:= 10;
      end;
    end;

    k:= -1;

    for i:= 0 to buff2.Count - 1 do
    begin
      aTable.CreateRowBlock(0);
      
      Inc(k,2);

      cls1:= TFMClass(buff2.Objects[i]);

      aTable.Cell[0,k-1].Data1:= cls1;

      if Assigned(cls1.FindPropertyByName('_checked')) then
        if cls1.FindPropertyByName('_checked').ValueB then
          aTable.Cell[0,k-1].TextString:= '1';

      if cls1.FindPropertyByName('DistI').ValueI > 0 then
        aTable.Cell[1,k-1].TextString:= IntToStr(cls1.FindPropertyByName('DistI').ValueI) + ' ��'
      else
        aTable.Cell[1,k-1].TextString:= '--';

      aTable.Cell[2,k-1].TextString:= cls1.FindPropertyByName('Price1').ValueS;
      if TryStrToInt(aTable.Cell[2,k-1].TextString,k1) then
        aTable.Cell[2,k-1].TextString:= aTable.Cell[2,k-1].TextString + ' �';
      if IsCashed(cls1) then
        aTable.Cell[2,k-1].Color:= $00B4FFFF;

      if cls1.FindPropertyByName('Weight').ValueF > 0 then
      begin
        s1:= FloatToStrF(cls1.FindPropertyByName('Weight').ValueF,fffixed,10,1);
        s1:= DelSymb(s1,'.0');
      end
      else
        s1:= '--';

      if cls1.FindPropertyByName('Volume').ValueF > 0 then
      begin
        s2:= FloatToStrF(cls1.FindPropertyByName('Volume').ValueF,fffixed,10,1);
        s2:= DelSymb(s2,'.0');
      end
      else
        s2:= '--';

      aTable.Cell[4,k-1].TextString:= s1 + ' / ' + s2;

      aTable.Cell[5,k-1].TextString:= cls1.FindPropertyByName('DateDesc').ValueS;
      aTable.Cell[6,k-1].TextString:= cls1.FindPropertyByName('FromGeo').ValueS;
      aTable.Cell[7,k-1].TextString:= cls1.FindPropertyByName('ToGeo').ValueS;
      aTable.Cell[8,k-1].TextString:= cls1.FindPropertyByName('CargoName').ValueS;

      aTable.Cell[3,k-1].TextString:= '--';
      
      if TryStrToFloat(cls1.FindPropertyByName('Price1').ValueS,f1) then
        if cls1.FindPropertyByName('DistI').ValueI > 0 then
          aTable.Cell[3,k-1].TextString:= FloatToStrF(f1/cls1.FindPropertyByName('DistI').ValueI,fffixed,10,1) + ' �/��';

      if Assigned(cls1.FindPropertyByName('_status_id')) then
      begin
        if cls1.FindPropertyByName('_status_id').ValueI > 0 then
        begin
          aTable.Cell[8,k].Font.Color:= GetStatusFontColor(cls1.FindPropertyByName('_status_id').ValueI);
          aTable.Cell[8,k].TextString:= cls1.FindPropertyByName('_status_str').ValueS;
        end;
      end;
    end;

    FreeAndNil(buff);
    FreeAndNil(buff2);
  end;

  aTable.EndUpdate;

  DecimalSeparator:= ds;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
  LockAllEventChangeSelCell:= False;

  if aTable = tblFindedTickets then
  begin
    TblCheckWVolume(aTable);
    SpTBXLabel22.Caption:= IntToStr(aTable.RowCount div 2) + ' �������';
  end;
  if aTable = tblFavorTickets then
  begin
    TblCheckWVolume(aTable);
    SpTBXLabel33.Caption:= IntToStr(aTable.RowCount div 2) + ' �������';
  end;
end;

procedure TMainForm.SpTBXButton33Click(Sender: TObject);
begin
  TblCheckUnCheck(tblFindedTickets,False);
end;

procedure TMainForm.TblCheckUnCheck(aTable: TRRAdvTable; Value: Boolean);
var i,n:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  n:= 2;

  if (aTable = tblFavor) or (aTable = tblPeriods) then n:= 1;

  i:= 0;
  while i <= aTable.RowCount-1 do
  begin
    if Value then
    begin
      if Assigned(aTable.Cell[0,i].Data1) then
        if Assigned(TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked')) then
          TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked').ValueB:= True;
      aTable.Cell[0,i].TextString:= '1'
    end
    else
    begin
      if Assigned(aTable.Cell[0,i].Data1) then
        if Assigned(TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked')) then
          TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked').ValueB:= False;
      aTable.Cell[0,i].TextString:= '';
    end;
    Inc(i,n);
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row);

  aTable.LockEventChangeSelCell:= False;

  if aTable = tblFindedTickets then
  begin
    TblCheckWVolume(aTable);
    cls_data.Save;
  end;
end;

procedure TMainForm.TblCheckWVolume(aTable: TRRAdvTable);
var f1,f2,f3,f4,f5:Single;
    i,_price,max_dist:Integer;
    ds:Char;
    dpp:TDebitPrognosParams;
    count_days:Single;
begin
  f1:= 0; f2:= 0; f3:= 0; f5:= 0;
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';
  
  i:= 0; max_dist:= 0;
  while i <= aTable.RowCount-1 do
  begin
    if TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('_checked').ValueB then
    begin
      if TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Weight').ValueF > 0 then
        f1:= f1 + TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Weight').ValueF;
      if TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Volume').ValueF > 0 then
        f2:= f2 + TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Volume').ValueF;
      if TryStrToInt(TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('Price1').ValueS,_price) then
      begin
        f3:= f3 + _price;
        if not IsCashed(TFMClass(aTable.Cell[0,i].Data1)) then
          f5:= f5 + (_price * 0.1);
      end;
      if TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('DistI').ValueI > max_dist then
        max_dist:= TFMClass(aTable.Cell[0,i].Data1).FindPropertyByName('DistI').ValueI;
    end;
    Inc(i,2);
  end;

  dpp.distance:= max_dist;
  count_days:= max_dist/cls_params.FindPropertyByName('day_range').ValueF;
  f5:= f5 + CalcDebitPrognosis(dpp);

  if aTable = tblFindedTickets then
  begin
    SpTBXLabel17.Caption:= FloatToStrF(f1,fffixed,10,1) + ' �';
    SpTBXLabel17.Caption:= DelSymb(SpTBXLabel17.Caption,'.0');
    SpTBXLabel19.Caption:= FloatToStrF(f2,fffixed,10,1) + ' �3';
    SpTBXLabel19.Caption:= DelSymb(SpTBXLabel19.Caption,'.0');
    SpTBXLabel21.Caption:= FloatToStrF(f3,fffixed,10,0) + ' �' + ' (' + IntToStr(Round(count_days)) + ' ����)';
    SpTBXLabel44.Caption:= FloatToStrF(f3-f5,fffixed,10,0) + ' �';
    if max_dist > 0 then
      SpTBXLabel85.Caption:= FloatToStrF((f3)/max_dist,fffixed,10,1) + ' �/��'
    else
      SpTBXLabel85.Caption:= '';
  end;

  if aTable = tblFavorTickets then
  begin
    SpTBXLabel28.Caption:= FloatToStrF(f1,fffixed,10,1) + ' �';
    SpTBXLabel28.Caption:= DelSymb(SpTBXLabel28.Caption,'.0');
    SpTBXLabel30.Caption:= FloatToStrF(f2,fffixed,10,1) + ' �3';
    SpTBXLabel30.Caption:= DelSymb(SpTBXLabel30.Caption,'.0');
    SpTBXLabel32.Caption:= FloatToStrF(f3,fffixed,10,0) + ' �' + ' (' + IntToStr(Round(count_days)) + ' ����)';
    SpTBXLabel46.Caption:= FloatToStrF(f3-f5,fffixed,10,0) + ' �';
    if max_dist > 0 then
      SpTBXLabel84.Caption:= FloatToStrF((f3)/max_dist,fffixed,10,1) + ' �/��'
    else
      SpTBXLabel84.Caption:= '';
  end;

  DecimalSeparator:= ds;
end;

procedure TMainForm.SpTBXButton30Click(Sender: TObject);
begin
  ToggleOperation(old_ticket_info_oper_id);
end;

procedure TMainForm.tblFindedTicketsAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('_checked').ValueB:= aCell.TextString = '1';
    cls_data.Save;
    TblCheckWVolume(tblFindedTickets);
  end;
end;

procedure TMainForm.SpTBXButton34Click(Sender: TObject);
begin
  if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
  begin
    cls_data.FindClassByName('blocks').FindClassByName('favor').Close;
    cls_data.Save;
    TblUpdateBlocks(tblFavor,cls_data.FindClassByName('blocks').FindClassByName('favor'));
  end;
end;

procedure TMainForm.SpTBXButton35Click(Sender: TObject);
begin
  if Assigned(tblFavor.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      TFMClass(tblFavor.SelectedCell.Data1).ParentClass.DeleteClassItem(TFMClass(tblFavor.SelectedCell.Data1));
      tblFavor.DelRow(tblFavor.SelectedCell.Row);
      cls_data.Save;
    end;
  end;
end;

procedure TMainForm.SpTBXButton36Click(Sender: TObject);
var cls1:TFMClass;
begin
  cls1:= cls_data.FindClassByName('blocks').FindClassByName('favor').CreateClassItem('','');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('data_block'),False,True);
  cls_data.Save;
  TblUpdateBlocks(tblFavor,cls_data.FindClassByName('blocks').FindClassByName('favor'));
end;

procedure TMainForm.tblFavorDblClickCell(Sender: TObject);
begin
  if Assigned(tblFavor.SelectedCell) then
  begin
    act_cls_block_favor:= TFMClass(tblFavor.SelectedCell.Data1);
    TblCheckUnCheck(tblFavor,False);
    tblFavor.Cell[0,tblFavor.SelectedCell.Row].MyText:= '1';
  end;
end;

procedure TMainForm.Setact_cls_block_favor(const Value: TFMClass);
begin
  Fact_cls_block_favor := Value;
  if Assigned(act_cls_block_favor) then
  begin
    SpTBXLabel25.Caption:= act_cls_block_favor.FindPropertyByName('Caption').ValueS;
    if Length(SpTBXLabel25.Caption) = 0 then
      SpTBXLabel25.Caption:= '��� �����';
  end
  else
  begin
    SpTBXLabel25.Caption:= '';
  end;
end;

procedure TMainForm.tblFavorChangeSelectedCell(Sender: TObject);
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblFavor.SelectedCell) then
  begin
    ToggleOperation(op_favor_ticks);
    Application.ProcessMessages;
    TblUpdateTickets(tblFavorTickets,TFMClass(tblFavor.SelectedCell.Data1));
  end;
end;

procedure TMainForm.SpTBXButton38Click(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblFindedTickets.SelectedCell) then
  begin
    if not Assigned(act_cls_block_favor) then
    begin
      MessageBox(Application.Handle,'�� ����� �������� ���� ����������!','', MB_OK OR MB_ICONWARNING);
    end
    else
    begin
      cls2:= TFMClass(tblFindedTickets.Cell[0,tblFindedTickets.SelectedCell.Row].Data1);
      if not Assigned(act_cls_block_favor.FindClassByName('items')) then
        act_cls_block_favor.CreateClassItem('items','');
      if not Assigned(GetTicketByID(cls2.FindPropertyByName('ID').ValueS,act_cls_block_favor.FindClassByName('items'))) then
      begin
        cls1:= act_cls_block_favor.FindClassByName('items').CreateClassItem('','');
        cls2.CopyClass(cls1,cls2,True,True);
        if Length(act_cls_block_favor.FindPropertyByName('Caption').ValueS) = 0 then
        begin
          act_cls_block_favor.FindPropertyByName('Caption').ValueS:=
              Copy(cls1.FindPropertyByName('FromGeo').ValueS,1,4) + '-' + Copy(cls1.FindPropertyByName('ToGeo').ValueS,1,4);
          for i:= 0 to tblFavor.RowCount - 1 do
          begin
            if tblFavor.Cell[0,i].TextString = '1' then
            begin
              tblFavor.Cell[1,i].MyText:= act_cls_block_favor.FindPropertyByName('Caption').ValueS; 
            end;
            act_cls_block_favor:= act_cls_block_favor;
          end;
        end;
        cls_data.Save;
        InfoTimerForm.Execute('���������');
      end
      else
        MessageBox(Application.Handle,'������ ��� � �������� �����','', MB_OK OR MB_ICONINFORMATION);
    end;
  end;
end;

function TMainForm.GetTicketByID(ID: String; aClass: TFMClass): TFMClass;
var i:Integer;
begin
  Result:= nil;
  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    if aClass.MyClass[i].FindPropertyByName('ID').ValueS = ID then
    begin
      Result:= aClass.MyClass[i];
      Break;
    end;
  end;
end;

procedure TMainForm.SpTBXLabel23Click(Sender: TObject);
begin
  tblFavorChangeSelectedCell(nil);
end;

procedure TMainForm.SpTBXLabel15Click(Sender: TObject);
begin
  tblFindedChangeSelectedCell(nil);
end;

procedure TMainForm.tblFavorTicketsAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'enabled' then
  begin
    TFMClass(aCell.Data1).FindPropertyByName('_checked').ValueB:= aCell.TextString = '1';
    cls_data.Save;
    TblCheckWVolume(tblFavorTickets);
  end;
end;

procedure TMainForm.SpTBXButton37Click(Sender: TObject);
begin
  TblCheckUnCheck(tblFavorTickets,False);
end;

procedure TMainForm.SpTBXButton39Click(Sender: TObject);
var cls1:TFMClass;
    i:Integer;
begin
  if Assigned(tblFavorTickets.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      cls1:= TFMClass(tblFavorTickets.Cell[0,tblFavorTickets.SelectedCell.Row].Data1);
      cls1.ParentClass.DeleteClassItem(cls1);
      i:= tblFavorTickets.SelectedCell.Row;
      tblFavorTickets.DelRow(i);
      tblFavorTickets.DelRow(i);
      cls_data.Save;
    end;
  end;
end;

procedure TMainForm.tblFindedTicketsDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblFindedTickets.SelectedCell) then
  begin
    cls1:= TFMClass(tblFindedTickets.Cell[0,tblFindedTickets.SelectedCell.Row].Data1);
    cls_active_ticket:= cls1;
    old_ticket_info_oper_id:= op_finded_ticks;
    TblUpdateTicketInfo(cls1);
    ToggleOperation(op_ticket_info);
  end;
end;

procedure TMainForm.tblFindedTicketsChangeSelectedCell(Sender: TObject);
var cls1:TFMClass;
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblFinded.SelectedCell) then
  begin
    cls1:= TFMClass(tblFinded.Cell[0,tblFinded.SelectedCell.Row].Data1);
    cls_templates.CopyClass(cls1,cls_templates.FindClassByName('data_block'),False,True);
    cls1.FindPropertyByName('_sel_session').ValueS:= cur_session;
    cls1.FindPropertyByName('_sel_col').ValueI:= tblFindedTickets.SelectedCell.Col;
    cls1.FindPropertyByName('_sel_row').ValueI:= tblFindedTickets.SelectedCell.Row;
  end;
end;

procedure TMainForm.TblUpdateTicketInfo(aClass: TFMClass);
var i,i1,i2,_price,n:Integer;
    f1:Single;
    s,s1:String;
    ds:Char;
begin
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  SpTBXTabControl2.ActiveTabIndex:= 0;
  SpTBXTabControl3.ActiveTabIndex:= 0;
  SpTBXTabControl4.ActiveTabIndex:= 0;

  cls_templates.CopyClass(aClass,cls_templates.FindClassByName('ticket'),False,True);

  if aClass.FindPropertyByName('DistI').ValueI > 0 then
    Memo13.Text:= IntToStr(aClass.FindPropertyByName('DistI').ValueI) + ' ��'
  else
    Memo13.Text:= '--';
  s:= '';
  for n:= 1 to 2 do
  begin
    i1:= 0; i2:= 0;
    if aClass.FindPropertyByName('DistI').ValueI > 0 then
    begin
      f1:= 1;
      if n = 1 then
        if aClass.FindPropertyByName('Weight').ValueF > 0 then
          f1:= aClass.FindPropertyByName('Weight').ValueF/5;
      i1:= Round(((aClass.FindPropertyByName('DistI').ValueI/100) * cls_params.FindPropertyByName('truck_fuel_cons').ValueF * 30)*(f1));
    end;
    if TryStrToInt(aClass.FindPropertyByName('Price1').ValueS,_price) then
    begin
      if not IsCashed(aClass) then
        i2:= Round(_price * 0.1);
    end;
    if (i1 > 0) or (i2 > 0) then
    begin
      i:= i1 + i2;
      s:= s + '-' + IntToStr(i) + ' �';
      if _price > 0 then
      begin
        i:= _price - i;
        s:= s + ' [' + IntToStr(i) + ' �]';
      end;
    end;
    if n = 1 then
      if Length(s) > 0 then
        s:= s + ' :: ';
  end;
  SpTBXLabel42.Caption:= '(' + s + ')';

  Memo1.Text:= aClass.FindPropertyByName('FromGeoDesc1').ValueS;
  Memo2.Text:= aClass.FindPropertyByName('ToGeoDesc1').ValueS;
  Memo12.Text:= aClass.FindPropertyByName('Price1').ValueS;
  Memo3.Text:= aClass.FindPropertyByName('PriceDesc').ValueS;
  Memo7.Text:= '����.: ' + aClass.FindPropertyByName('Note').ValueS;
  Memo15.Text:= aClass.FindPropertyByName('TruckType').ValueS;

  SpTBXLabel38.Caption:= '';

  if aClass.FindPropertyByName('Weight').ValueF > 0 then
  begin
    s1:= FloatToStrF(aClass.FindPropertyByName('Weight').ValueF,fffixed,10,1);
    s1:= DelSymb(s1,'.0');
    SpTBXLabel38.Caption:= SpTBXLabel38.Caption + s1;
  end
  else
    SpTBXLabel38.Caption:= '--';

  if aClass.FindPropertyByName('Volume').ValueF > 0 then
  begin
    s1:= FloatToStrF(aClass.FindPropertyByName('Volume').ValueF,fffixed,10,1);
    s1:= DelSymb(s1,'.0');
    SpTBXLabel38.Caption:= SpTBXLabel38.Caption + ' / ' + s1;
  end
  else
    SpTBXLabel38.Caption:= SpTBXLabel38.Caption + ' / --';

  Memo4.Text:= aClass.FindPropertyByName('CargoDesc').ValueS;

  SpTBXLabel40.Caption:= aClass.FindPropertyByName('DateDesc').ValueS;

  Memo9.Text:= aClass.FindPropertyByName('Reliability').ValueS;
  Memo5.Text:= aClass.FindPropertyByName('ControllerInfo').ValueS;

  Memo6.Lines.Clear;
  for i:= 0 to aClass.FindClassByName('controller_contacts').MyClassCount - 1 do
  begin
    Memo6.Lines.Add(aClass.FindClassByName('controller_contacts').MyClass[i].FindPropertyByName('Str1').ValueS);
  end;

  Memo14.Lines.Clear;
  for i:= 0 to cls_active_ticket.FindClassByName('controller_mails').MyClassCount - 1 do
  begin
    Memo14.Lines.Add(cls_active_ticket.FindClassByName('controller_mails').MyClass[i].FindPropertyByName('Str1').ValueS);
  end;

  if aClass.FindPropertyByName('_status_id').ValueI = 0 then
  begin
    aClass.FindPropertyByName('_status_id').ValueI:= 10;
    aClass.FindPropertyByName('_status_str').ValueS:= '�����';
    cls_data.Save;
  end;

  
  SpTBXLabel35.Caption:= aClass.FindPropertyByName('_status_str').ValueS;
  SpTBXLabel35.Font.Color:= GetStatusFontColor(aClass.FindPropertyByName('_status_id').ValueI);

  Memo8.Text:= aClass.FindPropertyByName('Comments').ValueS;

  SpTBXCheckBox1.Checked:= not IsCashed(aClass);
  if not SpTBXCheckBox1.Checked then
    Shape1.Brush.Color:= $00B4FFFF
  else
    Shape1.Brush.Color:= clWhite;
    
  Memo12.Color:= Shape1.Brush.Color;

  SpTBXLabel48.Caption:= '';
  if Assigned(cls_active_period) then
    SpTBXLabel48.Caption:= cls_active_period.FindPropertyByName('BeginDate').ValueS + '-' + cls_active_period.FindPropertyByName('EndDate').ValueS;

  DecimalSeparator:= ds;
end;

procedure TMainForm.tblFavorTicketsDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblFavorTickets.SelectedCell) then
  begin
    cls1:= TFMClass(tblFavorTickets.Cell[0,tblFavorTickets.SelectedCell.Row].Data1);
    cls_active_ticket:= cls1;
    old_ticket_info_oper_id:= op_favor_ticks;
    TblUpdateTicketInfo(cls1);
    ToggleOperation(op_ticket_info);
  end;
end;

procedure TMainForm.TblUpdateTicketStatuses(aTable: TRRAdvTable;
  aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    aTable.Cell[0,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('str').ValueS;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[0,aTable.RowCount-1].Font.Color:= GetStatusFontColor(aClass.MyClass[i].FindPropertyByName('id').ValueI);
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

function TMainForm.GetStatusFontColor(statID: Integer): TColor;
begin
  Result:= clBlack;
  case statID of
    20,30: Result:= clRed;
    40: Result:= clBlue;
    50: Result:= clGreen;
    60: Result:= clFuchsia;
    70: Result:= clNavy;
  end;
end;

procedure TMainForm.tblTicketStatusesDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblTicketStatuses.SelectedCell) then
  begin
    cls1:= TFMClass(tblTicketStatuses.Cell[0,tblTicketStatuses.SelectedCell.Row].Data1);
    cls_templates.CopyClass(cls_active_ticket,cls_templates.FindClassByName('ticket'),False,True);
    cls_active_ticket.FindPropertyByName('_status_id').ValueI:= cls1.FindPropertyByName('id').ValueI;
    cls_active_ticket.FindPropertyByName('_status_str').ValueS:= cls1.FindPropertyByName('str').ValueS;
    SpTBXLabel35.Caption:= cls_active_ticket.FindPropertyByName('_status_str').ValueS;
    SpTBXLabel35.Font.Color:= GetStatusFontColor(cls_active_ticket.FindPropertyByName('_status_id').ValueI);
    cls_data.Save;
  end;
end;

function TMainForm.IsCashed(aClass: TFMClass): Boolean;
var s1:String;
begin
  Result:= GetFirstChar(AnsiUpperCase(aClass.FindPropertyByName('PriceDesc').ValueS),'���',1,False,s1) > 0;  
end;

function TMainForm.GetForecast(aClass: TFMClass): Integer;
begin

end;

procedure TMainForm.Memo8Change(Sender: TObject);
begin
  if Assigned(cls_active_ticket) then
  begin
    cls_active_ticket.FindPropertyByName('Comments').ValueS:= Memo8.Text;
    cls_data.Save;
  end;
end;

procedure TMainForm.TblUpdatePeriods(aTable: TRRAdvTable;
  aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    if cls_active_period = aClass.MyClass[i] then
      aTable.Cell[0,aTable.RowCount-1].TextString:= '1';
      
    if Length(aClass.MyClass[i].FindPropertyByName('BeginDate').ValueS) > 0 then
      aTable.Cell[1,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('BeginDate').ValueS;
    if Length(aClass.MyClass[i].FindPropertyByName('EndDate').ValueS) > 0 then
      aTable.Cell[1,aTable.RowCount-1].TextString:= aTable.Cell[1,aTable.RowCount-1].TextString + ' - ' + aClass.MyClass[i].FindPropertyByName('EndDate').ValueS;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[1,aTable.RowCount-1].Data1:= aClass.MyClass[i];
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXLabel49Click(Sender: TObject);
begin
  TblUpdatePeriods(tblPeriods,cls_periods.FindClassByName('periods'));
end;

procedure TMainForm.SpTBXButton41Click(Sender: TObject);
var cls1:TFMClass;
begin
  cls1:= cls_periods.FindClassByName('periods').CreateClassItem('','');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('period'),False,True);
  cls1.FindPropertyByName('guid').ValueS:= GenerateGUID;
  cls_periods.Save;
  TblUpdatePeriods(tblPeriods,cls_periods.FindClassByName('periods'));
  tblPeriods.SetSelectedCell(1,tblPeriods.RowCount-1);
end;

procedure TMainForm.tblPeriodsChangeSelectedCell(Sender: TObject);
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblPeriods.SelectedCell) then
  begin
    TblUpdatePeriodInfo(TFMClass(tblPeriods.Cell[0,tblPeriods.SelectedCell.Row].Data1));
    ToggleOperation(op_per_info);
  end;
end;

procedure TMainForm.TblUpdatePeriodInfo(aClass: TFMClass);
begin
  SpTBXEdit8.Tag:= 1;

  SpTBXEdit8.Text:= aClass.FindPropertyByName('BeginDate').ValueS;
  SpTBXEdit9.Text:= aClass.FindPropertyByName('EndDate').ValueS;

  SpTBXEdit8.Tag:= 0;
end;

procedure TMainForm.SpTBXButton46Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y+10) = mrOk then
    SpTBXEdit8.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton48Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y+10) = mrOk then
    SpTBXEdit9.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXEdit8Change(Sender: TObject);
var aClass:TFMClass;
begin
  if SpTBXEdit8.Tag = 1 then Exit;

  aClass:= TFMClass(tblPeriods.Cell[0,tblPeriods.SelectedCell.Row].Data1);
  aClass.FindPropertyByName('BeginDate').ValueS:= SpTBXEdit8.Text;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit9Change(Sender: TObject);
var aClass:TFMClass;
begin
  if SpTBXEdit8.Tag = 1 then Exit;
  
  aClass:= TFMClass(tblPeriods.Cell[0,tblPeriods.SelectedCell.Row].Data1);
  aClass.FindPropertyByName('EndDate').ValueS:= SpTBXEdit9.Text;
  cls_periods.Save;
end;

procedure TMainForm.tblPeriodsDblClickCell(Sender: TObject);
var aClass:TFMClass;
begin
  if Assigned(tblPeriods.SelectedCell) then
  begin
    aClass:= TFMClass(tblPeriods.Cell[0,tblPeriods.SelectedCell.Row].Data1);
    TblCheckUnCheck(tblPeriods,False);
    cls_active_period:= nil;
    cls_periods.FindPropertyByName('active_period').ValueS:= '';
    tblPeriods.Cell[0,tblPeriods.SelectedCell.Row].MyText:= '1';
    cls_periods.FindPropertyByName('active_period').ValueS:= aClass.FindPropertyByName('guid').ValueS;
    cls_active_period:= aClass;
    cls_periods.Save;
  end;
end;

procedure TMainForm.SetActivePeriod;
var i:Integer;
    s:String;
begin
  cls_active_period:= nil;
  s:= cls_periods.FindPropertyByName('active_period').ValueS;

  for i:= 0 to cls_periods.FindClassByName('periods').MyClassCount-1 do
  begin
    if cls_periods.FindClassByName('periods').MyClass[i].FindPropertyByName('guid').ValueS = s then
    begin
      cls_active_period:= cls_periods.FindClassByName('periods').MyClass[i];
      Break;
    end;
  end;
end;

procedure TMainForm.SpTBXButton40Click(Sender: TObject);
var cls1,cls2:TFMClass;
    i:Integer;
begin
  if not Assigned(cls_active_period) then
      MessageBox(Application.Handle,'�� ����� �������� ������!','', MB_OK OR MB_ICONWARNING)
  else
  begin
    if Assigned(GetDebitByID(cls_active_ticket.FindPropertyByName('ID').ValueS,cls_active_period.FindClassByName('debits'))) then
    begin
      MessageBox(Application.Handle,'��� ������� � �������� �������!','', MB_OK OR MB_ICONWARNING);
    end
    else
    begin
      cls1:= cls_active_period.FindClassByName('debits').CreateClassItem('','');
      cls_templates.CopyClass(cls1,cls_templates.FindClassByName('debit'),False,True);
      cls1.FindPropertyByName('guid').ValueS:= cls_active_ticket.FindPropertyByName('ID').ValueS;
      cls1.FindPropertyByName('create_date').ValueS:= DateToStr(Now);
      cls1.FindPropertyByName('type').ValueI:= 10;
      cls1.FindPropertyByName('type_str').ValueS:= '������';
      cls1.FindPropertyByName('caption').ValueS:= cls_active_ticket.FindPropertyByName('FromGeo').ValueS + '-' + cls_active_ticket.FindPropertyByName('ToGeo').ValueS;
      if IsCashed(cls_active_ticket) then
      begin
        cls1.FindPropertyByName('settlem_type').ValueI:= 10;
        cls1.FindPropertyByName('settlem_str').ValueS:= '���';
      end
      else
      begin
        if SpTBXCheckBox1.Checked then
        begin
          cls1.FindPropertyByName('settlem_type').ValueI:= 30;
          cls1.FindPropertyByName('settlem_str').ValueS:= '������';
        end
        else
        begin
          cls1.FindPropertyByName('settlem_type').ValueI:= 20;
          cls1.FindPropertyByName('settlem_str').ValueS:= '�� �����';
        end;
      end;

      if TryStrToInt(cls_active_ticket.FindPropertyByName('Price1').ValueS,i) then
        cls1.FindPropertyByName('value').ValueI:= i;

      cls2:= cls1.FindClassByName('ticket').CreateClassItem('','');
      cls_active_ticket.CopyClass(cls2,cls_active_ticket,False,True);

      if SpTBXCheckBox1.Checked then
      begin
        cls1:= cls_active_period.FindClassByName('credits').CreateClassItem('','');
        cls_templates.CopyClass(cls1,cls_templates.FindClassByName('credit'),False,True);
        cls1.FindPropertyByName('guid').ValueS:= GenerateGUID;
        cls1.FindPropertyByName('create_date').ValueS:= DateToStr(Now);
        cls1.FindPropertyByName('type').ValueI:= 30;
        cls1.FindPropertyByName('type_str').ValueS:= '�������� ��';
        cls1.FindPropertyByName('caption').ValueS:= cls_active_ticket.FindPropertyByName('FromGeo').ValueS + '-' + cls_active_ticket.FindPropertyByName('ToGeo').ValueS;
        if TryStrToInt(cls_active_ticket.FindPropertyByName('Price1').ValueS,i) then
          cls1.FindPropertyByName('value').ValueI:= Round(i*0.1);
      end;

      cls_periods.Save;
      InfoTimerForm.Execute('���������');
    end;
  end;
end;

function TMainForm.GetDebitByID(ID: String;aClass:TFMClass): TFMClass;
var i:Integer;
begin
  Result:= nil;
  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    if aClass.MyClass[i].FindPropertyByName('guid').ValueS = ID then
    begin
      Result:= aClass.MyClass[i];
      Break;
    end;
  end;
end;

procedure TMainForm.tblATIGeosDblClickCell(Sender: TObject);
begin
  SpTBXButton18Click(nil);
end;

procedure TMainForm.TblUpdateDebits(aTable: TRRAdvTable; aClass: TFMClass);
var i,n:Integer;
    sel_cell:TRRCell;
    a_color:TColor;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    a_color:= $006E6E6F;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i]; 
    if aClass.MyClass[i].FindPropertyByName('enabled').ValueB then
    begin
      aTable.Cell[0,aTable.RowCount-1].TextString:= '1';
      a_color:= clBlack;
    end;
    aTable.Cell[1,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('create_date').ValueS;
    aTable.Cell[1,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[2,aTable.RowCount-1].TextString:= IntToStr(aClass.MyClass[i].FindPropertyByName('value').ValueI) + ' �';
    aTable.Cell[2,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[3,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('type_str').ValueS;
    aTable.Cell[3,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[4,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('caption').ValueS;
    aTable.Cell[4,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[5,aTable.RowCount-1].TextSrings.Text:= aClass.MyClass[i].FindPropertyByName('comments').ValueS;
    aTable.Cell[5,aTable.RowCount-1].Font.Color:= a_color;
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  SpTBXLabel58.Caption:= IntToStr(aTable.RowCount) + ' �������';

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton45Click(Sender: TObject);
begin
  TblUpdateDebits(tblDebits,GetFMClassFromTable(tblPeriods).FindClassByName('debits'));
  ToggleOperation(op_debits);
end;

function TMainForm.GetFMClassFromTable(aTable: TRRAdvTable): TFMClass;
begin
  Result:= nil;
  if Assigned(aTable.SelectedCell) then
    Result:= TFMClass(aTable.Cell[0,aTable.SelectedCell.Row].Data1);
end;

procedure TMainForm.SpTBXButton43Click(Sender: TObject);
begin
  if Assigned(GetFMClassFromTable(tblPeriods)) then
    TblUpdateDebits(tblDebits,GetFMClassFromTable(tblPeriods).FindClassByName('debits'));
end;

procedure TMainForm.SpTBXButton44Click(Sender: TObject);
begin
    if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y+10) = mrOk then
      SpTBXEdit10.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton50Click(Sender: TObject);
begin
    if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y+10) = mrOk then
      SpTBXEdit14.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton49Click(Sender: TObject);
begin
  ToggleOperation(old_debit_info_oper_id);
end;

procedure TMainForm.TblUpdateDebitInfo(aClass: TFMClass);
begin
  SpTBXEdit10.Tag:= 1;

  cls_templates.CopyClass(aClass,cls_templates.FindClassByName('debit'),False,True);

  SpTBXCheckBox2.Checked:= aClass.FindPropertyByName('enabled').ValueB;
  
  SpTBXEdit10.Text:= aClass.FindPropertyByName('create_date').ValueS;
  SpTBXEdit13.Text:= IntToStr(aClass.FindPropertyByName('value').ValueI);
  SpTBXEdit11.Text:= aClass.FindPropertyByName('type_str').ValueS;
  SpTBXEdit12.Text:= aClass.FindPropertyByName('caption').ValueS;
  SpTBXEdit14.Text:= aClass.FindPropertyByName('ttn_date').ValueS;
  SpTBXEdit15.Text:= aClass.FindPropertyByName('settlem_str').ValueS;
  if aClass.FindPropertyByName('settlem_days').ValueI >= 0 then
    SpTBXEdit16.Text:= IntToStr(aClass.FindPropertyByName('settlem_days').ValueI);
  SpTBXEdit17.Text:= aClass.FindPropertyByName('card_str').ValueS;
  Memo10.Lines.Text:= aClass.FindPropertyByName('comments').ValueS;

  SpTBXButton51.Enabled:= aClass.FindClassByName('ticket').MyClassCount > 0;

  SpTBXEdit10.Tag:= 0;
end;

procedure TMainForm.tblDebitsDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblDebits.SelectedCell) then
  begin
    cls1:= GetFMClassFromTable(tblDebits);
    cls_active_debit:= cls1;
    old_debit_info_oper_id:= op_debits;
    TblUpdateDebitInfo(cls1);
    ToggleOperation(op_debit_info);
  end;
end;

procedure TMainForm.TblUpdateStdItemsTable(aTable: TRRAdvTable;
  aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    aTable.Cell[0,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('caption').ValueS;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.tblDebitTypesDblClickCell(Sender: TObject);
begin
  cls_active_debit.FindPropertyByName('type').ValueI:= GetFMClassFromTable(tblDebitTypes).FindPropertyByName('id').ValueI;
  cls_active_debit.FindPropertyByName('type_str').ValueS:= GetFMClassFromTable(tblDebitTypes).FindPropertyByName('caption').ValueS;
  SpTBXEdit11.Text:= cls_active_debit.FindPropertyByName('type_str').ValueS;
  cls_periods.Save;
end;

procedure TMainForm.tblCardTypesDblClickCell(Sender: TObject);
begin
  cls_active_debit.FindPropertyByName('card_type').ValueI:= GetFMClassFromTable(tblCardTypes).FindPropertyByName('id').ValueI;
  cls_active_debit.FindPropertyByName('card_str').ValueS:= GetFMClassFromTable(tblCardTypes).FindPropertyByName('caption').ValueS;
  SpTBXEdit17.Text:= cls_active_debit.FindPropertyByName('card_str').ValueS;
  cls_periods.Save;
end;

procedure TMainForm.tblSettlTypesDblClickCell(Sender: TObject);
begin
  cls_active_debit.FindPropertyByName('settlem_type').ValueI:= GetFMClassFromTable(tblSettlTypes).FindPropertyByName('id').ValueI;
  cls_active_debit.FindPropertyByName('settlem_str').ValueS:= GetFMClassFromTable(tblSettlTypes).FindPropertyByName('caption').ValueS;
  SpTBXEdit15.Text:= cls_active_debit.FindPropertyByName('settlem_str').ValueS;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXCheckBox2Click(Sender: TObject);
begin
  if SpTBXEdit10.Tag = 1 then Exit;
  cls_active_debit.FindPropertyByName('enabled').ValueB:= SpTBXCheckBox2.Checked;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit10Change(Sender: TObject);
begin
  if SpTBXEdit10.Tag = 1 then Exit;
  cls_active_debit.FindPropertyByName('create_date').ValueS:= SpTBXEdit10.Text;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit13Change(Sender: TObject);
var i:Integer;
begin
  if SpTBXEdit10.Tag = 1 then Exit;
  if TryStrToInt(SpTBXEdit13.Text,i) then
    cls_active_debit.FindPropertyByName('value').ValueI:= i
  else
    cls_active_debit.FindPropertyByName('value').ValueI:= 0;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit12Change(Sender: TObject);
begin
  if SpTBXEdit10.Tag = 1 then Exit;
  cls_active_debit.FindPropertyByName('caption').ValueS:= SpTBXEdit12.Text;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit14Change(Sender: TObject);
begin
  if SpTBXEdit10.Tag = 1 then Exit;
  cls_active_debit.FindPropertyByName('ttn_date').ValueS:= SpTBXEdit14.Text;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit16Change(Sender: TObject);
var i:Integer;
begin
  if SpTBXEdit10.Tag = 1 then Exit;
  if TryStrToInt(SpTBXEdit16.Text,i) then
    cls_active_debit.FindPropertyByName('settlem_days').ValueI:= i
  else
    cls_active_debit.FindPropertyByName('settlem_days').ValueI:= -1;
  cls_periods.Save;
end;

procedure TMainForm.Memo10Change(Sender: TObject);
begin
  if SpTBXEdit10.Tag = 1 then Exit;
  cls_active_debit.FindPropertyByName('comments').ValueS:= Memo10.Lines.Text;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXButton51Click(Sender: TObject);
var cls1:TFMClass;
begin
  cls1:= cls_active_debit.FindClassByName('ticket').MyClass[0];
  cls_active_ticket:= cls1;
  old_ticket_info_oper_id:= op_debit_info;
  TblUpdateTicketInfo(cls1);
  ToggleOperation(op_ticket_info);
end;

procedure TMainForm.SpTBXButton52Click(Sender: TObject);
begin
  if Assigned(tblPeriods.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      GetFMClassFromTable(tblDebits).ParentClass.DeleteClassItem(GetFMClassFromTable(tblDebits));
      tblDebits.DelRow(tblDebits.SelectedCell.Row);
      cls_periods.Save;
    end;
  end;
end;

procedure TMainForm.SpTBXButton53Click(Sender: TObject);
var cls1,cls2:TFMClass;
    i:Integer;
begin
  if not Assigned(cls_active_period) then
    MessageBox(Application.Handle,'�� ����� �������� ������!','', MB_OK OR MB_ICONWARNING)
  else
  begin
    cls1:= cls_active_period.FindClassByName('debits').CreateClassItem('','');
    cls_templates.CopyClass(cls1,cls_templates.FindClassByName('debit'),False,True);
    cls1.FindPropertyByName('guid').ValueS:= GenerateGUID;
    cls1.FindPropertyByName('create_date').ValueS:= DateToStr(Now);
    cls1.FindPropertyByName('type').ValueI:= 10;
    cls1.FindPropertyByName('type_str').ValueS:= '������';
    cls_periods.Save;
    InfoTimerForm.Execute('���������');
    TblUpdateDebits(tblDebits,cls_active_period.FindClassByName('debits'));
  end;
end;

procedure TMainForm.SpTBXButton54Click(Sender: TObject);
begin
  if Assigned(GetFMClassFromTable(tblPeriods)) then
    TblUpdateCredits(tblCredits,GetFMClassFromTable(tblPeriods).FindClassByName('credits'));
end;

procedure TMainForm.TblUpdateCredits(aTable: TRRAdvTable;
  aClass: TFMClass);
var i,n:Integer;
    sel_cell:TRRCell;
    a_color:TColor;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    a_color:= $006E6E6F;
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i]; 
    if aClass.MyClass[i].FindPropertyByName('enabled').ValueB then
    begin
      aTable.Cell[0,aTable.RowCount-1].TextString:= '1';
      a_color:= clBlack;
    end;
    aTable.Cell[1,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('create_date').ValueS;
    aTable.Cell[1,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[2,aTable.RowCount-1].TextString:= IntToStr(aClass.MyClass[i].FindPropertyByName('value').ValueI) + ' �';
    aTable.Cell[2,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[3,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('type_str').ValueS;
    aTable.Cell[3,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[4,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('caption').ValueS;
    aTable.Cell[4,aTable.RowCount-1].Font.Color:= a_color;
    aTable.Cell[5,aTable.RowCount-1].TextSrings.Text:= aClass.MyClass[i].FindPropertyByName('comments').ValueS;
    aTable.Cell[5,aTable.RowCount-1].Font.Color:= a_color;
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  SpTBXLabel67.Caption:= IntToStr(aTable.RowCount) + ' �������';

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton47Click(Sender: TObject);
begin
  TblUpdateCredits(tblCredits,GetFMClassFromTable(tblPeriods).FindClassByName('credits'));
  ToggleOperation(op_credits);
end;

procedure TMainForm.SpTBXButton56Click(Sender: TObject);
var cls1,cls2:TFMClass;
    i:Integer;
begin
  if not Assigned(cls_active_period) then
    MessageBox(Application.Handle,'�� ����� �������� ������!','', MB_OK OR MB_ICONWARNING)
  else
  begin
    cls1:= cls_active_period.FindClassByName('credits').CreateClassItem('','');
    cls_templates.CopyClass(cls1,cls_templates.FindClassByName('credit'),False,True);
    cls1.FindPropertyByName('guid').ValueS:= GenerateGUID;
    cls1.FindPropertyByName('create_date').ValueS:= DateToStr(Now);
    cls_periods.Save;
    InfoTimerForm.Execute('���������');
    TblUpdateCredits(tblCredits,cls_active_period.FindClassByName('credits'));
  end;
end;

procedure TMainForm.SpTBXButton55Click(Sender: TObject);
begin
  if Assigned(tblCredits.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      GetFMClassFromTable(tblCredits).ParentClass.DeleteClassItem(GetFMClassFromTable(tblCredits));
      tblCredits.DelRow(tblCredits.SelectedCell.Row);
      cls_periods.Save;
    end;
  end;
end;

procedure TMainForm.tblCreditsDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblCredits.SelectedCell) then
  begin
    cls1:= GetFMClassFromTable(tblCredits);
    cls_active_credit:= cls1;
    old_credit_info_oper_id:= op_credits;
    TblUpdateCreditInfo(cls1);
    ToggleOperation(op_credit_info);
  end;
end;

procedure TMainForm.TblUpdateCreditInfo(aClass: TFMClass);
begin
  SpTBXEdit18.Tag:= 1;

  cls_templates.CopyClass(aClass,cls_templates.FindClassByName('credit'),False,True);
  
  SpTBXCheckBox3.Checked:= aClass.FindPropertyByName('enabled').ValueB;

  SpTBXEdit18.Text:= aClass.FindPropertyByName('create_date').ValueS;
  SpTBXEdit20.Text:= IntToStr(aClass.FindPropertyByName('value').ValueI);
  SpTBXEdit19.Text:= aClass.FindPropertyByName('type_str').ValueS;
  SpTBXEdit21.Text:= aClass.FindPropertyByName('caption').ValueS;
  Memo11.Lines.Text:= aClass.FindPropertyByName('comments').ValueS;
  
  SpTBXEdit18.Tag:= 0;
end;

procedure TMainForm.SpTBXButton57Click(Sender: TObject);
begin
  ToggleOperation(old_credit_info_oper_id);
end;

procedure TMainForm.tblCreditTypesDblClickCell(Sender: TObject);
begin
  cls_active_credit.FindPropertyByName('type').ValueI:= GetFMClassFromTable(tblCreditTypes).FindPropertyByName('id').ValueI;
  cls_active_credit.FindPropertyByName('type_str').ValueS:= GetFMClassFromTable(tblCreditTypes).FindPropertyByName('caption').ValueS;
  SpTBXEdit19.Text:= cls_active_credit.FindPropertyByName('type_str').ValueS;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXCheckBox3Click(Sender: TObject);
begin
  if SpTBXEdit18.Tag = 1 then Exit;
  cls_active_credit.FindPropertyByName('enabled').ValueB:= SpTBXCheckBox3.Checked;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXButton58Click(Sender: TObject);
begin
    if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y+10) = mrOk then
      SpTBXEdit18.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXEdit18Change(Sender: TObject);
begin
  if SpTBXEdit18.Tag = 1 then Exit;
  cls_active_credit.FindPropertyByName('create_date').ValueS:= SpTBXEdit18.Text;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit20Change(Sender: TObject);
var i:Integer;
begin
  if SpTBXEdit18.Tag = 1 then Exit;
  if TryStrToInt(SpTBXEdit20.Text,i) then
    cls_active_credit.FindPropertyByName('value').ValueI:= i
  else
    cls_active_credit.FindPropertyByName('value').ValueI:= 0;
  cls_periods.Save;
end;

procedure TMainForm.SpTBXEdit21Change(Sender: TObject);
begin
  if SpTBXEdit18.Tag = 1 then Exit;
  cls_active_credit.FindPropertyByName('caption').ValueS:= SpTBXEdit21.Text;
  cls_periods.Save;
end;

procedure TMainForm.Memo11Change(Sender: TObject);
begin
  if SpTBXEdit18.Tag = 1 then Exit;
  cls_active_credit.FindPropertyByName('comments').ValueS:= Memo11.Lines.Text;
  cls_periods.Save;
end;

procedure TMainForm.TblUpdateDebCredBalance(aTable: TRRAdvTable;
  aClass: TFMClass);
var i,n,d_summ,c_summ,d_summ_all,c_summ_all:Integer;
    sel_cell:TRRCell;
    a_color:TColor;
    cls1:TFMClass;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  cls1:= aClass;
  d_summ:= 0; c_summ:= 0; d_summ_all:= 0; c_summ_all:= 0; 
  for n:= 1 to 2 do
  begin
    if n = 1 then aClass:= cls1.FindClassByName('debits');
    if n = 2 then aClass:= cls1.FindClassByName('credits');
    for i:= 0 to aClass.MyClassCount - 1 do
    begin
      aTable.CreateRowBlock(0);

      if n = 1 then a_color:= clBlack;
      if n = 2 then a_color:= clMaroon;

      if not aClass.MyClass[i].FindPropertyByName('enabled').ValueB then
        a_color:= $006E6E6F;

      aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
      aTable.Cell[1,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('create_date').ValueS;
      aTable.Cell[1,aTable.RowCount-1].Font.Color:= a_color;
      if n = 2 then
        aTable.Cell[2,aTable.RowCount-1].TextString:= '-';
      aTable.Cell[2,aTable.RowCount-1].TextString:= aTable.Cell[2,aTable.RowCount-1].TextString + IntToStr(aClass.MyClass[i].FindPropertyByName('value').ValueI) + ' �';
      aTable.Cell[2,aTable.RowCount-1].Font.Color:= a_color;
      aTable.Cell[3,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('type_str').ValueS;
      aTable.Cell[3,aTable.RowCount-1].Font.Color:= a_color;
      aTable.Cell[4,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('caption').ValueS;
      aTable.Cell[4,aTable.RowCount-1].Font.Color:= a_color;
      aTable.Cell[5,aTable.RowCount-1].TextSrings.Text:= aClass.MyClass[i].FindPropertyByName('comments').ValueS;
      aTable.Cell[5,aTable.RowCount-1].Font.Color:= a_color;

      if aClass.MyClass[i].FindPropertyByName('enabled').ValueB then
      begin
        if n = 1 then d_summ:= d_summ + aClass.MyClass[i].FindPropertyByName('value').ValueI;
        if n = 2 then c_summ:= c_summ + aClass.MyClass[i].FindPropertyByName('value').ValueI;
      end;
      if n = 1 then d_summ_all:= d_summ_all + aClass.MyClass[i].FindPropertyByName('value').ValueI;
      if n = 2 then c_summ_all:= c_summ_all + aClass.MyClass[i].FindPropertyByName('value').ValueI;
    end;
  end;

  aTable.CreateRowBlock(0);
  aTable.Cell[1,aTable.RowCount-1].HorzTextAlignment:= htaLeft;
  aTable.Cell[1,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[2,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[3,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[4,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[1,aTable.RowCount-1].TextString:= '�����';

  aTable.CreateRowBlock(0);
  aTable.Cell[1,aTable.RowCount-1].HorzTextAlignment:= htaRight;
  aTable.Cell[1,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[2,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[3,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[1,aTable.RowCount-1].TextString:= '������: ';
  aTable.Cell[5,aTable.RowCount-1].HorzTextAlignment:= htaCenter;
  aTable.Cell[5,aTable.RowCount-1].MyText:= IntToStr(d_summ) + ' (' + IntToStr(d_summ_all) + ')';

  aTable.CreateRowBlock(0);
  aTable.Cell[1,aTable.RowCount-1].HorzTextAlignment:= htaRight;
  aTable.Cell[1,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[2,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[3,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[1,aTable.RowCount-1].TextString:= '�������: ';
  aTable.Cell[5,aTable.RowCount-1].HorzTextAlignment:= htaCenter;
  aTable.Cell[5,aTable.RowCount-1].MyText:= IntToStr(c_summ) + ' (' + IntToStr(c_summ_all) + ')';

  aTable.CreateRowBlock(0);
  aTable.Cell[1,aTable.RowCount-1].HorzTextAlignment:= htaRight;
  aTable.Cell[1,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[2,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[3,aTable.RowCount-1].VERT_MERGING:= True;
  aTable.Cell[1,aTable.RowCount-1].TextString:= '����: ';
  aTable.Cell[5,aTable.RowCount-1].HorzTextAlignment:= htaCenter;
  aTable.Cell[5,aTable.RowCount-1].MyText:= IntToStr(d_summ - c_summ) + ' �' + ' (' + IntToStr(d_summ_all - c_summ_all) + ' �)';

  tblDCBalance.FixedCell[0].Visible:= False;

  aTable.EndUpdate;

  Application.ProcessMessages;

  SpTBXLabel67.Caption:= IntToStr(aTable.RowCount) + ' �������';

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton42Click(Sender: TObject);
begin
  TblUpdateDebCredBalance(tblDCBalance,GetFMClassFromTable(tblPeriods));
  ToggleOperation(op_deb_cred_balance);
end;

procedure TMainForm.tblDCBalanceDblClickCell(Sender: TObject);
var cls1,cls2,cls3:TFMClass;
    i:Integer;
begin
  if Assigned(tblDCBalance.SelectedCell) then
  begin
    if Assigned(GetFMClassFromTable(tblDCBalance)) then
    begin
      cls1:= GetFMClassFromTable(tblDCBalance);
      if cls1.ParentClass.SysName = 'debits' then
      begin
        cls_active_debit:= cls1;
        old_debit_info_oper_id:= op_deb_cred_balance;
        TblUpdateDebitInfo(cls1);
        ToggleOperation(op_debit_info);
      end;
      if cls1.ParentClass.SysName = 'credits' then
      begin
        cls_active_credit:= cls1;
        old_credit_info_oper_id:= op_deb_cred_balance;
        TblUpdateCreditInfo(cls1);
        ToggleOperation(op_credit_info);
      end;
    end;
  end;
end;

procedure TMainForm.SpTBXButton59Click(Sender: TObject);
begin
  TblUpdateDebCredBalance(tblDCBalance,GetFMClassFromTable(tblPeriods));
end;

procedure TMainForm.SpTBXButton60Click(Sender: TObject);
begin
  ToggleOperation(op_notes);
  tblNotesChangeSelectedCell(nil);
end;

procedure TMainForm.TblUpdateNotes(aTable: TRRAdvTable; aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[0,aTable.RowCount-1].TextString:= aClass.MyClass[i].FindPropertyByName('caption').ValueS;
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton62Click(Sender: TObject);
var cls1:TFMClass;
begin
  cls1:= cls_notes.FindClassByName('items').CreateClassItem('','');
  cls_templates.CopyClass(cls1,cls_templates.FindClassByName('note_block'),False,True);
  cls_notes.Save;
  TblUpdateNotes(tblNotes,cls_notes.FindClassByName('items'));
  tblNotes.SetSelectedCell(0,tblNotes.RowCount-1);
end;

procedure TMainForm.tblNotesAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'caption' then
  begin
    GetFMClassFromTable(tblNotes).FindPropertyByName('caption').ValueS:= aCell.TextString;
    cls_notes.Save;
  end;
end;

procedure TMainForm.tblNotesChangeSelectedCell(Sender: TObject);
begin
  if LockAllEventChangeSelCell then Exit;
  if Assigned(tblNotes.SelectedCell) then
  begin
    TblUpdateNoteItems(tblNoteItems,GetFMClassFromTable(tblNotes));
    ToggleOperation(op_note_items);
  end;
end;

procedure TMainForm.SpTBXButton61Click(Sender: TObject);
begin
  if Assigned(tblNotes.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      GetFMClassFromTable(tblNotes).ParentClass.DeleteClassItem(GetFMClassFromTable(tblNotes));
      tblNotes.DelRow(tblNotes.SelectedCell.Row);
      cls_notes.Save;
      ToggleOperation(op_notes);
    end;
  end;
end;

procedure TMainForm.SpTBXLabel75Click(Sender: TObject);
begin
  TblUpdateNotes(tblNotes,cls_notes.FindClassByName('items'));
end;

procedure TMainForm.TblUpdateNoteItems(aTable: TRRAdvTable;
  aClass: TFMClass);
var i:Integer;
    sel_cell:TRRCell;
begin
  aTable.BeginUpdate;
  aTable.ClearRows;

  aTable.LockEventChangeSelCell:= True;

  sel_cell:= nil;

  for i:= 0 to aClass.MyClassCount - 1 do
  begin
    aTable.CreateRowBlock(0);
    aTable.Cell[0,aTable.RowCount-1].Data1:= aClass.MyClass[i];
    aTable.Cell[0,aTable.RowCount-1].TextSrings.Text:= aClass.MyClass[i].FindPropertyByName('text').ValueS;
  end;

  aTable.EndUpdate;

  Application.ProcessMessages;

  if Assigned(sel_cell) then
    aTable.SetSelectedCell(sel_cell.Col,sel_cell.Row)
  else
    aTable.SetSelectedCell(-1,-1);

  SpTBXLabel77.Caption:= IntToStr(aTable.RowCount) + ' �������';

  aTable.LockEventChangeSelCell:= False;
end;

procedure TMainForm.SpTBXButton65Click(Sender: TObject);
var cls1,cls2:TFMClass;
begin
  if Assigned(tblNotes.SelectedCell) then
  begin
    cls1:= GetFMClassFromTable(tblNotes).CreateClassItem('','');
    cls_templates.CopyClass(cls1,cls_templates.FindClassByName('note_item'),False,True);
    cls_notes.Save;
    TblUpdateNoteItems(tblNoteItems,GetFMClassFromTable(tblNotes));
  end;
end;

procedure TMainForm.tblNoteItemsAfterCellEdit(aCell: TRRCell);
begin
  if aCell.MyTag = 'caption' then
  begin
    GetFMClassFromTable(tblNoteItems).FindPropertyByName('text').ValueS:= aCell.TextSrings.Text;
    cls_notes.Save;
  end;
end;

procedure TMainForm.SpTBXButton64Click(Sender: TObject);
begin
  if Assigned(tblNoteItems.SelectedCell) then
  begin
    if MessageBox(Application.Handle,'����������� �������� !!!','�������������',MB_OKCANCEL OR MB_ICONQUESTION) = ID_OK then
    begin
      GetFMClassFromTable(tblNoteItems).ParentClass.DeleteClassItem(GetFMClassFromTable(tblNoteItems));
      tblNoteItems.DelRow(tblNoteItems.SelectedCell.Row);
      cls_notes.Save;
    end;
  end;
end;

procedure TMainForm.Memo12Change(Sender: TObject);
begin
  cls_active_ticket.FindPropertyByName('Price1').ValueS:= Memo12.Text;
  cls_data.Save;
end;

procedure TMainForm.SpTBXTabControl1ActiveTabChange(Sender: TObject;
  TabIndex: Integer);
begin
  case SpTBXTabControl1.ActiveTabIndex of
    0:
    begin
      tblFindedChangeSelectedCell(nil);
    end;
    1:
    begin
      tblFavorChangeSelectedCell(nil);
    end;
  end
end;

procedure TMainForm.SpTBXButton63Click(Sender: TObject);
begin
  tblPeriodsChangeSelectedCell(nil);
end;

procedure TMainForm.SpTBXButton67Click(Sender: TObject);
begin
  SpTBXEdit1.Text:= '500';
end;

procedure TMainForm.SpTBXButton68Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '100';
end;

procedure TMainForm.SpTBXButton69Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '200';
end;

procedure TMainForm.SpTBXButton70Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '300';
end;

procedure TMainForm.SpTBXButton71Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '400';
end;

procedure TMainForm.SpTBXButton72Click(Sender: TObject);
begin
  SpTBXEdit2.Text:= '500';
end;

procedure TMainForm.Init;
var cls1:TFMClass;
begin
  inherited;

  cur_session:= GenerateGUID;

  FileModLibName:= ExtractFilePath(Application.ExeName) + FileModLibName;
  if not InitFM then
  begin
    MessageBox(Application.Handle,PChar('�� ������ ���� �� ����������� ����������' +  '(file_mod_dll.dll).' + #13 + '���������� ����� �������'),PChar('������'), MB_OK	 OR MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;
  SkinManager.SetSkin('Xito');

  SpTBXTabControl1.ActiveTabIndex:= 0;

  curr_sel_cell_value:= '';
  LockAllEventChangeSelCell:= False;

  act_cls_block_favor:= nil;
  cls_active_ticket:= nil;
  cls_active_period:= nil;
  cls_active_debit:= nil;
  cls_active_credit:= nil;

  cls_templates:= TFMClass.Create(Self);
  cls_templates.FileName:= AppDir + 'templates.dat';
  cls_templates.Open;

  app_sett:= TFMClass.Create(Self);
  app_sett.FileName:= AppDir + 'transpo.dat';
  app_sett.Open;
  app_sett.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('app_sett');
  cls1.CopyClass(app_sett,cls1,False,True);

  cls_geos:= TFMClass.Create(Self);
  cls_geos.FileName:= AppDir + 'data\geos.dat';
  cls_geos.Open;
  cls_geos.FileType:= ftFullText;
  cls_geos.ClassSortType:= stAlpha;

  cls_data:= TFMClass.Create(Self);
  cls_data.FileName:= AppDir + 'data\data.dat';
  cls_data.Open;
  cls_data.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('data_file');
  cls1.CopyClass(cls_data,cls1,False,True);

  cls_periods:= TFMClass.Create(Self);
  cls_periods.FileName:= AppDir + 'data\periods.dat';
  cls_periods.Open;
  cls_periods.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('periods_file');
  cls1.CopyClass(cls_periods,cls1,False,True);

  cls_notes:= TFMClass.Create(Self);
  cls_notes.FileName:= AppDir + 'data\notes.dat';
  cls_notes.Open;
  cls_notes.FileType:= ftFullText;

  cls1:= cls_templates.FindClassByName('notes_file');
  cls1.CopyClass(cls_notes,cls1,False,True);

  cls_params:= TFMClass.Create(Self);
  cls_params.FileName:= AppDir + 'data\params.dat';
  cls_params.Open;
  cls_params.FileType:= ftFullText;
  cls_templates.CopyClass(cls_params,cls_templates.FindClassByName('app_params'),False,True);

  ToggleOperation(op_none);

  tblATIFromGeo.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIFromGeo.Open;
  tblATIToGeo.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIToGeo.Open;
  tblATIGeos.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\geos.tbl';
  tblATIGeos.Open;

  tblFinded.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\blocks.tbl';
  tblFinded.Options.ForceNullSelecting:= False;
  tblFinded.Open;

  tblFavor.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\blocks.tbl';
  tblFavor.Options.ForceNullSelecting:= False;
  tblFavor.Open;

  tblFindedTickets.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\tickets.tbl';
  tblFindedTickets.Options.ForceNullSelecting:= False;
  tblFindedTickets.Open;

  tblFavorTickets.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\tickets.tbl';
  tblFavorTickets.Options.ForceNullSelecting:= False;
  tblFavorTickets.Open;

  tblTicketStatuses.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\statuses.tbl';
  tblTicketStatuses.Options.ForceNullSelecting:= False;
  tblTicketStatuses.Open;

  tblPeriods.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\blocks.tbl';
  tblPeriods.Options.ForceNullSelecting:= False;
  tblPeriods.Open;

  tblDebits.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\debits.tbl';
  tblDebits.Options.ForceNullSelecting:= False;
  tblDebits.Open;

  tblDebitTypes.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\stditems.tbl';
  tblDebitTypes.Options.ForceNullSelecting:= False;
  tblDebitTypes.Open;

  tblSettlTypes.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\stditems.tbl';
  tblSettlTypes.Options.ForceNullSelecting:= False;
  tblSettlTypes.Open;

  tblCardTypes.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\stditems.tbl';
  tblCardTypes.Options.ForceNullSelecting:= False;
  tblCardTypes.Open;

  tblCredits.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\debits.tbl';
  tblCredits.Options.ForceNullSelecting:= False;
  tblCredits.Open;

  tblCreditTypes.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\stditems.tbl';
  tblCreditTypes.Options.ForceNullSelecting:= False;
  tblCreditTypes.Open;

  tblDCBalance.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\debits.tbl';
  tblDCBalance.Options.ForceNullSelecting:= False;
  tblDCBalance.Open;

  tblNotes.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\notes.tbl';
  tblNotes.Options.ForceNullSelecting:= False;
  tblNotes.Open;

  tblNoteItems.TemplateFile:= ExtractFilePath(Application.ExeName) + 'tbl\note_items.tbl';
  tblNoteItems.Options.ForceNullSelecting:= False;
  tblNoteItems.Open;

  SetActivePeriod;

  TblUpdateGeos(tblATIGeos,cls_geos);
  TblUpdateBlocks(tblFinded,cls_data.FindClassByName('blocks').FindClassByName('finded'));
  TblUpdateBlocks(tblFavor,cls_data.FindClassByName('blocks').FindClassByName('favor'));
  TblUpdateTicketStatuses(tblTicketStatuses,cls_templates.FindClassByName('ticket_statuses'));
  TblUpdatePeriods(tblPeriods,cls_periods.FindClassByName('periods'));
  TblUpdateStdItemsTable(tblDebitTypes,cls_templates.FindClassByName('debit_types'));
  TblUpdateStdItemsTable(tblSettlTypes,cls_templates.FindClassByName('settlem_types'));
  TblUpdateStdItemsTable(tblCardTypes,cls_templates.FindClassByName('card_types'));
  TblUpdateStdItemsTable(tblCreditTypes,cls_templates.FindClassByName('credit_types'));
  TblUpdateNotes(tblNotes,cls_notes.FindClassByName('items'));
  UpdateATI_f_Params;
  UpdateLogisticOne_f_Params;


  ati_service:= TATI.Create(Self);
  {$IFDEF _IE}
  ati_service.init(app_sett.FindClassByName('ati').FindPropertyByName('login').ValueS,app_sett.FindClassByName('ati').FindPropertyByName('passw').ValueS);
  ati_service.InsertControl(ati_service.wb);
  ati_service.wb.Align:= alNone;
  ati_service.wb.Width:= 0;
  ati_service.wb.Height:= 0;
  {$ELSE}
  ati_service.SetChromium(Browser.Chromium1);
  ati_service.Set_Chromium(Browser.Chromium2);
  ati_service.PaintBox:= Browser.PaintBox;
  ati_service._idHTTP:= Browser.IdHTTP1;
  ati_service.login_s:= app_sett.FindClassByName('ati').FindPropertyByName('login').ValueS;
  ati_service.passw_s:= app_sett.FindClassByName('ati').FindPropertyByName('passw').ValueS;
  {$ENDIF}

  logisticone:= TLogisticOne.Create(Self);
  logisticone.OnOperProgress:= DoOperProgress;
  logisticone.OnEndOperProgress:= DoEndOperProgress;

  bp_service_enabled:= False;

  IdSMTP1.Host:= app_sett.FindClassByName('email').FindClassByName('mail_center').FindPropertyByName('smtp_host').ValueS;
  IdSMTP1.Username:= app_sett.FindClassByName('email').FindClassByName('mail_center').FindPropertyByName('user').ValueS;
  IdSMTP1.Password:= app_sett.FindClassByName('email').FindClassByName('mail_center').FindPropertyByName('passw').ValueS;

  IdPOP1.Host:= app_sett.FindClassByName('email').FindClassByName('mail_center').FindPropertyByName('pop_host').ValueS;
  IdPOP1.Username:= app_sett.FindClassByName('email').FindClassByName('mail_center').FindPropertyByName('pop_user').ValueS;
  IdPOP1.Password:= app_sett.FindClassByName('email').FindClassByName('mail_center').FindPropertyByName('pop_passw').ValueS;

  FreeAndNil(SplashForm);
end;

procedure TMainForm.SpTBXButton73Click(Sender: TObject);
begin
  DoOperProgress('','');
  DoOperSub1Progress('���������� �������','');
  logisticone.IndexingGeosFromWays;
end;

procedure TMainForm.SpTBXButton28Click(Sender: TObject);
begin
  ToggleOperation(op_logistic_one);
end;

procedure TMainForm.DoEndOperProgress(Stage1, Stage2: String);
begin
  DoOperSub1Progress('','');
end;

procedure TMainForm.SpTBXButton74Click(Sender: TObject);
begin
  SendMail(cls_active_ticket.FindPropertyByName('FromGeo').ValueS + '-' + cls_active_ticket.FindPropertyByName('ToGeo').ValueS,
            GetTicketMailText(cls_active_ticket,SpTBXCheckBox4.Checked));
end;

function TMainForm.GetTicketMailText(aTicket: TFMClass;ShortView:Boolean): String;
var s1,s,s2:String;
    ds:Char;
    k:Integer;
    f1:Single;
begin
  ds:= DecimalSeparator;
  DecimalSeparator:= '.';

  if not ShortView then
  begin
    s:= '';

    if TryStrToFloat(aTicket.FindPropertyByName('Price1').ValueS,f1) then
        if aTicket.FindPropertyByName('DistI').ValueI > 0 then
          s:= '(' + FloatToStrF(f1/aTicket.FindPropertyByName('DistI').ValueI,fffixed,10,1) + ' �/��)';

    s2:= '';
    if aTicket.FindPropertyByName('Weight').ValueF > 0 then
    begin
      s1:= FloatToStrF(aTicket.FindPropertyByName('Weight').ValueF,fffixed,10,1);
      s1:= DelSymb(s1,'.0');
      s2:= s2 + ' ' + s1;
    end
    else
      s2:= s2 + ' --';

    if aTicket.FindPropertyByName('Volume').ValueF > 0 then
    begin
      s1:= FloatToStrF(aTicket.FindPropertyByName('Volume').ValueF,fffixed,10,1);
      s1:= DelSymb(s1,'.0');
      s2:= s2 + '/' + s1;
    end
    else
      s2:= s2 + '/--';

    Result:= aTicket.FindPropertyByName('DateDesc').ValueS + '  ' + aTicket.FindPropertyByName('Price1').ValueS + '  ' + s + '  ' + aTicket.FindPropertyByName('FromGeo').ValueS + ' (' + aTicket.FindPropertyByName('FromGeoDesc1').ValueS + ')' +
             ' - ' + aTicket.FindPropertyByName('ToGeo').ValueS + ' (' + aTicket.FindPropertyByName('ToGeoDesc1').ValueS + ')' +
             '  ' + aTicket.FindPropertyByName('Dist').ValueS + '  ' + s2 + '  ' + aTicket.FindPropertyByName('CargoDesc').ValueS  + '  (' + aTicket.FindPropertyByName('ControllerInfo').ValueS + ')   ' +
              '(����.: ' + aTicket.FindPropertyByName('Note').ValueS + ')';
    if aTicket.FindClassByName('controller_contacts').MyClassCount > 0 then
      Result:= Result + '  (' + aTicket.FindClassByName('controller_contacts').MyClass[aTicket.FindClassByName('controller_contacts').MyClassCount-1].FindPropertyByName('Str1').ValueS + ')';
  end
  else
  begin
    Result:= aTicket.FindPropertyByName('DateDesc').ValueS + ' ' + aTicket.FindPropertyByName('FromGeo').ValueS + ' - ' + aTicket.FindPropertyByName('ToGeo').ValueS;

    if aTicket.FindPropertyByName('Weight').ValueF > 0 then
    begin
      s1:= FloatToStrF(aTicket.FindPropertyByName('Weight').ValueF,fffixed,10,1);
      s1:= DelSymb(s1,'.0');
      Result:= Result + ' ' + s1;
    end
    else
      Result:= Result + ' --';
    if aTicket.FindPropertyByName('Volume').ValueF > 0 then
    begin
      s1:= FloatToStrF(aTicket.FindPropertyByName('Volume').ValueF,fffixed,10,1);
      s1:= DelSymb(s1,'.0');
      Result:= Result + '/' + s1;
    end
    else
      Result:= Result + '/--';

    Result:= Result + ' ' + aTicket.FindPropertyByName('CargoName').ValueS;
    Result:= Result + ' ' + aTicket.FindPropertyByName('Price1').ValueS + ' �.';

    s:= AnsiUpperCase(aTicket.FindPropertyByName('ControllerInfo').ValueS);
    k:= GetFirstChar(s,'ID:',1,False,s1);
    if k > 0 then
    begin
      k:= GetFirstUnDigitalChar(s,k+3,s1);
      Result:= Result + ' ID:' + s1;
    end
    else
      Result:= Result + ' ID: ---';
    if aTicket.FindClassByName('controller_contacts').MyClassCount > 0 then
      Result:= Result + '  (' + aTicket.FindClassByName('controller_contacts').MyClass[aTicket.FindClassByName('controller_contacts').MyClassCount-1].FindPropertyByName('Str1').ValueS + ')';
  end;

  DecimalSeparator:= ds;
end;

procedure TMainForm.DoMessageInitializeISO(var VHeaderEncoding: Char; var VCharSet: string);
begin
  VHeaderEncoding := 'B';
  //VCharSet:='windows-1251';
  VCharSet := 'idcs_UTF_8';//IdCharsetNames[idcs_UTF_8];
end;

procedure TMainForm.SpTBXButton75Click(Sender: TObject);
var i:Integer;
    f1:Single;
    dt:TDateTime;
begin
  logisticone.stopped:= False;

  if TryStrToInt(SpTBXEdit22.Text,i) then
    logisticone.tmPass.Interval:= i*60*1000
  else
    logisticone.tmPass.Interval:= 30*60*1000;

  logisticone.WorkMode:= logistic_one.TWorkMode(SpTBXComboBox1.ItemIndex);

  logisticone.FromGeo:= SpTBXEdit23.Text;
  app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromGeo').ValueS:= logisticone.FromGeo;

  logisticone.ToGeo:= SpTBXEdit24.Text;
  app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('ToGeo').ValueS:= logisticone.ToGeo;

  if TryStrToFloat(SpTBXEdit25.Text,f1) then
    logisticone.Weight:= f1
  else
    logisticone.Weight:= 0;

  app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('WeightEnd').ValueI:= Round(logisticone.Weight);

  if TryStrToFloat(SpTBXEdit26.Text,f1) then
    logisticone.Volume:= f1
  else
    logisticone.Volume:= 0;

  app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('VolumeEnd').ValueI:= Round(logisticone.Volume);

  if TryStrToInt(SpTBXEdit27.Text,i) then
    logisticone.from_radius1:= i
  else
    logisticone.from_radius1:= 200;

  app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromRadius1').ValueI:= logisticone.from_radius1;

  if TryStrToInt(SpTBXEdit28.Text,i) then
    logisticone.from_radius2:= i
  else
    logisticone.from_radius2:= 100;

  app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromRadius2').ValueI:= logisticone.from_radius2;

  if TryStrToDate(SpTBXEdit29.Text,dt) then
  begin
    logisticone.DateBegin:= dt;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateBegin').ValueS:= SpTBXEdit29.Text;
  end
  else
    logisticone.DateBegin:= 0;

  if TryStrToDate(SpTBXEdit30.Text,dt) then
  begin
    logisticone.DateEnd:= dt;
    app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateEnd').ValueS:= SpTBXEdit30.Text;
  end
  else
    logisticone.DateEnd:= 0;

  app_sett.Save;

  logisticone.Pass;
end;

procedure TMainForm.SpTBXButton76Click(Sender: TObject);
begin
  logisticone.Stop;
end;

procedure TMainForm.SpTBXButton77Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y-CalendarWizard.spMainForm.Height) = mrOk then
    SpTBXEdit29.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.SpTBXButton78Click(Sender: TObject);
begin
  if CalendarWizard.Execute(Mouse.CursorPos.X-CalendarWizard.spMainForm.Width,Mouse.CursorPos.Y-CalendarWizard.spMainForm.Height) = mrOk then
    SpTBXEdit30.Text:= DateToStr(CalendarWizard.Result);
end;

procedure TMainForm.UpdateLogisticOne_f_Params;
begin
  SpTBXEdit23.Text:= app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromGeo').ValueS;

  SpTBXEdit24.Text:= app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('ToGeo').ValueS;

  if app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('WeightEnd').ValueI > 0 then
    SpTBXEdit25.Text:= IntToStr(app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('WeightEnd').ValueI);

  if app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('VolumeEnd').ValueI > 0 then
    SpTBXEdit26.Text:= IntToStr(app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('VolumeEnd').ValueI);

  if app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromRadius1').ValueI >= 0 then
    SpTBXEdit27.Text:= IntToStr(app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromRadius1').ValueI);

  if app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromRadius2').ValueI >= 0 then
    SpTBXEdit28.Text:= IntToStr(app_sett.FindClassByName('logistic_one_f_params').FindPropertyByName('FromRadius2').ValueI);

  if Length(app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateBegin').ValueS) > 0 then
    SpTBXEdit29.Text:= app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateBegin').ValueS;

  if Length(app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateEnd').ValueS) > 0 then
    SpTBXEdit30.Text:= app_sett.FindClassByName('ati_f_params').FindPropertyByName('DateEnd').ValueS;
end;

procedure TMainForm.Memo13Change(Sender: TObject);
var i:Integer;
begin
  if TryStrToInt(Memo13.Text,i) then
    cls_active_ticket.FindPropertyByName('DistI').ValueI:= i;
  cls_data.Save;
end;

procedure TMainForm.DoEndGetContacts(Sender: TObject);
var i:Integer;
begin
  cls_data.Save;
  DoOperSub1Progress('','');
  Memo14.Clear;
  for i:= 0 to cls_active_ticket.FindClassByName('controller_mails').MyClassCount - 1 do
  begin
    Memo14.Lines.Add(cls_active_ticket.FindClassByName('controller_mails').MyClass[i].FindPropertyByName('Str1').ValueS);
  end;
end;

procedure TMainForm.SpTBXButton79Click(Sender: TObject);
begin
  ati_service.OnAutorizCode:= DoATIAutorizCode;
  ati_service.OnCaptcha:= DoATICaptcha;
  ati_service.OnOperProgress:= DoOperProgress;
  ati_service.OnEndGetTickets:= DoEndGetContacts;
  cls_active_ticket.FindClassByName('controller_mails').Close;
  ati_service.GetContacts(cls_active_ticket);
end;

procedure TMainForm.SpTBXButton80Click(Sender: TObject);
begin
  SpTBXEdit31.Text:= '';
end;

procedure TMainForm.StartBPService;
begin
  last_capcha:= 0;
  ati_service.OnEndGetTickets:= DoEndBPServiceUpdate;
  cls_bp_service_file:= TFMClass.Create(Self);
  cls_bp_service_file.FileName:= AppDir + 'bp_service.dat';
  cls_bp_service_file.Open;
  cls_templates.CopyClass(cls_bp_service_file,cls_templates.FindClassByName('bp_service_file'),False,True);
  bp_service_enabled:= True;
  SpTBXButton26Click(nil);
end;

procedure TMainForm.StopBPService;
begin
  tmBPService.Enabled:= False;
  bp_service_enabled:= False;
  FreeAndNil(cls_bp_service_file);
end;

procedure TMainForm.SpTBXButton81Click(Sender: TObject);
begin
  if not bp_service_enabled then
    StartBPService;
end;

procedure TMainForm.SpTBXButton82Click(Sender: TObject);
begin
  if bp_service_enabled then
    StopBPService;
end;

procedure TMainForm.DoEndBPServiceUpdate(Sender: TObject);
  function CheckBPServItem(aID:String):Boolean;
  var cls1,cls2:TFMClass;
      i:Integer;
  begin
    Result:= False;
    cls1:= cls_bp_service_file.FindClassByName('sending_items');
    for i:= 0 to cls1.MyClassCount - 1 do
    begin
      cls2:= cls1.MyClass[i];
      if cls2.FindPropertyByName('id').ValueS = aID then
      begin
        Result:= True;
        Break;
      end;
    end;
  end;
var i,_count:Integer;
    cls1,cls2,cls3:TFMClass;
    _text:String;
begin
  DoEndGetTickets(nil);

  bp_service_last_update:= DateTimeToStr(Now);
  
  _text:= '';
  cls1:= ati_service.GetTickResult.FindClassByName('items');
  _count:= 0;
  for i:= 0 to cls1.MyClassCount - 1 do
  begin
    cls2:= cls1.MyClass[i];
    if not CheckBPServItem(cls2.FindPropertyByName('ID').ValueS) then
    begin
      cls3:= cls_bp_service_file.FindClassByName('sending_items').CreateClassItem('','');
      cls_templates.CopyClass(cls3,cls_templates.FindClassByName('bp_service_send_item'),False,True);
      cls3.FindPropertyByName('id').ValueS:= cls2.FindPropertyByName('ID').ValueS;
      if Length(_text) > 0 then
        _text:= _text + #$A + #$D + #$A + #$D;
      _text:= _text + GetTicketMailText(cls2,False);
      Inc(_count);
    end;
  end;
  
  if _count > 0 then
    SendMail(TimeToStr(Now) + ' ' + IntToStr(_count) + ' items',_text);
    
  cls_bp_service_file.Save;

  if TryStrToInt(SpTBXEdit32.Text,i) then
    tmBPService.Interval:= i*60*1000
  else
    tmBPService.Interval:= 10*60*1000;

  Application.ProcessMessages;
  ATIGetTickets(-1,-1);
end;

procedure TMainForm.tmBPServiceTimer(Sender: TObject);
begin
  tmBPService.Enabled:= False;
  SpTBXButton26Click(nil);
end;

procedure TMainForm.SendMail(aSubject, aText: String);
var aMessage:TIdMessage;
begin                         
  try
  aMessage:= TIdMessage.Create(nil);
  aMessage.OnInitializeISO:= DoMessageInitializeISO;
  aMessage.From.Text:= app_sett.FindClassByName('email').FindClassByName('mail_center').FindPropertyByName('from').ValueS;
  aMessage.Subject:= aSubject;
  aMessage.Recipients.EMailAddresses:= 'gr-s@mail.ru';
  aMessage.Body.Text:= aText;
  aMessage.CharSet:= 'windows-1251';
  aMessage.IsEncoded:= True;
  IdSMTP1.Connect;
  IdSMTP1.Send(aMessage);
  IdSMTP1.Disconnect;
  except
  end;
end;

procedure TMainForm.GetMail;
var sl:TStringList;
    i,n,k:Integer;
    s,s1:String;
    aMessage:TIdMessage;
begin
  sl:= TStringList.Create;
  IdPOP1.Connect;
  for i:= 1 to IdPOP1.CheckMessages do
  begin
    aMessage:= TIdMessage.Create(nil);
    sl.Clear;
    IdPOP1.Retrieve(i,aMessage);
    if AnsiLowerCase(aMessage.Subject) = 'cmd' then
    begin
      for n:= 0 to aMessage.MessageParts.Count - 1 do
      begin
        if aMessage.MessageParts.Items[n].PartType = mptText then
          s:= s + TIdText(aMessage.MessageParts.Items[n]).Body.Text;
      end;
      sl.Text:= s;
    end;
    FreeAndNil(aMessage);
    //IdPOP1.Delete(i);
    while False do
    begin
      s:= AnsiLowerCase(sl.Strings[n]);
      s:= Trim(s);
      if Copy(s,1,3) = 'cmd' then
      begin
        Delete(s,1,3);
        s:= Trim(s);
        k:= GetFirstChar(s,' ',1,False,s1);
        if k > 0 then
        begin
          if s1 = 'bp' then
          begin
            s:= Trim(s);
            k:= GetFirstChar(s,' ',1,False,s1);
            if s1 = 'start' then
              if not bp_service_enabled then
                StartBPService;
            if s1 = 'stop' then
              if bp_service_enabled then
                StopBPService;
          end;
        end;
      end;
    end;
  end;
  IdPOP1.Disconnect;
end;

end.

