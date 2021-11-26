//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_locContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons;

type
  TForm_locConta = class(TForm)
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
  Form_locConta: TForm_locConta;

implementation

uses Unit_dmdados;

{$R *.DFM}

procedure TForm_locConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
      
end;

procedure TForm_locConta.Edit1Change(Sender: TObject);
begin
Dmdados.TbCpagar.findnearest([edit1.text]);

end;

procedure TForm_locConta.FormShow(Sender: TObject);
begin
  DmDados.TbCpagar.IndexFieldNames:='Docnumero';
  edit1.SetFocus;
end;

procedure TForm_locConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DmDados.TbCpagar.IndexFieldNames:='registro';
   action:=cafree;
end;

end.
