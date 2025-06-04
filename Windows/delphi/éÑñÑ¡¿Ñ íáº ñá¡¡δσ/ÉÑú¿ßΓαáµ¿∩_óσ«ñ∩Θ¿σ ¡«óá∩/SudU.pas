unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons, DateUtils, ADODB;

type
  TFmPer = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ToolBar1: TToolBar;
    TB1: TToolButton;
    TB2: TToolButton;
    TB3: TToolButton;
    TB4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PM2: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    P1: TPanel;
    DB: TDBGrid;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Breg: TButton;
    DBNavigator1: TDBNavigator;
    Pdelo: TPanel;
    Lbel4: TLabel;
    MEdelo1: TMaskEdit;
    Bfound: TBitBtn;
    Pfio: TPanel;
    Label4: TLabel;
    Efio: TEdit;
    Bfio: TBitBtn;
    Enam: TEdit;
    Label2: TLabel;
    CB_PF: TComboBox;
    CB_pr: TComboBox;
    DataSource3: TDataSource;
    Bdob: TButton;
    Label1: TLabel;
    Pdob: TPanel;
    Ldob1: TLabel;
    Bda: TButton;
    Bnet: TButton;
    Ldob2: TLabel;
    DBGfio: TDBGrid;
    ETema: TComboBox;
    ADOCon: TADOConnection;
    Tprn: TADOQuery;
    Tp: TADOQuery;
    Tpp: TADOQuery;
    Tproch: TADOQuery;
    Label3: TLabel;
    Egod: TEdit;
    Label5: TLabel;
    CBgod: TComboBox;
    ADOCommand: TADOCommand;
    procedure FormActivate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BfoundClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pokaz(Sender: TObject);
    procedure CB_PFChange(Sender: TObject);
    procedure BregClick(Sender: TObject);
    procedure CB_prChange(Sender: TObject);
    procedure Dobavka(Sender:TObject);
    procedure BdobClick(Sender: TObject);
    procedure BdaClick(Sender: TObject);
    procedure BnetClick(Sender: TObject);
    procedure DBGfioDblClick(Sender: TObject);
    procedure CBgodChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPer: TFmPer;
  zv:array [1..16] of string;
  zap,nn,zap1:integer;
  vsego,vsego1:real;
implementation

{$R *.dfm}

procedure TFmPer.FormActivate(Sender: TObject);
var k: integer;
begin
 Egod.Text:=IntToStr(YearOf(date()));
 for k:=YearOf(date())-4 to YearOf(date()) do
  CBgod.Items.Append(IntToStr(k));
 try
  ADOCommand.CommandText:='CREATE TABLE '+'Regv'+Copy(Egod.Text,3,2)+' (data DATE, npp SMALLINT, nampns TEXT(60), tema TEXT(40))';
  ADOCommand.Execute;
 except
  // если таблица уже есть, то ещё одну сделать не дадут
 end;
 if Tprn.Active then Tprn.Close;
 Tprn.SQL.Strings[1]:='FROM Regv'+Copy(Egod.Text,3,2);
 try
  Tprn.Open;
 except on E: EDataBaseError do ShowMessage('Ошибка открытия журнала регистрации.');
 end;
 Tprn.Last;
 try
  Tpp.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы PENSF');
 end;
 try
  Tproch.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы PROCH1');
 end;
 CB_PF.Items.Clear;
 CB_PR.Items.Clear;
 Tpp.First;
 while not Tpp.Eof do
  begin
   CB_PF.Items.Append(Tpp['nampf']);
   Tpp.Next;
  end;
 Tproch.First;
 CB_pr.Items.Append('Добавить организацию');
 while not Tproch.Eof do
  begin
   CB_Pr.Items.Append(Tproch['nam']);
   Tproch.Next;
  end;

end;

procedure TFmPer.N3Click(Sender: TObject);
begin
 DB.SetFocus;
end;

procedure TFmPer.N6Click(Sender: TObject);
begin
 Enam.text:='Рыбинский Сбербанк';
end;

procedure TFmPer.N7Click(Sender: TObject);
begin
 Enam.Text:='Ростовский Сбербанк';
end;

procedure TFmPer.N8Click(Sender: TObject);
begin
 Enam.text:='Переславский Сбербанк';
