//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_relimprimir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TForm_relimprimimir = class(TForm)
    Panel1: TPanel;
    BTpago: TBitBtn;
    BTnpago: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BTpagoClick(Sender: TObject);
    procedure BTnpagoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_relimprimimir: TForm_relimprimimir;

implementation

uses Unit_relquitadas, Unit_dmdados, Unit_Relatrazadas;

{$R *.DFM}

procedure TForm_relimprimimir.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TForm_relimprimimir.BTpagoClick(Sender: TObject);
begin
Form_relquitadas:=TForm_relquitadas.Create(Application);
dmdados.TbContasReceber.SetRangeStart;
dmdados.TbContasReceber.FieldByName('Quitado').AsString :='Pago';
dmdados.TbContasReceber.SetRangeEnd;
dmdados.TbContasReceber.FieldByName('Quitado').AsString := 'Pago';
dmdados.TbContasReceber.ApplyRange;
Form_relquitadas.QRQuitadas.preview{.print};
end;
procedure TForm_relimprimimir.BTnpagoClick(Sender: TObject);
begin
Form_relAtrazadas:=TForm_relAtrazadas.Create(Application);
dmdados.TbContasReceber.SetRangeStart;
dmdados.TbContasReceber.FieldByName('Quitado').AsString :='Em aberto';
dmdados.TbContasReceber.SetRangeEnd;
dmdados.TbContasReceber.FieldByName('Quitado').AsString := 'Em aberto';
dmdados.TbContasReceber.ApplyRange;
Form_relAtrazadas.QRAtrazadas.preview{.print};
end;

end.
