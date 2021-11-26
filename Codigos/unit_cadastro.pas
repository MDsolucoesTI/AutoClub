//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_cadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids;

type
  TForm_Cadastro = class(TForm)
    gbCategoria: TGroupBox;
    gbNome: TGroupBox;
    dbeNome: TDBEdit;
    gbEndereco: TGroupBox;
    dbeEndereco: TDBEdit;
    gbIdentidade: TGroupBox;
    dbeIdentidade: TDBEdit;
    gbNascimento: TGroupBox;
    dbeNascimento: TDBEdit;
    gbNomepais: TGroupBox;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btCancCad: TBitBtn;
    btCadastro: TBitBtn;
    BTlocalizar: TBitBtn;
    BTSair: TBitBtn;
    dbmNomepais: TDBMemo;
    gbBairro: TGroupBox;
    DBEBairro: TDBEdit;
    gbNumero: TGroupBox;
    DBEdit1: TDBEdit;
    dbnCadastro: TDBNavigator;
    gbFone: TGroupBox;
    dbeTelefone: TDBEdit;
    DBComboBox1: TDBComboBox;
    gbCep: TGroupBox;
    dbeCep: TDBEdit;
    gbCidade: TGroupBox;
    dbeCidade: TDBEdit;
    gbUF: TGroupBox;
    dbcbxEstado: TDBComboBox;
    gbobs: TGroupBox;
    dbmObs: TDBMemo;
    gbSexo: TGroupBox;
    DBComboBox2: TDBComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbnvcadastrosClick(Sender: TObject; Button: TNavigateBtn);
    procedure btCadastroClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
//    procedure BTlocalizarClick(Sender: TObject);
    procedure btCancCadClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure BTlocalizarClick(Sender: TObject);
    procedure dbnCadastroClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeCategoriaEnter(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure dbeNomeEnter(Sender: TObject);
    procedure dbeEnderecoEnter(Sender: TObject);
    procedure DBEBairroEnter(Sender: TObject);
    procedure dbeIdentidadeEnter(Sender: TObject);
    procedure dbeNascimentoEnter(Sender: TObject);
    procedure dbmNomepaisEnter(Sender: TObject);
    procedure dbeCategoriaExit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure dbeEnderecoExit(Sender: TObject);
    procedure DBEBairroExit(Sender: TObject);
    procedure dbeIdentidadeExit(Sender: TObject);
    procedure dbeNascimentoExit(Sender: TObject);
    procedure dbmNomepaisExit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cadastro: TForm_Cadastro;

implementation

uses Unit_dmdados, Unit_locsocios{, Unit_locsocios};

{$R *.DFM}

procedure TForm_Cadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TForm_Cadastro.dbnvcadastrosClick(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button in [nbInsert] then
      dbcombobox1.SetFocus;
end;

procedure TForm_Cadastro.btCadastroClick(Sender: TObject);
begin
   dbnCadastro.Enabled:=False;
   btCadastro.Enabled:=False;
   btOk.Enabled:=True;
   btCancel.Enabled:=True;
   btCancCad.Enabled:=True;
   btLocalizar.Enabled:=true;
   dmdados.tbcadastro.Append;
   dbComboBox1.SetFocus;
end;

procedure TForm_Cadastro.btOkClick(Sender: TObject);
begin
dmdados.tbCadastro.Post;
dmdados.tbCadastro.Append;
dbComboBox1.SetFocus;
end;

procedure TForm_Cadastro.btCancelClick(Sender: TObject);
begin
 dmdados.tbCadastro.Cancel;
 dmdados.tbCadastro.Append;
 dbComboBox1.SetFocus;
end;

procedure TForm_Cadastro.BTlocalizarClick(Sender: TObject);
begin
form_locSocios:=Tform_locSocios.create(application);
form_locSocios.showmodal;
end;

procedure TForm_Cadastro.btCancCadClick(Sender: TObject);
begin
   dbnCadastro.Enabled:=True;
   btCadastro.Enabled:=True;
   btOk.Enabled:=False;
   btCancel.Enabled:=False;
   btCancCad.Enabled:=False;
   btLocalizar.Enabled:=false;
   dmdados.tbCadastro.Cancel;
   dmdados.tbCadastro.First;
end;

procedure TForm_Cadastro.BTSairClick(Sender: TObject);
begin
close;
end;

{procedure TForm_Cadastro.BTlocalizarClick(Sender: TObject);
begin
form_locsocios:=Tform_locsocios.create(application);
form_locsocios.showmodal;
end;}

procedure TForm_Cadastro.dbnCadastroClick(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button in [nbInsert] then
      dbComboBox1.SetFocus;
end;

procedure TForm_Cadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm_Cadastro.dbeCategoriaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Cadastro.DBEdit1Enter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Cadastro.dbeNomeEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Cadastro.dbeEnderecoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Cadastro.DBEBairroEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Cadastro.dbeIdentidadeEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Cadastro.dbeNascimentoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_Cadastro.dbmNomepaisEnter(Sender: TObject);
begin
(Sender as TDbmemo).Color:=claqua;
end;

procedure TForm_Cadastro.dbeCategoriaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_Cadastro.DBEdit1Exit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_Cadastro.dbeNomeExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_Cadastro.dbeEnderecoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_Cadastro.DBEBairroExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_Cadastro.dbeIdentidadeExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_Cadastro.dbeNascimentoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_Cadastro.dbmNomepaisExit(Sender: TObject);
begin
(Sender as TDbmemo).Color:=clwindow;
end;

procedure TForm_Cadastro.DBComboBox1Exit(Sender: TObject);
begin
if dmdados.TBcadastroCategoria.value='Dependente' then
  Begin
    dbeEndereco.Enabled:=False;
    dbeBairro.Enabled:=false;
    dbeCep.Enabled:=false;
    dbeCidade.Enabled:=false;
    dbcbxEstado.Enabled:=false;
    dbeTelefone.Enabled:=false;
    dbeIdentidade.Enabled:=false;
    dbmNomePais.Enabled:=false;
  End
else
  Begin
    dbeEndereco.Enabled:=true;
    dbeBairro.Enabled:=true;
    dbeCep.Enabled:=true;
    dbeCidade.Enabled:=true;
    dbcbxEstado.Enabled:=true;
    dbeTelefone.Enabled:=true;
    dbeIdentidade.Enabled:=true;
    dbmNomePais.Enabled:=true;
  End;
end;

end.
