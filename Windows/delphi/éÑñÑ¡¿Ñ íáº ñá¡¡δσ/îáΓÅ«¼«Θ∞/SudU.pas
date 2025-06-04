unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons,LSP,DateUtils,Spp, ADODB;

type
  TFmPer = class(TForm)
    ToolBar1: TToolBar;
    TB1: TToolButton;
    TB2: TToolButton;
    TB3: TToolButton;
    TB4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    P1: TPanel;
    Edelo: TMaskEdit;
    DBTnampns: TDBText;
    Lbcodrnk: TLabel;
    Button1: TButton;
    DB: TDBGrid;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Label2: TLabel;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    Pdelo: TPanel;
    Lbel4: TLabel;
    MEdelo1: TMaskEdit;
    Bfound: TBitBtn;
    Pfio: TPanel;
    Label4: TLabel;
    Efio: TEdit;
    Bfio: TBitBtn;
    Rv1: TRvProject;
    MEo: TEdit;
    TB5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Label3: TLabel;
    MEgod: TMaskEdit;
    Label5: TLabel;
    CBgod: TComboBox;
    Label6: TLabel;
    Eprich: TEdit;
    MEfio: TMaskEdit;
    Button3: TButton;
    Label1: TLabel;
    Label7: TLabel;
    DBGTp: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOCon: TADOConnection;
    ADOCart: TADOQuery;
    ADOnal: TADOQuery;
    ADObank: TADOQuery;
    procedure FormActivate(Sender: TObject);
    procedure TB2Click(Sender: TObject);
    procedure EdeloDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BfoundClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB3Click(Sender: TObject);
    procedure CBgodChange(Sender: TObject);
    procedure TB4Click(Sender: TObject);
    function Perev(cifra:real):string;
    procedure TB5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGTpDblClick(Sender: TObject);
    procedure Showpen(Sender: TObject);
   
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
begin
 zv[1]:='рядовой';
 zv[2]:='ефрейтор';
 zv[3]:='мл.сержант';
 zv[4]:='сержант';
 zv[5]:='ст.сержант';
 zv[6]:='старшина';
 zv[7]:='прапорщик';
 zv[8]:='ст.прапорщик';
 zv[9]:='мл.лейтенант';
 zv[10]:='лейтенант';
 zv[11]:='ст.лейтенант';
 zv[12]:='капитан';
 zv[13]:='майор';
 zv[14]:='подполковник';
 zv[15]:='полковник';
 zv[16]:='генерал-майор';
 MEgod.Text:=IntToStr(YearOf(Date()));
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'matpom'+Copy(MEgod.Text,3,2);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы мат.помощи!');
   Exit;
  end;
 end;
 ADOnal.Sort:='datapom';
 ADOnal.Last;
end;

procedure TFmPer.TB2Click(Sender: TObject);
begin
 p1.Visible:=true;
 Edelo.SetFocus;
end;

procedure TFmPer.EdeloDblClick(Sender: TObject);
begin
 ADOCart.SQL.Strings[0]:='SELECT delo,nampns,codrnk,codbnk,pnslst,adres1,adres2,pstind,vidpns';
 ADOcart.SQL.Strings[1]:='FROM cart';
 ADOcart.SQL.Strings[2]:='WHERE delo='+Edelo.Text+' AND vidpns<>3';
 if ADOCart.Active then ADOCart.Close;
  try
   ADOcart.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы CART');
    Exit;
   end;
  end;
  if ADOCart.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('Номер дела не существует');
    Edelo.SetFocus;
    Exit;
   end;
  Showpen(Sender);
end;

procedure TfmPer.Showpen(Sender: TObject);
var i:integer;
 begin
  Lbcodrnk.caption:='';
  if ADOcart['vidpns']<3
  then
  begin
   i:=ADOcart['codrnk'];
   Lbcodrnk.Caption:=zv[i];
  end; 
end;

procedure TFmPer.Button2Click(Sender: TObject);
begin
 ADOnal.AppendRecord([ADOcart['delo'],ADOcart['nampns'],'  ',ADOcart['codbnk'],' ',StrToFloat(Trim(Meo.Text)),StrToFloat(Trim(Meo.Text)),Date(),Eprich.Text,ADOcart['pnslst'],null,null,null,null,null]);
 Meo.Text:=',';
end;

procedure TFmPer.N3Click(Sender: TObject);
begin
 DB.SetFocus;
end;

procedure TFmPer.Button1Click(Sender: TObject);
begin
 Lbcodrnk.Visible:=true;
 Lbcodrnk.Caption:='';
 DBTnampns.Visible:=true;
 EdeloDblClick(Sender);
end;

procedure TFmPer.N1Click(Sender: TObject);
begin
 Pdelo.Visible:=true;
 MEdelo1.SetFocus;
end;

procedure TFmPer.BfoundClick(Sender: TObject);
begin
 ADOnal.Sort:='delo';
 if not ADOnal.Locate('delo',trim(MEdelo1.Text),[])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Пенсионеру мат.помощь не выплачивалась!');
  end;
  Pdelo.Visible:=false;
