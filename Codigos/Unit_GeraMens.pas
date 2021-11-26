//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_GeraMens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TForm_geraMens = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    BTbaixa: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    procedure BTbaixaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_geraMens: TForm_geraMens;

implementation

uses unit_dmdados;

{$R *.DFM}

procedure TForm_geraMens.BTbaixaClick(Sender: TObject);
begin
   dmDados.tbCadastro.First;
   While Not dmDados.tbCadastro.Eof Do
     Begin
      if Not(((dmDados.TbCadastroCategoria.Value='Dependente')
           And (dmDados.TbCadastroSexo.Value='F')) Or (dmDados.TbCadastroCategoria.Value='Benemerito')) Then
       Begin
       {Janeiro}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Jan';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Fevereiro}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Fev';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Mar�o}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Mar';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Abril}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Abr';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Maio}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Mai';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Junho}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Jun';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Julho}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Jul';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Agosto}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Ago';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Setembro}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Set';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Outubro}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Out';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Novembro}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Nov';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       {Dezembro}
       dmDados.tbContasReceber.Insert;
       dmDados.tbContasReceberCod_numero.Value:=dmDados.tbCadastroCod_Numero.Value;
       if (dmDados.tbCadastroCategoria.Value='S�cio') or (dmDados.tbCadastroCategoria.Value='Remido') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit1.text);
       if (dmDados.tbCadastroCategoria.Value='Dependente') Then
         dmDados.tbContasReceberValor.Value:=StrtoInt(Edit2.text);
       dmDados.TbContasReceberAno.Value:=Edit3.text;
       dmDados.TbContasReceberMes.Value:='Dez';
       dmDados.TbContasReceberQuitado.Value:='Em Aberto';
       dmDados.TbContasReceber.Post;
       End;
       {Pr�ximo}
       dmDados.tbCadastro.Next;
     End;
     Close;
end;

procedure TForm_geraMens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TForm_geraMens.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure TForm_geraMens.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

end.
