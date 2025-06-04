unit Spp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, Grids, DBGrids, ADODB;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    DBEDelo2: TDBEdit;
    DBENampns: TDBEdit;
    BBPrint: TBitBtn;
    LbSP: TLabel;
    DBEDatbst: TDBEdit;
    LbPEN: TLabel;
    LbSUM: TLabel;
    Lbvidpns: TLabel;
    LbRUB: TLabel;
    EditRed: TEdit;
    BBEdit: TBitBtn;
    MMVD: TMemo;
    Memo2: TMemo;
    MNACH: TMemo;
    Lbdata: TLabel;
    Edinput: TMaskEdit;
    Lb48: TLabel;
    DBEDelo1: TDBEdit;
    Lbcifra: TLabel;
    Edgr: TEdit;
    Lboutput: TLabel;
    DBFIO: TDBGrid;
    PFIO: TPanel;
    Label3: TLabel;
    BBOk: TBitBtn;
    BBNo: TBitBtn;
    PFIO1: TPanel;
    LbFIO: TLabel;
    EditFIO: TEdit;
    BBFIO: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    LbItgpns: TEdit;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    function Perev(cifra:real):string;
    procedure BBFIOClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Showpen(Sender: TObject);
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
   ADOCart.Parameters[0].Value:=StrToFloat(edinput.Text);
   ADOcart.Parameters[1].Value:='SOS';
   if ADOCart.Active then ADOCart.Close;
   try
    ADOcart.Open;
   except ShowMessage('Œ¯Ë·Í‡ ÔË ÓÚÍ˚ÚËË ·‡Á˚ CART');
   end;
   if ADOCart.RecordCount=0
   then
    begin
     MessageBeep(MB_OK);
     ShowMessage('ÕÓÏÂ ‰ÂÎ‡ ÌÂ ÒÛ˘ÂÒÚ‚ÛÂÚ');
     edinput.SetFocus;
     Exit;
    end;
 Showpen(Sender);
 Editred.Text:='';
 Edit1.Text:='';
 Edit2.Text:='';
 Edit1.Width:=90;
 Edit2.Width:=90;
end;

procedure TfmExampl.FormActivate(Sender: TObject);
begin
 edinput.SetFocus;
 Lbdata.Caption:=DateToStr(date());
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOcart.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 panel1.Visible:=false;
 PFIO.Visible:=false;
 fmexampl.Print;
 panel1.Visible:=True;
 PFIO.Visible:=True;
 edinput.SetFocus;
end;

procedure TfmExampl.BBEditClick(Sender: TObject);
begin
 Editred.SetFocus;
end;

function TfmExampl.Perev(cifra:real):string;
var
 shab1,shab2,shab3,shab4,shab5:string;
 slovo0,slovo,slovo1,tis0,tis1,tis2,ttttt:string;
 lendd,lendd1:integer;
 vvcifr,nbb:real;
 ddkop,promeg1,promeg2,isxch,RUBLI,s:string;