end;

procedure TFmPer.N9Click(Sender: TObject);
begin
 Enam.text:='Угличский Сбербанк';
end;

procedure TFmPer.N1Click(Sender: TObject);
begin
 Pdelo.Visible:=true;
 MEdelo1.SetFocus;
end;

procedure TFmPer.BfoundClick(Sender: TObject);
begin
 Tp.Parameters[0].Value:=StrToFloat(Medelo1.Text);
 Tp.Parameters[1].Value:='SOS';
 if Tp.Active then Tp.Close;
 try
  Tp.Open;
 except ShowMessage('Ошибка при открытии базы CART');
 end;
 if Tp.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('Номер дела не существует');
    Medelo1.SetFocus;
    Exit;
   end;
  Pdelo.Visible:=false;
  Pokaz(Sender);
 end;

procedure TFmPer.N2Click(Sender: TObject);
begin
 Pfio.Visible:=true;
 Efio.SetFocus;
end;

procedure TFmPer.BfioClick(Sender: TObject);
begin
 Tp.Parameters[0].Value:=0;
 Tp.Parameters[1].Value:=trim(EFIO.Text)+'%';
 if Tp.Active then Tp.Close;
 try
  Tp.Open;
 except ShowMessage('Ошибка при открытии базы CART');
 end;
 Tp.Sort:='nampns';
 if Tp.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('Нет такого пенсионера!');
    Efio.SetFocus;
    Exit;
   end;
 Pfio.Visible:=false;
 DBGfio.Visible:=true;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Tp.Close;
 Tpp.Close;
 Tprn.Close;
end;

procedure TFMPer.Pokaz(Sender: TObject);
 begin
  Enam.Text:=Tp['nampns']+'   П/д № 48/'+IntToStr(Tp['delo']);
  Tp.Close;
 end;

procedure TFmPer.CB_PFChange(Sender: TObject);
begin
 Enam.Text:='УПФР '+CB_PF.Text+' р-н';
end;

procedure TFmPer.BregClick(Sender: TObject);
var np:integer;
begin
 if StrToInt(Egod.Text)<>YearOf(Date())
 then
  begin
   ShowMessage('Вы пытаетесь регистрировать в журнал '+Egod.Text+' года!');
   Exit;
  end;
 Tprn.Close;
 Tprn.Open;
 Tprn.Sort:='npp';
 if Tprn.RecordCount=0
 then np:=1
 else
 begin
  Tprn.Last;
  np:=Tprn['npp']+1;
 end; 
 Tprn.AppendRecord([Date(),np,Enam.Text,Etema.Text]);
end;

procedure TFmPer.CB_prChange(Sender: TObject);
begin
 if CB_pr.ItemIndex=0
 then Dobavka(Sender)
 else
  begin
   Enam.Text:=CB_pr.Text;
  end;
end;

procedure TFmPer.Dobavka(Sender:TObject);
begin
 Bdob.Visible:=true;
end;

procedure TFmPer.BdobClick(Sender: TObject);
begin
 if Enam.Text<>''
 then
  begin
   Ldob2.Caption:=Enam.Text;
   Pdob.Visible:=true;
  end
 else ShowMessage('Кого добавлять будем?!');
end;

procedure TFmPer.BdaClick(Sender: TObject);
begin
 Pdob.Visible:=false;
 Tproch.Last;
 Tproch.AppendRecord([Tproch.RecordCount+1,Enam.Text]);
end;

procedure TFmPer.BnetClick(Sender: TObject);
begin
 Pdob.Visible:=false;
end;

procedure TFmPer.DBGfioDblClick(Sender: TObject);
begin
 DBGfio.Visible:=false;
 Pokaz(Sender);
end;

procedure TFmPer.CBgodChange(Sender: TObject);
begin
 Egod.Text:=CBgod.Text;
 if Tprn.Active then Tprn.Close;
 Tprn.SQL.Strings[1]:='FROM regV'+Copy(Egod.Text,3,2);
 try
  Tprn.Open;
 except on E: EDataBaseError do ShowMessage('Ошибка открытия журнала регистрации.');
 end;
 Tprn.Sort:='npp';
 Tprn.Last;
end;

end.
