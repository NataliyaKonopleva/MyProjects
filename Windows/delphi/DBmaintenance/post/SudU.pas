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
    P1: TPanel;
    DB: TDBGrid;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Breg: TButton;
    DBNavigator1: TDBNavigator;
    Enam: TEdit;
    Bprn: TButton;
    Label2: TLabel;
    Eind: TEdit;
    CBkonv: TComboBox;
    CB_PF: TComboBox;
    CB_pr: TComboBox;
    DataSource3: TDataSource;
    Bdob: TButton;
    Label1: TLabel;
    Label6: TLabel;
    Etema: TComboBox;
    Label7: TLabel;
    Egod: TEdit;
    Label8: TLabel;
    CBgod: TComboBox;
    Padr: TPanel;
    Label9: TLabel;
    Eadr: TEdit;
    Badr: TButton;
    Ptema: TPanel;
    Label10: TLabel;
    Etem: TEdit;
    Btema: TButton;
    ADOCon: TADOConnection;
    Tp: TADOQuery;
    Tprn: TADOQuery;
    Tpp: TADOQuery;
    Tproch: TADOQuery;
    Label11: TLabel;
    Madres: TMemo;
    Pdelo: TPanel;
    Label3: TLabel;
    MEdelo1: TMaskEdit;
    BitBtn1: TBitBtn;
    Pfio: TPanel;
    Label5: TLabel;
    Efio: TEdit;
    BitBtn2: TBitBtn;
    DBGfio: TDBGrid;
    Pdob: TPanel;
    Ldob1: TLabel;
    Ldob2: TLabel;
    Bda: TButton;
    Bnet: TButton;
    ADOCommand: TADOCommand;
    zakaz: TRadioGroup;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BfoundClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pokaz(Sender: TObject);
    procedure CB_PFChange(Sender: TObject);
    procedure BprnClick(Sender: TObject);
    procedure BregClick(Sender: TObject);
    procedure CB_prChange(Sender: TObject);
    procedure Dobavka(Sender:TObject);
    procedure BdobClick(Sender: TObject);
    procedure BdaClick(Sender: TObject);
    procedure BnetClick(Sender: TObject);
    procedure DBGfioDblClick(Sender: TObject);
    procedure CBgodChange(Sender: TObject);
    procedure BadrClick(Sender: TObject);
    procedure BtemaClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
 
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
  ADOCommand.CommandText:='CREATE TABLE '+'Regist'+Copy(Egod.Text,3,2)+' (data DATE, npp SMALLINT, nampns TEXT(60), tema TEXT(40), prim TEXT(40))';
  //ADOCommand.CommandText:='CREATE TABLE '+'Regist18'+' (data DATE, npp BYTE, nampns TEXT(60), tema TEXT(40), prim TEXT(40))';
  ADOCommand.Execute;
 except
  // если таблица уже есть, то ещё одну сделать не дадут
 end;
 if Tprn.Active then Tprn.Close;
 Tprn.SQL.Strings[0]:='SELECT *';
 Tprn.SQL.Strings[1]:='FROM Regist'+Copy(Egod.Text,3,2);
 //Tprn.SQL.Strings[1]:='FROM Regist18';
 try
  Tprn.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы REGIST');
 end;
 Tprn.Sort:='npp';
 Tprn.Last;
 try
  Tpp.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы PENSF');
 end;
 try
  Tproch.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы PROCH');
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
 while not Tproch.Eof do
  begin
   CB_Pr.Items.Append(Tproch['nam']);
   Tproch.Next;
  end;
end;

procedure TFmPer.N6Click(Sender: TObject);
begin
 Padr.Visible:=true;
 Eadr.SetFocus;
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
 var adr:string;
     i:integer;
     a:array [1..4] of integer;
 begin
  Enam.Text:=Tp['nampns']+'   П/д № 48/'+IntToStr(Tp['delo']);
  Madres.Clear;
  adr:= Trim(Tp['adres']);
  {if Tp['reg']<>null then adr:=adr+Trim(Tp['reg']);
  if Tp['rn']<>null then adr:=adr+' '+Trim(Tp['rn']);
  if Tp['gor']<>null then adr:=adr+' '+Trim(Tp['gor']);
  //Madres.Lines.Append(adr);
  //adr:='';
  if Tp['ul']<>null then adr:=adr+' '+Trim(Tp['ul']);
  if Tp['dom']<>null then adr:=adr+' д.'+Trim(Tp['dom']);
  if Tp['kor']<>null then adr:=adr+' кор.'+Trim(Tp['kor']);
  if Tp['kv']<>null then adr:=adr+' кв.'+Trim(Tp['kv']);}
  Madres.Lines.Append(adr);
  adr:='';
  Eind.Text:=Tp['pstind']+' ';
  {if Tp['pstind']<=''
  then
   begin
    Eind.Text:=Copy(Tp['adres'],1,6);
    adr:=Copy(Tp['adres'],7,75);
   end
  else
   begin
    Eind.Text:=Tp['pstind'];
    adr:=Tp['adres'];
   end;
  a[1]:=Pos('ул.',adr);
  a[2]:=Pos('пер.',adr);
  a[3]:=Pos('пр.',adr);
  a[4]:=Pos('пр-т',adr);
  if (Pos('ул.',adr)>0) or (Pos('пер.',adr)>0) or (Pos('пр.',adr)>0) or (Pos('пр-т',adr)>0)
  then
   begin
    i:=1;
    while a[i]<>0 do
     i:=i+1;
    Madres.Lines.Append(Copy(adr,a[i-1],76-i));
    Madres.Lines.Append(Copy(adr,1,a[i-1]-1));
   end
  else
   begin
    ShowMessage('Преобразовать адрес не удалось!');
    Madres.Lines.Append(adr);
   end;}
  Tp.Close;
