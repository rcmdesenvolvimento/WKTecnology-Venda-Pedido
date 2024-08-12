unit Vendas.Dao.PedidoProduto;

interface

uses
  FireDAC.Comp.Client, FireDAC.DApt, Vendas.Conexao,
  Vendas.Model.PedidoProduto;

type

  TPedidoProdutoDao = class

  private

   procedure GravarPedidoProduto(PedidoProduto: TPedidoProduto; FDCon: TFDConnection);

  public

    constructor Create;
    destructor Destroy; override;

    procedure LerPedidoProduto(FDMemPedido: TFDMemTable; nNumPedido : Integer; FDCon: TFDConnection);

  end;

var
  FDConnection     : TFDConnection;
  Conexao          : TConexao;
  QryPedidoProduto : TFDQuery;

implementation

uses
  System.SysUtils;

{ TPedidoProdutoDao }

constructor TPedidoProdutoDao.Create;
begin
  FDConnection     := TFDConnection.Create(Nil);
  Conexao          := TConexao.Create;
  QryPedidoProduto := TFDQuery.Create(nil);
  FDConnection     := Conexao.Connect;
end;

destructor TPedidoProdutoDao.Destroy;
begin
  FDConnection.Connected := false;
  FreeAndNil(FDConnection);
  FreeAndNil(Conexao);
  FreeAndNil(QryPedidoProduto);
  inherited;
end;

procedure TPedidoProdutoDao.LerPedidoProduto(FDMemPedido: TFDMemTable; nNumPedido : Integer; FDCon: TFDConnection);
var
  PedidoProduto: TPedidoProduto;
begin
  PedidoProduto := TPedidoProduto.Create;
  FDMemPedido.Edit;
  FDMemPedido.First;
  while not(FDMemPedido.EOF) do
  begin
    with FDMemPedido do
    begin
      PedidoProduto.CodigoProduto := FieldByName('CODIGO_PRODUTO').AsInteger;
      PedidoProduto.NumeroPedido  := nNumPedido;
      PedidoProduto.Quantidade    := FieldByName('QUANTIDADE').AsInteger;
      PedidoProduto.ValorUnitario := FieldByName('VALOR_UNITARIO').AsCurrency;
      PedidoProduto.ValorTotal    := FieldByName('VALOR_TOTAL').AsCurrency;

      Self.GravarPedidoProduto(PedidoProduto,FDCon);

      next;
    end;
  end;
  FreeAndNil(PedidoProduto);
end;

procedure TPedidoProdutoDao.GravarPedidoProduto(PedidoProduto: TPedidoProduto; FDCon: TFDConnection);
begin
  QryPedidoProduto.Connection := FDCon;

  with QryPedidoProduto do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO Pedido_Produto(CODIGO_PRODUTO, NUMERO_PEDIDO, ');
      SQL.Add('QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL)');
      SQL.Add('VALUES(:CODIGO_PRODUTO, :NUMERO_PEDIDO, :QUANTIDADE, ');
      SQL.Add(':VALOR_UNITARIO, :VALOR_TOTAL)');
      ParamByName('CODIGO_PRODUTO').AsInteger := PedidoProduto.CodigoProduto;
      ParamByName('NUMERO_PEDIDO').AsInteger  := PedidoProduto.NumeroPedido;
      ParamByName('QUANTIDADE').AsInteger     := PedidoProduto.Quantidade;
      ParamByName('VALOR_UNITARIO').AsFloat   := PedidoProduto.ValorUnitario;
      ParamByName('VALOR_TOTAL').AsFloat      := PedidoProduto.ValorTotal;
      ExecSQL;
    end;
end;

end.
