unit transpo_classes;

interface
uses rrfile_mod_api;

var

  cur_session:String;

  app_sett:TFMClass;
  cls_templates:TFMClass;

  cls_geos:TFMClass;
  cls_data:TFMClass;
  cls_periods:TFMClass;
  cls_notes:TFMClass;

const
  op_none:Integer = 0;
  op_ati:Integer = 10;
  op_ati_get_ticks:Integer = 20;
  op_finded_ticks:Integer = 30;
  op_favor_ticks:Integer = 40;
  op_ticket_info:Integer = 50;
  op_per_menu:Integer = 60;
  op_per_info:Integer = 70;
  op_debits:Integer = 80;
  op_debit_info:Integer = 90;
  op_credits:Integer = 100;
  op_credit_info:Integer = 110;
  op_deb_cred_balance:Integer = 120;
  op_notes:Integer = 130;
  op_note_items:Integer = 140;

implementation

end.
