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
    DBENampns: TDBEdit;
    BBPrint: TBitBtn;
    LbSP: TLabel;
    DBEDatbst: TDBEdit;
    LbPEN: TLabel;
    LbSUM: TLabel;
    Lbvidpns: TLabel;
    LbRUB: TLabel;
    BBEdit: TBitBtn;
    MMVD: TMemo;
    Memo2: TMemo;
    MNACH: TMemo;
    Lbdata: TLabel;
    Edinput: TMaskEdit;
    Lb48: TLabel;
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
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    Enom: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Mem1: TMemo;
    Label5: TLabel;
    Lbpolpns: TEdit;
    Label7: TLabel;
    Eendpay: TEdit;
    Epnsapp: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    DBEadres1: TDBEdit;
    DBEadres2: TDBEdit;
    Memo1: TMemo;
    Label13: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    DBEpnsapp: TDBEdit;
    Label12: TLabel;
    DBEdelo: TDBEdit;
    Label17: TLabel;
    ADOdepen: TADOQuery;
    Lbitgpns: TEdit;
    Lbitgpns1: TEdit;
    Lbdmo: TEdit;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    function Perev(cifra:real):string;
    procedure BBFIOClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure Showpen(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    procedure LbdmoChange(Sender: TObject);
    procedure LbitgpnsChange(Sender: TObject);
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
   if Pfio.Visible
   then Pfio.Visible:=false;
   ADOCart.Parameters[0].Value:=StrToFloat(edinput.Text);
   ADOcart.Parameters[1].Value:='SOS';
   if ADOCart.Active then ADOCart.Close;
   try
    ADOcart.Open;
   except ShowMessage('Îøèáêà ïğè îòêğûòèè áàçû CART');
   end;
   if ADOCart.RecordCount=0
   then
    begin
     MessageBeep(MB_OK);
     ShowMessage('Íîìåğ äåëà íå ñóùåñòâóåò');
     edinput.SetFocus;
     Exit;
    end;
   if ADOdepen.Active then ADOdepen.Close;
   try
    ADOdepen.Open;
   except ShowMessage('Îøèáêà ïğè îòêğûòèè áàçû DEPEN');
   end;
   Showpen(Sender);
end;

procedure TfmExampl.FormActivate(Sender: TObject);
begin
 edinput.SetFocus;
 Lbdata.Caption:=DateToStr(date());
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOcart.Close;
  ADOdepen.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 panel1.Visible:=false;
 PFIO.Visible:=false;
 Print;
 panel1.Visible:=True;
 PFIO.Visible:=True;
 edinput.SetFocus;
end;

function TfmExampl.Perev(cifra:real):string;
var
 shab1,shab2,shab3,shab4,shab5:string;
 slovo0,slovo,slovo1,tis0,tis1,tis2,ttttt:string;
 lendd,lendd1:integer;
 vvcifr,nbb:real;
 ddkop,promeg1,promeg2,isxch,RUBLI,s:string;
begin
 shab1:='ÎÄÈÍ  ÄÂÀ   ÒĞÈ   ×ÅÒÛĞÅÏßÒÜ  ØÅÑÒÜ ÑÅÌÜ  ÂÎÑÅÌÜÄÅÂßÒÜ';
 shab2:='ÄÅÑßÒÜ       ÎÄÈÍÍÀÄÖÀÒÜ  ÄÂÅÍÀÄÖÀÒÜ   ÒĞÈÍÀÄÖÀÒÜ   ×ÅÒÛĞÍÀÄÖÀÒÜ ÏßÒÍÀÄÖÀÒÜ   ØÅÑÒÍÀÄÖÀÒÜ  ÑÅÌÍÀÄÖÀÒÜ   ÂÎÑÅÌÍÀÄÖÀÒÜ ÄÅÂßÒÍÀÄÖÀÒÜ';
 shab3:='ÄÂÀÄÖÀÒÜ   ÒĞÈÄÖÀÒÜ   ÑÎĞÎÊ      ÏßÒÜÄÅÑßÒ  ØÅÑÒÜÄÅÑßÒ ÑÅÌÜÄÅÑßÒ  ÂÎÑÅÌÜÄÅÑßÒÄÅÂßÍÎÑÒÎ  ';
 shab4:='ÎÄÍÀ  ÄÂÅ   ÒĞÈ   ×ÅÒÛĞÅÏßÒÜ  ØÅÑÒÜ ÑÅÌÜ  ÂÎÑÅÌÜÄÅÂßÒÜ';
 shab5:='ÑÒÎ      ÄÂÅÑÒÈ   ÒĞÈÑÒÀ   ×ÅÒÛĞÅÑÒÀÏßÒÜÑÎÒ  ØÅÑÒÜÑÎÒ ÑÅÌÜÑÎÒ  ÂÎÑÅÌÜÑÎÒÄÅÂßÒÜÑÎÒ';
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
     RUBLI:='ĞÓÁËÜ'
    ELSE
     begin
      NBB:=StrToFloat(COPY(ISXCH,LENDD,1));
      if (NBB=0)OR(NBB>4) then RUBLI:='ĞÓÁËÅÉ'
                          else RUBLI:= 'ĞÓÁËß';
     end;
    IF LENDD>=2 then
     IF  COPY(ISXCH,LENDD-1,1) ='1' then
      begin
       SLOVO1:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD,1))*13+1,13);
       RUBLI:='ĞÓÁËÅÉ';
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
       TTTTT:='ÒÛÑß×À'
      ELSE
       begin
        NBB:=StrToFloat(COPY(ISXCH,LENDD-3,1));
        if (NBB=0)OR(NBB >4) then TTTTT:='ÒÛÑß×'
                             else TTTTT:='ÒÛÑß×È';
       end;
     end;
    IF LENDD>=5 then
     begin
      IF  COPY(ISXCH,LENDD-4,1) ='1' then
       begin
        TIS0:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD-3,1))*13+1,13);
        TTTTT:='ÒÛÑß×';
       end
      ELSE
       IF COPY(ISXCH,LENDD-4,1)<>'0' then
        TIS1:=COPY(SHAB3,(StrToInt(COPY(ISXCH,LENDD-4,1))-2)*11+1,11);
     end;
    IF LENDD>=6 then
     TIS2:=COPY(SHAB5,(StrToInt(COPY(ISXCH,LENDD-5,1))-1)*9+1,9);
    lendd1:=0;
   END;
  perev:=TRIMLEFT(TRIMRIGHT(TIS2)+' '+TRIMRIGHT(TIS1)+' '+TRIMRIGHT(TIS0)+' '+TTTTT+' '+TRIMRIGHT(SLOVO0)+' '+TRIMRIGHT(SLOVO)+' '+TRIMRIGHT(SLOVO1)+' '+RUBLI+' '+DDKOP+' '+'ÊÎÏ.');
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
 except ShowMessage('Îøèáêà ïğè îòêğûòèè áàçû CART');
 end;
 if ADOCart.RecordCount=0
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Íåò òàêîãî ïåíñèîíåğà â ÓÂÄ!');
   EditFio.SetFocus;
   Exit;
  end;
   DBFIO.Visible:=true;
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 if ADOdepen.Active then ADOdepen.Close;
 try
  ADOdepen.Open;
 except ShowMessage('Îøèáêà ïğè îòêğûòèè áàçû DEPEN');
 end;
 Showpen(Sender);
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

