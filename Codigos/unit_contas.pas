//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_contas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask;

type
  TForm_Contas = class(TForm)
    DBGridContas: TDBGrid;
    Panel1: TPanel;
    dbnvContas: TDBNavigator;
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
    Label4: TLabel;
    dbeEmissao: TDBEdit;
    dbeVenc: TDBEdit;
    dbeValor: TDBEdit;
    Label8: TLabel;
    dblcboxFornec: TDBLookupComboBox;
    dbmObs: TDBMemo;
    Label10: TLabel;
    BTbaixa: TBitBtn;
    BTrelatorio: TBitBtn;
    dbeDoc: TDBEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbnvContasClick(Sender: TObject; Button: TNavigateBtn);
    procedure BTSairClick(Sender: TObject);
    procedure BTbaixaClick(Sender: TObject);
    procedure dbeDocEnter(Sender: TObject);
    procedure dbeEmissaoEnter(Sender: TObject);
    procedure dbeVencEnter(Sender: TObject);
    procedure dbeValorEnter(Sender: TObject);
    procedure dblcboxFornecEnter(Sender: TObject);
    procedure dbmObsEnter(Sender: TObject);
    procedure dbeDocExit(Sender: TObject);
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
  Form_Contas: TForm_Contas;

implementation

uses unit_dmdados, unit_baixa, unit_periodo, unit_locContas;

{$R *.DFM}

procedure TForm_Contas.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

procedure TForm_Contas.dbnvContasClick(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button in [nbInsert] then
       dbedoc.clear;
       dbeEmissao.clear;
       dbeVenc.clear;
       dbevalor.clear;
       dbeDoc.SetFocus;
if Button in [nbPost] Then
    dmDados.TbCpagar.first;
            
end;

procedure TForm_Contas.BTSairClick(Sender: TObject);
begin
close;
end;

procedure TForm_Contas.BTbaixaClick(Sender: TObject);
begin
Form_baixa:=Tform_baixa.create(application);
Form_baixa.showmodal;
end;

procedure TForm_Contas.dbeDocEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Contas.dbeEmissaoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Contas.dbeVencEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Contas.dbeValorEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Contas.dblcboxFornecEnter(Sender: TObject);
begin
(Sender as TDblookupComboBox).Color:=claqua;
end;

procedure TForm_Contas.dbmObsEnter(Sender: TObject);
begin
(Sender as TDbmemo).Color:=claqua;
end;

procedure TForm_Contas.dbeDocExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_Contas.dbeEmissaoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_Contas.dbeVencExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_Contas.dblcboxFornecExit(Sender: TObject);
begin
(Sender as TDblookupComboBox).Color:=clWindow;
end;

procedure TForm_Contas.dbeValorExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
dmdados.TbCpagarEfetuado.Value:='Em aberto';
end;

procedure TForm_Contas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm_Contas.btCadastroClick(Sender: TObject);
begin
dbnvContas.Enabled:=False;
btCadastro.Enabled:=False;
btOk.Enabled:=True;
btCancel.Enabled:=True;
btCancCad.Enabled:=True;
btLocalizar.Enabled:=true;
dmdados.tbCpagar.Append;
dbeDoc.SetFocus;
end;

procedure TForm_Contas.btOkClick(Sender: TObject);
begin
dmdados.tbCpagar.Post;
dmdados.tbCpagar.Append;
dbeDoc.SetFocus;
end;

procedure TForm_Contas.btCancelClick(Sender: TObject);
begin
 dmdados.tbCpagar.Cancel;
 dmdados.tbCpagar.Append;
 dbeDoc.SetFocus;
end;

procedure TForm_Contas.btCancCadClick(Sender: TObject);
begin
dbnvContas.Enabled:=True;
btCadastro.Enabled:=True;
btOk.Enabled:=False;
btCancel.Enabled:=False;
btCancCad.Enabled:=False;
btLocalizar.Enabled:=false;
dmdados.tbCpagar.Cancel;
dmdados.tbCpagar.First;
end;

procedure TForm_Contas.dbmObsExit(Sender: TObject);
begin
(Sender as TDbmemo).Color:=clWindow;
end;

procedure TForm_Contas.BTrelatorioClick(Sender: TObject);
begin
Form_periodo:=TForm_periodo.create(application);
Form_periodo.showmodal;
end;

procedure TForm_Contas.BTlocalizarClick(Sender: TObject);
begin
Form_locConta:=TForm_locConta.create(application);
Form_locConta.showmodal;
end;

end.
