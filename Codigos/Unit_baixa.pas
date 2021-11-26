//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_baixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TForm_baixa = class(TForm)
    GroupBox1: TGroupBox;
    dbeTotalpago: TDBEdit;
    Label6: TLabel;
    Label5: TLabel;
    dbeJuros: TDBEdit;
    dbeDesconto: TDBEdit;
    Label7: TLabel;
    Label9: TLabel;
    dbePagoem: TDBEdit;
    Label1: TLabel;
    Panel1: TPanel;
    BTconfirma: TBitBtn;
    BTcancela: TBitBtn;
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
    procedure BTconfirmaClick(Sender: TObject);
    procedure BTcancelaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_baixa: TForm_baixa;

implementation

uses unit_dmdados;

{$R *.DFM}

procedure TForm_baixa.FormShow(Sender: TObject);
begin
dmdados.TbCpagar.edit;
dbePagoem.setfocus;
end;

procedure TForm_baixa.dbePagoemEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixa.dbeDescontoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixa.dbeJurosEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixa.dbeTotalpagoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_baixa.dbePagoemExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixa.dbeDescontoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixa.dbeJurosExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixa.dbeTotalpagoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TForm_baixa.BTconfirmaClick(Sender: TObject);
begin
dmdados.TbCpagarEfetuado.Value:='Pago';
dmdados.TbCpagar.Post;
close;
end;

procedure TForm_baixa.BTcancelaClick(Sender: TObject);
begin
dmdados.TbCpagar.cancel;
close;
end;

procedure TForm_baixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TForm_baixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
