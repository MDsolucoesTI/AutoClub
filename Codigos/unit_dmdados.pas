//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_dmdados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMdados = class(TDataModule)
    DSfornecedor: TDataSource;
    tbfornecedor: TTable;
    tbfornecedorRazaoSocial: TStringField;
    tbfornecedorEndereco: TStringField;
    tbfornecedorBairro: TStringField;
    tbfornecedorCidade: TStringField;
    tbfornecedorEstado: TStringField;
    tbfornecedorCep: TStringField;
    tbfornecedorInscEstadual: TStringField;
    tbfornecedorCNPJ: TStringField;
    tbfornecedorTelefone: TStringField;
    tbfornecedorFax: TStringField;
    tbfornecedorContato: TStringField;
    tbfornecedorRamal: TStringField;
    tbfornecedorEmail: TStringField;
    tbfornecedorObs: TMemoField;
    tbfornecedorComplemento: TStringField;
    DScpagar: TDataSource;
    TbCpagar: TTable;
    DSdespesas: TDataSource;
    Tbdespesas: TTable;
    TbCpagarEmissao: TDateField;
    TbCpagarVencimento: TDateField;
    TbCpagarValPagto: TCurrencyField;
    TbCpagarJuros: TCurrencyField;
    TbCpagarDesconto: TCurrencyField;
    TbCpagarDataPagto: TDateField;
    TbCpagarObservacao: TMemoField;
    TbdespesasDescricao: TStringField;
    TbdespesasVencimento: TDateField;
    TbdespesasValor: TCurrencyField;
    TbCpagarEfetuado: TStringField;
    TbCpagarTotalPago: TCurrencyField;
    TbdespesasDataPagto: TDateField;
    TbdespesasValorPago: TCurrencyField;
    TbdespesasEfetuado: TStringField;
    tbfornecedorCodFornecedor: TAutoIncField;
    TbCpagarCodFornecedor: TIntegerField;
    TbCpagarRegistro: TAutoIncField;
    TbCpagarDocNumero: TStringField;
    DScheques: TDataSource;
    TbCheques: TTable;
    TbChequesNumero: TStringField;
    TbChequesData: TDateField;
    TbChequesBanco: TStringField;
    TbChequesAgencia: TStringField;
    TbChequesValor: TCurrencyField;
    TbChequesValorExtenso: TStringField;
    TbChequesValorExtensoII: TStringField;
    TbChequesFavorecido: TStringField;
    DScadastro: TDataSource;
    TBcadastro: TTable;
    tbContasReceber: TTable;
    dsContasReceber: TDataSource;
    TBcadastroCod_numero: TStringField;
    TBcadastroCategoria: TStringField;
    TBcadastroSexo: TStringField;
    TBcadastroNome: TStringField;
    TBcadastroRg: TStringField;
    TBcadastroEndereco: TStringField;
    TBcadastroBairro: TStringField;
    TBcadastroCEP: TStringField;
    TBcadastroCidade: TStringField;
    TBcadastroUF: TStringField;
    TBcadastroTelefone: TStringField;
    TBcadastroNasc_socio: TDateField;
    TBcadastroNome_pais: TMemoField;
    TBcadastroObs: TStringField;
    TBcadastroFoto: TGraphicField;
    tbContasReceberCod_numero: TStringField;
    tbContasReceberMes: TStringField;
    tbContasReceberAno: TStringField;
    tbContasReceberValor: TCurrencyField;
    tbContasReceberQuitado: TStringField;
    tbContasReceberValorPago: TCurrencyField;
    tbContasReceberDataPago: TDateField;
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMdados: TDMdados;

implementation

{$R *.DFM}



end.
