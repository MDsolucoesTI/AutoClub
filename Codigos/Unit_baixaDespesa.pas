//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_baixaDespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TForm_baixaDespesa = class(TForm)
    GroupBox1: TGroupBox;
    dbeTotalpago: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    dbePagoem: TDBEdit;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBText1: TDBText;
    procedure FormShow(Sender: TObject);
    procedure dbePagoemEnter(Sender: TObject);
    procedure dbeDescontoEnter(Sender: TObject);
    procedure dbeJurosEnter(Sender: TObject);
    procedure dbeTotalpagoEnter(Sender: TObject);
    procedure dbePagoemExit(Sender: TObject);
    procedure dbeDescontoExit(Sender: TObject);
    procedure dbeJurosExit(Sender: TObject);
    procedure dbeTotalpagoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_baixaDespesa: TForm_baixaDespesa;

implementation

uses unit_dmdados;

{$R *.DFM}

procedure TForm_baixaDespesa.FormShow(Sender: TObject);
begin
dmdados.TbCpagar.edit;
dbePagoem.setfocus;
end;

procedure TForm_baixaDespesa.dbePagoemEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixaDespesa.dbeDescontoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixaDespesa.dbeJurosEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixaDespesa.dbeTotalpagoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixaDespesa.dbePagoemExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixaDespesa.dbeDescontoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixaDespesa.dbeJurosExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixaDespesa.dbeTotalpagoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixaDespesa.BitBtn1Click(Sender: TObject);
begin
dmdados.TbDespesasEfetuado.Value:='Pago';
dmdados.TbDespesas.Post;
close;
end;

procedure TForm_baixaDespesa.BitBtn2Click(Sender: TObject);
begin
dmdados.TbDespesas.cancel;
close;
end;

procedure TForm_baixaDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TForm_baixaDespesa.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

end.
