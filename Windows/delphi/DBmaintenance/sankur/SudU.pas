unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons, ADODB,DateUtils, jpeg;

type
  TFmPer = class(TForm)
    ToolBar1: TToolBar;
    TB1: TToolButton;
    TB2: TToolButton;
    TB3: TToolButton;
    TB4: TToolButton;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    PM3: TPopupMenu;
    N6: TMenuItem;
    P1: TPanel;
    Edelo: TMaskEdit;
    DBTnampns: TDBText;
    Label1: TLabel;
    Lbcodrnk: TLabel;
    Button1: TButton;
    DB: TDBGrid;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Label2: TLabel;
    Label3: TLabel;
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
    PM4: TPopupMenu;
    N10: TMenuItem;
    Rv1: TRvProject;
    Mbnk: TMemo;
    Label5: TLabel;
    Lbitogo: TLabel;
    N12: TMenuItem;
    N13: TMenuItem;
    MEo: TEdit;
    TB5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ADOCon: TADOConnection;
    ADOCart: TADOQuery;
    ADOnal: TADOQuery;
    ADObank: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label7: TLabel;
    Label6: TLabel;
    MEfio: TMaskEdit;
    Button3: TButton;
    Label8: TLabel;
    MEp: TEdit;
    DBGTp: TDBGrid;
    Label9: TLabel;
    MEgod: TMaskEdit;
    Label10: TLabel;
    CBgod: TComboBox;
    Label11: TLabel;
    Pskl: TPanel;
    Label12: TLabel;
    DBTdatdis: TDBText;
    Label13: TLabel;
    DBTartdis: TDBText;
    DBTnampst: TDBText;
    Label14: TLabel;
    Lbwsllgt: TLabel;
    Label15: TLabel;
    Lbwslnad: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Lbg: TLabel;
    Eprap: TEdit;
    ADObank1: TADOQuery;
    N7: TMenuItem;
    Pblok: TPanel;
    Label18: TLabel;
    Button4: TButton;
    Button5: TButton;
    ADOCon1: TADOConnection;
    Pkor: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    MEsp: TMaskEdit;
    MEvip: TMaskEdit;
    BBkor: TBitBtn;
    BBclose: TBitBtn;
    Lbsp: TLabel;
    Label22: TLabel;
    CBbnk: TComboBox;
    N19: TMenuItem;
    N20: TMenuItem;
    Padm: TPanel;
    Label21: TLabel;
    MEgod1: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    MEm1: TMaskEdit;
    Label25: TLabel;
    MEm2: TMaskEdit;
    BBpokaz: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Mem: TMemo;
    Psum: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Es1: TEdit;
    Es2: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Pbuk: TPanel;
    Label29: TLabel;
    Label31: TLabel;
    Ebuk: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    MemBuk: TMemo;
    ADOcart1: TADOQuery;
    ADOnal1: TADOQuery;
    N11: TMenuItem;
    Pbnk: TPanel;
    Label30: TLabel;
    Lbsp1: TLabel;
    Label34: TLabel;
    MEdatsp: TMaskEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    CBbankS: TComboBox;
    Lbs: TLabel;
    ADOsp: TADOQuery;
    N5: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure TB2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ConOpen(Connection: TRvCustomConnection);
    procedure ConGetCols(Connection: TRvCustomConnection);
    procedure ConGetRow(Connection: TRvCustomConnection);
    procedure Button1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
