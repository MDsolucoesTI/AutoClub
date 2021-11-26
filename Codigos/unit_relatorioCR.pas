//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_relatorioCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unit_periodo, StdCtrls, Buttons, ExtCtrls;

type
  TForm_relatorioCR = class(TForm_periodo)
    procedure BTpagasClick(Sender: TObject);
    procedure BTnpagasClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_relatorioCR: TForm_relatorioCR;

implementation

uses unit_relMensPagas, unit_dmdados, unit_relMensNpagas, unit_periodoCR;

{$R *.DFM}

procedure TForm_relatorioCR.BTpagasClick(Sender: TObject);
begin
Form_relMensPagas:=TForm_relMensPagas.Create(Application);
dmdados.TbContasReceber.SetRangeStart;
dmdados.TbContasReceber.FieldByName('Quitado').AsString :='Pago';
dmdados.TbContasReceber.SetRangeEnd;
dmdados.TbContasReceber.FieldByName('Quitado').AsString := 'Pago';
dmdados.TbContasReceber.ApplyRange;
Form_relMensPagas.QRmensPagas.print;

end;

procedure TForm_relatorioCR.BTnpagasClick(Sender: TObject);
begin
Form_relMensNPagas:=TForm_relMensNPagas.Create(Application);
dmdados.TbContasReceber.SetRangeStart;
dmdados.TbContasReceber.FieldByName('Quitado').AsString :='Em aberto';
dmdados.TbContasReceber.SetRangeEnd;
dmdados.TbContasReceber.FieldByName('Quitado').AsString := 'Em aberto';
dmdados.TbContasReceber.ApplyRange;
Form_relMensNPagas.QRmensNPagas.print;

end;

procedure TForm_relatorioCR.BitBtn2Click(Sender: TObject);
begin
Form_periodoCR:=TForm_periodoCR.create(application);
Form_periodoCR.showmodal;

end;

procedure TForm_relatorioCR.FormShow(Sender: TObject);
begin
dmdados.tbContasReceber.IndexFieldNames:='Quitado';
end;

procedure TForm_relatorioCR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

dmdados.tbContasReceber.CancelRange;
action:=cafree;
end;

end.
