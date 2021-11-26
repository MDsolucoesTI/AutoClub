//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Automação de Secretária de Club
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unit_inicio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, ToolWin, ComCtrls;

type
  TForm_inicio = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Fornecedor1: TMenuItem;
    ToolBar1: TToolBar;
    N1: TMenuItem;
    Sair1: TMenuItem;
    StsBarInicio: TStatusBar;
    btcontas: TBitBtn;
    btdespesa: TBitBtn;
    Sair2: TMenuItem;
    btSocio: TBitBtn;
    BtCR: TBitBtn;
    Mensalidades1: TMenuItem;
    GerarMensalidade1: TMenuItem;
    Baixa1: TMenuItem;
    Relatrios1: TMenuItem;
    Scios1: TMenuItem;
    ContasPagar1: TMenuItem;
    Despesas1: TMenuItem;
    Mensalidades2: TMenuItem;
    BitBtn1: TBitBtn;
    procedure Fornecedor1Click(Sender: TObject);
    procedure btdespesaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btcontasClick(Sender: TObject);
    procedure BTchequesClick(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btSocioClick(Sender: TObject);
    procedure BtCRClick(Sender: TObject);
    procedure GerarMensalidade1Click(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure ContasPagar1Click(Sender: TObject);
    procedure Despesas1Click(Sender: TObject);
    procedure Mensalidades2Click(Sender: TObject);
    procedure Scios1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure showhints (Sender: TObject);
  end;

var
  Form_inicio: TForm_inicio;

implementation

uses unit_fornecdor, unit_contas, unit_despesas, unit_cheques,
  unit_cadastro, Unit_ContasReceber, Unit_GeraMens, unit_baixaMens,
  unit_periodo, unit_periodoDespesa, unit_periodoCR, unit_relSocio;

{$R *.DFM}

procedure TForm_inicio.Fornecedor1Click(Sender: TObject);
var
 oldcursor : tcursor;
 icont: integer;
Begin
   For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_Fornecedor Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_Fornecedor := Tform_Fornecedor.Create( Application );
      form_Fornecedor.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;
end;

procedure TForm_inicio.btdespesaClick(Sender: TObject);
var
 oldcursor : tcursor;
 icont: integer;
begin
For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_Despesa Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_Despesa := Tform_Despesa.Create( Application );
      form_Despesa.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;
end;



procedure TForm_inicio.FormCreate(Sender: TObject);
begin
   with Application do
   Begin
      HintPause := 200;
      OnHint := ShowHints;
   End;
end;

Procedure Tform_inicio.ShowHints(Sender : TObject);
Begin
   stsbarInicio.Panels.Items[0].text := Application.Hint;

end;

procedure TForm_inicio.btcontasClick(Sender: TObject);
var
  oldcursor : tcursor;
 icont: integer;
begin
For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_Contas Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_Contas := Tform_Contas.Create( Application );
      form_Contas.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;
end;

procedure TForm_inicio.BTchequesClick(Sender: TObject);
var
oldcursor : tcursor;
 icont: integer;

begin
For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_Cheque Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_Cheque := Tform_Cheque.Create( Application );
      form_Cheque.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;

end;

procedure TForm_inicio.Sair2Click(Sender: TObject);
begin
application.terminate;
end;

procedure TForm_inicio.N1Click(Sender: TObject);
var
 oldcursor : tcursor;
 icont: integer;
begin
For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_Cadastro Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_Cadastro := Tform_Cadastro.Create( Application );
      form_Cadastro.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;
end;

procedure TForm_inicio.btSocioClick(Sender: TObject);
var
 oldcursor : tcursor;
 icont: integer;
begin
For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_Cadastro Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_Cadastro := Tform_Cadastro.Create( Application );
      form_Cadastro.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;
end;
procedure TForm_inicio.BtCRClick(Sender: TObject);
var
 oldcursor : tcursor;
 icont: integer;
begin
For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_ContasReceber Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_ContasReceber := Tform_ContasReceber.Create( Application );
      form_ContasReceber.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;
end;

procedure TForm_inicio.GerarMensalidade1Click(Sender: TObject);
var
 oldcursor : tcursor;
 icont: integer;
begin
For iCont:=0 To MDIChildCount-1 Do
      If MDIChildren[iCont] Is Tform_geraMens Then
         Begin
            MDIChildren[iCont].WindowState:=wsNormal;
            MDIChildren[iCont].Show;
            Exit;
         End;
   OldCursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
   Try
      form_geraMens := Tform_geraMens.Create( Application );
      form_geraMens.Show;
   Finally
      Screen.Cursor := OldCursor;
   End;
   end;

procedure TForm_inicio.Baixa1Click(Sender: TObject);
begin
Form_baixaMens:=Tform_baixaMens.create(application);
Form_baixaMens.showmodal;
end;

procedure TForm_inicio.ContasPagar1Click(Sender: TObject);
begin
Form_periodo:=TForm_periodo.create(application);
Form_periodo.showmodal;
end;

procedure TForm_inicio.Despesas1Click(Sender: TObject);
begin
Form_periodoDespesa:=TForm_periodoDespesa.create(application);
Form_periodoDespesa.showmodal;
end;

procedure TForm_inicio.Mensalidades2Click(Sender: TObject);
begin
Form_periodoCR:=TForm_periodoCR.create(application);
Form_periodoCR.showmodal;
end;

procedure TForm_inicio.Scios1Click(Sender: TObject);
begin
Form_relSocio:=TForm_relSocio.create(application);
Form_relSocio.QRSocio.print;
end;

procedure TForm_inicio.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

end.