//    procedure Stat(Sender:TObject);
//    procedure N10Click(Sender: TObject);
 //   procedure N11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure Showpen(Sender: TObject);
    procedure DBGTpDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CBgodChange(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure BfoundClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBTitleClick(Column: TColumn);
    procedure MEoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Spisok(Sender: TObject;bank,slb:integer;kod,msl:string);
    procedure Koreshok(Sender: TObject;codb,slb:integer;kod,msl:string);
    procedure N7Click(Sender: TObject);
    procedure Otr(Sender: TObject;bank:integer);
    procedure N14Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure TB3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure OtrKor(Sender: TObject;bank:integer);
    procedure K10Click(Sender: TObject);
    procedure K8Click(Sender: TObject);
    procedure K2Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure BBkorClick(Sender: TObject);
    procedure TB5Click(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure CBbnkChange(Sender: TObject);
    procedure MEspKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N10Click(Sender: TObject);
    procedure BBpokazClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ADOcart1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    function DA(Sender: TObject):Boolean;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure CBbankSChange(Sender: TObject);
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
var m:integer;
begin
 try ADOcon.Open
 except
  begin
   ShowMessage('Журнал компенсаций недоступен! Попробуйте позже!');
   Exit;
  end;
 end;
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
 CBgod.Text:=IntToStr(YearOf(Date()));
 MEgod.Text:=CBgod.Text;
end;

procedure TFmPer.TB2Click(Sender: TObject);
begin
 p1.Visible:=true;
 Edelo.SetFocus;
 Lbg.Caption:=IntToStr(YearOf(date())-1);
end;

function TfmPer.Da(Sender: TObject):Boolean;
begin
  Da:=false;
  if (ADOcart1['mstslb']=1) or (ADOcart1['mstslb']=3) then
   if ADOcart1['datdis']>=StrToDate('13.01.1993')
   then
    begin
     if StrToInt(copy(ADOcart1['wsllgt'],1,2))>=20
     then Da:=true;
    end
   else if (StrToInt(copy(ADOcart1['wsllgt'],1,2))>=20) and (Pos(Copy(ADOcart1['artdis'],3,1),'бежз')<>0) and (ADOcart1['codrnk']>12)
        then Da:=true;
   if ADOcart1['mstslb']=2
   then
    if ADOcart1['codrnk']>8
    then
     begin
      if (StrToInt(copy(ADOcart1['wsllgt'],1,2))>=20) and (Pos(Copy(ADOcart1['artdis'],3,1),'бежз')<>0)
      then Da:=true
      else if (StrToInt(copy(ADOcart1['wslkal'],1,2))>=25)
           then Da:=true
     end
    else
     if (ADOcart1['codrnk']>6) and (StrToInt(copy(ADOcart1['wslkal'],1,2))>=20) and (Pos(Copy(ADOcart1['artdis'],3,1),'бежз')<>0)
     then Da:=true;
end;

procedure TfmPer.Showpen(Sender: TObject);
 var da:boolean;
     i,m:integer;
begin
 Lbcodrnk.caption:='';
 Lbwsllgt.Caption:='';
 Lbwslnad.Caption:='';
 Eprap.Visible:=false;
 Lbitogo.Caption:='';
 MEo.Text:='0';
 MEp.Text:='';
 i:=ADOcart['codrnk'];
 Lbcodrnk.Caption:=zv[i];
  Lbwsllgt.Caption:=Copy(ADOcart['wsllgt'],1,2);
  if ADOcart['mstslb']=2 then Lbwslnad.Caption:=Copy(ADOcart['wslkal'],1,2);
   //Проверка положенности сан.кур.
  da:=false;
  if Pos('*',ADOcart['nampst'])=0
  then
   begin
    if (ADOcart['mstslb']=1) or (ADOcart['mstslb']=3) then
     if ADOcart['datdis']>=StrToDate('13.01.1993')
     then
      begin
       if StrToInt(copy(ADOcart['wsllgt'],1,2))<20
       then m:=Application.MessageBox('Компенсация не положена!','Внимание!Проверка!',mb_iconExclamation)
       else da:=true;
      end
     else if (StrToInt(copy(ADOcart['wsllgt'],1,2))>=20) and (Pos(Copy(ADOcart['artdis'],3,1),'бежз')<>0) and (ADOcart['codrnk']>12)
          then da:=true
          else m:=Application.MessageBox('Компенсация не положена!','Внимание!Проверка!',mb_iconExclamation);
    if ADOcart['mstslb']=2 then
     if ADOcart['codrnk']>8
     then
      begin
       if (StrToInt(copy(ADOcart['wsllgt'],1,2))>=20) and (Pos(Copy(ADOcart['artdis'],3,1),'бежз')<>0)
       then da:=true
       else if (StrToInt(copy(ADOcart['wslkal'],1,2))>=25)
            then da:=true
            else m:=Application.MessageBox('Компенсация не положена!','Внимание!Проверка!',mb_iconExclamation);
      end
     else
      if (ADOcart['codrnk']>6) and (StrToInt(copy(ADOcart['wslkal'],1,2))>=20) and (Pos(Copy(ADOcart['artdis'],3,1),'бежз')<>0)
       then
        begin
         da:=true;
         Eprap.Visible:=true;
         MEp.Text:='600';
        end
       else m:=Application.MessageBox('Компенсация не положена!','Внимание!Проверка!',mb_iconExclamation);
   end else m:=Application.MessageBox('Компенсация не положена! Прибыл из СНГ.','Внимание!Проверка!',mb_iconExclamation);
   if da
   then
    begin
     if ADOnal.Active then ADOnal.Close;
     ADOnal.SQL.Strings[0]:='SELECT *';
     ADOnal.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date())-1);
     try
      ADOnal.Open;
     except
     begin
      m:=Application.MessageBox('Возможно, идет печать списков в банки. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
      Exit;
     end;
     end;
     ADOnal.Filter:='delo='+FloatToStr(ADOcart['delo']);
     ADOnal.Filtered:=true;
     if ADOnal.RecordCount>0 then Lbitogo.Caption:=FloatToStrF(ADOnal['summaV'],ffFixed,7,2);
     ADOnal.Close;
     ADOnal.SQL.Strings[0]:='SELECT *';
     ADOnal.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date()));
     try
      ADOnal.Open;
     except
     begin
      m:=Application.MessageBox('Возможно, идет печать списков в банки. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
      Exit;
     end;
     end;
     CBgod.Text:=IntToStr(YearOf(date()));
     MEgod.Text:=CBgod.Text;
     ADOnal.Filter:='delo='+FloatToStr(ADOcart['delo']);
     ADOnal.Filtered:=true;
     if ADOnal.RecordCount>0
     then
      begin
       m:=Application.MessageBox('Компенсация пенсионеру уже выплачивалась!','Внимание! Предупреждение!',mb_iconExclamation);
       Pskl.Visible:=true;
       Edelo.SetFocus;
      end;
     MEo.SetFocus;
    end;
end;

procedure TFmPer.Button2Click(Sender: TObject);
var bank:string;
    m,codb,ms:integer;
begin
 {if (ADOcart['codbnk']=1) or (ADOcart['codbnk']=4) or (ADOcart['codbnk']=5) or (ADOcart['codbnk']=6) or (ADOcart['codbnk']=9) or (ADOcart['codbnk']=11) or (ADOcart['codbnk']=15) or (ADOcart['codbnk']=16) or (ADOcart['codbnk']>=18)
 then codb:=1
 else
  if (ADOcart['codbnk']=2) or (ADOcart['codbnk']=17) or (ADOcart['codbnk']=10) or (ADOcart['codbnk']=12) or (ADOcart['codbnk']=13) or (ADOcart['codbnk']=14)
  then codb:=2
  else
   if (ADOcart['codbnk']=3) or (ADOcart['codbnk']=7) or (ADOcart['codbnk']=8)
   then codb:=8;}
 codb:=1;
 try
  ADObank.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы банков.');
   Exit;
  end;
 end;
 //bank:=Copy(ADObank['nambnk'],1,3)+'.';
 bank:='Яр.';
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date()));
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 CBgod.Text:=IntToStr(YearOf(date()));
 MEgod.Text:=CBgod.Text;
 if  not ADOnal.Locate('delo',ADOcart['delo'],[])
 then
  try
   if ADOcart['mstslb']=2 then ms:=2
                          else ms:=1;
   ADOnal.AppendRecord([ADOcart['delo'],ADOcart['nampns'],StrToFloat(Trim(MEp.Text)),Date(),'',StrToFloat(Trim(MEo.Text)),codb,null,bank,ADOcart['pnslst'],ms])
  except ShowMessage('Идет печать списков. Ждите!');
  end
 else
  begin
   m:=Application.MessageBox('Компенсация пенсионеру уже выплачивалась!','Внимание! Предупреждение!',mb_iconExclamation);
   Edelo.SetFocus;
  end;
 ADOcart.Close;
 ADObank.Close;
 Lbcodrnk.Caption:='';
 Lbitogo.Caption:='';
 MEp.Text:='';
 MEo.Text:='';
 Lbwsllgt.Caption:='';
 Lbwslnad.Caption:='';
 Eprap.Visible:=false;
 Edelo.Text:='';
 Edelo.SetFocus;
 Pskl.Visible:=true;
