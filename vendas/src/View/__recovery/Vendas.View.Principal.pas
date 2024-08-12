unit Vendas.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Vendas.View.Pedido;

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  with TfrmPedido.Create(self) do
    try
      ShowModal;
    finally
      FreeAndNil(frmPedido);
    end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
