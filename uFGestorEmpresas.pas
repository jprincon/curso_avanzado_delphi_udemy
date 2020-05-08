unit uFGestorEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXPanels,

  {Librerias de nuestra aplicación}
  uFEmpresa;

type
  TFGestorEmpresa = class(TForm)
    MenuPrincipal1: TMainMenu;
    Archivo1: TMenuItem;
    Acercade1: TMenuItem;
    Autor1: TMenuItem;
    MenuPrincipal2: TPageControl;
    TabArchivo: TTabSheet;
    TabAcerca: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    sbNuevaEmpresa: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    sbAutor: TSpeedButton;
    BarraEstado: TStatusBar;
    MenuLateral: TPageControl;
    TabMenu: TTabSheet;
    tvMenuLateral: TTreeView;
    Contenido: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    Card3: TCard;
    lbEmpresa: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btEditar: TButton;
    procedure Autor1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvMenuLateralClick(Sender: TObject);
    procedure sbNuevaEmpresaClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MENU_CARD1 = 'Card 1';
  MENU_CARD2 = 'Card 2';
  MENU_CARD3 = 'Card 3';

var
  FGestorEmpresa: TFGestorEmpresa;

implementation

{$R *.dfm}

procedure TFGestorEmpresa.Autor1Click(Sender: TObject);
begin
  ShowMessage
    ('Esta aplicación fue desarrollada por: Julián Andrés Rincón Penagos');
end;

{ Cuando se lanza la aplicación }
procedure TFGestorEmpresa.btEditarClick(Sender: TObject);
begin
  { Enviar parámetros }
  FEmpresa.NombreEmpresa := lbEmpresa.Caption;
  FEmpresa.Accion := 'Editar';
  FEmpresa.ShowModal;

  { Espera ... }
  if FEmpresa.CreoEmpresa then
  begin
    ShowMessage(FEmpresa.NombreEmpresa);
    lbEmpresa.Caption := FEmpresa.NombreEmpresa;
  end;
end;

procedure TFGestorEmpresa.FormCreate(Sender: TObject);
begin
  BarraEstado.Panels[3].Text := 'Gestor de Empresas';

  { Prueba }
  tvMenuLateral.Items.Add(nil, MENU_CARD1);
  tvMenuLateral.Items.Add(nil, MENU_CARD2);
  tvMenuLateral.Items.Add(nil, MENU_CARD3);

  { Iniciar en el card 1 }
  Contenido.ActiveCard := Card1;
end;

procedure TFGestorEmpresa.sbNuevaEmpresaClick(Sender: TObject);
begin
  { Enviar parámetros }
  FEmpresa.Accion := 'Crear';
  FEmpresa.ShowModal;

  { Espera ... }
  if FEmpresa.CreoEmpresa then
  begin
    ShowMessage(FEmpresa.NombreEmpresa);
    lbEmpresa.Caption := FEmpresa.NombreEmpresa;
  end;
end;

{ Evento para crear una empresa }
procedure TFGestorEmpresa.tvMenuLateralClick(Sender: TObject);
begin
  if tvMenuLateral.Selected <> nil then
  begin

    { Si el item seleccionado es el menú 1 - dirige a la tarjeta 1 }
    if tvMenuLateral.Selected.Text = MENU_CARD1 then
    begin
      Contenido.ActiveCard := Card1;
    end;

    if tvMenuLateral.Selected.Text = MENU_CARD2 then
    begin
      Contenido.ActiveCard := Card2;
    end;

    if tvMenuLateral.Selected.Text = MENU_CARD3 then
    begin
      Contenido.ActiveCard := Card3;
    end;
  end;
end;

end.