end;

procedure TFmPer.Spisok(Sender: TObject;bank:integer;slb:integer;kod,msl:string);
var vsego:real;
begin
 vsego:=0;
 ADOnal.Filter:='kodbank='+IntToStr(bank)+' and kassa<="" and mstslb='+IntToStr(slb);
 ADOnal.Filtered:=True;
 zap:=ADOnal.RecordCount;
 if zap>0
 then
  begin
   ADOnal.First;
   while not ADOnal.Eof do
    begin
     vsego:=vsego+ADOnal['summaV'];
     ADOnal.Next;
    end;
   try
    ADObank1.Open;
   except
    begin
     ShowMessage('Ошибка при открытии базы банков.');
     Exit;
    end;
   end;
   ADOnal.Sort:='delo';
   RV.Open;
   RV.SetParam('vsego',FloatToStrF(vsego,ffFixed,12,2));
   RV.SetParam('bank',ADObank1['nambnk']+' банк');
   RV.SetParam('col',IntToStr(zap));
   RV.SetParam('god',IntToStr(YearOf(date())));
   RV.SetParam('kod',kod);
   RV.SetParam('mstslb',msl);
   RV.ExecuteReport('Rspis');
   RV.Close;
   ADOnal.Filtered:=false;
  end else ShowMessage('В этот банк список пуст.');