procedure TfmExampl.Showpen(Sender: TObject);
begin
 Enom.Text:='';
 case ADOcart['vidpns'] of
   1: Lbvidpns.Caption:='çà âûñëóãó ëåò';
   2: Lbvidpns.Caption:='ïî èíâàëèäíîñòè';
   4: Lbvidpns.Caption:='ïî ïîòåğå êîğìèëüöà';
  end;
  if (ADOcart['vidpns']=4) and (not ADOcart['polpns'])
  then Lbpolpns.Text:='íà ğåáåíêà '+ADOdepen['namdpn']+', '+DateToStr(ADOdepen['datbst'])+' ã.ğ.'
  else Lbpolpns.Text:='';
  Lbitgpns.Text:=FloatToStrF(ADOcart['itgpns'],ffFixed,9,2);
  Lbdmo.Text:=FloatToStrF(ADOcart['dmo']+1000,ffFixed,9,2);
  Lbitgpns1.Text:=FloatToStrF(ADOcart['itgpns']+StrToFloat(Trim(Lbdmo.Text))+ADOcart['dmo'],ffFixed,9,2);
  Epnsapp.Text:=DateToStr(ADOcart['begpay'])+' ãîäà';
  try Eendpay.Text:=DateToStr(ADOcart['endpay'])+' ãîäà';
  except Eendpay.Text:='ïîæèçíåííî';
  end;
  //Lbcifra.Caption:=Perev(StrToFloat(Lbitgpns.Caption));
end;

procedure TfmExampl.BitBtn1Click(Sender: TObject);
begin
 if mem1.Top=256
 then mem1.Top:=236
 else
 if mem1.Top=236 then mem1.Top:=256;
end;

procedure TfmExampl.BBEditClick(Sender: TObject);
begin
 Enom.SetFocus;
end;

procedure TfmExampl.LbdmoChange(Sender: TObject);
begin
 Lbitgpns1.Text:=FloatToStrF(StrToFloat(Trim(Lbitgpns.Text))+StrToFloat(Trim(Lbdmo.Text))+ADOcart['dmo'],ffFixed,9,2);
end;

procedure TfmExampl.LbitgpnsChange(Sender: TObject);
begin
 try
  Lbitgpns1.Text:=FloatToStrF(StrToFloat(Trim(Lbitgpns.Text))+StrToFloat(Trim(Lbdmo.Text))+ADOcart['dmo'],ffFixed,9,2);
 except
 end
end;

end.
