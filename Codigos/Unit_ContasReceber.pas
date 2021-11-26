//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_ContasReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TForm_ContasReceber = class(TForm)
    Panel_jan: TPanel;
    Label1: TLabel;
    Jan: TCheckBox;
    Panel_fev: TPanel;
    Label2: TLabel;
    Fev: TCheckBox;
    Panel_mar: TPanel;
    Label3: TLabel;
    Panel_mai: TPanel;
    Label6: TLabel;
    Mai: TCheckBox;
    Panel_abr: TPanel;
    Label5: TLabel;
    Abr: TCheckBox;
    Panel_jul: TPanel;
    Label9: TLabel;
    Jul: TCheckBox;
    Panel_nov: TPanel;
    Label14: TLabel;
    Nov: TCheckBox;
    Panel_ago: TPanel;
    Label10: TLabel;
    Ago: TCheckBox;
    Panel_set: TPanel;
    Label11: TLabel;
    St: TCheckBox;
    Panel_jun: TPanel;
    Label7: TLabel;
    Jun: TCheckBox;
    Panel_dez: TPanel;
    Label15: TLabel;
    Dez: TCheckBox;
    Panel_out: TPanel;
    Label13: TLabel;
    Out: TCheckBox;
    gbNumero: TGroupBox;
    gbNome: TGroupBox;
    Mar: TCheckBox;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel1: TPanel;
    BTrelatorio: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTrelatorioClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ContasReceber: TForm_ContasReceber;

implementation

uses Unit_dmdados, Unit_relquitadas, unit_baixaMens, unit_relatorioCR;

{$R *.DFM}

procedure TForm_ContasReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;



procedure TForm_ContasReceber.BTrelatorioClick(Sender: TObject);
begin
Form_RelatorioCR:=TForm_RelatorioCR.create(application);
Form_RelatorioCR.showmodal;

end;

procedure TForm_ContasReceber.Edit1Exit(Sender: TObject);
begin
dmdados.tbCadastro.Findkey([edit1.text]);
Edit2.Text:=dmDados.tbCadastroNome.Value;
end;

procedure TForm_ContasReceber.Edit3Exit(Sender: TObject);
begin
dmDados.tbContasReceber.CancelRange;
dmdados.TbContasReceber.SetRangeStart;
dmdados.TbContasReceber.FieldByName('Cod_numero').AsString :=Edit1.Text;
dmdados.TbContasReceber.SetRangeEnd;
dmdados.TbContasReceber.FieldByName('Cod_Numero').AsString :=Edit1.Text;
dmdados.TbContasReceber.ApplyRange;
dmdados.tbContasReceber.First;
While Not(dmdados.tbContasReceber.Eof) Do
  Begin
    if ((dmdados.tbContasReceberMes.Value='Jan') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Jan.Checked:=True
        else
         Jan.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Fev') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Fev.Checked:=True
        else
         Fev.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Mar') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Mar.Checked:=True
        else
         Mar.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Abr') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Abr.Checked:=True
        else
         Abr.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Mai') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Mai.Checked:=True
        else
         Mai.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Jun') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Jun.Checked:=True
        else
         Jun.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Ago') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Ago.Checked:=True
        else
         Ago.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Set') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         St.Checked:=True
        else
         St.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Out') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Out.Checked:=True
        else
         Out.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Nov') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Nov.Checked:=True
        else
         Nov.Checked:=False;
    if ((dmdados.tbContasReceberMes.Value='Dez') and (dmDados.tbContasReceberAno.Value=Edit3.Text)) Then
        if dmdados.tbContasreceberQuitado.Value='Pago' Then
         Dez.Checked:=True
        else
         Dez.Checked:=False;
    dmDados.tbContasReceber.Next;
   End;
end;

procedure TForm_ContasReceber.FormShow(Sender: TObject);
begin
dmdados.tbContasReceber.IndexFieldNames:='cod_numero';
end;

procedure TForm_ContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmDados.tbContasReceber.CancelRange;
action:=cafree;
end;

procedure TForm_ContasReceber.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