end;

procedure TFmPer.N5Click(Sender: TObject);
begin
 Spisok(Sender,1,1,'1003 514 2401 005 263','сотрудников ОВД');
end;

procedure TFmPer.ConOpen(Connection: TRvCustomConnection);
begin
 Con.DataRows:=zap;
 ADOnal.First;
 nn:=1;
end;

procedure TFmPer.ConGetCols(Connection: TRvCustomConnection);
begin
 Con.WriteField('nn',dtString,5,'nn','');
 Con.WriteField('delo',dtString,10,'delo','');
 Con.WriteField('fam',dtString,40,'fam','');
 Con.WriteField('pnslst',dtString,15,'pnslst','');
 Con.WriteField('summa',dtString,15,'summa','');
end;

procedure TFmPer.ConGetRow(Connection: TRvCustomConnection);
begin
   Con.WriteStrData('',IntToStr(nn));
   Con.WriteStrData('','48/'+IntToStr(ADOnal['delo']));
   Con.WriteStrData('',ADOnal['fam']);
   Con.WriteStrData('',ADOnal['penlist']);
   Con.WriteStrData('',FloatToStrF(ADOnal['summaV'],ffFixed,9,2));
   ADOnal.Next;
   nn:=nn+1;
end;

procedure TFmPer.Button1Click(Sender: TObject);
begin
 ADOCart.Parameters[0].Value:=StrToFloat(Edelo.Text);
 ADOcart.Parameters[1].Value:='SOS';
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

procedure TFmPer.N6Click(Sender: TObject);
begin
Spisok(Sender,1,2,'1003 514 2202 005 263','военнослужащих ВВ');
end;

procedure TFmPer.N8Click(Sender: TObject);
begin
//Spisok(Sender,8,1);
end;

procedure TFmPer.N9Click(Sender: TObject);
begin
//Spisok(Sender,10,1);
end;

procedure TFmPer.N1Click(Sender: TObject);
begin
 ADOnal.Filtered:=false;
 Pskl.Visible:=true;
 Pdelo.Visible:=true;
 MEdelo1.SetFocus;
end;

procedure TFmPer.N2Click(Sender: TObject);
begin
 ADOnal.Filtered:=false;
 Pskl.Visible:=true;
 Pfio.Visible:=true;
 Efio.SetFocus;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOcart.Close;
 ADOnal.Close;
end;

procedure TFmPer.Koreshok(Sender: TObject;codb:integer;slb:integer;kod,msl:string);
var i:integer;
begin
 ADOnal.Filter:='kodbank='+IntToStr(codb)+' and kassa<="" and mstslb='+IntToStr(slb);
 ADOnal.Filtered:=True;
 zap:=ADOnal.RecordCount;
 ADOnal.First;
 try
  ADObank1.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы банков.');
   Exit;
  end;
 end;
 ADOnal.Sort:='delo';
 RV.Open;
 RV.SetParam('bank',ADObank1['nambnk']+' банк');
 RV.SetParam('col',IntToStr(zap));
 RV.SetParam('kod',kod);
 RV.SetParam('mstslb',msl);
 RV.ExecuteReport('Rkor');
 RV.Close;
 ADOnal.Filtered:=false;
end;

procedure TFmPer.N12Click(Sender: TObject);
begin
 Koreshok(Sender,1,1,'1003 514 2401 005 263','сотрудников ОВД');
end;

