//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons;

type
  TForm_cheque = class(TForm)
    GroupBox1: TGroupBox;
    dbeBanco: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    dbeAgencia: TDBEdit;
    dbenumero: TDBEdit;
    dbevalor: TDBEdit;
    GroupBox5: TGroupBox;
    dbevalorextensob: TDBEdit;
    dbevalorextenso: TDBEdit;
    GroupBox6: TGroupBox;
    dbedata: TDBEdit;
    GroupBox7: TGroupBox;
    dbefavorecido: TDBEdit;
    Panel1: TPanel;
    BTsair: TBitBtn;
    dbnvCheque: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BTsairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeBancoEnter(Sender: TObject);
    procedure dbeAgenciaEnter(Sender: TObject);
    procedure dbenumeroEnter(Sender: TObject);
    procedure dbevalorEnter(Sender: TObject);
    procedure dbevalorextensoEnter(Sender: TObject);
    procedure dbedataEnter(Sender: TObject);
    procedure dbevalorextensobEnter(Sender: TObject);
    procedure dbefavorecidoEnter(Sender: TObject);
    procedure dbeBancoExit(Sender: TObject);
    procedure dbeAgenciaExit(Sender: TObject);
    procedure dbenumeroExit(Sender: TObject);
    procedure dbevalorExit(Sender: TObject);
    procedure dbevalorextensoExit(Sender: TObject);
    procedure dbevalorextensobExit(Sender: TObject);
    procedure dbedataExit(Sender: TObject);
    procedure dbefavorecidoExit(Sender: TObject);
    procedure dbnvChequeClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cheque: TForm_cheque;

implementation
        uses unit_dmdados;
{$R *.DFM}

procedure TForm_cheque.BitBtn1Click(Sender: TObject);
var
   Impressora:TextFile;
begin
AssignFile(Impressora,'Lpt1:');
Rewrite(Impressora);
//O comando writeln imprime o comando e pula uma linha, no caso abaixo
//Estamos apenas pulando uma linha.
Write(Impressora,#15);
WriteLn(Impressora, Format('%100f',[dmdados.TbChequesValor.Value]));
// pula uma linha                                            
WriteLn(Impressora);
WriteLn(Impressora, Format('%-30s',[dmdados.TbChequesValorExtenso.Value]));
WriteLn(Impressora);
WriteLn(Impressora, Format('%-20s',[dmdados.TbChequesValorExtensoII.Value]));
WriteLn(Impressora);
WriteLn(Impressora, Format('%-20s',[dmdados.TbChequesFavorecido.Value]));
WriteLn(Impressora,'                                                     Sao Bento,       '+FormatDateTime('d       mmmm       yyyy',dmdados.TbChequesData.Value));
WriteLn(Impressora);
CloseFile(Impressora);
dmdados.TbCheques.Post;
dmdados.TbCheques.close;
close;
end;

procedure TForm_cheque.BTsairClick(Sender: TObject);
begin


close;
end;

procedure TForm_cheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
   begin
        key:=#0;
        postmessage(handle,WM_keydown,vk_tab,1);
   end;
end;

procedure TForm_cheque.dbeBancoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbeAgenciaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbenumeroEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbevalorEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbevalorextensoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbedataEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbevalorextensobEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbefavorecidoEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=claqua;
end;

procedure TForm_cheque.dbeBancoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbeAgenciaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbenumeroExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbevalorExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbevalorextensoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbevalorextensobExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbedataExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbefavorecidoExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TForm_cheque.dbnvChequeClick(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button in [nbInsert] then
       dbebanco.clear;
       dbevalor.clear;
       dbedata.clear;
       dbeagencia.clear;
       dbevalorextenso.clear;
       dbevalorextensob.clear;
       dbefavorecido.clear;
       dbenumero.clear;
       dbebanco.SetFocus;
end;

procedure TForm_cheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

end.
