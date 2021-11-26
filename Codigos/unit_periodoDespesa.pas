//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_periodoDespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TForm_periodoDespesa = class(TForm)
    Panel1: TPanel;
    BTpagas: TBitBtn;
    BTnpagas: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BTpagasClick(Sender: TObject);
    procedure BTnpagasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_periodoDespesa: TForm_periodoDespesa;

implementation

uses unit_despesaPaga, unit_dmdados, Unit_relDespesaNaoPaga,
  unit_definePeriodoDespesa;

{$R *.DFM}

procedure TForm_periodoDespesa.BTpagasClick(Sender: TObject);
begin
Form_relDespesa:=TForm_relDespesa.Create(Application);
dmdados.Tbdespesas.SetRangeStart;
dmdados.Tbdespesas.FieldByName('Efetuado').AsString :='Pago';
dmdados.Tbdespesas.SetRangeEnd;
dmdados.Tbdespesas.FieldByName('Efetuado').AsString := 'Pago';
dmdados.Tbdespesas.ApplyRange;
Form_relDespesa.QRdespesa.print;
end;

procedure TForm_periodoDespesa.BTnpagasClick(Sender: TObject);
begin
Form_relDespesaNaoPaga:=TForm_relDespesaNaoPaga.Create(Application);
dmdados.Tbdespesas.SetRangeStart;
dmdados.Tbdespesas.FieldByName('Efetuado').AsString :='Em aberto';
dmdados.Tbdespesas.SetRangeEnd;
dmdados.Tbdespesas.FieldByName('Efetuado').AsString := 'Em aberto';
dmdados.Tbdespesas.ApplyRange;
Form_relDespesaNaoPaga.QRdespesaNaoPaga.print;
end;

procedure TForm_periodoDespesa.FormShow(Sender: TObject);
begin
dmdados.Tbdespesas.IndexFieldNames:='Efetuado';
end;

procedure TForm_periodoDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmdados.Tbdespesas.CancelRange;
dmdados.Tbdespesas.IndexFieldNames:='Codigo';
action:=cafree;
end;

procedure TForm_periodoDespesa.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm_periodoDespesa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TForm_periodoDespesa.BitBtn2Click(Sender: TObject);
begin
Form_definePeriodoDespesa:=TForm_definePeriodoDespesa.create(application);
Form_definePeriodoDespesa.showmodal;
end;

end.