procedure TFmPer.N13Click(Sender: TObject);
begin
 Koreshok(Sender,1,2,'1003 514 2202 005 263','военнослужащих ВВ');
end;

procedure TFmPer.N15Click(Sender: TObject);
begin
 //Koreshok(Sender,8,1);
end;

procedure TFmPer.N16Click(Sender: TObject);
begin
 //Koreshok(Sender,10,1);
end;

procedure TFmPer.DBGTpDblClick(Sender: TObject);
begin
 DBGTp.Visible:=false;
 Edelo.Text:=IntToStr(ADOcart['delo']);
 Showpen(Sender);
end;

procedure TFmPer.Button3Click(Sender: TObject);
begin
  ADOCart.Parameters[0].Value:=0;
  ADOcart.Parameters[1].Value:=Trim(MEFIO.Text)+'%';
  if ADOCart.Active then ADOCart.Close;
  try
   ADOcart.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы CART');
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

procedure TFmPer.CBgodChange(Sender: TObject);
var m:integer;
begin
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Trim(MEgod.Text);
 try
  ADOnal.Open;
 except
  begin
   m:=Application.MessageBox('Возможно, идет печать списков в банки. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
   Exit;
  end;
 end;
 ADOnal.Filtered:=false;
end;

procedure TFmPer.BfioClick(Sender: TObject);
var m:integer;
begin
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Trim(MEgod.Text);
 try
  ADOnal.Open;
 except
  begin
   m:=Application.MessageBox('Возможно, идет печать списков в банки. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
  end;
 end;
 ADOnal.Sort:='fam';
 if not ADOnal.Locate('fam',trim(EFIO.Text),[loCaseinsensitive,loPartialKey])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Пенсионеру компенсация не выплачивалась!');
  end;
 Pfio.Visible:=false;
end;

procedure TFmPer.BfoundClick(Sender: TObject);
var m:integer;
begin
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Trim(MEgod.Text);
 try
  ADOnal.Open;
 except
  begin
   m:=Application.MessageBox('Возможно, идет печать списков в банки. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
   Exit;
  end;
 end;
 ADOnal.Sort:='delo';
 if not ADOnal.Locate('delo',trim(MEdelo1.Text),[])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Пенсионеру компенсация не выплачивалась!');
  end;
  Pdelo.Visible:=false;
end;

procedure TFmPer.N4Click(Sender: TObject);
var m:integer;
begin
 //CBgod.Text:=IntToStr(YearOf(Date()));
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Trim(MEgod.Text);
 try
  ADOnal.Open;
 except
  begin
   m:=Application.MessageBox('Возможно, идет печать списков в банки. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
   Exit;
  end;
 end;
 ADOnal.Filtered:=false;
 Pskl.Visible:=true;
 ADOnal.Sort:='datapom';
end;

procedure TFmPer.N3Click(Sender: TObject);
var m:integer;
begin
 //CBgod.Text:=IntToStr(YearOf(Date()));
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Trim(MEgod.Text);
 try
  ADOnal.Open;
 except
  begin
   m:=Application.MessageBox('Возможно, идет печать списков в банки. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
   //ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 //ADOnal.Last;
 ADOnal.Filtered:=false;
 Pskl.Visible:=true;
 ADOnal.Sort:='rovd';
end;

procedure TFmPer.DBTitleClick(Column: TColumn);
begin
 ADOnal.Filtered:=false;
 if Column.Index=0
 then ADOnal.Sort:='delo' else
  if Column.Index=1
  then ADOnal.Sort:='fam' else
   if Column.Index=4
   then ADOnal.Sort:='datapom' else
    if Column.Index=6
    then ADOnal.Sort:='rovd';
end;

procedure TFmPer.MEoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var F:Textfile;
    s1,s2:string;
begin
 if Key=13
 then
  begin
   AssignFile(F,'F:\DATA\skl.txt');
   Reset(F);
   Readln(F,s1);
   Readln(F,s2);
   MEp.Text:=FloatToStrF(StrToInt(Trim(MEo.Text))*StrToFloat(Trim(s2))+StrToFloat(Trim(s1)),ffFixed,7,2);
   MEp.SetFocus;
   CloseFile(F);
  end;
end;

procedure TFmPer.MEpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13
  then Button2Click(Sender);
end;

procedure TFmPer.Otr(Sender: TObject;bank:integer);
var i:integer;
begin
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date()));
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 ADOnal.Filter:='kodbank='+IntToStr(bank)+' and kassa<=""';
 ADOnal.Filtered:=True;
 zap:=ADOnal.RecordCount;
 ADOnal.First;
 for i:=1 to zap do
  begin
   ADOnal.Edit;
   ADOnal.FieldValues['datapom']:=Date();
   ADOnal.FieldValues['kassa']:='с';
   ADOnal.Next;
  end;
 ADOnal.Filtered:=false;
end;

procedure TFmPer.N7Click(Sender: TObject);
begin
 Otr(Sender,1);
end;

procedure TFmPer.N14Click(Sender: TObject);
begin
 Otr(Sender,1);
end;

procedure TFmPer.N17Click(Sender: TObject);
begin
 Otr(Sender,8);
end;

procedure TFmPer.N18Click(Sender: TObject);
begin
 Otr(Sender,10);
end;

procedure TFmPer.TB3Click(Sender: TObject);
begin
 Pblok.Visible:=true;
end;

procedure TFmPer.Button4Click(Sender: TObject);
begin
 ADOcon.Close;
 ADOCon.Mode:=cmShareExclusive;
 //ADOCon.Mode:=cmShareDenyWrite ;
 try
  ADOCon.Open;
  ADOnal.SQL.Strings[0]:='SELECT *';
  ADOnal.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date()));
  ADOnal.Open;
  PM3.AutoPopup:=true;
 except ShowMessage('База занята другим пользователем.');
 end;
end;

procedure TFmPer.Button5Click(Sender: TObject);
begin
 ADOcon.Close;
 ADOcon.Mode:=cmShareDenyNone;
 ADOcon.Open;
 Pblok.Visible:=false;
 PM3.AutoPopup:=false;
end;

procedure TFMPer.OtrKor(Sender: TObject;bank:integer);
var i:integer;
begin
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date()));
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 ADOnal.Filter:='kodbank='+IntToStr(bank)+' and kassa<=""';
 ADOnal.Filtered:=True;
 zap:=ADOnal.RecordCount;
 ADOnal.First;
 for i:=1 to zap do
  begin
   ADOnal.Edit;
   ADOnal.FieldValues['datapom']:=Date();
   ADOnal.FieldValues['kassa']:='с';
   ADOnal.Next;
  end;
 ADOnal.Filtered:=false;
