//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program SBSocial;

uses
  Forms,
  unit_fornecdor in 'unit_fornecdor.pas' {form_fornecedor},
  unit_dmdados in 'unit_dmdados.pas' {DMdados: TDataModule},
  unit_locFornecedor in 'unit_locFornecedor.pas' {Form_locfornecedor},
  unit_contas in 'unit_contas.pas' {Form_Contas},
  unit_inicio in 'unit_inicio.pas' {Form_inicio},
  Unit_baixa in 'Unit_baixa.pas' {Form_baixa},
  unit_despesas in 'unit_despesas.pas' {Form_despesa},
  Unit_baixaDespesa in 'Unit_baixaDespesa.pas' {Form_baixaDespesa},
  unit_periodo in 'unit_periodo.pas' {Form_periodo},
  unit_relContasPagas in 'unit_relContasPagas.pas' {form_relContasPagas},
  unit_relContasNaoPagas in 'unit_relContasNaoPagas.pas' {form_relContasNaoPagas},
  unit_periodoDespesa in 'unit_periodoDespesa.pas' {Form_periodoDespesa},
  unit_despesaPaga in 'unit_despesaPaga.pas' {form_relDespesa},
  Unit_relDespesaNaoPaga in 'Unit_relDespesaNaoPaga.pas' {form_relDespesaNaoPaga},
  unit_definePeriodo in 'unit_definePeriodo.pas' {Form_definePeriodo},
  unit_definePeriodoDespesa in 'unit_definePeriodoDespesa.pas' {Form_definePeriodoDespesa},
  unit_cheques in 'unit_cheques.pas' {Form_cheque},
  unit_cadastro in 'unit_cadastro.pas' {Form_Cadastro},
  Unit_Relatrazadas in 'Unit_Relatrazadas.pas' {Form_Relatrazadas},
  Unit_locsocios in 'Unit_locsocios.pas' {Form_LocSocios},
  Unit_ContasReceber in 'Unit_ContasReceber.pas' {Form_ContasReceber},
  Unit_relquitadas in 'Unit_relquitadas.pas' {Form_relquitadas},
  Unit_relimprimir in 'Unit_relimprimir.pas' {Form_relimprimimir},
  Unit_GeraMens in 'Unit_GeraMens.pas' {Form_geraMens},
  unit_baixaMens in 'unit_baixaMens.pas' {Form_baixaMens},
  unit_relatorioCR in 'unit_relatorioCR.pas' {Form_relatorioCR},
  unit_relMensPagas in 'unit_relMensPagas.pas' {form_relMensPagas},
  unit_relMensNpagas in 'unit_relMensNpagas.pas' {form_relMensNPagas},
  unit_periodoCR in 'unit_periodoCR.pas' {Form_PeriodoCR},
  unit_locContas in 'unit_locContas.pas' {Form_locConta},
  unit_locdespesa in 'unit_locdespesa.pas' {Form_locdespesa},
  unit_relSocio in 'unit_relSocio.pas' {Form_relSocio};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm_inicio, Form_inicio);
  Application.CreateForm(TDMdados, DMdados);
  Application.Run;
end.
