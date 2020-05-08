program Gestor_de_Empresas;

uses
  Vcl.Forms,
  uFGestorEmpresas in 'uFGestorEmpresas.pas' {FGestorEmpresa},
  uFEmpresa in 'uFEmpresa.pas' {FEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFGestorEmpresa, FGestorEmpresa);
  Application.CreateForm(TFEmpresa, FEmpresa);
  Application.Run;
end.
