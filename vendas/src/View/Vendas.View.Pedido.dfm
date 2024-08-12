object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Pedido de Venda'
  ClientHeight = 619
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pnl002: TPanel
    Left = 0
    Top = 113
    Width = 760
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 752
    object Label4: TLabel
      Left = 6
      Top = 7
      Width = 72
      Height = 17
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 133
      Top = 7
      Width = 86
      Height = 17
      Caption = 'Valor Unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtQuantidade: TEdit
      Left = 6
      Top = 30
      Width = 123
      Height = 23
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
    object edtValorUnitario: TEdit
      Left = 133
      Top = 30
      Width = 109
      Height = 23
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnConfirma: TButton
      Left = 248
      Top = 29
      Width = 97
      Height = 25
      Caption = '&Confirma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnConfirmaClick
    end
    object pnlPedido: TPanel
      Left = 360
      Top = 8
      Width = 392
      Height = 50
      BevelOuter = bvNone
      TabOrder = 3
      object Label6: TLabel
        Left = 16
        Top = 8
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
      object btnCarregarPedidos: TButton
        Left = 170
        Top = 24
        Width = 106
        Height = 25
        Caption = 'Carregar Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCarregarPedidosClick
      end
      object btnCancelarPedido: TButton
        Left = 282
        Top = 24
        Width = 106
        Height = 25
        Caption = 'Cancelar Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnCancelarPedidoClick
      end
      object edtNumPedido: TEdit
        Left = 14
        Top = 26
        Width = 150
        Height = 23
        Alignment = taRightJustify
        TabOrder = 0
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 578
    Width = 760
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 566
    ExplicitWidth = 752
    object Label1: TLabel
      Left = 248
      Top = 18
      Width = 275
      Height = 15
      Caption = 'Tecla [Del] Deleta Produto  [Enter] Altera Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnGravarPedido: TButton
      Left = 7
      Top = 12
      Width = 97
      Height = 25
      Caption = 'Gravar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGravarPedidoClick
    end
    object btnDesfazerPedido: TButton
      Left = 110
      Top = 12
      Width = 113
      Height = 25
      Caption = 'Desfazer Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnDesfazerPedidoClick
    end
    object btnFinalizar: TButton
      Left = 632
      Top = 10
      Width = 113
      Height = 27
      Caption = '&Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnFinalizarClick
    end
  end
  object pnlGridDados: TPanel
    Left = 0
    Top = 177
    Width = 760
    Height = 401
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 752
    ExplicitHeight = 389
    object dbgProdutos: TDBGrid
      Left = 1
      Top = 1
      Width = 758
      Height = 399
      Align = alClient
      DataSource = dsPedido
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = dbgProdutosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo_produto'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo do Produto'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 223
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 131
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
          Width = 146
          Visible = True
        end>
    end
  end
  object pnl001: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 113
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 752
    object Label3: TLabel
      Left = 193
      Top = 58
      Width = 59
      Height = 17
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 6
      Top = 58
      Width = 122
      Height = 17
      Caption = 'C'#243'digo do Produto '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 6
      Top = 6
      Width = 111
      Height = 17
      Caption = 'C'#243'digo do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 193
      Top = 6
      Width = 37
      Height = 17
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescricaoProduto: TEdit
      Left = 193
      Top = 81
      Width = 559
      Height = 23
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtCodigoProduto: TEdit
      Left = 4
      Top = 80
      Width = 123
      Height = 23
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 20
      NumbersOnly = True
      ParentFont = False
      TabOrder = 2
    end
    object edtCodigoCliente: TEdit
      Tag = 1
      Left = 4
      Top = 29
      Width = 123
      Height = 23
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnChange = edtCodigoClienteChange
    end
    object edtNomeCliente: TEdit
      Left = 193
      Top = 29
      Width = 559
      Height = 23
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnProcurarCliente: TButton
      Left = 131
      Top = 27
      Width = 56
      Height = 25
      Caption = '&Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnProcurarClienteClick
    end
    object btnProcurarProduto: TButton
      Left = 131
      Top = 79
      Width = 56
      Height = 25
      Caption = '&Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnProcurarProdutoClick
    end
  end
  object dsCliente: TDataSource
    Left = 576
    Top = 288
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 576
    Top = 232
  end
  object dsProduto: TDataSource
    Left = 576
    Top = 352
  end
  object dsPedido: TDataSource
    DataSet = FDMemPedido
    Left = 576
    Top = 416
  end
  object FDMemPedido: TFDMemTable
    OnCalcFields = FDMemPedidoCalcFields
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 576
    Top = 480
    object FDMemPedidocodigo_produto: TIntegerField
      FieldName = 'codigo_produto'
    end
    object FDMemPedidodescricao: TStringField
      FieldName = 'descricao'
    end
    object FDMemPedidoquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object FDMemPedidovalor_unitario: TCurrencyField
      FieldName = 'valor_unitario'
      DisplayFormat = '###,##0.00'
    end
    object FDMemPedidovalor_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valor_total'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object FDMemPedidocodigo_cliente: TIntegerField
      FieldName = 'codigo_cliente'
    end
    object FDMemPedidototal_pedido: TFloatField
      FieldName = 'total_pedido'
    end
  end
  object dsCancelaPedido: TDataSource
    Left = 664
    Top = 288
  end
  object dsMostraPedido: TDataSource
    Left = 664
    Top = 344
  end
end
