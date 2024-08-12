object frmPedidoSelecionado: TfrmPedidoSelecionado
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Pedido'
  ClientHeight = 560
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 113
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 620
    object Label1: TLabel
      Left = 18
      Top = 5
      Width = 97
      Height = 15
      Caption = 'C'#243'digo do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 55
      Width = 72
      Height = 15
      Caption = 'N'#186' do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 122
      Top = 5
      Width = 34
      Height = 15
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 122
      Top = 55
      Width = 84
      Height = 15
      Caption = 'Data do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 212
      Top = 55
      Width = 85
      Height = 15
      Caption = 'Total do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodCliente: TEdit
      Left = 18
      Top = 26
      Width = 98
      Height = 23
      Alignment = taRightJustify
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object edtNumPedido: TEdit
      Left = 18
      Top = 76
      Width = 98
      Height = 23
      Alignment = taCenter
      Enabled = False
      NumbersOnly = True
      TabOrder = 2
    end
    object edtNomeCliente: TEdit
      Left = 122
      Top = 26
      Width = 499
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object edtDataPedido: TEdit
      Left = 122
      Top = 76
      Width = 84
      Height = 23
      Alignment = taCenter
      Enabled = False
      NumbersOnly = True
      TabOrder = 3
    end
    object EdtValorTotalPedido: TEdit
      Left = 212
      Top = 76
      Width = 85
      Height = 23
      Alignment = taRightJustify
      Enabled = False
      NumbersOnly = True
      TabOrder = 4
    end
    object btnSair: TButton
      Left = 306
      Top = 74
      Width = 75
      Height = 25
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  object pnlProduto: TPanel
    Left = 0
    Top = 113
    Width = 628
    Height = 447
    Align = alClient
    Caption = 'pnlProduto'
    TabOrder = 1
    ExplicitWidth = 620
    ExplicitHeight = 435
    object dbgProdutos: TDBGrid
      Left = 1
      Top = 1
      Width = 626
      Height = 445
      Align = alClient
      DataSource = dsPedidoProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo_produto'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo Produto'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 180
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Total'
          Width = 114
          Visible = True
        end>
    end
  end
  object dsPedidoProduto: TDataSource
    OnDataChange = dsPedidoProdutoDataChange
    Left = 352
    Top = 217
  end
end
