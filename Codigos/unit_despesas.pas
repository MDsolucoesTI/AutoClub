//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_despesas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask;

type
  TForm_despesa = class(TForm)
    DBGridContas: TDBGrid;
    Panel1: TPanel;
    dbnvDespesa: TDBNavigator;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btCancCad: TBitBtn;
    btCadastro: TBitBtn;
    BTlocalizar: TBitBtn;
    BTSair: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeDesc: TDBEdit;
    dbeValor: TDBEdit;
    dbeVenc: TDBEdit;
    BTbaixa: TBitBtn;
    BTrelatorio: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbnvDespesaClick(Sender: TObject; Button: TNavigateBtn);
    procedure BTSairClick(Sender: TObject);
    procedure BTbaixaClick(Sender: TObject);
    procedure dbeDescEnter(Sender: TObject);
    procedure dbeEmissaoEnter(Sender: TObject);
    procedure dbeVencEnter(Sender: TObject);
    procedure dbeValorEnter(Sender: TObject);
    procedure dblcboxFornecEnter(Sender: TObject);
    procedure dbmObsEnter(Sender: TObject);
    procedure dbeDescExit(Sender: TObject);
    procedure dbeEmissaoExit(Sender: TObject);
    procedure dbeVencExit(Sender: TObject);
    procedure dblcboxFornecExit(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCadastroClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btCancCadClick(Sender: TObject);
    procedure dbmObsExit(Sender: TObject);
    procedure BTrelatorioClick(Sender: TObject);
    procedure BTlocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_despesa: TForm_despesa;

implementation

uses unit_dmdados, unit_baixa, Unit_baixaDespesa, unit_periodoDespesa,
  unit_locdespesa;

{$R *.DFM}

procedure TForm_despesa.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

procedure TForm_despesa.dbnvDespesaClick(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button in [nbInsert] then
      dbeDesc.clear;
      dbeValor.clear;
      dbeVenc.clear;
      dbeDesc.SetFocus;
if Button in [nbPost] then
 dmdados.Tbdespesas.First;      
            
end;

procedure TForm_despesa.BTSairClick(Sender: TObject);
begin
close;
end;

procedure TForm_despesa.BTbaixaClick(Sender: TObject);
begin
Form_baixaDespesa:=Tform_baixaDespesa.create(application);
Form_baixaDespesa.showmodal;
end;

procedure TForm_despesa.dbeDescEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_despesa.dbeEmissaoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_despesa.dbeVencEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_despesa.dbeValorEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_despesa.dblcboxFornecEnter(Sender: TObject);
begin
(Sender as TDblookupComboBox).Color:=claqua;
end;

procedure TForm_despesa.dbmObsEnter(Sender: TObject);
begin
(Sender as TDbmemo).Color:=claqua;
end;

procedure TForm_despesa.dbeDescExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_despesa.dbeEmissaoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_despesa.dbeVencExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
dmdados.TbDespesasEfetuado.Value:='Em aberto';
end;

procedure TForm_despesa.dblcboxFornecExit(Sender: TObject);
begin
(Sender as TDblookupComboBox).Color:=clWindow;
end;

procedure TForm_despesa.dbeValorExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
dmdados.TbCpagarEfetuado.Value:='Em aberto';
end;

procedure TForm_despesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm_despesa.btCadastroClick(Sender: TObject);
begin
dbnvDespesa.Enabled:=False;
btCadastro.Enabled:=False;
btOk.Enabled:=True;
btCancel.Enabled:=True;
btCancCad.Enabled:=True;
btLocalizar.Enabled:=true;
dmdados.tbdespesas.Append;
dbeDesc.SetFocus;
end;

procedure TForm_despesa.btOkClick(Sender: TObject);
begin
dmdados.tbdespesas.Post;
dmdados.tbdespesas.Append;
dbeDesc.SetFocus;
end;

procedure TForm_despesa.btCancelClick(Sender: TObject);
begin
 dmdados.tbdespesas.Cancel;
 dmdados.tbdespesas.Append;
 dbeDesc.SetFocus;
end;

procedure TForm_despesa.btCancCadClick(Sender: TObject);
begin
dbnvdespesa.Enabled:=True;
btCadastro.Enabled:=True;
btOk.Enabled:=False;
btCancel.Enabled:=False;
btCancCad.Enabled:=False;
btLocalizar.Enabled:=false;
dmdados.tbdespesas.Cancel;
dmdados.tbdespesas.First;
end;

procedure TForm_despesa.dbmObsExit(Sender: TObject);
begin
(Sender as TDbmemo).Color:=clWindow;
end;

procedure TForm_despesa.BTrelatorioClick(Sender: TObject);
begin
Form_periododespesa:=TForm_periododespesa.create(application);
Form_periododespesa.showmodal;
end;

procedure TForm_despesa.BTlocalizarClick(Sender: TObject);
begin
Form_locdespesa:=Tform_locdespesa.create(application);
Form_locdespesa.showmodal;
end;

end.
