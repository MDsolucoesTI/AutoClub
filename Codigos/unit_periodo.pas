//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_periodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TForm_periodo = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BTpagas: TBitBtn;
    BTnpagas: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BTpagasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BTnpagasClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_periodo: TForm_periodo;

implementation

uses unit_dmdados, unit_relContasPagas, unit_relContasNaoPagas,
  unit_definePeriodo;

{$R *.DFM}

procedure TForm_periodo.BTpagasClick(Sender: TObject);
begin
Form_relContasPagas:=TForm_relContasPagas.Create(Application);
dmdados.TbCpagar.SetRangeStart;
dmdados.TbCpagar.FieldByName('Efetuado').AsString :='Pago';
dmdados.TbCpagar.SetRangeEnd;
dmdados.TbCpagar.FieldByName('Efetuado').AsString := 'Pago';
dmdados.TbCpagar.ApplyRange;
Form_relContasPagas.QRContasPagas.print;
end;

procedure TForm_periodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmdados.TbCpagar.CancelRange;
dmdados.TbCpagar.indexfieldnames:='Registro';
action:=cafree;
end;

procedure TForm_periodo.FormShow(Sender: TObject);
begin
dmdados.TbCpagar.indexfieldnames:='Efetuado';
end;

procedure TForm_periodo.BTnpagasClick(Sender: TObject);
begin
Form_relContasNaoPagas:=TForm_relContasNaoPagas.Create(Application);
dmdados.TbCpagar.SetRangeStart;
dmdados.TbCpagar.FieldByName('Efetuado').AsString :='Em aberto';
dmdados.TbCpagar.SetRangeEnd;
dmdados.TbCpagar.FieldByName('Efetuado').AsString := 'Em aberto';
dmdados.TbCpagar.ApplyRange;
Form_relContasNaoPagas.QRContasNaoPagas.print;
end;

procedure TForm_periodo.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm_periodo.BitBtn2Click(Sender: TObject);
begin
Form_definePeriodo:=TForm_definePeriodo.create(application);
Form_definePeriodo.showmodal;

end;

end.
