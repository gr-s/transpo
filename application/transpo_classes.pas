unit transpo_classes;

interface
uses rrfile_mod_api;

type
  TDebitPrognosParams = record
    distance:Single;
    fuel_consumption:Single;
    fuel_price:Single;
    day_range:Single;
    day_credits:Single;
  end;

var

  cur_session:String;

  app_sett:TFMClass;
  cls_templates:TFMClass;

  cls_params:TFMClass;
  cls_geos:TFMClass;
  cls_data:TFMClass;
  cls_periods:TFMClass;
  cls_notes:TFMClass;

  function CalcDebitPrognosis(DPP:TDebitPrognosParams):Single;

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
  op_logistic_one:Integer = 150;

implementation

function CalcDebitPrognosis(DPP:TDebitPrognosParams):Single;
var count_days:Single;
begin
  DPP.fuel_consumption:= cls_params.FindPropertyByName('truck_fuel_cons').ValueF;
  DPP.fuel_price:= cls_params.FindPropertyByName('fuel_price').ValueF;
  DPP.day_range:= cls_params.FindPropertyByName('day_range').ValueF;
  DPP.day_credits:= cls_params.FindPropertyByName('day_credits').ValueF;
  count_days:= DPP.distance/DPP.day_range;
  Result:= (DPP.distance/100) * DPP.fuel_consumption * DPP.fuel_price;
  Result:= Result + (count_days * DPP.day_credits);  
end;

end.
