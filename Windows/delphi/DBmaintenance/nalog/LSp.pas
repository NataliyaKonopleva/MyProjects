unit LSp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, DateUtils, Grids, DBGrids,Printers, RpBase, RpSystem,
  RpDefine, RpRave;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    DSCart: TDataSource;
    Table1: TTable;
    BBPrint: TBitBtn;
    Lbvidpns: TLabel;
    Lbdata: TLabel;
    Edinput: TMaskEdit;
    Lbitgpns: TLabel;
    Lbcifra: TLabel;
    Lboutput: TLabel;
    TVipl: TTable;
    DSVipl: TDataSource;
    PFIO: TPanel;
    Label3: TLabel;
    BBOk: TBitBtn;
    BBNo: TBitBtn;
    PFIO1: TPanel;
    LbFIO: TLabel;
    EditFIO: TEdit;
    BBFIO: TBitBtn;
    DBFIO: TDBGrid;
    Lbadr1: TLabel;
    Lbadr2: TLabel;
    Lbnampns: TLabel;
    TBank: TTable;
    DSBank: TDataSource;
    DBzn: TDBGrid;
    Label1: TLabel;
    Editgod: TComboBox;
    Lbzn: TLabel;
    DBNzn: TDBNavigator;
    Rv1: TRvProject;
    RvSystem1: TRvSystem;
    ShowB: TButton;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    function Perev(cifra:real):string;
    procedure Showpen(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure DBNznBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DBNznClick(Sender: TObject; Button: TNavigateBtn);
    procedure ShowBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExampl: TfmExampl;
  plist:string;
  bank:integer;

implementation

{$R *.dfm}

procedure TfmExampl.bbFindClick(Sender: TObject);
 var da1:boolean;
 begin
  da1:=true;
  try
   try
    if not table1.Locate('delo',StrToFloat(Trim(edinput.text)),[])
     then
      begin
       MessageBeep(MB_OK);
       ShowMessage('Номер дела не существует!');
       edinput.SetFocus;
       da1:=false;
      end;
   except on E: EDatabaseError
   do ShowMessage('Ошибка поиска');
   end;
  except on E: EConvertError
  do begin
       ShowMessage('Вы выполнили некорректное действие.');
       ShowMessage('Наберите номер дела или ФИО и нажмите "Найти".');
       if PFIO1.Visible
       then EditFio.SetFocus
       else edinput.SetFocus;
       //da1:=false;
     end;
 end;
 if da1 then Showpen(sender);
end;
procedure TfmExampl.Showpen(Sender: TObject);
 var da:boolean;
     g:string;
 begin
  da:=false;
  if Pos('*',table1['nampst'])=0
  then
   begin
    if table1['mstslb']=1 then
     if (StrToInt(copy(table1['wslkal'],1,2))<20) or (Pos(Copy(table1['artdis'],3,1),'бвежз')=0)
      then begin
            ShowMessage('Компенсация налога указанному пенсионеру не положена!');
            PFIO.Visible:=true;
           end else da:=true;
     if table1['mstslb']=2 then
      if (StrToInt(copy(table1['wslnad'],1,2))<20) or (Pos(Copy(table1['artdis'],3,1),'бежз')=0)
       then begin
             ShowMessage('Компенсация налога указанному пенсионеру не положена!');
             PFIO.Visible:=true;
            end else da:=true;
     if table1['mstslb']=3 then
                            begin
                             ShowMessage('Пенсионер налоговой полиции,компенсация не положена!');
                             PFIO.Visible:=true;
                            end;
   end else
        begin
         ShowMessage('Пенсионер прибыл к нам из СНГ, компенсиция не положена!');
         PFIO.Visible:=true;
        end;
   if da
   then
    begin
     try
      if not TBank.Locate('codbnk',table1['codbnk'],[])
      then
       begin
        MessageBeep(MB_OK);
        ShowMessage('Странный какой-то  номер банка у пенсионера!');
       end;
     except on E: EDatabaseError
     do ShowMessage('Ошибка поиска в базе "Банки"');
     end;
     g:='Zn'+Copy(Editgod.Text,3,2)+'.DBF';
     TVipl.TableName:=g;
     try
      TVipl.Active:=true;
      DsVipl.DataSet.Open;
      if not TVipl.Locate('delo',table1['delo'],[])
      then TVipl.AppendRecord([table1['delo'],table1['nampns'],null,0,0,date(),date(),table1['codbnk'],table1['pnslst'],0])
      else ShowMessage('Указанному пенсионеру уже что-то выплачивалось!');
     except
     on E: EDBEngineError do
                           begin
                            ShowMessage('Ошибка базы-налоги.Возможно неправильно указан год.');
                            Editgod.SetFocus;
                           end;
     end;
     Lbzn.Caption:='Журнал выплаты компенсации налогов за '+Editgod.Text+' год.';
     DbZn.Visible:=true;
     DBNzn.Visible:=true;
    end;
  end;
procedure TfmExampl.FormActivate(Sender: TObject);
begin
 try
 if not FileExists('F:\DATA\CART.MDX') then
  table1.AddIndex('cart2','nampns',[ixExpression]);
  table1.IndexName:='cart2';
  table1.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы');
 end;
 table1.Filter:='vidpns<3 and codlea=0';
 table1.Filtered:=True;
 //Editgod.Text:=IntToStr(YearOf(date())-1);
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  table1.Close;
  //TVipl.Close;
  Tbank.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
 var cifra:string;
 begin
 PFIO.Visible:=false;
 panel1.Visible:=false;
 cifra:=Perev(TVipl['s']);
 try
  if not TBank.Locate('codbnk',TVipl['codbnk'],[])
   then
    begin
     MessageBeep(MB_OK);
     ShowMessage('Странный какой-то номер банка у пенсионера!');
    end;
 except on E: EDatabaseError
 do ShowMessage('Ошибка поиска в базе "Банки"');
 end;
 RV1.Open;
 RV1.SetParam('data',TVipl['datapom']);
 RV1.SetParam('delo',TVipl['delo']);
 RV1.SetParam('fam',TVipl['fam']);
 RV1.SetParam('sum',TVipl['s']);
 RV1.SetParam('cifra',cifra);
 RV1.SetParam('pnslst',TVipl['pnslst']);
 RV1.SetParam('god',Editgod.Text);
 RV1.SetParam('bank',TBank['nambnk']);
 RV1.SetParam('adr1',TBank['adres1']);
 RV1.SetParam('adr2',TBank['adres2']);
 RV1.Execute;
 DBzn.Visible:=false;
 DBNzn.Visible:=false;
 TVipl.Close;
 Lbzn.Caption:='';
 panel1.Visible:=True;
 edinput.SetFocus;
 PFIO.Visible:=true;
end;

function TfmExampl.Perev(cifra:real):string;
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
procedure TfmExampl.BBNoClick(Sender: TObject);
begin
 PFIO.Visible:=false;
 edinput.SetFocus;
end;

procedure TfmExampl.BBOkClick(Sender: TObject);
begin
 PFIO.Visible:=false;
 PFIO1.Visible:=true;
 editFIO.SetFocus;
end;

procedure TfmExampl.BBFIOClick(Sender: TObject);
begin
  if table1.Locate('nampns',trim(EditFIO.Text),[loCaseinsensitive,loPartialKey])
   then
    begin
     DBFIO.Visible:=true;
     edinput.Text:=table1['delo'];
    end
   else
    begin
     MessageBeep(MB_OK);
     ShowMessage('Такого пенсионера не существует!');
     editFIO.SetFocus;
    end;
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 edinput.Text:=table1['delo'];
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
 Showpen(sender);
end;



procedure TfmExampl.DBNznBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button=nbPost
  then TVipl['s']:=TVipl['summa']+TVipl['summa1'];
end;


procedure TfmExampl.DBNznClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button=nbInsert
  then TVipl.AppendRecord([table1['delo'],table1['nampns'],null,0,0,date(),date(),table1['codbnk'],table1['pnslst'],0]);
end;

procedure TfmExampl.ShowBClick(Sender: TObject);
var g:string;
begin
 g:='Zn'+Copy(Editgod.Text,3,2)+'.DBF';
 TVipl.TableName:=g;
 try
  TVipl.Active:=true;
  DsVipl.DataSet.Open;
 except on E: EDBEngineError do
                              begin
                               ShowMessage('Ошибка базы-налоги.Возможно неправильно указан год.');
                               Editgod.SetFocus;
                              end;
 end;
 Lbzn.Caption:='Журнал выплаты компенсации налогов за '+Editgod.Text+' год.';
 DbZn.Visible:=true;
 DBNzn.Visible:=true;
end;

end.




