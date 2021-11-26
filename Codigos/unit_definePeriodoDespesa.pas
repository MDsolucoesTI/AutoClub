//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_definePeriodoDespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask;

type
  TForm_definePeriodoDespesa = class(TForm)
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
  Form_definePeriodoDespesa: TForm_definePeriodoDespesa;

implementation

uses unit_relContasPagas, unit_dmdados, unit_relContasNaoPagas,
  unit_despesaPaga, Unit_relDespesaNaoPaga;

{$R *.DFM}

procedure TForm_definePeriodoDespesa.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm_definePeriodoDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmdados.TbDespesas.IndexFieldNames:='codigo';
action:=cafree;
end;

procedure TForm_definePeriodoDespesa.BTpagasClick(Sender: TObject);
begin
Form_relDespesa:=TForm_relDespesa.Create(Application);
dmdados.TbDespesas.SetRangeStart;
dmdados.TbDespesas.FieldByName('Vencimento').AsString :=mskDataInicio.text;
dmdados.TbDespesas.SetRangeEnd;
dmdados.TbDespesas.FieldByName('Vencimento').AsString :=mskDataFim.Text;
dmdados.TbDespesas.ApplyRange;
Form_relDespesa.QRdespesa.print;
end;

procedure TForm_definePeriodoDespesa.FormShow(Sender: TObject);
begin
dmdados.TbDespesas.IndexFieldNames:='Vencimento';
mskdatainicio.setfocus;
end;

procedure TForm_definePeriodoDespesa.BTnpagasClick(Sender: TObject);
begin
Form_relDespesaNaoPaga:=TForm_relDespesaNaoPaga.Create(Application);
dmdados.TbDespesas.SetRangeStart;
dmdados.TbDespesas.FieldByName('Vencimento').AsString :=mskDataInicio.text;
dmdados.TbDespesas.SetRangeEnd;
dmdados.TbDespesas.FieldByName('Vencimento').AsString :=mskDataFim.Text;
dmdados.TbDespesas.ApplyRange;
Form_relDespesaNaoPaga.QRDespesaNaoPaga.print;
end;

procedure TForm_definePeriodoDespesa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

end.
