//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_locdespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons;

type
  TForm_locdespesa = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_locdespesa: TForm_locdespesa;

implementation

uses Unit_dmdados;

{$R *.DFM}

procedure TForm_locdespesa.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
      
end;

procedure TForm_locdespesa.Edit1Change(Sender: TObject);
begin
Dmdados.Tbdespesas.findnearest([edit1.text]);

end;

procedure TForm_locdespesa.FormShow(Sender: TObject);
begin
  DmDados.Tbdespesas.IndexFieldNames:='descricao';
  edit1.SetFocus;
end;

procedure TForm_locdespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DmDados.Tbdespesas.IndexFieldNames:='Codigo';
   action:=cafree;
end;

end.
