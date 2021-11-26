//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_periodoCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask;

type
  TForm_PeriodoCR = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BTpagas: TBitBtn;
    BTnpagas: TBitBtn;
    BitBtn1: TBitBtn;
    cbMesI: TComboBox;
    cbMesF: TComboBox;
    edtAnoI: TEdit;
    edtAnoF: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTpagasClick(Sender: TObject);
    procedure BTnpagasClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PeriodoCR: TForm_PeriodoCR;

implementation

uses unit_relContasPagas, unit_dmdados, unit_relContasNaoPagas,
  unit_periodo, unit_relMensPagas, unit_relMensNpagas;

{$R *.DFM}

procedure TForm_PeriodoCR.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm_PeriodoCR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmDados.TbContasReceber.Filtered:=False;
dmDados.TbContasReceber.IndexFieldNames:='Cod_numero;Mes;Ano';
action:=cafree;
end;

procedure TForm_PeriodoCR.BTpagasClick(Sender: TObject);
begin
Form_relMensPagas:=TForm_relMensPagas.Create(Application);
dmDados.TbContasReceber.Filtered:=False;
dmDados.TbContasReceber.Filter:='((Mes >= '''+cbMesI.Text+''') And '+
                                '(Ano >= '''+edtAnoI.Text+''')) And '+
                                '((Mes <= '''+cbMesF.Text+''') And '+
                                '(Ano >= '''+edtAnoI.Text+''')) And '+
                                '(Quitado = '''+'Pago'+''')';
dmDados.TbContasReceber.Filtered:=True;
Form_relmensPagas.QRmensPagas.print;
end;

procedure TForm_PeriodoCR.BTnpagasClick(Sender: TObject);
begin
Form_relmensNPagas:=TForm_relmensNPagas.Create(Application);
dmDados.TbContasReceber.Filtered:=False;
dmDados.TbContasReceber.Filter:='((Mes >= '''+cbMesI.Text+''') And '+
                                '(Ano >= '''+edtAnoI.Text+''')) And '+
                                '((Mes <= '''+cbMesF.Text+''') And '+
                                '(Ano >= '''+edtAnoI.Text+''')) And '+
                                '(Quitado = '''+'Em Aberto'+''')';
dmDados.TbContasReceber.Filtered:=True;
Form_relmensNPagas.QRmensNPagas.print;
end;

procedure TForm_PeriodoCR.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

end.
