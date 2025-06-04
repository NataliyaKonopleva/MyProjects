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
    P1: TPanel;
    Label1: TLabel;
    DB: TDBGrid;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    PM4: TPopupMenu;
    N10: TMenuItem;
    Rv1: TRvProject;
    Mbnk: TMemo;
    TB5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ADOCon: TADOConnection;
    ADOsum: TADOQuery;
    ADOnal: TADOQuery;
    ADObank: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    MEsum: TEdit;
    Label9: TLabel;
    MEgod: TMaskEdit;
    Label10: TLabel;
    CBgod: TComboBox;
    Label11: TLabel;
    Pskl: TPanel;
    Label14: TLabel;
    ADObank1: TADOQuery;
    ADOCon1: TADOConnection;
    N19: TMenuItem;
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
    ADOcart: TADOQuery;
    ADOnal1: TADOQuery;
    N11: TMenuItem;
    ADOsp: TADOQuery;
    P1sp: TPanel;
    Label32: TLabel;
    DBchern: TDBGrid;
    Pfio: TPanel;
    Label36: TLabel;
    Efio: TEdit;
    BitBtn9: TBitBtn;
    Pdelo: TPanel;
    Label37: TLabel;
    MEdelo1: TMaskEdit;
    BitBtn10: TBitBtn;
    DBNavigator2: TDBNavigator;
    Lbfam: TLabel;
    DBEdelo: TDBEdit;
    DBEfam: TDBEdit;
    Label4: TLabel;
    DBEdatar: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEzon: TDBEdit;
    DBEgrp: TDBEdit;
    Label22: TLabel;
    Label26: TLabel;
    CBbnk: TComboBox;
    DBEpnslst: TDBEdit;
    Label12: TLabel;
    DBEkol: TDBEdit;
    Label13: TLabel;
    DBEendpay: TDBEdit;
    CBvid: TComboBox;
    Label2: TLabel;
    Emes: TEdit;
    Label5: TLabel;
    Label15: TLabel;
    Esum2: TEdit;
    Button1: TButton;
    DBCBcat: TDBComboBox;
    DataSource3: TDataSource;
    Pnew: TPanel;
    Label16: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Button3: TButton;
    DBEnampns: TDBEdit;
    DBEdatbst: TDBEdit;
    CBcat: TComboBox;
    CBbank: TComboBox;
    DBEdit6: TDBEdit;
    DBEgru: TDBEdit;
    Label17: TLabel;
    DataSource4: TDataSource;
    Edelo: TEdit;
    Ezon: TEdit;
    Edeti: TEdit;
    Esrok: TMaskEdit;
    BBclose: TBitBtn;
    Pbnk: TPanel;
    Label29: TLabel;
    CBnambnk: TComboBox;
    CBvidv: TComboBox;
    CBmes1: TComboBox;
    BBprint: TBitBtn;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    BBclose1: TBitBtn;
    ADOnal2: TADOQuery;
    ADOchern: TADOQuery;
    DataSource5: TDataSource;
    BitBtn3: TBitBtn;
    BBprintChernv: TBitBtn;
    Con2: TRvCustomConnection;
    Psum1: TPanel;
    Label44: TLabel;
    DBGsum: TDBGrid;
    DBNavigator3: TDBNavigator;
    BitBtn4: TBitBtn;
    ADOsum1: TADOQuery;
    DataSource6: TDataSource;
    ADOsum1V0: TFloatField;
    ADOsum1V1: TFloatField;
    ADOsum1V2: TFloatField;
    ADOsum1V3: TFloatField;
    ADOsum1V4: TFloatField;
    ADOsum1V5: TFloatField;
    ADOsum1V6: TFloatField;
    ADOsum1V7: TFloatField;
    ADOsum1NAM: TWideStringField;
    BitBtn5: TBitBtn;
    Esum1: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure TB2Click(Sender: TObject);
  //  procedure Button2Click(Sender: TObject);
