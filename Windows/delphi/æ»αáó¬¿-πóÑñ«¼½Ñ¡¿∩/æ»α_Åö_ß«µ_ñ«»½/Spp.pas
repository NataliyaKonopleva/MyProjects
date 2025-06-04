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
    Lbitgpns: TLabel;
    LbRUB: TLabel;
    EditRed: TEdit;
    BBEdit: TBitBtn;
    MMVD: TMemo;
    LbCPO: TLabel;
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
    Lbitgpns1: TLabel;
    Label9: TLabel;
    Lbdmo: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Mem1: TMemo;
    Memo3: TMemo;
    Label4: TLabel;
    DBEdelo: TDBEdit;
    Label5: TLabel;
    Lbpolpns: TEdit;
    Label7: TLabel;
    Eendpay: TEdit;
    Epnsapp: TEdit;
    BitBtn1: TBitBtn;
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
    procedure Showpen(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
 Showpen(Sender);
 Editred.Text:='';
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
 Print;
 panel1.Visible:=True;
 PFIO.Visible:=True;
 mem1.Top:=256;
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
   Editred.Text:='';

end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 Showpen(Sender);
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

procedure TfmExampl.Showpen(Sender: TObject);
begin
 case ADOcart['vidpns'] of
   1: Lbvidpns.Caption:='çà âûñëóãó ëåò';
   2: Lbvidpns.Caption:='ïî èíâàëèäíîñòè';
   4: Lbvidpns.Caption:='ïî ïîòåğå êîğìèëüöà';
  end;
  if (ADOcart['vidpns']<3) or ((ADOcart['polpns'])and (ADOcart['numdep']=0))
  then
   begin
    Lbpolpns.Text:='íà ñåáÿ,';
    mem1.Top:=236;
   end;
  if (ADOcart['vidpns']=4) and (not ADOcart['polpns'])
  then Lbpolpns.Text:='íà ğåáåíêà,';
  if (ADOcart['vidpns']=4) and (ADOcart['polpns']) and (ADOcart['numdep']>0)
  then Lbpolpns.Text:='íà ñåáÿ è íà ğåáåíêà';
  Lbitgpns.Caption:=FloatToStrF(ADOcart['itgpns']+240,ffFixed,9,2);
  Lbitgpns1.Caption:=FloatToStrF(ADOcart['itgpns']+240+ADOcart['dmo'],ffFixed,9,2);
  if ADOcart['dmo']=0
  then Lbdmo.Caption:='     -      '
  else Lbdmo.Caption:=FloatToStr(ADOcart['dmo']);
  try Epnsapp.Text:=DateToStr(ADOcart['pnsapp'])+' ãîäà';
  except Eendpay.Text:='';
  end;
  try Eendpay.Text:=DateToStr(ADOcart['endpay'])+' ãîäà';
  except Eendpay.Text:='ïîæèçíåííî';
  end;
  //if Trim(Eendpay.Text)='' then Eendpay.Text:='ïîæèçíåííî';
 // Lbcifra.Caption:=Perev(StrToFloat(Lbitgpns.Caption));
end;

procedure TfmExampl.BitBtn1Click(Sender: TObject);
begin
 if mem1.Top=256
 then mem1.Top:=236
 else
 if mem1.Top=236 then mem1.Top:=256;
end;

end.
