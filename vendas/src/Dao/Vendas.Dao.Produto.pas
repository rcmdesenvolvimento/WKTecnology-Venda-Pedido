unit Vendas.Dao.Produto;

interface

uses
  FireDAC.Comp.Client, FireDAC.DApt, Vendas.Conexao;

type

  TProdutoDao = class

  private

  public

    constructor Create;
    destructor Destroy; override;

    function SelecionaProduto(out erro: string; Codigo: Integer): TFDQuery;

  end;

var
  FDConnection: TFDConnection;
  Conexao: TConexao;
  QryProduto: TFDQuery;

implementation

uses
  System.SysUtils;

{ TProdutoDao }

constructor TProdutoDao.Create;
begin
  FDConnection := TFDConnection.Create(Nil);
  Conexao      := TConexao.Create;
  QryProduto   := TFDQuery.Create(nil);
  FDConnection := Conexao.Connect;
end;

destructor TProdutoDao.Destroy;
begin
  FDConnection.Connected := False;
  FreeAndNil(FDConnection);
  FreeAndNil(Conexao);
  FreeAndNil(QryProduto);
  inherited;
end;

function TProdutoDao.SelecionaProduto(out erro: string; Codigo: Integer): TFDQuery;
begin
   QryProduto.Connection := FDConnection;
  try
    QryProduto.Connection := FDConnection;
    with QryProduto do
    begin
      SQL.Add('SELECT * FROM Produto ');
      SQL.Add('WHERE Codigo =:Codigo');
      ParamByName('Codigo').AsInteger := Codigo;
      Open;

      if RecordCount = 0 then
         erro := 'Produto n�o encontrado!';
    end;
  finally
    Result := QryProduto;
  end;
end;

end.
