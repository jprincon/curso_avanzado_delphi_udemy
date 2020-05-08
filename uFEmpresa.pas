unit uFEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFEmpresa = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edEmpresa: TEdit;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    procedure sbGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FNombreEmpresa: string;
    FCreoEmpresa: boolean;
    FAccion: String;
    procedure setNombreEmpresa(const Value: string);
    procedure setCreoEmpresa(const Value: boolean);
    procedure setAccion(const Value: String);
    { Private declarations }
  public
    property NombreEmpresa: string read FNombreEmpresa write setNombreEmpresa;
    property CreoEmpresa: boolean read FCreoEmpresa write setCreoEmpresa;
    property Accion: String read FAccion write setAccion;
  end;

var
  FEmpresa: TFEmpresa;

implementation

{$R *.dfm}
{ TFEmpresa }

procedure TFEmpresa.FormShow(Sender: TObject);
begin
  { Configurar todas las propiedades }
  FCreoEmpresa := False;
  FNombreEmpresa := '';

  { Determinar el tipo de la acción }
  if FAccion = 'Editar' then
  begin
    { Ejecutar un código }
  end
  else
  begin
    edEmpresa.Text := '';
  end;
end;

procedure TFEmpresa.sbGuardarClick(Sender: TObject);
begin
  FNombreEmpresa := edEmpresa.Text;
  FCreoEmpresa := True;
  close;
end;

procedure TFEmpresa.setAccion(const Value: String);
begin
  FAccion := Value;
end;

procedure TFEmpresa.setCreoEmpresa(const Value: boolean);
begin
  FCreoEmpresa := Value;
end;

procedure TFEmpresa.setNombreEmpresa(const Value: string);
begin
  FNombreEmpresa := Value;
  edEmpresa.Text := Value;
end;

end.
