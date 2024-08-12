unit Vendas.Controller.Produto;

interface

uses
  FireDAC.Comp.Client, Data.DB, Vendas.Dao.Produto;

type

  TControllerProduto = class

  private

  ProdutoDao : TProdutoDao;
  QryProduto : TFDQuery;

  public

    constructor Create;
    destructor Destroy; override;

    function SelecionaProduto(out erro : string; Codigo : string): TFDQuery;

  end;

implementation

uses
  System.SysUtils;

{ TControllerProduto }

constructor TControllerProduto.Create;
begin
  ProdutoDao := TProdutoDao.Create;
  QryProduto := TFDQuery.Create(Nil);
end;

destructor TControllerProduto.Destroy;
begin
  FreeAndNil(ProdutoDao);
  FreeAndNil(QryProduto);
  inherited;
end;

function TControllerProduto.SelecionaProduto(out erro: string; Codigo: string): TFDQuery;
begin
  Result := ProdutoDao.SelecionaProduto(erro, StrToInt(Codigo));
end;

end.