end;

procedure TFmPer.K10Click(Sender: TObject);
begin
 Pkor.Visible:=true;
end;

procedure TFmPer.K8Click(Sender: TObject);
begin
 Pkor.Visible:=true;
end;

procedure TFmPer.K2Click(Sender: TObject);
begin
 Pkor.Visible:=true;
end;

procedure TFmPer.K1Click(Sender: TObject);
begin
 Pkor.Visible:=true;
end;

procedure TFmPer.BBkorClick(Sender: TObject);
var i:integer;
begin
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Copy(MEsp.Text,7,4);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 if CBbnk.ItemIndex<2
 then ADOnal.Filter:='kodbank='+IntToStr(CBbnk.ItemIndex+1)+' and datapom='+Trim(MEsp.Text)+' and kassa>="с"'
 else if CBbnk.ItemIndex=2
      then ADOnal.Filter:='kodbank=8 and datapom='+Trim(MEsp.Text)+' and kassa>="с"'
      else if CBbnk.ItemIndex=3
           then ADOnal.Filter:='kodbank=10 and datapom='+Trim(MEsp.Text)+' and kassa>="с"';
 ADOnal.Filtered:=True;
 zap:=ADOnal.RecordCount;
 Lbsp.Caption:='В списке '+IntToStr(zap)+' чел.';
 ADOnal.First;
 for i:=1 to zap do
  begin
   ADOnal.Edit;
   ADOnal.FieldValues['datapom1']:=StrToDate(Trim(MEvip.Text));
   ADOnal.Next;
  end;
 ADOnal.Filtered:=false;
 ADOnal.Close;
end;

procedure TFmPer.TB5Click(Sender: TObject);
begin
 Pkor.Visible:=true;
 //CBbnk.Text:=CBbnk.Items[0];
 MEsp.SetFocus;
end;

procedure TFmPer.BBcloseClick(Sender: TObject);
begin
 Pkor.Visible:=false;
end;

procedure TFmPer.CBbnkChange(Sender: TObject);
begin
 MEsp.SetFocus;
end;

procedure TFmPer.MEspKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then MEvip.SetFocus;
end;

