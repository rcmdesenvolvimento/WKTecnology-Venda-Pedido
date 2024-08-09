unit Vendas.View.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vendas.Model.Cliente, Vendas.Controller.Cliente, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  Vendas.Model.Produto, Vendas.Controller.Produto, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, Vcl.Menus,
  Vcl.Mask, Vendas.Controller.Pedido, Vendas.Model.Pedido;

type

  TOperacao = (opInserir, opAlterar, opCanelar);

  TfrmPedido = class(TForm)
    pnl002: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtQuantidade: TEdit;
    edtValorUnitario: TEdit;
    pnlRodape: TPanel;
    dsCliente: TDataSource;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    btnConfirma: TButton;
    dsProduto: TDataSource;
    pnlGridDados: TPanel;
    dbgProdutos: TDBGrid;
    dsPedido: TDataSource;
    FDMemPedido: TFDMemTable;
    FDMemPedidocodigo_produto: TIntegerField;
    FDMemPedidodescricao: TStringField;
    FDMemPedidoquantidade: TIntegerField;
    FDMemPedidovalor_unitario: TCurrencyField;
    FDMemPedidovalor_total: TFloatField;
    btnGravarPedido: TButton;
    Label1: TLabel;
    btnDesfazerPedido: TButton;
    pnl001: TPanel;
    edtDescricaoProduto: TEdit;
    Label3: TLabel;
    edtCodigoProduto: TEdit;
    Label2: TLabel;
    edtCodigoCliente: TEdit;
    Label7: TLabel;
    edtNomeCliente: TEdit;
    Label8: TLabel;
    btnFinalizar: TButton;
    btnProcurarCliente: TButton;
    btnProcurarProduto: TButton;
    FDMemPedidocodigo_cliente: TIntegerField;
    FDMemPedidototal_pedido: TFloatField;
    pnlPedido: TPanel;
    btnCarregarPedidos: TButton;
    btnCancelarPedido: TButton;
    edtNumPedido: TEdit;
    Label6: TLabel;
    dsCancelaPedido: TDataSource;
    dsMostraPedido: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FDMemPedidoCalcFields(DataSet: TDataSet);
    procedure btnConfirmaClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnDesfazerPedidoClick(Sender: TObject);
    procedure btnProcurarClienteClick(Sender: TObject);
    procedure btnProcurarProdutoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnCarregarPedidosClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
  private
    ControllerCliente : TControllerCliente;
    ControllerProduto : TControllerProduto;
    ControllerPedido  : TControllerPedido;

    Cliente   : TCliente;
    Produto   : TProduto;
    Pedido    : TPedido;
    FOperacao : TOperacao;

    procedure LimpaCampos(FOperacao : TOperacao);
    procedure DesfazPedido;
    procedure InsereProduto;
    procedure AlteraProduto;
    procedure ProcurarCliente;
    procedure ProcurarProduto;

    function ValidarQuantidadeVrUnitario : Boolean;
    function ObtenTotalPedido : Currency;
    function ValidaNumeroPedido(NumPedido: string) : string;

  public

  end;

var
  frmPedido     : TfrmPedido;
  erro          : string;
  vrTotalPedido : Currency;

implementation

uses
  Vcl.Dialogs, System.UITypes, Vendas.View.PedidoSelecionado;

{$R *.dfm}

procedure TfrmPedido.btnDesfazerPedidoClick(Sender: TObject);
begin
  FDMemPedido.Close;
  DesfazPedido;
end;

