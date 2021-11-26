//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_baixaMens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,Variants;

type
  TForm_baixaMens = class(TForm)
    GroupBox1: TGroupBox;
    Label6: TLabel;
    dbevalor: TDBEdit;
    Label9: TLabel;
    dbePagoem: TDBEdit;
    Label1: TLabel;
    Panel1: TPanel;
    BTconfirma: TBitBtn;
    BTcancela: TBitBtn;
    edtAno: TEdit;
    cbMes: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edtCod: TEdit;
    procedure FormShow(Sender: TObject);
    procedure dbePagoemEnter(Sender: TObject);
    procedure dbevalorEnter(Sender: TObject);
    procedure dbePagoemExit(Sender: TObject);
    procedure dbevalorExit(Sender: TObject);
    procedure BTconfirmaClick(Sender: TObject);
    procedure BTcancelaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtAnoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_baixaMens: TForm_baixaMens;

implementation

uses unit_dmdados;

{$R *.DFM}

procedure TForm_baixaMens.FormShow(Sender: TObject);
begin
edtCod.setfocus;
end;

procedure TForm_baixaMens.dbePagoemEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixaMens.dbevalorEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixaMens.dbePagoemExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixaMens.dbevalorExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;


procedure TForm_baixaMens.BTconfirmaClick(Sender: TObject);
begin
dmdados.tbContasReceberQuitado.value:='Pago';
dmdados.TbContasReceber.Post;
close;
end;

procedure TForm_baixaMens.BTcancelaClick(Sender: TObject);
begin
dmdados.TbContasReceber.Cancel;
close;
end;

procedure TForm_baixaMens.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TForm_baixaMens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm_baixaMens.edtAnoExit(Sender: TObject);
begin
If Not (dmDados.TbContasReceber.Locate('Cod_Numero;Mes;Ano', VarArrayOf
   ([edtCod.text,cbMes.Text,edtAno.Text]),[])) Then
   Begin
     showmessage('Dados n�o localizados !');
     edtAno.Clear;
     edtCod.Clear;
     edtCod.SetFocus;
   End
Else
  dmDados.tbContasReceber.Edit;
end;

end.