procedure TFmPer.N10Click(Sender: TObject);
begin
 Padm.Visible:=true;
 MEgod1.SetFocus;
end;

procedure TFmPer.BBpokazClick(Sender: TObject);
var i,j,n,d,nv,dv:integer;
    so,sv:real;
    m1,m2:string;
begin
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Trim(MEgod1.Text);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 if StrToInt(Trim(MEm1.Text))<10 then m1:='0'+Trim(MEm1.Text) else m1:=Trim(MEm1.Text);
 if StrToInt(Trim(MEm2.Text))<10 then m2:='0'+Trim(MEm2.Text) else m2:=Trim(MEm2.Text);
 ADOnal.Filter:='datapom>=01.'+m1+'.'+Trim(MEgod1.Text)+' and datapom<=28.'+m2+'.'+Trim(MEgod1.Text);
 ADOnal.Filtered:=true;
 Mem.Clear;
 for i:=StrToInt(Trim(MEm1.Text)) to StrToInt(Trim(MEm2.Text)) do
  begin
   so:=0;
   n:=0;
   d:=0;
   sv:=0;
   nv:=0;
   dv:=0;
   ADOnal.First;
   for j:=1 to ADOnal.RecordCount do
    begin
     if MonthOf(ADOnal['datapom'])=i
     then
      begin
       if ADOnal['mstslb']=2
       then
        begin
         sv:=sv+ADOnal['summaV'];
         nv:=nv+1;
         dv:=dv+ADOnal['kol'];
        end
       else
        begin
         so:=so+ADOnal['summaV'];
         n:=n+1;
         d:=d+ADOnal['kol'];
        end;
      end;
     ADOnal.Next;
    end;
   Mem.Lines.Append(IntToStr(i)+' - '+FloatToStr(so)+' руб.  '+IntToStr(n)+' чел.('+IntToStr(d)+' чл.сем.)-ОВД');
   Mem.Lines.Append(IntToStr(i)+' - '+FloatToStr(sv)+' руб.  '+IntToStr(nv)+' чел.('+IntToStr(dv)+' чл.сем.)-ВВ');
  end;
 ADOnal.Filtered:=false;
 ADOnal.Close;
end;

procedure TFmPer.BitBtn2Click(Sender: TObject);
begin
 Padm.Visible:=false;
end;

procedure TFmPer.BitBtn1Click(Sender: TObject);
begin
 RV1.SetParam('mem',Mem.Lines.Text);
 RV1.Open;
 RV1.Execute;
 RV1.Close;
end;

procedure TFmPer.N19Click(Sender: TObject);
begin
 Psum.Visible:=true;
 Es1.SetFocus;
end;

procedure TFmPer.BitBtn4Click(Sender: TObject);
begin
 Psum.Visible:=false;
end;

procedure TFmPer.BitBtn3Click(Sender: TObject);
var F:Textfile;
begin
 AssignFile(F,'F:\DATA\skl.txt');
 ReWrite(F);
 WriteLn(F,Trim(Es1.Text));
 WriteLn(F,Trim(Es2.Text));
 CloseFile(F);
end;

procedure TFmPer.N20Click(Sender: TObject);
begin
 Pbuk.Visible:=true;
 Ebuk.SetFocus;
end;

procedure TFmPer.BitBtn6Click(Sender: TObject);
begin
 Pbuk.Visible:=false;
end;

procedure TFmPer.BitBtn5Click(Sender: TObject);
var n,kol:integer;
    sum:real;
    datdis,vv:string;
