unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons,DateUtils,Lsp,Spp, ADODB;

type
  TFmPer = class(TForm)
    ToolBar1: TToolBar;
    TB1: TToolButton;
    TB2: TToolButton;
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
    DBN: TDBNavigator;
    Pdelo: TPanel;
    Lbel4: TLabel;
    MEdelo1: TMaskEdit;
    Bfound: TBitBtn;
    Pfio: TPanel;
    Label4: TLabel;
    Efio: TEdit;
    Bfio: TBitBtn;
    MEo: TEdit;
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
    Label8: TLabel;
    Label9: TLabel;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOCart: TADOQuery;
    ADObank: TADOQuery;
    DataSource2: TDataSource;
    ADOnal: TADOQuery;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Pot: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    BBOK: TBitBtn;
    BBcl: TBitBtn;
    MEot: TMaskEdit;
    MemOt: TMemo;
    Label12: TLabel;
    Label13: TLabel;
    ME1: TMaskEdit;
    ME2: TMaskEdit;
    Label14: TLabel;
    Eprim: TEdit;
    Label15: TLabel;
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
    procedure CBgodChange(Sender: TObject);
    procedure TB4Click(Sender: TObject);
    function Perev(cifra:real):string;
    procedure Button3Click(Sender: TObject);
    procedure DBGTpDblClick(Sender: TObject);
    procedure Showpen(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure BBOKClick(Sender: TObject);
    procedure BBclClick(Sender: TObject);
    procedure TB1Click(Sender: TObject);
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPer: TFmPer;
  zv:array [1..16] of string;
  zap,nn,zap1,mes:integer;
  vsego,vsego1:real;
implementation

{$R *.dfm}

procedure TFmPer.FormActivate(Sender: TObject);
begin
 zv[1]:='�������';
 zv[2]:='��������';
 zv[3]:='��.�������';
 zv[4]:='�������';
 zv[5]:='��.�������';
 zv[6]:='��������';
 zv[7]:='���������';
 zv[8]:='��.���������';
 zv[9]:='��.���������';
 zv[10]:='���������';
 zv[11]:='��.���������';
 zv[12]:='�������';
 zv[13]:='�����';
 zv[14]:='������������';
 zv[15]:='���������';
 zv[16]:='�������-�����';
 CBgod.Text:=IntToStr(YearOf(Date()));
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'zn'+Copy(MEgod.Text,3,2);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('������ ��� �������� ���� �������!');
   Exit;
  end;
 end;
 ADOnal.Last;
end;

procedure TFmPer.TB2Click(Sender: TObject);
begin
 CBgod.Visible:=false;
 Label8.Visible:=false;
 CBgod.Text:=IntToStr(YearOf(DATE()));
 CBgodChange(Sender);
 p1.Visible:=true;
 Edelo.SetFocus;
end;

procedure TFmPer.EdeloDblClick(Sender: TObject);
begin
  ADOCart.Parameters[0].Value:=StrToFloat(Edelo.Text);
  ADOcart.Parameters[1].Value:='SOS';
  if ADOCart.Active then ADOCart.Close;
  try
   ADOcart.Open;
  except
   begin
    ShowMessage('������ ��� �������� ���� CART');
    Exit;
   end;
  end;
  if ADOCart.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('����� ���� �� ����������');
    Edelo.SetFocus;
    Exit;
   end;
  Showpen(Sender);
end;

procedure TfmPer.Showpen(Sender: TObject);
 var da:boolean;
     i,m:integer;
 begin
  Lbcodrnk.caption:='';
  da:=false;
  if Pos('*',ADOcart['nampst'])=0
  then
   begin
    if ADOcart['mstslb']=1 then
     if (StrToInt(copy(ADOcart['wslkal'],1,2))<20) or (Pos(Copy(ADOcart['artdis'],3,1),'�����')=0)
      then begin
            m:=Application.MessageBox('����������� ������ ���������� �� ��������!','��������! ��������������!',mb_iconExclamation);
           end else da:=true;
    if ADOcart['mstslb']=2 then
     if (StrToInt(copy(ADOcart['wslnad'],1,2))<20) or (Pos(Copy(ADOcart['artdis'],3,1),'����')=0)
      then begin
            m:=Application.MessageBox('����������� ������ ���������� �� ��������!','��������! ��������������!',mb_iconExclamation);           end else da:=true;
    if ADOcart['mstslb']=3 then
                       begin
                        m:=Application.MessageBox('����������� �� ��������! ��������� �������.','��������! ��������������!',mb_iconExclamation);
                       end;
   end else
        begin
         m:=Application.MessageBox('����������� �� ��������! ������ �� ���.','��������! ��������������!',mb_iconExclamation);
        end;
   if da
   then
    begin
     i:=ADOcart['codrnk'];
     Lbcodrnk.Caption:=zv[i];
     if ADOnal.Locate('delo',ADOcart['delo'],[])
     then ShowMessage('���������� ��� ���-�� �������������.���������!');
     MEo.SetFocus;
    end ;
end;

procedure TFmPer.Button2Click(Sender: TObject);
var bank:string;
    codb:integer;
begin
 ADOnal.AppendRecord([ADOcart['delo'],ADOcart['nampns'],null,StrToFloat(Trim(MEo.Text)),StrToFloat(Trim(Eprich.text)),date(),date(),ADOcart['codbnk'],ADOcart['pnslst'],StrToFloat(Trim(Meo.Text))+StrToFloat(Trim(Eprich.Text)),ADOcart['mstslb'],Eprim.Text]);
 Meo.Text:=',';
end;

procedure TFmPer.N3Click(Sender: TObject);
begin
 DB.SetFocus;
end;

procedure TFmPer.Button1Click(Sender: TObject);
begin
 Lbcodrnk.Visible:=true;
 DBTnampns.Visible:=true;
 EdeloDblClick(Sender);
end;

procedure TFmPer.N1Click(Sender: TObject);
begin
 Cbgod.Visible:=true;
 Label8.Visible:=true;
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
   ShowMessage('���������� ����������� �� �������������!');
  end;
  Pdelo.Visible:=false;
end;

procedure TFmPer.N2Click(Sender: TObject);
begin
 Cbgod.Visible:=true;
 Label8.Visible:=true;
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
   ShowMessage('���������� ����������� �� �������������!');
  end;
 Pfio.Visible:=false;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOcart.Close;
 ADObank.Close;
 ADOnal.Close;
end;

{procedure TFmPer.TB3Click(Sender: TObject);
begin
 Application.CreateForm(TFmExampl,FmExampl);
 FmExampl.Show;
 FmExampl.SetFocus;
end;}

procedure TFmPer.CBgodChange(Sender: TObject);
begin
 MEgod.Text:=CBgod.Text;
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT *';
 ADOnal.SQL.Strings[1]:='FROM '+'zn'+Copy(MEgod.Text,3,2);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('������ ��� �������� ���� �������!');
   Exit;
  end;
 end;
end;

procedure TFmPer.TB4Click(Sender: TObject);
var sum,kod:string;
begin
 if ADOnal['mstslb']=2
 then kod:='1003 5142202 313 263'
 else kod:='1003 5142401 313 263';
 ADObank.Open;
 RV.Open;
 RV.SetParam('bank',ADObank['nambnk']);
 RV.SetParam('adr1',ADObank['adres1']);
 RV.SetParam('adr2',ADObank['adres2']);
 RV.SetParam('delo',ADOnal['delo']);
 RV.SetParam('fam',ADOnal['fam']);
 STR(ADOnal['s']:9:2,sum);
 RV.SetParam('sum',sum);
 RV.SetParam('pnslst',ADOnal['pnslst']);
 RV.SetParam('data',ADOnal['datapom']);
 RV.SetParam('god',MEgod.Text);
 RV.SetParam('cifra',Perev(ADOnal['s']));
 RV.SetParam('kod',kod);
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
 shab1:='����  ���   ���   ����������  ����� ����  ������������';
 shab2:='������       �����������  ����������   ����������   ������������ ����������   �����������  ����������   ������������ ������������';
 shab3:='��������   ��������   �����      ���������  ���������� ���������  ��������������������  ';
 shab4:='����  ���   ���   ����������  ����� ����  ������������';
 shab5:='���      ������   ������   ����������������  �������� �������  ������������������';
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
     RUBLI:='�����'
    ELSE
     begin
      NBB:=StrToFloat(COPY(ISXCH,LENDD,1));
      if (NBB=0)OR(NBB>4) then RUBLI:='������'
                          else RUBLI:= '�����';
     end;
    IF LENDD>=2 then
     IF  COPY(ISXCH,LENDD-1,1) ='1' then
      begin
       SLOVO1:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD,1))*13+1,13);
       RUBLI:='������';
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
       TTTTT:='������'
      ELSE
       begin
        NBB:=StrToFloat(COPY(ISXCH,LENDD-3,1));
        if (NBB=0)OR(NBB >4) then TTTTT:='�����'
                             else TTTTT:='������';
       end;
     end;
    IF LENDD>=5 then
     begin
      IF  COPY(ISXCH,LENDD-4,1) ='1' then
       begin
        TIS0:=COPY(SHAB2,StrToInt(COPY(ISXCH,LENDD-3,1))*13+1,13);
        TTTTT:='�����';
       end
      ELSE
       IF COPY(ISXCH,LENDD-4,1)<>'0' then
        TIS1:=COPY(SHAB3,(StrToInt(COPY(ISXCH,LENDD-4,1))-2)*11+1,11);
     end;
    IF LENDD>=6 then
     TIS2:=COPY(SHAB5,(StrToInt(COPY(ISXCH,LENDD-5,1))-1)*9+1,9);
    lendd1:=0;
   END;
  perev:=TRIMLEFT(TRIMRIGHT(TIS2)+' '+TRIMRIGHT(TIS1)+' '+TRIMRIGHT(TIS0)+' '+TTTTT+' '+TRIMRIGHT(SLOVO0)+' '+TRIMRIGHT(SLOVO)+' '+TRIMRIGHT(SLOVO1)+' '+RUBLI+' '+DDKOP+' '+'���.');
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
    ShowMessage('������ ��� �������� ���� CART');
   end;
  end;
  if ADOCart.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('��� ������ ���������� � ���');
    MEFIO.SetFocus;
    Exit;
   end;
 DBGTp.Visible:=true;
