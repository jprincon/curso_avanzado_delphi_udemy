program Gestor_de_Empresas;

uses
  Vcl.Forms,
  uFGestorEmpresas in 'uFGestorEmpresas.pas' {FGestorEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFGestorEmpresa, FGestorEmpresa);
  Application.Run;
end.
