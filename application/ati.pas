unit ati;

interface
uses Classes, Contnrs, TypInfo, SysUtils, Forms, Dialogs, Windows, transpo_classes, rrfile_mod_api;

type

  TATI = class(TComponent)
  private

  protected

  public
    procedure Init();

    constructor Create(AOwner: TComponent);
    destructor Destroy;override;
  end;

var
  ati_service:TATI;

implementation

{ TATI }


{ TATI }

constructor TATI.Create(AOwner: TComponent);
begin

end;

destructor TATI.Destroy;
begin

  inherited;
end;

procedure TATI.Init;
begin

end;

end.