end;

procedure TFmPer.N2Click(Sender: TObject);
begin
 Pfio.Visible:=true;
 Efio.SetFocus;
end;

procedure TFmPer.BfioClick(Sender: TObject);
begin
 ADOnal.Sort:='fam';
 if not ADOnal.Locate('fam',trim(EFIO.Text),[loCaseinsensitive,loPartialKey])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Пенсионеру мат.помощь не выплачивалась!');
  end;
 Pfio.Visible:=false;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOcart.Close;
 ADOnal.Close;
end;

procedure TFmPer.TB3Click(Sender: TObject);
begin
 Application.CreateForm(TFmExampl,FmExampl);
 FmExampl.Show;
 FmExampl.SetFocus;
end;

procedure TFmPer.CBgodChange(Sender: TObject);
begin
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'matpom'+Copy(MEgod.Text,3,2);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы мат.помощи!');
   Exit;
  end;
 end;
end;

procedure TFmPer.TB4Click(Sender: TObject);
var sum:string;
begin
 ADObank.Open;
 RV.Open;
 RV.SetParam('bank',ADObank['nambnk']);
 RV.SetParam('adr1',ADObank['adres1']);
 RV.SetParam('adr2',ADObank['adres2']);
 RV.SetParam('delo',ADOnal['delo']);
 RV.SetParam('fam',ADOnal['fam']);
 STR(ADOnal['summa']:9:2,sum);
 RV.SetParam('sum',sum);
 RV.SetParam('pnslst',ADOnal['pnslst']);
 RV.SetParam('mem',ADOnal['kassa']);
 RV.SetParam('cifra',Perev(ADOnal['summa']));
 RV.Execute;
 RV.Close;
 ADObank.Close;
end;

function TFmPer.Perev(cifra:real):string;
var
 shab1,shab2,shab3,shab4,shab5:string;
 slovo0,slovo,slovo1,tis0,tis1,tis2,ttttt:string;
 lendd,lendd1:integer;
 vvcifr,nbb:real;
 ddkop,promeg1,promeg2,isxch,RUBLI,s:string;
begin
 shab1:='ОДИН  ДВА   ТРИ   ЧЕТЫРЕПЯТЬ  ШЕСТЬ СЕМЬ  ВОСЕМЬДЕВЯТЬ';
 shab2:='ДЕСЯТЬ       ОДИННАДЦАТЬ  ДВЕНАДЦАТЬ   ТРИНАДЦАТЬ   ЧЕТЫРНАДЦАТЬ ПЯТНАДЦАТЬ   ШЕСТНАДЦАТЬ  СЕМНАДЦАТЬ   ВОСЕМНАДЦАТЬ ДЕВЯТНАДЦАТЬ';
 shab3:='ДВАДЦАТЬ   ТРИДЦАТЬ   СОРОК      ПЯТЬДЕСЯТ  ШЕСТЬДЕСЯТ СЕМЬДЕСЯТ  ВОСЕМЬДЕСЯТДЕВЯНОСТО  ';
 shab4:='ОДНА  ДВЕ   ТРИ   ЧЕТЫРЕПЯТЬ  ШЕСТЬ СЕМЬ  ВОСЕМЬДЕВЯТЬ';
 shab5:='СТО      ДВЕСТИ   ТРИСТА   ЧЕТЫРЕСТАПЯТЬСОТ  ШЕСТЬСОТ СЕМЬСОТ  ВОСЕМЬСОТДЕВЯТЬСОТ';
 slovo:='';
 slovo0:='';
 slovo1:='';
 tis0:='';
 tis1:='';
 tis2:='';
 ttttt:='';
 VVCIFR:=CIFRA;
 Str(CIFRA:9:2,s);
 Str(VVCIFR:9:2,promeg1);
 DDKOP:=COPY(s,8,2);
 promeg2:=COPY(promeg1,1,6);
 ISXCH:=TRIMLeft(PROMEG2);
 LENDD:=LENGTH(ISXCH);
 LENDD1:=LENGTH(ISXCH);
  WHILE LENDD1>0 do
   BEGIN
    IF COPY(ISXCH,LENDD,1)<>'0' then
     SLOVO1:=COPY(SHAB1,(StrToInt(COPY(ISXCH,LENDD,1))-1)*6+1,6);
    IF COPY(ISXCH,LENDD,1)='1' then
     RUBLI:='РУБЛЬ'
    ELSE
     begin
      NBB:=StrToFloat(COPY(ISXCH,LENDD,1));
      if (NBB=0)OR(NBB>4) then RUBLI:='РУБЛЕЙ'
                          else RUBLI:= 'РУБЛЯ';
     end;
    IF LENDD>=2 then
     IF  COPY(ISXCH,LENDD-1,1) ='1' then
      begin
       SLOVO1:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD,1))*13+1,13);
       RUBLI:='РУБЛЕЙ';
      end
     ELSE
      begin
       IF COPY(ISXCH,LENDD-1,1)<>'0' then
        SLOVO:=COPY(SHAB3,(StrToInt(COPY(ISXCH,(LENDD-1),1))-2)*11+1,11);
      end;
    IF LENDD>=3 then
     begin
      IF COPY(ISXCH,LENDD-2,1)<>'0' then
       SLOVO0:=COPY(SHAB5,(StrToInt(COPY(ISXCH,LENDD-2,1))-1)*9+1,9);
     end;
    IF LENDD>=4 then
     begin
      IF COPY(ISXCH,LENDD-3,1)<>'0' then
       TIS0:=COPY(SHAB4,(StrToInt(COPY(ISXCH,LENDD-3,1))-1)*6+1,6);
      IF COPY(ISXCH,LENDD-3,1)='1' then
       TTTTT:='ТЫСЯЧА'
      ELSE
       begin
        NBB:=StrToFloat(COPY(ISXCH,LENDD-3,1));
        if (NBB=0)OR(NBB >4) then TTTTT:='ТЫСЯЧ'
                             else TTTTT:='ТЫСЯЧИ';
       end;
     end;
    IF LENDD>=5 then
     begin
      IF  COPY(ISXCH,LENDD-4,1) ='1' then
       begin
        TIS0:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD-3,1))*13+1,13);
        TTTTT:='ТЫСЯЧ';
       end
      ELSE
       IF COPY(ISXCH,LENDD-4,1)<>'0' then
        TIS1:=COPY(SHAB3,(StrToInt(COPY(ISXCH,LENDD-4,1))-2)*11+1,11);
     end;
    IF LENDD>=6 then
     TIS2:=COPY(SHAB5,(StrToInt(COPY(ISXCH,LENDD-5,1))-1)*9+1,9);
    lendd1:=0;
   END;
  perev:=TRIMLEFT(TRIMRIGHT(TIS2)+' '+TRIMRIGHT(TIS1)+' '+TRIMRIGHT(TIS0)+' '+TTTTT+' '+TRIMRIGHT(SLOVO0)+' '+TRIMRIGHT(SLOVO)+' '+TRIMRIGHT(SLOVO1)+' '+RUBLI+' '+DDKOP+' '+'КОП.');
