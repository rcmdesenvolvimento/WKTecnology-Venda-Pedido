program Vendas;

uses
  Vcl.Forms,
  Vendas.View.Principal in 'View\Vendas.View.Principal.pas' {frmPrincipal},
  Vendas.View.Pedido in 'View\Vendas.View.Pedido.pas' {frmPedido},
  Vendas.Model.Cliente in 'Model\Vendas.Model.Cliente.pas',
  Vendas.Model.Pedido in 'Model\Vendas.Model.Pedido.pas',
  Vendas.Model.PedidoProduto in 'Model\Vendas.Model.PedidoProduto.pas',
  Vendas.Conexao in 'Conexao\Vendas.Conexao.pas',
  Vendas.Dao.Cliente in 'Dao\Vendas.Dao.Cliente.pas',
  Vendas.Controller.Cliente in 'Controller\Vendas.Controller.Cliente.pas',
  Vendas.Model.Produto in 'Model\Vendas.Model.Produto.pas',
  Vendas.Controller.Produto in 'Controller\Vendas.Controller.Produto.pas',
  Vendas.Dao.Produto in 'Dao\Vendas.Dao.Produto.pas',
  Vendas.Controller.Pedido in 'Controller\Vendas.Controller.Pedido.pas',
  Vendas.Dao.Pedido in 'Dao\Vendas.Dao.Pedido.pas',
  Vendas.View.PedidoSelecionado in 'View\Vendas.View.PedidoSelecionado.pas' {frmPedidoSelecionado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