//    procedure N5Click(Sender: TObject);
    procedure ConOpen(Connection: TRvCustomConnection);
    procedure ConGetCols(Connection: TRvCustomConnection);
    procedure ConGetRow(Connection: TRvCustomConnection);
    procedure Button1Click(Sender: TObject);
//    procedure N6Click(Sender: TObject);
//    procedure N8Click(Sender: TObject);
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
//    procedure Showpen(Sender: TObject);
    procedure DBGTpDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CBgodChange(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure BfoundClick(Sender: TObject);
    procedure MEoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEsumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
 //   procedure Spisok(Sender: TObject;bank:integer);
    procedure Koreshok(Sender: TObject;codb:integer);
    procedure N7Click(Sender: TObject);
    procedure Otr(Sender: TObject;bank:integer);
    procedure N14Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure TB3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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
    procedure ADOcartFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    function DA(Sender: TObject):Boolean;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ADOnalAfterScroll(DataSet: TDataSet);
    procedure DBchernDblClick(Sender: TObject);
    procedure CBvidChange(Sender: TObject);
    procedure TB5Click(Sender: TObject);
    procedure EdeloChange(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBclose1Click(Sender: TObject);
    procedure Print(NameRep:string);
    procedure BBprintClick(Sender: TObject);
    procedure Esum1Change(Sender: TObject);
    procedure BBprintChernvClick(Sender: TObject);
    procedure Con2GetRow(Connection: TRvCustomConnection);
    procedure Con2GetCols(Connection: TRvCustomConnection);
    procedure Con2Open(Connection: TRvCustomConnection);
    procedure DBTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPer: TFmPer;
  zap,nn,zap1:integer;
  vsego1:real;
  NameRep:string;
implementation

{$R *.dfm}

procedure TFmPer.FormActivate(Sender: TObject);
begin
 try ADOcon.Open
 except
  begin
   ShowMessage('Журналы не доступны! Попробуйте позже!');
   Exit;
  end;
 end;
  if ADOnal.Active then ADOnal.Close;
  try
   ADOnal.Open;
  except
   begin
    Application.MessageBox('Журнал ликвидаторов не доступен! Попробуйте позже.','Журнал ликвидаторов не доступен!',mb_iconExclamation);
    Exit;
   end;
  end;
  CBgod.Text:=IntToStr(YearOf(Date()));
  MEgod.Text:=CBgod.Text;
  if ADOnal1.Active then ADOnal1.Close;
  ADOnal1.SQL.Strings[0]:='SELECT *';
  ADOnal1.SQL.Strings[1]:='FROM CHERNV'+Copy(MEgod.Text,3,2);
  ADOnal1.SQL.Strings[2]:='WHERE (delo=:delo) and (codpol=:codpol)';
  try
   ADOnal1.Open;
  except
   begin
    Application.MessageBox('Журнал компенсаций не доступен! Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
    Exit;
   end;
  end;
  ADOnal1.Sort:='datav';
  DBchern.SetFocus;
end;

procedure TFmPer.TB2Click(Sender: TObject);
begin
 DBchernDblClick(Sender);
end;

function TfmPer.Da(Sender: TObject):Boolean;
begin
 { Da:=false;
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
     if (ADOcart1['codrnk']>8) and (StrToInt(copy(ADOcart1['wslkal'],1,2))>=20) and (Pos(Copy(ADOcart1['artdis'],3,1),'бежз')<>0)
     then Da:=true;}
end;

{procedure TfmPer.Showpen(Sender: TObject);
 var da:boolean;
     i,m:integer;
begin
 i:=ADOcart['codrnk'];
   //Lbwsllgt.Caption:=Copy(ADOcart['wsllgt'],1,2);
 // if ADOcart['mstslb']=2 then Lbwslnad.Caption:=Copy(ADOcart['wslkal'],1,2);
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
       //  Eprap.Visible:=true;
       //  MEp.Text:='600';
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
    // if ADOnal.RecordCount>0 then Lbitogo.Caption:=FloatToStrF(ADOnal['summaV'],ffFixed,7,2);
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
      // Edelo.SetFocus;
      end;
   //  MEo.SetFocus;
    end;
end;

procedure TFmPer.Button2Click(Sender: TObject);
var bank:string;
    m,codb:integer;
begin
 if (ADOcart['codbnk']=1) or (ADOcart['codbnk']=4) or (ADOcart['codbnk']=5) or (ADOcart['codbnk']=6) or (ADOcart['codbnk']=9) or (ADOcart['codbnk']=11) or (ADOcart['codbnk']=15) or (ADOcart['codbnk']=16) or (ADOcart['codbnk']>=18)
 then codb:=1
 else
  if (ADOcart['codbnk']=2) or (ADOcart['codbnk']=17) or (ADOcart['codbnk']=10) or (ADOcart['codbnk']=12) or (ADOcart['codbnk']=13) or (ADOcart['codbnk']=14)
  then codb:=2
  else
   if (ADOcart['codbnk']=3) or (ADOcart['codbnk']=7) or (ADOcart['codbnk']=8)
   then codb:=8;
 try
  ADObank.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы банков.');
   Exit;
  end;
 end;
 bank:=Copy(ADObank['nambnk'],1,3)+'.';
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
  // ADOnal.AppendRecord([ADOcart['delo'],ADOcart['nampns'],StrToFloat(Trim(MEp.Text)),Date(),'',StrToFloat(Trim(MEo.Text)),codb,null,bank,ADOcart['pnslst']])
  except ShowMessage('Идет печать списков. Ждите!');
  end
 else
  begin
   m:=Application.MessageBox('Компенсация пенсионеру уже выплачивалась!','Внимание! Предупреждение!',mb_iconExclamation);
  // Edelo.SetFocus;
  end;
 ADOcart.Close;
 ADObank.Close;
 //Lbitogo.Caption:='';
 //Eprap.Visible:=false;
 //Edelo.Text:='';
 //Edelo.SetFocus;
 Pskl.Visible:=true;
end;}

{procedure TFmPer.Spisok(Sender: TObject;bank:integer);
var vsego:real;
begin
 vsego:=0;
 ADOnal.Filter:='kodbank='+IntToStr(bank)+' and kassa<=""';
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
   RV.ExecuteReport('Rspis');
   RV.Close;
   ADOnal.Filtered:=false;
  end else ShowMessage('В этот банк список пуст.');
end;

procedure TFmPer.N5Click(Sender: TObject);
begin
 Spisok(Sender,1);
end;}

procedure TFmPer.ConOpen(Connection: TRvCustomConnection);
begin
 Con.DataRows:=zap;
 ADOnal2.First;
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
   Con.WriteStrData('','48/'+IntToStr(ADOnal2['delo']));
   try
    ADOchern.Open;
   except
    begin
     Application.MessageBox('База CHERN не доступна! Попробуйте позже.','Журнал ликвидаторов не доступен!',mb_iconExclamation);
     Exit;
    end;
   end;
   Con.WriteStrData('',ADOchern['fam']);
   Con.WriteStrData('',ADOnal2['naim']);
   Con.WriteStrData('',FloatToStrF(ADOnal2['sum'],ffFixed,9,2));
   ADOnal2.Next;
   nn:=nn+1;
   ADOchern.Close;
end;

procedure TFmPer.Button1Click(Sender: TObject);
begin
 ADOnal1.AppendRecord([StrToInt(DBEdelo.Text),ADOnal['codpol'],CBvid.ItemIndex,Date(),CBvid.Text,null,StrToFloat(Esum1.Text),StrToFloat(Esum2.Text),StrToInt(DBEkol.Text),StrToFloat(MEsum.Text),'с/б',StrToInt(Emes.Text),(Cbbnk.ItemIndex+1),(Cbbnk.ItemIndex+1)]);
end;

{procedure TFmPer.N6Click(Sender: TObject);
begin
Spisok(Sender,2);
end;

procedure TFmPer.N8Click(Sender: TObject);
begin
Spisok(Sender,8);
end;}

procedure TFmPer.N1Click(Sender: TObject);
begin
 ADOnal.Filtered:=false;
 P1sp.Visible:=true;
 Pdelo.Visible:=true;
 MEdelo1.SetFocus;
end;

procedure TFmPer.N2Click(Sender: TObject);
begin
 ADOnal.Filtered:=false;
 p1sp.Visible:=true;
 Pfio.Visible:=true;
 Efio.SetFocus;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOCon.Close;
 ADOcon1.Close;
end;

procedure TFmPer.Koreshok(Sender: TObject;codb:integer);
var i:integer;
begin
 ADOnal.Filter:='kodbank='+IntToStr(codb)+' and kassa<=""';
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
 RV.ExecuteReport('Rkor');
 RV.Close;
 ADOnal.Filtered:=false;
end;

procedure TFmPer.N12Click(Sender: TObject);
begin
 Koreshok(Sender,1);
end;

procedure TFmPer.N13Click(Sender: TObject);
begin
 Koreshok(Sender,2);
end;

procedure TFmPer.N15Click(Sender: TObject);
begin
 Koreshok(Sender,8);
end;

procedure TFmPer.N16Click(Sender: TObject);
begin
 Koreshok(Sender,10);
end;

procedure TFmPer.DBGTpDblClick(Sender: TObject);
begin
 //DBGTp.Visible:=false;
 //Edelo.Text:=IntToStr(ADOcart['delo']);
// Showpen(Sender);
end;

procedure TFmPer.Button3Click(Sender: TObject);
begin
 try
  begin
   if Trim(Esrok.Text)<=''
   then ADOnal.AppendRecord([StrToInt(Edelo.Text),ADOcart['codpol'],DBEnampns.Text,StrToDate(DBEdatbst.Text),CBcat.ItemIndex,StrToInt(DBEgru.Text),StrToInt(Ezon.Text),StrToInt(Edeti.Text),null,(CBbank.ItemIndex+1),DBEpnslst.Text,null,(CBbank.ItemIndex+1)])
   else ADOnal.AppendRecord([StrToInt(Edelo.Text),ADOcart['codpol'],DBEnampns.Text,StrToDate(DBEdatbst.Text),CBcat.ItemIndex,StrToInt(DBEgru.Text),StrToInt(Ezon.Text),StrToInt(Edeti.Text),StrToDate(Esrok.Text),(CBbank.ItemIndex+1),DBEpnslst.Text,null,(CBbank.ItemIndex+1)]);
   Pnew.Visible:=false;
   ADOcart.Close;
  end;
 except ShowMessage('Ошибка ввода!Возможно недостаточно данных.');
 end;
end;

procedure TFmPer.CBgodChange(Sender: TObject);
var m:integer;
begin
 MEgod.Text:=CBgod.Text;
 if ADOnal1.Active then ADOnal1.Close;
 ADOnal1.SQL.Strings[0]:='SELECT *';
 ADOnal1.SQL.Strings[1]:='FROM '+'CHERNV'+Trim(Copy(MEgod.Text,3,2));
 ADOnal1.SQL.Strings[2]:='WHERE delo=:delo and codpol=:codpol';
 try
  ADOnal1.Open;
 except
  begin
   m:=Application.MessageBox('Журнал компенсаций не доступен. Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
   Exit;
  end;
 end;
 //ADOnal1.Filtered:=false;
end;

procedure TFmPer.BfioClick(Sender: TObject);
begin
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 try
  ADOnal.Open;
 except
  begin
   Application.MessageBox('Журнал ликвидаторов не доступен. Попробуйте позже.','Журнал ликвидаторов не доступен!',mb_iconExclamation);
  end;
 end;
 ADOnal.Sort:='fam';
 if not ADOnal.Locate('fam',trim(EFIO.Text),[loCaseinsensitive,loPartialKey])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Нет такого ликвидатора!');
  end;
 Pfio.Visible:=false;
end;

procedure TFmPer.BfoundClick(Sender: TObject);
var m:integer;
begin
 //MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 try
  ADOnal.Open;
 except
  begin
   m:=Application.MessageBox('Журнал ликвидаторов не доступен. Попробуйте позже.','Журнал ликвидаторов не доступен!',mb_iconExclamation);
   Exit;
  end;
 end;
 if not ADOnal.Locate('delo',trim(MEdelo1.Text),[])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Нет такого ликвидатора!');
  end;
  Pdelo.Visible:=false;
  {if ADOnal1.Active then ADOnal1.Close;
  ADOnal1.SQL.Clear;
  ADOnal1.SQL.Append('SELECT *');
  ADOnal1.SQL.Append('FROM CHERNV'+Copy(MEgod.Text,3,2));
  ADOnal1.SQL.Append('WHERE delo=:delo');
  try
   ADOnal1.Open;
  except
   begin
    m:=Application.MessageBox('Журнал компенсаций недоступен! Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
    Exit;
   end;
  end;
  Pskl.Visible:=true;}
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
   //MEp.Text:=FloatToStrF(StrToInt(Trim(MEo.Text))*StrToFloat(Trim(s2))+StrToFloat(Trim(s1)),ffFixed,7,2);
   //MEp.SetFocus;
   CloseFile(F);
  end;
end;

procedure TFmPer.MEsumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13
  then MEsum.Text:=Esum1.Text;
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
 Otr(Sender,2);
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
 Pbnk.Visible:=true;
end;

procedure TFmPer.Button5Click(Sender: TObject);
begin
 ADOcon.Close;
 ADOcon.Mode:=cmShareDenyNone;
 ADOcon.Open;
end;

{procedure TFmPer.BBkorClick(Sender: TObject);
var i:integer;
begin
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 //ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Copy(MEsp.Text,7,4);
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
 CBbnk.SetFocus;
end;

procedure TFmPer.BBcloseClick(Sender: TObject);
begin
 Pkor.Visible:=false;
end;}

procedure TFmPer.CBbnkChange(Sender: TObject);
begin
// MEsp.SetFocus;
end;

procedure TFmPer.MEspKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //if Key=13 then MEvip.SetFocus;
end;

procedure TFmPer.N10Click(Sender: TObject);
begin
 Psum1.Visible:=false;
 Pnew.Visible:=false;
 Pskl.Visible:=false;
 P1sp.Visible:=false;
 Padm.Visible:=true;
 MEgod1.SetFocus;
end;

procedure TFmPer.BBpokazClick(Sender: TObject);
var i,j,n,d:integer;
    sp,sv,sm:real;
    m1,m2:string;
begin
 if ADOnal2.Active then ADOnal2.Close;
 ADOnal2.SQL.Strings[0]:='SELECT *';
 ADOnal2.SQL.Strings[1]:='FROM '+'CHERNV'+Copy(MEgod1.Text,3,2);
 try
  ADOnal2.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы компенсаций!');
   Exit;
  end;
 end;
 if StrToInt(Trim(MEm1.Text))<10 then m1:='0'+Trim(MEm1.Text) else m1:=Trim(MEm1.Text);
 if StrToInt(Trim(MEm2.Text))<10 then m2:='0'+Trim(MEm2.Text) else m2:=Trim(MEm2.Text);
 ADOnal2.Filter:='datav>=01.'+m1+'.'+Trim(MEgod1.Text)+' and datav<=28.'+m2+'.'+Trim(MEgod1.Text);
 ADOnal2.Filtered:=true;
 Mem.Clear;
 for i:=StrToInt(Trim(MEm1.Text)) to StrToInt(Trim(MEm2.Text)) do
  begin
   ADOnal2.First;
   sp:=0;
   sv:=0;
   sm:=0;
   for j:=1 to ADOnal2.RecordCount do
    begin
     if MonthOf(ADOnal2['datav'])=i
     then
      begin
       if ADOnal2['kodv']<2
       then sp:=sp+ADOnal2['sum']
       else if ADOnal2['kodv']<5
            then sv:=sv+ADOnal2['sum']
            else if ADOnal2['kodv']<8
                 then sm:=sm+ADOnal2['sum']
                 else if ADOnal2['kodv']=8
                      then sp:=sp+ADOnal2['sum']
                      else if ADOnal2['kodv']=9
                           then sm:=sm+ADOnal2['sum']
                           else sv:=sv+ADOnal2['sum'];
      end;
     ADOnal2.Next;
    end;
   Mem.Lines.Append(IntToStr(i)+' - пит.'+FloatToStrF(sp,ffFixed,9,2)+'; вред '+FloatToStrF(sv,ffFixed,9,2)+'; м/п '+FloatToStrF(sm,ffFixed,9,2));
  end;
   ADOnal2.Filtered:=false;
   ADOnal2.Close;
end;

procedure TFmPer.BitBtn2Click(Sender: TObject);
begin
 Padm.Visible:=false;
end;

procedure TFmPer.BitBtn1Click(Sender: TObject);
begin
 Pskl.Visible:=true;
 P1sp.Visible:=true;
 Padm.Visible:=false;
 RV1.SetParam('mem',Mem.Lines.Text);
 RV1.SetParam('god',MEgod.Text);
 RV1.Open;
 RV1.Execute;
 RV1.Close;
end;

procedure TFmPer.N19Click(Sender: TObject);
var c:TColumn;
begin
 Psum1.Visible:=true;
 ADOsum1.Open;
end;

procedure TFmPer.BitBtn4Click(Sender: TObject);
begin
 Psum1.Visible:=false;
 ADOsum1.Close;
end;

procedure TFmPer.BitBtn3Click(Sender: TObject);
begin
 NameRep:='Rkor';
 Print(NameRep);
end;

procedure TFmPer.N20Click(Sender: TObject);
begin
 //Pbuk.Visible:=true;
 //Ebuk.SetFocus;
end;

procedure TFmPer.BitBtn6Click(Sender: TObject);
begin
 //Pbuk.Visible:=false;
end;

procedure TFmPer.BitBtn5Click(Sender: TObject);
begin
 Pnew.Visible:=false;
end;

procedure TFmPer.ADOcartFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 //if Trim(Ebuk.Text)='Кос'
 //then Accept:=(Copy(Trim(ADOcart1['nampns']),1,1)='К') and (Copy(Trim(ADOcart1['nampns']),1,3)>='Кос') and (Pos('*',ADOcart1['nampst'])=0)
 //else
  //if Trim(Ebuk.Text)='К'
  //then Accept:=(Copy(Trim(ADOcart1['nampns']),1,1)='К') and (Copy(Trim(ADOcart1['nampns']),1,3)<'Кос') and (Pos('*',ADOcart1['nampst'])=0)
  //else Accept:=(Pos(Copy(Trim(ADOcart1['nampns']),1,1),AnsiUpperCase(Trim(Ebuk.Text)))<>0) and (Pos('*',ADOcart1['nampst'])=0);
end;

procedure TFmPer.BitBtn8Click(Sender: TObject);
begin
 //Pbnk.Visible:=false;
end;

procedure TFmPer.BitBtn7Click(Sender: TObject);
 var i:integer;
     s:real;
begin
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 //ADOnal.SQL.Strings[1]:='FROM '+'KUR'+Copy(MEdatsp.Text,7,4);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('Ошибка при открытии базы сан.кур. компенсаций!');
   Exit;
  end;
 end;
 //if CBbnk.ItemIndex<2
 //ADOnal.Filter:='kodbank=1 and datapom='+Trim(MEdatsp.Text)+' and kassa>="с"';
 {else if CBbnk.ItemIndex=2
      then ADOnal.Filter:='kodbank=8 and datapom='+Trim(MEdatsp.Text)
      else if CBbnk.ItemIndex=3
           then ADOnal.Filter:='kodbank=10 and datapom='+Trim(MEdatsp.Text);}
 ADOnal.Filtered:=True;
 zap:=ADOnal.RecordCount;
 ADOnal.Sort:='delo';
 s:=0;
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
 //Lbsp1.Caption:='В файле sp1.dbf '+IntToStr(zap)+' чел.';
 //Lbs.Caption:='На сумму '+FloatToStr(s)+' руб.';
 ADOnal.Filtered:=false;
 ADOnal.Close;
 ADOsp.Close;
end;

procedure TFmPer.N11Click(Sender: TObject);
begin
 //Pbnk.Visible:=true;
end;

procedure TFmPer.ComboBox1Change(Sender: TObject);
begin
 //MEdatsp.SetFocus;
end;

procedure TFmPer.ADOnalAfterScroll(DataSet: TDataSet);
begin
 Lbfam.Caption:=ADOnal['fam'];
end;

procedure TFmPer.DBchernDblClick(Sender: TObject);
begin
 if ADOnal['codlea']=0 then
  begin
   if ADOnal['endpay']<>null then ShowMessage('Проверьте срок выплаты!');
   p1sp.Visible:=false;
   p1.Visible:=true;
   try ADOsum.Open
   except
    begin
     ShowMessage('Журнал норм выплат не доступен! Попробуйте позже!');
     Exit;
    end;
   end;
   CBbnk.ItemIndex:=(ADOnal['codbnk']-1);
   CBvid.Text:='';
   Esum1.Text:='';
   Esum2.Text:='';
   MEsum.Text:='';
  end
 else Application.MessageBox('Пенсионер выбыл!','Внимание!Проверка!',mb_iconExclamation);
end;
 
procedure TFmPer.CBvidChange(Sender: TObject);
var nv:string;
begin
 nv:='V'+IntToStr(CBvid.ItemIndex);
 if CBvid.ItemIndex<8
 then Esum1.Text:=FloatToStrF(ADOsum[nv],ffFixed,9,2);
 if CBvid.ItemIndex<2
 then
  begin
   Esum2.Text:=FloatToStrF((ADOsum[nv]*ADOnal['do_14']),ffFixed,9,2);
   Emes.Text:=IntToStr(MonthOf(Date()+31));
  end
 else
  begin
   if CBvid.ItemIndex<5
   then Emes.Text:=IntToStr(MonthOf(Date()))
   else Emes.Text:='0';
   Esum2.Text:='0,00';
  end;
 try
  MEsum.Text:=FloatToStrF((StrToFloat(Esum1.Text)+StrToFloat(Esum2.Text)),ffFixed,9,2);
 except end;
end;

procedure TFmPer.TB5Click(Sender: TObject);
begin
 P1.Visible:=false;
 P1sp.Visible:=true;
 Pnew.Visible:=true;
 Edelo.SetFocus;
 Edeti.Text:='0';
end;

procedure TFmPer.EdeloChange(Sender: TObject);
begin
 if ADOcart.Active then ADOcart.Close;
 ADOcart.Parameters.ParamValues['delo']:=Trim(Edelo.Text);
  try
   ADOcart.Open;
  except
   begin
    Application.MessageBox('База CART не доступна! Попробуйте позже.','Журнал ликвидаторов не доступен!',mb_iconExclamation);
    Exit;
   end;
  end;
end;

procedure TFmPer.BBcloseClick(Sender: TObject);
begin
 P1.Visible:=false;
 P1sp.Visible:=true;
end;

procedure TFmPer.BBclose1Click(Sender: TObject);
begin
 Pbnk.Visible:=false;
end;

procedure TFmPer.Print(NameRep:string);
var kodv:string;
    kodbnk:integer;
    vsego:real;
begin
 vsego:=0;
 MEgod.Text:=CBgod.Text;
 if ADOnal2.Active then ADOnal2.Close;
 if ADOnal.Active then ADOnal.Close;
 ADOnal2.SQL.Strings[0]:='SELECT *';
 ADOnal2.SQL.Strings[1]:='FROM CHERNV'+Copy(MEgod.Text,3,2);
 try
  ADOnal2.Open;
 except
  begin
   Application.MessageBox('Журнал компенсаций не доступен! Попробуйте позже.','Журнал компенсаций не доступен!',mb_iconExclamation);
   Exit;
  end;
 end;
  ADOnal2.Sort:='delo';
  if CBvidV.ItemIndex=0
  then kodv:='kodv<2'
  else if CBvidV.ItemIndex=1
       then kodv:='kodv>1 and kodv<5'
       else if CBvidV.ItemIndex=2
            then kodv:='kodv>4 and kodv<8'
            else kodv:='kodv>7';
  kodbnk:=CBnambnk.ItemIndex+1;
  ADOnal2.Filter:='codbnk='+IntToStr(kodbnk)+' and '+kodv+' and srok='+IntToStr(CBmes1.ItemIndex+1);
  ADOnal2.Filtered:=true;
  zap:=ADOnal2.RecordCount;
 if zap>0
 then
  begin
   ADOnal2.First;
   while not ADOnal2.Eof do
    begin
     vsego:=vsego+ADOnal2['sum'];
     ADOnal2.Next;
    end;
   RV.Open;
   RV.SetParam('vsego',FloatToStrF(vsego,ffFixed,12,2));
   RV.SetParam('bank',CBnambnk.Text+' банк');
   RV.SetParam('col',IntToStr(zap));
   RV.SetParam('god',CBvidV.Text+' за '+CBmes1.Text+' '+MEgod.Text);
   RV.ExecuteReport(NameRep);
   RV.Close;
   ADOnal2.Filtered:=false;
  end else ShowMessage('Список в банк пуст');
end;

procedure TFmPer.BBprintClick(Sender: TObject);
begin
 NameRep:='Rspis';
 Print(NameRep);
end;

procedure TFmPer.Esum1Change(Sender: TObject);
begin
 MEsum.Text:=Esum1.Text;
end;

procedure TFmPer.BBprintChernvClick(Sender: TObject);
begin
 ADOnal1.First;
 RV.Open;
 RV.SetParam('god',MEgod.Text);
 RV.SetParam('fam',Lbfam.Caption);
 RV.ExecuteReport('Rchernv');
 RV.Close;
end;

procedure TFmPer.Con2GetRow(Connection: TRvCustomConnection);
begin
  Con2.WriteStrData('',DateToStr(ADOnal1['datav']));
  Con2.WriteStrData('',ADOnal1['naim']);
  Con2.WriteStrData('',ADOnal1['srok']);
  Con2.WriteStrData('',FloatToStrF(ADOnal1['sum1'],ffFixed,9,2));
  Con2.WriteStrData('',FloatToStrF(ADOnal1['sum2'],ffFixed,9,2));
  Con2.WriteStrData('',FloatToStrF(ADOnal1['sum'],ffFixed,9,2));
  ADOnal1.Next;
end;

procedure TFmPer.Con2GetCols(Connection: TRvCustomConnection);
begin
 Con2.WriteField('data',dtString,10,'data','');
 Con2.WriteField('naim',dtString,40,'naim','');
 Con2.WriteField('mes',dtString,40,'mes','');
 Con2.WriteField('sum1',dtString,15,'sum1','');
 Con2.WriteField('sum2',dtString,15,'sum2','');
 Con2.WriteField('sum',dtString,15,'sum','');
end;

procedure TFmPer.Con2Open(Connection: TRvCustomConnection);
begin
 Con2.DataRows:=ADOnal1.RecordCount;
 ADOnal1.First;
end;

procedure TFmPer.DBTitleClick(Column: TColumn);
begin
 if Column.Index=0
 then ADOnal1.Sort:='datav';
end;

end.
