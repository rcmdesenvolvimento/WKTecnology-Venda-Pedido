unit Vendas.Model.Pedido;

interface

uses
  System.Classes;

type
  TPedido = class

  private

    FDataPedido: TDateTime;
    FValorTotal: Currency;
    FCodigoCliente: Integer;
    FNumeroPedido: string;

    function SetCodigoCliente: Integer;
    function SetDataPedido: TDateTime;
    function SetNumeroPedido: string;
    function SetValorTotal: Currency;

  public

    constructor Create;

    destructor Destroy; override;

    property NumeroPedido: string read SetNumeroPedido write FNumeroPedido;
    property DataPedido: TDateTime read SetDataPedido write FDataPedido;
    property CodigoCliente: Integer read SetCodigoCliente write FCodigoCliente;
    property ValorTotal: Currency read SetValorTotal write FValorTotal;

  end;

implementation

uses
  System.SysUtils;

{ TPedido }

constructor TPedido.Create;
begin

end;

destructor TPedido.Destroy;
begin

  inherited;
end;

function TPedido.SetCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedido.SetDataPedido: TDateTime;
begin
  Result := FDataPedido;
end;

function TPedido.SetNumeroPedido: string;
begin
 if FNumeroPedido = EmptyStr then
  begin
    raise Exception.Create('Digite o n�mero do pedido!');
  end;
  Result := FNumeroPedido;
end;

function TPedido.SetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

end.
