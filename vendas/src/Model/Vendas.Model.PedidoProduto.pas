unit Vendas.Model.PedidoProduto;

interface

type
  TPedidoProduto = class

  private

    FCodigoProduto: Integer;
    FCodigo: Integer;
    FValorUnitario: Currency;
    FValorTotal: Currency;
    FQuantidade: Integer;
    FNumeroPedido: Integer;

    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoProduto(const Value: Integer);
    procedure SetNumeroPedido(const Value: Integer);
    procedure SetQuantidade(const Value: Integer);
    procedure SetValorTotal(const Value: Currency);
    procedure SetValorUnitario(const Value: Currency);

  public

    constructor Create;

    destructor Destroy; override;

    property Codigo: Integer read FCodigo write SetCodigo;
    property NumeroPedido: Integer read FNumeroPedido write SetNumeroPedido;
    property CodigoProduto: Integer read FCodigoProduto write SetCodigoProduto;
    property Quantidade: Integer read FQuantidade write SetQuantidade;
    property ValorUnitario: Currency read FValorUnitario write SetValorUnitario;
    property ValorTotal: Currency read FValorTotal write SetValorTotal;

  end;

implementation

{ TPedidoProduto }

constructor TPedidoProduto.Create;
begin

end;

destructor TPedidoProduto.Destroy;
begin

  inherited;
end;

procedure TPedidoProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPedidoProduto.SetCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

procedure TPedidoProduto.SetNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedidoProduto.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TPedidoProduto.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

procedure TPedidoProduto.SetValorUnitario(const Value: Currency);
begin
  FValorUnitario := Value;
end;

end.