end;


procedure TFmPer.TB5Click(Sender: TObject);
var d:real;
    p:string;
begin
 d:=ADOnal['delo'];
 p:=ADOnal['pnslst'];
 ADOCart.SQL.Strings[0]:='SELECT delo,nampns,codrnk,codbnk,pnslst,adres1,adres2,pstind';
 ADOcart.SQL.Strings[1]:='FROM cart';
 //ADOcart.SQL.Strings[2]:='WHERE delo='+FloatToStr(d)+' AND vidpns<>3 AND pnslst="p"';
 ADOcart.SQL.Strings[2]:='WHERE delo='+FloatToStr(d)+' AND vidpns<>3 AND pnslst=:PL';
 ADOcart.Parameters.ParamByName('PL').Value:=p;
 if ADOCart.Active then ADOCart.Close;
  try
   ADOcart.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы CART');
    Exit;
   end;
 end;
 RV1.SetParam('delo',ADOcart['delo']);
 RV1.SetParam('nampns',ADOcart['nampns']);
 RV1.SetParam('adres1',ADOcart['adres1']);
 if ADOcart['adres2']<>null then RV1.SetParam('adres2',ADOcart['adres2']);
 if ADOcart['pstind']<>null then RV1.SetParam('ind',ADOcart['pstind']);
 RV1.SetParam('sum',ADOnal['summa']);
 RV1.SetParam('data',ADOnal['datapom']);
 RV1.Open;
 RV1.ExecuteReport('Report5');
 RV1.Close;
end;

procedure TFmPer.Button3Click(Sender: TObject);
begin
 ADOCart.SQL.Strings[0]:='SELECT delo,nampns,codrnk,codbnk,pnslst,adres1,adres2,pstind,vidpns';
 ADOcart.SQL.Strings[1]:='FROM cart';
 ADOcart.SQL.Strings[2]:='WHERE nampns LIKE :PF AND vidpns<>3';
 ADOcart.Parameters.ParamByName('PF').Value:=MEfio.Text+'%';
 if ADOCart.Active then ADOCart.Close;
  try
   ADOcart.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы CART');
    Exit;
   end;
  end;
  if ADOCart.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('Нет такого пенсионера в УВД');
    MEFIO.SetFocus;
    Exit;
   end;
  DBGTp.Visible:=true;
end;

procedure TFmPer.DBGTpDblClick(Sender: TObject);
begin
 Lbcodrnk.Visible:=true;
 Lbcodrnk.Caption:='';
 DBTnampns.Visible:=true;
 DBGTp.Visible:=false;
 Edelo.Text:=IntToStr(ADOcart['delo']);
 Showpen(Sender);
 MEo.SetFocus;
end;


end.
