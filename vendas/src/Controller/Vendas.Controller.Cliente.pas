unit Vendas.Controller.Cliente;

interface

uses
  FireDAC.Comp.Client, vendas.dao.cliente, Data.DB;

type

  TControllerCliente = class

  private

  ClienteDao : TClienteDao;
  QryCliente : TFDQuery;

  public

    constructor Create;
    destructor Destroy; override;

    function SelecionaCliente(out erro : string; Codigo : string): TFDQuery;

  end;

implementation

uses
  System.SysUtils;

{ TControllerCliente }

constructor TControllerCliente.Create;
begin
  ClienteDao := TClienteDao.Create;
  QryCliente := TFDQuery.Create(nil);
end;

destructor TControllerCliente.Destroy;
begin
  FreeAndNil(QryCliente);
  FreeAndNil(ClienteDao);
  inherited;
end;

function TControllerCliente.SelecionaCliente(out erro : string; Codigo : string): TFDQuery;
begin
  Result := ClienteDao.SelecionaCliente(erro, Codigo);
end;

end.
