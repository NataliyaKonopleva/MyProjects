unit LSp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, DateUtils, Grids, DBGrids,Printers, RpBase, RpSystem,
  RpDefine, RpRave, ADODB;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    BBPrint: TBitBtn;
    Lbvidpns: TLabel;
    Lbdata: TLabel;
    Edinput: TMaskEdit;
    Lbitgpns: TLabel;
    Lbcifra: TLabel;
    Lboutput: TLabel;
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
    Label1: TLabel;
    EVipl: TComboBox;
    Lbzn: TLabel;
    Rv1: TRvProject;
    RvSystem1: TRvSystem;
    DBTNampns: TDBText;
    DBTDelo: TDBText;
    DBTBank: TDBText;
    Lbbank: TLabel;
    LbSumma: TLabel;
    MComment: TMemo;
    Esumma: TMaskEdit;
    Lb48: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    ADObank: TADOQuery;
    DataSource2: TDataSource;
    DBTadr1: TDBText;
    DBTadr2: TDBText;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    function Perev(cifra:real):string;
    procedure BBNoClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure MCommentChange(Sender: TObject);
    procedure EViplChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExampl: TfmExampl;
  //plist:string;
  //bank:integer;

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
  ADObank.Open;
end;

procedure TfmExampl.FormActivate(Sender: TObject);
begin
 edinput.SetFocus;
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOCart.Close;
  ADObank.Open;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
 var cifra,kod,sum:string;
begin
 case EVipl.ItemIndex of
  0: kod:='1001 4900101 312 263';
  1: kod:='1003 5052001 313 263';
  2: kod:='1003 5052205 313 263';
  3: kod:='1003 5142401 313 263';
  4: kod:='1003 5142202 313 263';
  5: kod:='1003 5057600 321 263';
  6: kod:='1003 5051201 314 263';
  7: kod:='1003 5051101 314 263';
  8: kod:='1003 5050105 313 263';
  9: kod:='1003 5142401 313 263';
  10: kod:='1003 5142202 313 263';
 end;
 try
  cifra:=Perev(StrToFloat(Trim(ESumma.Text)));
 except on E: EConvertError do
                             begin
                              ShowMessage('Œ¯Ë·Í‡ ‚‚Ó‰‡ ÒÛÏÏ˚ ‚˚ÔÎ‡Ú˚');
                              Esumma.SetFocus;
                              exit;
                             end;
 end;
 //PFIO.Visible:=false;
 RV1.Open;
 RV1.SetParam('vidpns',kod);
 RV1.SetParam('data',DateToStr(Date()));
 RV1.SetParam('delo',DBTDelo.Caption);
 RV1.SetParam('fam',DBTNampns.Caption);
 STR(StrToFloat(ESumma.Text):9:2,sum);
 RV1.SetParam('sum',sum);
 RV1.SetParam('cifra',cifra);
 RV1.SetParam('pnslst',ADOcart['pnslst']);
 RV1.SetParam('mem',MComment.Text);
 RV1.SetParam('bank',DBTbank.Caption);
 RV1.SetParam('adr1',DBTadr1.Caption);
 RV1.SetParam('adr2',DBTadr2.Caption);
 RV1.Execute;
 MComment.Width:=153;
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
 ADOCart.Parameters[0].Value:=0.5;
 ADOCart.Parameters[1].Value:=trim(EditFIO.Text)+'%';
 if ADOCart.Active then ADOCart.Close;
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
 PFIO1.Visible:=false;
 DBFIO.Visible:=true;
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 edinput.Text:=FloatToStr(ADOCart['delo']);
 ADObank.Open;
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

procedure TfmExampl.MCommentChange(Sender: TObject);
begin
 MComment.Width:=700;
end;

procedure TfmExampl.EViplChange(Sender: TObject);
begin
 MComment.Text:=EVipl.Text;
end;

end.