begin
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date()));
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 try
  ADOcart1.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы CART');
   Exit;
  end;
 end;
 ADOnal1.SQL.Strings[0]:='SELECT *';
 ADOnal1.SQL.Strings[1]:='FROM '+'KUR'+IntToStr(YearOf(date())-1);
 ADOcart1.Filtered:=true;
 ADOcart1.Sort:='delo';
 ADOcart1.First;
 n:=1;
 while not ADOcart1.Eof do
  begin
   if Da(Sender)
   then
    if not ADOnal.Locate('delo',ADOcart1['delo'],[])
    then
     begin
      try
       ADOnal1.Open;
      except
       begin
        ShowMessage('Ошибка при открытии базы сан.кур. компенсаций прошлого года!');
        Exit;
       end;
      end;
      ADOnal1.Filter:='delo='+FloatToStr(ADOcart1['delo']);
      ADOnal1.Filtered:=true;
      if ADOnal1.RecordCount>0
      then
       begin
        kol:=ADOnal1['kol'];
        sum:=ADOnal1['summaV'];
       end
      else
       begin
        kol:=0;
        sum:=0;
       end;
      try datdis:=FormatDateTime('dd.mm.yy',ADOcart1['datdis']) except datdis:='' end;
      if ADOcart1['mstslb']=2 then vv:='ВВ';
      MemBuk.Lines.Append(IntToStr(n)+'.'+StringOfChar(' ',3-Length(IntToStr(n)))+' № '+FloatToStr(ADOcart1['delo'])+StringOfChar(' ',6-Length(FloatToStr(ADOcart1['delo'])))+ADOcart1['nampns']+StringOfChar(' ',35-Length(ADOcart1['nampns']))+Copy(ADOcart1['wsllgt'],1,2)+' лет'+' '+ADOcart1['artdis']+' с '+datdis+' '+vv+'   ('+IntToStr(kol)+' чл.сем.)');
      //MemBuk.Lines.Append('');
      n:=n+1;
     end;
   ADOcart1.Next;
   vv:='';
  end;
 //MemBuk.Visible:=true;
 ADOcart1.Close;
 ADOnal1.Close;
 ADOnal.Close;
 RV.Open;
 RV.SetParam('buk',MemBuk.Lines.Text);
 RV.ExecuteReport('Rbuk');
 RV.Close;
 Membuk.Clear;
end;

procedure TFmPer.ADOcart1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 if Trim(Ebuk.Text)='Кос'
 then Accept:=(Copy(Trim(ADOcart1['nampns']),1,1)='К') and (Copy(Trim(ADOcart1['nampns']),1,3)>='Кос') and (Pos('*',ADOcart1['nampst'])=0)
 else
  if Trim(Ebuk.Text)='К'
  then Accept:=(Copy(Trim(ADOcart1['nampns']),1,1)='К') and (Copy(Trim(ADOcart1['nampns']),1,3)<'Кос') and (Pos('*',ADOcart1['nampst'])=0)
  else Accept:=(Pos(Copy(Trim(ADOcart1['nampns']),1,1),AnsiUpperCase(Trim(Ebuk.Text)))<>0) and (Pos('*',ADOcart1['nampst'])=0);
end;

procedure TFmPer.BitBtn8Click(Sender: TObject);
begin
 Pbnk.Visible:=false;
end;

procedure TFmPer.BitBtn7Click(Sender: TObject);
 var i:integer;
     s:real;
     NAMSP:STRING;
begin
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Copy(MEdatsp.Text,7,4);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 if CBbankS.ItemIndex=0
 then
  begin
   ADOnal.Filter:='kodbank=1 and datapom='+Trim(MEdatsp.Text)+' and kassa>="с" and mstslb=1';
   namsp:='SP_OVD';
  end
 else
  begin
   ADOnal.Filter:='kodbank=1 and datapom='+Trim(MEdatsp.Text)+' and kassa>="с" and mstslb=2';
   namsp:='SP_VV';
  end;
 ADOnal.Filtered:=True;
 zap:=ADOnal.RecordCount;
 ADOnal.Sort:='delo';
 s:=0;
 ADOsp.SQL.Strings[0]:='SELECT *';
 ADOsp.SQL.Strings[1]:='FROM '+namsp;
 ADOsp.Open;
 ADOsp.First;
 if ADOsp.RecordCount<>0
 then
  for i:=1 to ADOsp.RecordCount do
   begin
    ADOsp.DeleteRecords(arCurrent);
    ADOsp.Next;
   end;
 ADOnal.First;
 for i:=1 to zap do
  begin
   ADOsp.AppendRecord([ADOnal['delo'],ADOnal['fam'],ADOnal['summaV']]);
   s:=s+ADOnal['summaV'];
   ADOnal.Next;
  end;
 Lbsp1.Caption:='В файле '+namsp+' '+IntToStr(zap)+' чел.';
 Lbs.Caption:='На сумму '+FloatToStr(s)+' руб.';
 ADOnal.Filtered:=false;
 ADOnal.Close;
 ADOsp.Close;
end;

procedure TFmPer.N11Click(Sender: TObject);
begin
 Pbnk.Visible:=true;
end;

procedure TFmPer.CBbankSChange(Sender: TObject);
begin
 MEdatsp.SetFocus;
end;

end.
