//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_definePeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask;

type
  TForm_definePeriodo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BTpagas: TBitBtn;
    BTnpagas: TBitBtn;
    BitBtn1: TBitBtn;
    MskDataInicio: TMaskEdit;
    mskDataFim: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTpagasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTnpagasClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_definePeriodo: TForm_definePeriodo;

implementation

uses unit_relContasPagas, unit_dmdados, unit_relContasNaoPagas,
  unit_periodo;

{$R *.DFM}

procedure TForm_definePeriodo.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm_definePeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmdados.TbCpagar.IndexFieldNames:='registro';
action:=cafree;
end;

procedure TForm_definePeriodo.BTpagasClick(Sender: TObject);
begin
Form_relContasPagas:=TForm_relContasPagas.Create(Application);
dmdados.TbCpagar.SetRangeStart;
dmdados.TbCpagar.FieldByName('Vencimento').AsString :=mskDataInicio.text;
dmdados.TbCpagar.SetRangeEnd;
dmdados.TbCpagar.FieldByName('Vencimento').AsString :=mskDataFim.Text;
dmdados.TbCpagar.ApplyRange;
Form_relContasPagas.QRContasPagas.print;
end;

procedure TForm_definePeriodo.FormShow(Sender: TObject);
begin
dmdados.TbCpagar.IndexFieldNames:='Vencimento';
mskDatainicio.setfocus;
end;

procedure TForm_definePeriodo.BTnpagasClick(Sender: TObject);
begin
Form_relContasNaoPagas:=TForm_relContasNaoPagas.Create(Application);
dmdados.TbCpagar.SetRangeStart;
dmdados.TbCpagar.FieldByName('Vencimento').AsString :=mskDataInicio.text;
dmdados.TbCpagar.SetRangeEnd;
dmdados.TbCpagar.FieldByName('Vencimento').AsString :=mskDataFim.Text;
dmdados.TbCpagar.ApplyRange;
Form_relContasNaoPagas.QRContasNaoPagas.print;
end;

procedure TForm_definePeriodo.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

end.