begin
 shab1:='Œƒ»Õ  ƒ¬¿   “–»   ◊≈“€–≈œﬂ“‹  ÿ≈—“‹ —≈Ã‹  ¬Œ—≈Ã‹ƒ≈¬ﬂ“‹';
 shab2:='ƒ≈—ﬂ“‹       Œƒ»ÕÕ¿ƒ÷¿“‹  ƒ¬≈Õ¿ƒ÷¿“‹   “–»Õ¿ƒ÷¿“‹   ◊≈“€–Õ¿ƒ÷¿“‹ œﬂ“Õ¿ƒ÷¿“‹   ÿ≈—“Õ¿ƒ÷¿“‹  —≈ÃÕ¿ƒ÷¿“‹   ¬Œ—≈ÃÕ¿ƒ÷¿“‹ ƒ≈¬ﬂ“Õ¿ƒ÷¿“‹';
 shab3:='ƒ¬¿ƒ÷¿“‹   “–»ƒ÷¿“‹   —Œ–Œ       œﬂ“‹ƒ≈—ﬂ“  ÿ≈—“‹ƒ≈—ﬂ“ —≈Ã‹ƒ≈—ﬂ“  ¬Œ—≈Ã‹ƒ≈—ﬂ“ƒ≈¬ﬂÕŒ—“Œ  ';
 shab4:='ŒƒÕ¿  ƒ¬≈   “–»   ◊≈“€–≈œﬂ“‹  ÿ≈—“‹ —≈Ã‹  ¬Œ—≈Ã‹ƒ≈¬ﬂ“‹';
 shab5:='—“Œ      ƒ¬≈—“»   “–»—“¿   ◊≈“€–≈—“¿œﬂ“‹—Œ“  ÿ≈—“‹—Œ“ —≈Ã‹—Œ“  ¬Œ—≈Ã‹—Œ“ƒ≈¬ﬂ“‹—Œ“';
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
     RUBLI:='–”¡À‹'
    ELSE
     begin
      NBB:=StrToFloat(COPY(ISXCH,LENDD,1));
      if (NBB=0)OR(NBB>4) then RUBLI:='–”¡À≈…'
                          else RUBLI:= '–”¡Àﬂ';
     end;
    IF LENDD>=2 then
     IF  COPY(ISXCH,LENDD-1,1) ='1' then
      begin
       SLOVO1:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD,1))*13+1,13);
       RUBLI:='–”¡À≈…';
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
       TTTTT:='“€—ﬂ◊¿'
      ELSE
       begin
        NBB:=StrToFloat(COPY(ISXCH,LENDD-3,1));
        if (NBB=0)OR(NBB >4) then TTTTT:='“€—ﬂ◊'
                             else TTTTT:='“€—ﬂ◊»';
       end;
     end;
    IF LENDD>=5 then
     begin
      IF  COPY(ISXCH,LENDD-4,1) ='1' then
       begin
        TIS0:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD-3,1))*13+1,13);
        TTTTT:='“€—ﬂ◊';
       end
      ELSE
       IF COPY(ISXCH,LENDD-4,1)<>'0' then
        TIS1:=COPY(SHAB3,(StrToInt(COPY(ISXCH,LENDD-4,1))-2)*11+1,11);
     end;
    IF LENDD>=6 then
     TIS2:=COPY(SHAB5,(StrToInt(COPY(ISXCH,LENDD-5,1))-1)*9+1,9);
    lendd1:=0;
   END;
  perev:=TRIMLEFT(TRIMRIGHT(TIS2)+' '+TRIMRIGHT(TIS1)+' '+TRIMRIGHT(TIS0)+' '+TTTTT+' '+TRIMRIGHT(SLOVO0)+' '+TRIMRIGHT(SLOVO)+' '+TRIMRIGHT(SLOVO1)+' '+RUBLI+' '+DDKOP+' '+' Œœ.');
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
 ADOCart.Parameters[0].Value:=0;
 ADOCart.Parameters[1].Value:=trim(EditFIO.Text)+'%';
 if ADOCart.Active
 then ADOCart.Close;
 try
  ADOcart.Open;
 except ShowMessage('Œ¯Ë·Í‡ ÔË ÓÚÍ˚ÚËË ·‡Á˚ CART');
 end;
 if ADOCart.RecordCount=0
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('ÕÂÚ Ú‡ÍÓ„Ó ÔÂÌÒËÓÌÂ‡ ‚ ”¬ƒ!');
   EditFio.SetFocus;
   Exit;
  end;
   DBFIO.Visible:=true;
   Editred.Text:='';
   Edit1.Text:='';
   Edit2.Text:='';
   Edit1.Width:=90;
   Edit2.Width:=90;
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 Showpen(Sender);
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

procedure TfmExampl.Edit1Change(Sender: TObject);
begin
 Edit1.Width:=593;
end;

procedure TfmExampl.Edit2Change(Sender: TObject);
begin
 Edit2.Width:=593;
end;

procedure TfmExampl.Showpen(Sender: TObject);
begin
 if ((ADOCart['nampst']<>null) and (Pos('!',ADOcart['nampst'])<>0)) or (ADOcart['begpay']<StrToDate('01.01.2012'))
 then ShowMessage('¬ÓÁÏÓÊÂÌ ÌÂÔ‡‚ËÎ¸Ì˚È ‡ÁÏÂ ÔÂÌÒËË.œÓ‚Â¸ÚÂ!');
 case ADOcart['vidpns'] of
   1: Lbvidpns.Caption:='Á‡ ‚˚ÒÎÛ„Û ÎÂÚ';
   2: Lbvidpns.Caption:='ÔÓ ËÌ‚‡ÎË‰ÌÓÒÚË';
   4: Lbvidpns.Caption:='ÔÓ ÔÓÚÂÂ ÍÓÏËÎ¸ˆ‡';
  end;
  if ADOcart['vidpns']=4 then
   if ADOcart['polpns'] then
    Lbitgpns.Text:=FloatToStr(ADOcart['itgpns']+ADOcart['ukaz']+ADOcart['numdep']*(ADOcart['itgpns']+ADOcart['ukaz']))
   else
    Lbitgpns.Text:=FloatToStr(ADOcart['numdep']*(ADOcart['itgpns']+ADOcart['ukaz']))
  else
    Lbitgpns.Text:=FloatToStr(ADOcart['itgpns']+ADOcart['ukaz']);
  Lbcifra.Caption:=Perev(StrToFloat(Lbitgpns.Text));
end;

end.