end;

procedure TFmPer.CB_PFChange(Sender: TObject);
begin
 Madres.Clear; 
 Enam.Text:='Управление пенсионного фонда РФ '+CB_PF.Text+' р-н';
 if Tpp.Locate('codpf',CB_PF.ItemIndex+1,[])
 then
  begin
   Eind.Text:=Copy(Tpp['adres1'],1,6);
   Madres.Lines.Append(Tpp['adres2']);
   Madres.Lines.Append(Copy(Tpp['adres1'],8,43)+' '+Eind.Text);
  end;
end;

procedure TFmPer.BprnClick(Sender: TObject);
var prim: string;
begin
 if zakaz.ItemIndex=0 then
  begin
   prim:='ЗАКАЗНОЕ';
   RV.SetParam('delo','48/'+IntToStr(Tprn['npp']));
  end
 else if zakaz.ItemIndex=1 then prim:='СЛУЖЕБНОЕ'
 else prim:='';
 RV.SetParam('nam',Enam.Text);
 RV.SetParam('tema',Etema.Text);
 RV.SetParam('adr1',Madres.Lines[0]+' '+Trim(Madres.Lines[1])+' '+Trim(Madres.Lines[2]));
 RV.SetParam('adr2',Trim(Madres.Lines[1]));
 RV.SetParam('zak',prim);
 RV.Open;
 if CBkonv.ItemIndex=0
 then RV.ExecuteReport('R1')
 else if CBkonv.ItemIndex=1
      then RV.ExecuteReport('R2')
      else if CBkonv.ItemIndex=2
           then RV.ExecuteReport('R3')
           else if CBkonv.ItemIndex=3
                then RV.ExecuteReport('R4')
                else if CBkonv.ItemIndex=4
                     then
                      begin
                       if zakaz.ItemIndex=0
                       then ShowMessage('На конверте не забудь поставить пометку ЗАКАЗНОЕ и номер регистрации!');
                       RV.ExecuteReport('R5');
                      end;
 RV.ClearParams;
 RV.Close;
end;

procedure TFmPer.BregClick(Sender: TObject);
var np: integer;
    prim: string;
begin
 if StrToInt(Egod.Text)<>YearOf(Date())
 then
  begin
   ShowMessage('Вы пытаетесь регистрировать в журнал '+Egod.Text+' года!');
   exit;
  end;
 Tprn.Close;
 Tprn.Open;
 Tprn.Sort:='npp';
 Tprn.Last;
 if Tprn['npp']<>null
 then
  np:=Tprn['npp']+1
 else np:=1;
 if zakaz.ItemIndex=0 then prim:='Заказное'
 else if zakaz.ItemIndex=1 then prim:='Служебное'
 else prim:='';
 Tprn.AppendRecord([Date(),np,Enam.Text,Etema.Text,prim]);
end;

procedure TFmPer.CB_prChange(Sender: TObject);
begin
 Madres.Clear;
 Enam.Text:=CB_pr.Text;
 Eind.Text:='';
 if Tproch.Locate('nam',CB_PR.Text,[loCaseinsensitive,loPartialKey])
 then
  begin
   try
    Eind.Text:=Tproch['index'];
   except end;
   try
    Madres.Lines.Append(Trim(Tproch['adres2']));
   except end;
   try
    Madres.Lines.Append(Trim(Tproch['adres1'])+' '+Eind.Text);
   except end;
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
 Tproch.AppendRecord([Tproch.RecordCount+1,Enam.Text,Madres.Lines[0],Madres.Lines[1],Eind.Text]);
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
 Tprn.Close;
 Tprn.SQL.Strings[0]:='SELECT *';
 Tprn.SQL.Strings[1]:='FROM Regist'+Copy(Egod.Text,3,2);
 try
  Tprn.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы REGIST');
 end;
end;

procedure TFmPer.BadrClick(Sender: TObject);
begin
 Padr.Visible:=false;
 Tprn.Sort:='nampns';
 if not Tprn.Locate('nampns',Trim(Eadr.Text),[loCaseinsensitive,loPartialKey])
 then ShowMessage('Не зарегистрирован!');
end;

procedure TFmPer.BtemaClick(Sender: TObject);
begin
 Ptema.Visible:=false;
 Tprn.Sort:='tema';
 if not Tprn.Locate('tema',Trim(Etem.Text),[loCaseinsensitive,loPartialKey])
 then ShowMessage('Не зарегистрирован!');
end;

procedure TFmPer.N7Click(Sender: TObject);
begin
 Ptema.Visible:=true;
 Etem.SetFocus;
end;


procedure TFmPer.BitBtn3Click(Sender: TObject);
begin
 Pfio.Visible:=false;
end;

procedure TFmPer.BitBtn4Click(Sender: TObject);
begin
 Pdelo.Visible:=false;
end;

end.