end;

procedure TFmPer.DBGTpDblClick(Sender: TObject);
var i:integer;
begin
 Lbcodrnk.Visible:=true;
 DBTnampns.Visible:=true;
 DBGTp.Visible:=false;
 Edelo.Text:=IntToStr(ADOcart['delo']);
 Showpen(Sender);
end;
procedure TFmPer.ToolButton4Click(Sender: TObject);
begin
 POt.Visible:=true;
 MEot.SetFocus;
end;

procedure TFmPer.BBOKClick(Sender: TObject);
var i,kol:integer;
    s:string;
    sum:real;
begin
 DB.Visible:=false;
 MemOt.Lines.Clear;
 MemOt.Visible:=true;
 MemOt.Lines.Append('��������� � '+MEot.text+' ����');
 if ADOnal.Active then ADOnal.Close;
 ADOnal.SQL.Strings[0]:='SELECT datapom,s,codbnk';
 ADOnal.SQL.Strings[1]:='FROM '+'zn'+Copy(Meot.Text,3,2);
 try
  ADOnal.Open;
 except
  begin
   ShowMessage('������ ��� �������� ���� �������!');
   Exit;
  end;
 end;
 //  Memot.Lines.Append('');
 //  MemOt.Lines.Append('������ �� 20'+s+' ���');
 for mes:=StrToInt(Trim(ME1.Text)) to StrToInt(Trim(ME2.Text)) do
  begin
   sum:=0;
   kol:=0;
   ADOnal.First;
   while not ADOnal.Eof do
    begin
     if (YearOf(ADOnal['datapom'])=StrToInt(MEot.Text)) AND (MonthOf(ADOnal['datapom'])=mes)
     then
      begin
       sum:=sum+ADOnal['s'];
       kol:=kol+1;
      end;
     ADOnal.Next;
    end;
    if sum>0 then MemOt.Lines.Append(IntToStr(mes)+'. - '+FloatToStr(sum)+' ('+IntToStr(kol)+' ���.)');
  end;
 ADOnal.Close;
end;

procedure TFmPer.BBclClick(Sender: TObject);
begin
 POt.Visible:=false;
 MemOt.Visible:=false;
 DB.Visible:=true;
 RV.Open;
 RV.SetParam('ot',MemOt.Lines.Text);
 RV.ExecuteReport('R2');
 RV.Close;
end;

procedure TFmPer.TB1Click(Sender: TObject);
begin
 Cbgod.Visible:=true;
 Label8.Visible:=true;
end;

end.
