unit logistic_one;

interface

uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api,
     OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, IEAddress,  Mshtml_Ewb, ExtCtrls, Controls,
     GRUtils, GRString;

type

  TLogisticOne = class(TComponent)
  private

  protected

  public

    constructor Create(AOwner: TComponent);
    destructor Destroy;override;
  end;

var
  logisticone:TLogisticOne;

implementation

{ TLogisticOne }

constructor TLogisticOne.Create(AOwner: TComponent);
begin

end;

destructor TLogisticOne.Destroy;
begin

  inherited;
end;

end.
