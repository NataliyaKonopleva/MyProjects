unit LSp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, DateUtils, Grids, DBGrids;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    DSCart: TDataSource;
    Table1: TTable;
    BBPrint: TBitBtn;
    LbPEN: TLabel;
    Lbvidpns: TLabel;
    BBEdit: TBitBtn;
    MNACH: TMemo;
    Edinput: TMaskEdit;
    Lbitgo: TLabel;
    Lbcifra: TLabel;
    Lboutput: TLabel;
    Egr: TEdit;
    PFIO: TPanel;
    Label3: TLabel;
    BBOk: TBitBtn;
    BBNo: TBitBtn;
    PFIO1: TPanel;
    LbFIO: TLabel;
    EditFIO: TEdit;
    BBFIO: TBitBtn;
    DBFIO: TDBGrid;
    Lbpd: TLabel;
    Lbdr: TLabel;
    Lbdol: TLabel;
    Lbzv: TLabel;
    Lbcodrnk: TLabel;
    Lbuv: TLabel;
    Lbstuv: TLabel;
    Lbvsl: TLabel;
    Lbkal: TLabel;
    Lbvsl1: TLabel;
    Lblgt: TLabel;
    Lblet: TLabel;
    Lbsum: TLabel;
    Lbrub: TLabel;
    Lbadr: TLabel;
    Lbmp: TLabel;
    Lbgod: TLabel;
    Lbdata: TLabel;
    Lb_: TLabel;
    TDis: TTable;
    DataDis: TDataSource;
    Lbtrud: TLabel;
    Lbst: TLabel;
    Label1: TLabel;
    Lbkorm: TLabel;
    LbNampns: TLabel;
    EDatbst: TEdit;
    Lbpnsapp: TLabel;
    Lbadres1: TLabel;
    Lbadres2: TLabel;
    Lbnampst: TLabel;
    Lbnampns1: TLabel;
    Lbdatbst1: TLabel;
    Lbdelo: TLabel;
    Lbmp1: TLabel;
    Lbgod1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Lbsm: TLabel;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    function Perev(cifra:real):string;
    procedure BBPOLClick(Sender: TObject);
    procedure Showpen(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExampl: TfmExampl;

implementation

{$R *.dfm}

procedure TfmExampl.bbFindClick(Sender: TObject);
 begin
  try
   try
    if table1.Locate('delo',StrToFloat(Trim(edinput.text)),[])
     then
      begin
       case table1['vidpns'] of
        1: Lbvidpns.Caption:='за выслугу лет';
        2: Lbvidpns.Caption:='по инвалидности';
        4: Lbvidpns.Caption:='по потере кормильца';
       end;
      end else
           begin
            MessageBeep(MB_OK);
            ShowMessage('Номер дела не существует!');
            edinput.SetFocus;
           end;
   except on E: EConvertError
   do begin
       ShowMessage('Вы выполнили некорректное действие.');
       ShowMessage('Наберите номер дела или ФИО и нажмите "Найти".');
       if PFIO1.Visible
       then EditFio.SetFocus
       else edinput.SetFocus;
      end;
   end;
  except on E: EDatabaseError
  do ShowMessage('Ошибка поиска');
  end;
  Showpen(Sender);
  end;
procedure TfmExampl.Showpen(Sender: TObject);
 var s,stuv,uch,inv:string;
     cr:integer;
     d:real;
 begin
  Lbdelo.caption:=table1['delo'];
  if table1['vidpns']=4 then
   if table1['polpns'] then
    Lbitgo.Caption:=FloatToStr(table1['itgpns']+240+table1['numdep']*(table1['itgpns']+240))
   else
    Lbitgo.Caption:=FloatToStr(table1['numdep']*(table1['itgpns']+240))
  else
    Lbitgo.Caption:=FloatToStr(table1['itgpns']+240);
  LbNampns.Caption:=table1['nampns'];
  EDatbst.Text:=table1['datbst'];
  try
   Lbpnsapp.Caption:=DateToStr(table1['pnsapp'])+' г.';
  except
  end;
  Lbadres1.Caption:=table1['adres1'];
  try
   Lbadres2.Caption:=table1['adres2'];
  except
  end; 
  s:='рядовой      ефрейтор     мл.сержант   сержант      ст.сержант   старшина     прапорщик    ст.прапорщик мл.лейтенант лейтенант    ст.лейтенант капитан      майор        подполковник полковник    генерал-майор';
  if table1['vidpns']<3 then
   begin
    Lbkorm.Caption:='';
    uch:='';
    inv:='';
    Lbsm.caption:='';
    if table1['stat45']<> Null
    then
    if table1['stat45']<='г1'
    then uch:='Участник ВОВ '
    else if table1['stat45']<='г4'
         then uch:='Ветеран боевых действий (Чечня) '
         else if table1['stat45']<='г5'
              then uch:='Ветеран боевых действий за границей '
              else if table1['stat45']<='д1'
                   then uch:='Ветеран ВОВ '
                   else if table1['stat45']<='д2'
                        then uch:='Участник трудового фронта ВОВ ';
    case table1['catinv'] of
    1: inv:='Инвалид ВОВ '+IntToStr(table1['grpinv'])+' гр.';
    2: inv:='Инвалид от заболевания при исполнении служ.обязанностей '+IntToStr(table1['grpinv'])+' гр.';
    3: inv:='Инвалид от заболевания при прохождении службы '+IntToStr(table1['grpinv'])+' гр.';
    4: inv:='Инвалид от общего заболевания '+IntToStr(table1['grpinv'])+' гр.';
    5: inv:='Инвалид детства '+IntToStr(table1['grpinv'])+' гр.';
    end;
    LbNampns1.Visible:=false;
    Lbkorm.Font.Style:=[FsItalic];
    try
     Lbkorm.Caption:=uch+' '+inv;
    except
    end;
    Lbnampns1.Caption:='';
    Lbdatbst1.Caption:='';
    Lbuv.Caption:='Уволен';
    Lbnampst.Caption:=table1['nampst'];
    cr:=table1['codrnk'];
    lbcodrnk.Caption:=copy(s,((cr-1)*13+1),13);
    Lbvsl.Caption:='Выслуга: календарная';
    Lbvsl1.Caption:='лет, льготная';
    Lblet.Caption:='лет';
    Lbtrud.Caption:='Общий тр.стаж';
    Label1.Caption:='лет';
    Lbkal.Caption:=copy(table1['WslKal'],1,2);
    Lblgt.Caption:=copy(table1['WslLgt'],1,2);
    if not (table1['WslSta']=null) then
     Lbst.Caption:=copy(table1['WslSta'],1,2);
    stuv:=table1['ARTDIS'];
    if tDis.Locate('ARTDIS',stuv,[loCaseinsensitive,loPartialKey])
     then
      Lbstuv.Caption:=tDis['NamArt']
     else
      begin
       MessageBeep(MB_OK);
       ShowMessage('Ошибка базы статьи увольнения');
      end;
     Lbpnsapp.Left:=Lbstuv.Left+Lbstuv.Width+5;
   end
   else
    begin
     Lbkorm.Visible:=true;
     //Lbkorm.Font.Style:=[fsbold];
     LbNampns1.Visible:=true;
     d:=table1['delo'];
     Lbuv.Caption:='Пенсия назначена с';
     Lbstuv.Caption:='';
     if table1['rsndea']=1
     then Lbsm.Caption:='Смерть связана с исполнением служебных обязанностей'
     else Lbsm.Caption:='';
     Lbvsl.Caption:='';
     Lbkal.Caption:='';
     Lbvsl1.Caption:='';
     Lblgt.Caption:='';
     Lblet.Caption:='';
     Lbtrud.Caption:='';
     label1.Caption:='';
     Lbst.Caption:='';
     table1.Filtered:=false;
     if table1.Locate('delo;vidpns',VarArrayOf([d,3]),[])
      then
       begin
        Lbnampns1.Caption:=table1['nampns'];
        Lbdatbst1.Caption:=DateToStr(table1['datbst'])+'-'+DateToStr(table1['datdea'])+' гг.';
        Lbnampst.Caption:=table1['nampst'];
        cr:=table1['codrnk'];
        lbcodrnk.Caption:=copy(s,((cr-1)*13+1),13);
        Lbpnsapp.Left:=200;
       end;
      table1.Filtered:=true;
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
 table1.Filter:='vidpns<>3 and codlea=0';
 table1.Filtered:=True;
 Lbdata.Caption:=DateToStr(date());
 Lbgod.Caption:=IntToStr(YearOf(date()))+', '+IntToStr(YearOf(date())-1)+' гг.';
 Lbgod1.Caption:=Lbgod.Caption;
 try
  tDis.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка базы статьи увольнения');
 end;
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  table1.Close;
  tDis.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 PFIO.Visible:=false;
 panel1.Visible:=false;
 Print;
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

procedure TfmExampl.BBPOLClick(Sender: TObject);
begin
 //table1.Next;
 table1.Prior;
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
 case table1['vidpns'] of
  1: Lbvidpns.Caption:='за выслугу лет';
  2: Lbvidpns.Caption:='по инвалидности';
  4: Lbvidpns.Caption:='по потере кормильца';
 end;
 Showpen(sender);
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

end.



