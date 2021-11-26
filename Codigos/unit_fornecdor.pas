//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_fornecdor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  Tform_fornecedor = class(TForm)
    gbCodigo: TGroupBox;
    dbeCodigo: TDBEdit;
    gbRazaoSocial: TGroupBox;
    dbeNome: TDBEdit;
    gbEndereco: TGroupBox;
    dbeEndereco: TDBEdit;
    gbComplemento: TGroupBox;
    dbeComplemento: TDBEdit;
    gbBairro: TGroupBox;
    dbeBairro: TDBEdit;
    gbCep: TGroupBox;
    dbeCep: TDBEdit;
    gbCidade: TGroupBox;
    dbeCidade: TDBEdit;
    gbEstado: TGroupBox;
    gbTelefone: TGroupBox;
    dbeTelefone: TDBEdit;
    gbRamal: TGroupBox;
    dbeRamal: TDBEdit;
    gbEMail: TGroupBox;
    dbeEMail: TDBEdit;
    gbContato: TGroupBox;
    dbeContato: TDBEdit;
    gbInsEstadual: TGroupBox;
    dbeInsc: TDBEdit;
    gbCNPJ: TGroupBox;
    dbeCnpj: TDBEdit;
    gbFax: TGroupBox;
    dbeFax: TDBEdit;
    gbObs: TGroupBox;
    dbmObs: TDBMemo;
    Panel1: TPanel;
    dbnvFornecedor: TDBNavigator;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btCancCad: TBitBtn;
    dbcbxEstado: TDBComboBox;
    btCadastro: TBitBtn;
    BTlocalizar: TBitBtn;
    BTSair: TBitBtn;
    procedure dbnvFornecedorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btCadastroClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btCancCadClick(Sender: TObject);
    procedure BTlocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNomeEnter(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure dbeInscEnter(Sender: TObject);
    procedure dbeCnpjEnter(Sender: TObject);
    procedure dbeContatoEnter(Sender: TObject);
    procedure dbeEnderecoEnter(Sender: TObject);
    procedure dbeComplementoEnter(Sender: TObject);
    procedure dbeBairroEnter(Sender: TObject);
    procedure dbeCidadeEnter(Sender: TObject);
    procedure dbcbxEstadoEnter(Sender: TObject);
    procedure dbeCepEnter(Sender: TObject);
    procedure dbeEMailEnter(Sender: TObject);
    procedure dbmObsEnter(Sender: TObject);
    procedure dbeTelefoneEnter(Sender: TObject);
    procedure dbeFaxEnter(Sender: TObject);
    procedure dbeRamalEnter(Sender: TObject);
    procedure dbeInscExit(Sender: TObject);
    procedure dbeCnpjExit(Sender: TObject);
    procedure dbeContatoExit(Sender: TObject);
    procedure dbeEnderecoExit(Sender: TObject);
    procedure dbeComplementoExit(Sender: TObject);
    procedure dbeBairroExit(Sender: TObject);
    procedure dbeCidadeExit(Sender: TObject);
    procedure dbcbxEstadoExit(Sender: TObject);
    procedure dbeCepExit(Sender: TObject);
    procedure dbeEMailExit(Sender: TObject);
    procedure dbmObsExit(Sender: TObject);
    procedure dbeTelefoneExit(Sender: TObject);
    procedure dbeFaxExit(Sender: TObject);
    procedure dbeRamalExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_fornecedor: Tform_fornecedor;

implementation

uses unit_dmdados, unit_locfornecedor;

{$R *.DFM}

procedure Tform_fornecedor.dbnvFornecedorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button in [nbInsert] then
      dbeNome.SetFocus;
end;

procedure Tform_fornecedor.btCadastroClick(Sender: TObject);
begin
   dbnvFornecedor.Enabled:=False;
   btCadastro.Enabled:=False;
   btOk.Enabled:=True;
   btCancel.Enabled:=True;
   btCancCad.Enabled:=True;
   btLocalizar.Enabled:=true;
   dmdados.tbfornecedor.Append;
   dbeNome.SetFocus;
end;

procedure Tform_fornecedor.btOkClick(Sender: TObject);
begin
dmdados.tbfornecedor.Post;
dmdados.tbfornecedor.Append;
dbeNome.SetFocus;
end;

procedure Tform_fornecedor.btCancelClick(Sender: TObject);
begin
 dmdados.tbfornecedor.Cancel;
 dmdados.tbfornecedor.Append;
 dbeNome.SetFocus;
end;

procedure Tform_fornecedor.btCancCadClick(Sender: TObject);
begin
   dbnvFornecedor.Enabled:=True;
   btCadastro.Enabled:=True;
   btOk.Enabled:=False;
   btCancel.Enabled:=False;
   btCancCad.Enabled:=False;
   btLocalizar.Enabled:=false;
   dmdados.tbFornecedor.Cancel;
   dmdados.tbFornecedor.First;
end;

procedure Tform_fornecedor.BTlocalizarClick(Sender: TObject);
begin
form_locfornecedor:=Tform_locfornecedor.create(application);
form_locfornecedor.showmodal;
end;

procedure Tform_fornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tform_fornecedor.dbeNomeEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeNomeExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeInscEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeCnpjEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeContatoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeEnderecoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeComplementoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeBairroEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeCidadeEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbcbxEstadoEnter(Sender: TObject);
begin
(Sender as TDbcomboBox).Color:=claqua;
end;

procedure Tform_fornecedor.dbeCepEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeEMailEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbmObsEnter(Sender: TObject);
begin
(Sender as TDbmemo).Color:=claqua;
end;

procedure Tform_fornecedor.dbeTelefoneEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeFaxEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeRamalEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure Tform_fornecedor.dbeInscExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeCnpjExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeContatoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeEnderecoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeComplementoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeBairroExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeCidadeExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbcbxEstadoExit(Sender: TObject);
begin
(Sender as TDbcomboBox).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeCepExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeEMailExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbmObsExit(Sender: TObject);
begin
(Sender as TDbMemo).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeTelefoneExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeFaxExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.dbeRamalExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure Tform_fornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure Tform_fornecedor.BTSairClick(Sender: TObject);
begin
close
end;

end.
