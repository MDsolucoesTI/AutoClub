//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_locsocios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm_LocSocios = class(TForm)
    Label1: TLabel;
    Edit_Locsocios: TEdit;
    procedure Edit_LocsociosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_LocSocios: TForm_LocSocios;

implementation

uses unit_dmdados;

{$R *.DFM}

procedure TForm_LocSocios.Edit_LocsociosChange(Sender: TObject);
begin
Dmdados.tbCadastro.findnearest([edit_locSocios.text]);
end;

procedure TForm_LocSocios.FormShow(Sender: TObject);
begin
dmdados.tbcadastro.indexfieldnames:='Nome';
end;

procedure TForm_LocSocios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmdados.tbcadastro.indexfieldnames:='cod_numero';
end;

end.