procedure TfrmPedido.btnCancelarPedidoClick(Sender: TObject);
begin

  ValidaNumeroPedido(Trim(edtNumPedido.Text));

  if MessageDlg('Confirma o cancelamento do pedido ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      dsCancelaPedido.DataSet := ControllerPedido.SelecionaPedido(erro,StrToInt(Trim(edtNumPedido.Text)));

      if dsCancelaPedido.DataSet.IsEmpty then
      begin
        MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
        exit;
      end;

      if Not ControllerPedido.DeletePedido(erro,StrToInt(Trim(edtNumPedido.Text))) then
      begin
        MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
        exit;
      end;
        MessageDlg('Pedido excluído com sucesso!', mtInformation, [mbOk], 0, mbOk);
    finally
      edtNumPedido.SetFocus;
    end;
  end;
end;

procedure TfrmPedido.btnCarregarPedidosClick(Sender: TObject);
begin
  ValidaNumeroPedido(Trim(edtNumPedido.Text));

  dsMostraPedido.DataSet := ControllerPedido.SelecionaPedido(erro, StrToInt(Trim(edtNumPedido.Text)));

  if dsMostraPedido.DataSet.IsEmpty then
   begin
     MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
     exit;
   end;

  with TfrmPedidoSelecionado.Create(self,Trim(edtNumPedido.Text)) do
  try
    ShowModal;
  finally
    FreeAndNil(frmPedidoSelecionado);
  end;
end;

procedure TfrmPedido.btnConfirmaClick(Sender: TObject);
begin
  if(Self.ValidarQuantidadeVrUnitario) then
  begin
    if FOperacao = opInserir then
       Self.InsereProduto
    else
       Self.AlteraProduto;
  end;
end;

procedure TfrmPedido.btnProcurarClienteClick(Sender: TObject);
begin
  Self.ProcurarCliente;
end;

procedure TfrmPedido.btnFinalizarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedido.btnGravarPedidoClick(Sender: TObject);
begin
  if FDMemPedido.IsEmpty then
   begin
     MessageDlg('Não há produtos selecionados para o pedido!', mtInformation, [mbOk], 0, mbOk);
     exit;
   end;

  if MessageDlg('Confirma a criação do pedido ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ObtenTotalPedido;
    FDMemPedido.Edit;
    FDMemPedido.FieldByName('codigo_cliente').AsInteger := StrToInt(edtCodigoCliente.Text);
    FDMemPedido.FieldByName('total_pedido').AsFloat     := vrTotalPedido;

    if Not ControllerPedido.CriarPedido(erro, FDMemPedido) then
     begin
       MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
       exit;
     end;
     edtCodigoCliente.Text := EmptyStr;
     edtNomeCliente.Text   := EmptyStr;
     FDMemPedido.EmptyDataSet;
     edtCodigoCliente.SetFocus;
     MessageDlg('Pedido criado com sucesso', mtInformation, [mbOk], 0, mbOk);
  end;
end;

procedure TfrmPedido.btnProcurarProdutoClick(Sender: TObject);
begin
  Self.ProcurarProduto;
end;

procedure TfrmPedido.FDMemPedidoCalcFields(DataSet: TDataSet);
begin
  dsPedido.DataSet.FieldByName('valor_total').AsFloat :=
  dsPedido.DataSet.FieldByName('valor_unitario').AsFloat *
  dsPedido.DataSet.FieldByName('quantidade').AsInteger;
end;

procedure TfrmPedido.FormDestroy(Sender: TObject);
begin
  FreeAndnil(Cliente);
  FreeAndnil(Produto);
  FreeAndnil(ControllerPedido);
  FreeAndnil(Pedido);
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  Cliente             := TCliente.Create;
  Produto             := TProduto.Create;
  Pedido              := TPedido.Create;
  ControllerPedido    := TControllerPedido.Create;
  FDMemPedido.Active  := True;
  FOperacao           := opInserir;
  btnConfirma.Enabled := False;
  vrTotalPedido       := 0;
end;

procedure TfrmPedido.InsereProduto;
begin
  with FDMemPedido do
  begin
    Active := True;
    Append;
    FieldByName('Codigo_Produto').AsInteger  := StrToInt(edtCodigoProduto.Text);
    FieldByName('Descricao').AsString        := edtDescricaoProduto.Text;
    FieldByName('Quantidade').AsInteger      := StrToInt(edtQuantidade.Text);
    FieldByName('Valor_Unitario').AsCurrency := StrToCurr(edtValorUnitario.Text);
    FieldByName('Quantidade').AsInteger      := StrToInt(edtQuantidade.Text);
    FieldByName('Valor_Unitario').AsCurrency := StrToCurr(edtValorUnitario.Text);
    Post;
  end;
  LimpaCampos(opInserir);
end;

procedure TfrmPedido.AlteraProduto;
begin
  with FDMemPedido do
  begin
    Edit;
    FieldByName('Quantidade').AsInteger      := StrToInt(edtQuantidade.Text);
    FieldByName('Valor_Unitario').AsCurrency := StrToCurr(edtValorUnitario.Text);
    Update;
  end;
  pnl001.Enabled      := True;
  btnConfirma.Enabled := False;
  LimpaCampos(opInserir);
end;

procedure TfrmPedido.LimpaCampos(FOperacao : TOperacao);
begin
  edtCodigoProduto.Text    := EmptyStr;
  edtDescricaoProduto.Text := EmptyStr;
  edtQuantidade.Text       := EmptyStr;
  edtValorUnitario.Text    := EmptyStr;
  btnConfirma.Enabled      := False;
  FOperacao                := FOperacao;
  edtCodigoProduto.SetFocus;
end;

function TfrmPedido.ObtenTotalPedido: Currency;
begin
  vrTotalPedido := 0;
  FDMemPedido.First;
  while Not(FDMemPedido.Eof) do
  begin
    with FDMemPedido do
    begin
      Edit;
      vrTotalPedido := vrTotalPedido + FieldByName('valor_total').AsFloat;
      Next;
    end;
  end;
  Result := vrTotalPedido;
end;

procedure TfrmPedido.ProcurarCliente;
begin
  Cliente.Codigo := Trim(edtCodigoCliente.Text);

  if Cliente.Codigo.IsEmpty then
  begin
    MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
    edtNomeCliente.Clear;
    exit;
  end;

  try
    ControllerCliente := TControllerCliente.Create;
    dsCliente.DataSet := ControllerCliente.SelecionaCliente(erro, Trim(edtCodigoCliente.Text));

    if dsCliente.DataSet.IsEmpty then
    begin
      MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
      edtCodigoCliente.SetFocus;
    end;
  finally
    edtNomeCliente.Text        := dsCliente.DataSet.FieldByName('nome').AsString;
    btnProcurarProduto.Enabled := True;
    pnlPedido.Visible          := False;
    FreeAndNil(ControllerCliente);
  end;
end;

procedure TfrmPedido.ProcurarProduto;
begin
  Produto.Codigo := Trim(edtCodigoProduto.Text);

  if Produto.Codigo.IsEmpty then
  begin
    MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
    exit;
  end;

  try
    ControllerProduto := TControllerProduto.Create;
    dsProduto.DataSet := ControllerProduto.SelecionaProduto(erro, Trim(edtCodigoProduto.Text));

    if dsProduto.DataSet.IsEmpty then
    begin
      MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
      edtCodigoProduto.SetFocus;
    end;
    finally
      edtDescricaoProduto.Text := dsProduto.DataSet.FieldByName('descricao').AsString;
      btnConfirma.Enabled      := True;
      FreeAndNil(ControllerProduto);
  end;
end;

function TfrmPedido.ValidaNumeroPedido(NumPedido: string) : string;
begin
   try
    Pedido.NumeroPedido := NumPedido;

    if Pedido.NumeroPedido.IsEmpty then
     begin
       MessageDlg(erro, mtInformation, [mbOk], 0, mbOk);
       edtNumPedido.SetFocus;
       exit;
     end;
   finally
   end;
end;

function TfrmPedido.ValidarQuantidadeVrUnitario: Boolean;
var
 vValorUnitario : Currency;
begin
  Result := True;
  if edtQuantidade.Text = EmptyStr  then
  begin
    MessageDlg('Digite a quantidade do produto!', mtInformation, [mbOk], 0, mbOk);
    Result := False;
    exit;
  end;

  try
    if(Trim(edtValorUnitario.Text) = EmptyStr) then
    begin
      MessageDlg('Digite o valor unitário!', mtInformation, [mbOk], 0, mbOk);
      Result := False;
      exit;
    end;
    vValorUnitario := StrToCurr(edtValorUnitario.Text);
  except
    on ex: Exception do
    begin
      raise Exception.Create('Valor inválido, utilize virgula para casas decimais.');
      Result := False;
    end;
  end;
end;

procedure TfrmPedido.dbgProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if MessageDlg('Deseja excluir o Produto ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FDMemPedido.Delete;
      FDMemPedido.Next;
    end;
    LimpaCampos(opInserir);
  end;

  if Key = VK_RETURN then
  begin
    FOperacao                := opAlterar;
    edtCodigoProduto.Text    := FDMemPedido.FieldByName('codigo_produto').Value;
    edtDescricaoProduto.Text := FDMemPedido.FieldByName('descricao').Value;
    edtQuantidade.Text       := FDMemPedido.FieldByName('quantidade').Value;
    pnl001.Enabled           := False;
    edtValorUnitario.Text    := FDMemPedido.FieldByName('valor_unitario').Value;
    btnConfirma.Enabled      := True;
    edtQuantidade.SetFocus;
  end;
end;

procedure TfrmPedido.DesfazPedido;
begin
  edtValorUnitario.Text    := EmptyStr;
  edtQuantidade.Text       := EmptyStr;
  edtDescricaoProduto.Text := EmptyStr;
  edtCodigoProduto.Text    := EmptyStr;
  edtNomeCliente.Text      := EmptyStr;
  edtCodigoCliente.Text    := EmptyStr;
  FOperacao                := opInserir;
  edtCodigoCliente.SetFocus;
end;

procedure TfrmPedido.edtCodigoClienteChange(Sender: TObject);
begin
  if(Trim(edtCodigoCliente.Text) <> '') then
   begin
     pnlPedido.Visible := False;
     edtNomeCliente.Clear;
   end
   else
     pnlPedido.Visible := True;
end;

end.
