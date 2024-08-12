unit Vendas.Model.Produto;

interface

type
  TProduto = class

  private

    FNome: string;
    FCodigo: string;
    FCidade: string;

    function SetCodigo: string;
    function SetDescricao: string;
    function SetPrecoVenda: string;

  public

    constructor Create;

    destructor Destroy; override;

    property Codigo: string read SetCodigo write FCodigo;
    property Descricao: string read SetDescricao write FNome;
    property PrecoVenda: string read SetPrecoVenda write FCidade;

  end;

implementation

uses
  System.SysUtils;

{ TProduto }

constructor TProduto.Create;
begin

end;

destructor TProduto.Destroy;
begin

  inherited;
end;

function TProduto.SetCodigo: string;
begin
 if FCodigo = EmptyStr then
  begin
    raise Exception.Create('Digite o código do produto!');
  end;
  Result := FCodigo;
end;

function TProduto.SetDescricao: string;
begin
  Result := FNome;
end;

function TProduto.SetPrecoVenda: string;
begin
  Result := FCidade;
end;

end.
