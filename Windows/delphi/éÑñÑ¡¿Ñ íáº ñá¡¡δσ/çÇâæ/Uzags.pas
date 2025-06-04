unit Uzags;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, DB, DBTables, Grids, DBGrids, StdCtrls,
  RpBase, RpSystem, RpDefine, RpRave, Menus, DateUtils, ADODB, ExtCtrls,
  Buttons, Mask, DBCtrls;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    OD: TOpenDialog;
    DataSource1: TDataSource;
    Tcart: TTable;
    Mem: TMemo;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Mem1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Rv: TRvProject;
    RvSystem1: TRvSystem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Tdepen: TTable;
    Mem2: TMemo;
    Label3: TLabel;
    ToolButton8: TToolButton;
    N3: TMenuItem;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    N4: TMenuItem;
    Tizm: TTable;
    DBGizm: TDBGrid;
    Tdeti: TTable;
    Tfsd: TTable;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    QCart: TQuery;
    Qdepen: TQuery;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    N7: TMenuItem;
    OD1: TOpenDialog;
    N8: TMenuItem;
    Ppas: TPanel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Edelo: TEdit;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    DataSource2: TDataSource;
    DBText1: TDBText;
    Eser: TEdit;
    CBkod: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Enom: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Eorg: TEdit;
    Edata: TMaskEdit;
    Label11: TLabel;
    BitBtn3: TBitBtn;
    Tzapros: TTable;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ConvertStr(var str:string);
    procedure ConvertStrP(var str:string);
    procedure StrConvert(str:string);
    procedure Stroki(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Massiv(Sender: TObject);
    procedure TdepenFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    function StrCount(str:string;Lenstr:integer):string;
    function RealCount(re:Real):string;
    function RealCount0(count:integer):string;
    procedure N6Click(Sender: TObject);
    procedure ObrSC(Sender: TObject);
    procedure DETI1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Zagruz(Sender: TObject);
    procedure PoiskP(Sender:TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var  Form1: TForm1;
     f,fo,fp:Textfile;
     SB,SO,SC,SP:string;
     i,j,k,mi,mmax,num:integer;
     fam,namr,ot,dr:string;
     mSC:array [1..12] of string;
implementation

{$R *.dfm}
procedure TForm1.Massiv(Sender: TObject);
var n:integer;
begin
 Tdeti.Open;
 Tcart.Open;
 Tdepen.Open;
 Tcart.Filter:='vidpns=4 and codlea=0';
 // and itgpns<4360';
 Tcart.Filtered:=true;
 Tcart.First;
 n:=1;
 while not Tcart.Eof do
  begin
   if Tcart['polpns']
   then
    begin
     Tdeti.AppendRecord([Tcart['delo'],Tcart['nampns'],Tcart['datbst'],Tcart['begpay'],Tcart['itgpns'],Tcart['endpay'],Tcart['pnsapp'],Tcart['codpol']]);
     Inc(n);
    end;
   if Tcart['numdep']>0
   then
    begin
     Tdepen.Filtered:=true;
     Tdepen.First;
     while not Tdepen.Eof do
      begin
       Tdeti.AppendRecord([Tdepen['delo'],Tdepen['namdpn'],Tdepen['datbst'],Tcart['begpay'],Tcart['itgpns'],Tcart['endpay'],Tcart['pnsapp'],Tdepen['codpol']]);
       Inc(n);
       Tdepen.Next;
      end;
    end;
   Tcart.Next;
   Tdepen.Filtered:=false;
  end;
  Tcart.Close;
  Tdepen.Close;
  Tdeti.Close;
end;

procedure TForm1.Stroki(Sender: TObject);
var datar,dat1,dat2:TDateTime;
    sum:real;
    srok,nam:string;
    l:integer;
begin
 //действия со строками
 Tfsd.Open;
 Tdeti.Open;
 Tizm.Open;
 Tcart.Open;
 Tcart.Filter:='codlea=0 and vidpns<3';
 // and itgpns<4360';
 Tcart.Filtered:=true;
 dat1:=StrToDate(Copy(SO,1187,2)+'.'+Copy(SO,1184,2)+'.'+Copy(SO,1179,4));
 dat2:=StrToDate(Copy(SO,1197,2)+'.'+Copy(SO,1194,2)+'.'+Copy(SO,1189,4));
 if dat2-dat1>31
 then srok:=' ВНИМАНИЕ ПО СРОКУ'
 else srok:=' за '+IntToStr(MonthOf(dat1))+' месяц';
 sum:=StrToFloat(Copy(SC,173,12)+','+Copy(SC,186,2));
 nam:=Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40));
 datar:=StrToDate(Copy(SO,156,2)+'.'+Copy(SO,153,2)+'.'+Copy(SO,148,4));
 //проверка за в/л и по инв. по CART
 if Tcart.Locate('nampns;datbst',VarArrayOf([nam,datar]),[loCaseinsensitive,loPartialKey])
 then
  begin
   if abs(sum-Tcart['itgpns'])>0.001
   then
    begin
     Mem2.Lines.Append(IntToStr(k)+'.48/'+IntToStr(Tcart['delo'])+' '+Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40))+srok+' пенсия -'+FloatToStrF(sum,ffFixed,7,2)+' пенсия по базе УВД с '+DateToStr(Tcart['begpay'])+'-'+FloatToStrF(Tcart['itgpns'],ffFixed,9,2)+'('+Copy(SO,2,14)+'-'+Trim(Copy(SC,50,100))+')');
     INC(k);
     Tizm.AppendRecord([Tcart['delo'],Copy(SO,2,14),Trim(Copy(SO,27,40))+' '+Copy(Trim(Copy(SO,67,40)),1,1)+'.'+Copy(Trim(Copy(SO,107,40)),1,1)+'.',sum,(Tcart['itgpns']),Tcart['begpay'],Trim(Copy(SC,50,100))]);
     Tfsd.AppendRecord([Tcart['delo'],Tcart['nampns'],Tcart['datbst'],Tcart['begpay'],Tcart['itgpns'],Copy(SC,150,15)]);
    end
   else
    begin
     Mem.Lines.Append(IntToStr(i)+'.48/'+IntToStr(Tcart['delo'])+' '+Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40))+srok+' пенсия -'+FloatToStrF(sum,ffFixed,7,2)+' пенсия по базе УВД-'+FloatToStrF(Tcart['itgpns'],ffFixed,9,2));
     INC(i);
     Tfsd.AppendRecord([Tcart['delo'],Tcart['nampns'],Tcart['datbst'],Tcart['begpay'],Tcart['itgpns'],Copy(SC,150,15)]);
    end;
  end
 else
 //проверка по потере кормильца по DETI
  begin
   if Tdeti.Locate('nampns;datbst',VarArrayOf([nam,datar]),[loCaseinsensitive,loPartialKey])
   then
    begin
     if abs(sum-Tdeti['itgpns'])>0.001
       then
        begin
         Mem2.Lines.Append(IntToStr(k)+'.48/'+IntToStr(Tdeti['delo'])+' '+Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40))+srok+' пенсия -'+FloatToStrF(sum,ffFixed,7,2)+' пенсия по базе УВД с '+DateToStr(Tdeti['begpay'])+'-'+FloatToStrF(Tdeti['itgpns'],ffFixed,9,2)+'('+Copy(SO,2,14)+'-'+Trim(Copy(SC,50,100))+')'+'ДЕТИ');
         INC(k);
         Tizm.AppendRecord([Tdeti['delo'],Copy(SO,2,14),Trim(Copy(SO,27,40))+' '+Copy(Trim(Copy(SO,67,40)),1,1)+'.'+Copy(Trim(Copy(SO,107,40)),1,1)+'.',sum,(Tdeti['itgpns']),Tdeti['begpay'],Trim(Copy(SC,50,100))]);
         Tfsd.AppendRecord([Tdeti['delo'],Tdeti['nampns'],Tdeti['datbst'],Tdeti['begpay'],Tdeti['itgpns'],Copy(SC,150,15)]);
        end
       else
        begin
         Mem.Lines.Append(IntToStr(i)+'.48/'+IntToStr(Tdeti['delo'])+' '+Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40))+srok+' пенсия -'+FloatToStrF(sum,ffFixed,7,2)+' пенсия по базе УВД c'+DateToStr(Tdeti['begpay'])+'-'+FloatToStrF(Tdeti['itgpns'],ffFixed,9,2)+'ДЕТИ');
         INC(i);
         Tfsd.AppendRecord([Tdeti['delo'],Tdeti['nampns'],Tdeti['datbst'],Tdeti['begpay'],Tdeti['itgpns'],Copy(SC,150,15)]);
        end;
    end
   else
    begin
      Mem1.Lines.Append(IntToStr(j)+'.'+nam+' '+DateToStr(datar)+' г.р.'+'('+Copy(SO,2,14)+'-'+Trim(Copy(SC,50,100))+')');
      INC(j);
      Tizm.AppendRecord([IntToStr(0),Copy(SO,2,14),Trim(Copy(SO,27,40))+' '+Copy(Trim(Copy(SO,67,40)),1,1)+'.'+Copy(Trim(Copy(SO,107,40)),1,1)+'.',sum,null,null,Trim(Copy(SC,50,100))]);
    end;
  end;
  Tcart.Close;
  Tizm.Close;
  Tdeti.Close;
end;

procedure TForm1.ConvertStr(var str:string);
var s1,s2:array[0..1237] of char;
begin
 //пробую перекодировку файла
 Readln(f,s1);
 OemToChar(s1,s2);
 str:=''+s2;
end;

procedure TForm1.ConvertStrP(var str:string);
var s1,s2:array[0..1237] of char;
begin
 //пробую перекодировку файла
 Readln(fp,s1);
 OemToChar(s1,s2);
 str:=''+s2;
end;

procedure TForm1.StrConvert(str:string);
var s2:array[0..1237] of char;
    s1:PChar;
begin
 //пробую перекодировку файла
 s1:=PChar(str);
 CharToOem(s1,s2);
 str:=''+s2;
 Writeln(fo,s2);
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
 OD.Execute;
 ShowMessage('Открыт файл для обработки- '+OD.FileName);
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
var SB,S:string;
begin
 mem.Cursor:=crHourGlass;
 mem1.Cursor:=crHourGlass;
 mem2.Cursor:=crHourGlass;
 Tizm.Open;
 Tizm.First;
 while not Tizm.Eof do
   Tizm.Delete;
 Tizm.Close;
 Tdeti.Open;
 Tdeti.First;
 {while not Tdeti.Eof do
   Tdeti.Delete;
 Tdeti.Close; }
 Tfsd.EmptyTable;
 Tfsd.Open;
 //Massiv(Sender);
 mem.Lines.Clear;
 mem1.Lines.Clear;
 mem2.Lines.Clear;
 AssignFile(f,OD.FileName);
 Reset(f);
 ConvertStr(SB);
 ConvertStr(SO);
 i:=1;
 j:=1;
 k:=1;
 while not eof(f) do
  begin
   ConvertStr(S);
   repeat
    begin
     if Copy(s,1,1)='С' then SC:=s;
     if Copy(s,1,1)='П' then SP:=s;
     ConvertStr(S);
    end;
   until (Copy(s,1,1)='О') or (Eof(f));
   Stroki(Sender);
   SO:=S;
  end;
  Closefile(f);
  mem.Cursor:=crDefault;
  mem1.Cursor:=crDefault;
  mem2.Cursor:=crDefault;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 RV.SetParam('mem',Mem.Text);
 RV.ExecuteReport('Rep1');
 RV.Close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 RV.SetParam('mem1',Mem1.Text);
 RV.ExecuteReport('Rep2');
 RV.Close;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 RV.SetParam('mem2',Mem2.Text);
 RV.ExecuteReport('Rep3');
 RV.Close;
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
 //Pvvod.Visible:=true;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 //mem.Visible:=false;
 //mem1.Visible:=false;
 //mem2.Visible:=false;
 Tizm.Open;
 DBGizm.Visible:=true;
end;

procedure TForm1.TdepenFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 Accept:=(Tdepen['delo']=Tcart['delo'])and(Tdepen['codpol']=Tcart['codpol']);
end;

function TForm1.StrCount(str:string;Lenstr:integer):string;
// Делает строку str заданной длины Lenstr
var i1:integer;
    sf:string;
begin
 sf:=str;
 for i1:=1 to (Lenstr-Length(str)) do
  sf:=sf+' ';
 StrCount:=sf;
end;

function TForm1.RealCount(re:real):string;
// Делает строку из re длины 15 добавляя вперед нули
var i1,k:integer;
    sf:string;
begin
 if re>=10000.00
 then sf:=Copy(FloatToStrF(re,ffFixed,8,2),1,5)+'.'+Copy(FloatToStrF(re,ffFixed,8,2),7,2);
 if re<10000.00
 then sf:=Copy(FloatToStrF(re,ffFixed,7,2),1,4)+'.'+Copy(FloatToStrF(re,ffFixed,7,2),6,2);
 k:=15-Length(sf);
 for i1:=1 to k do
  sf:='0'+sf;
 RealCount:=sf;
end;

function TForm1.RealCount0(count:integer):string;
// Делает строку из count нулей
var i:integer;
    s:string;
begin
 s:='0';
 for i:=1 to (count-1) do
  s:=s+'0';
 RealCount0:=s;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 Tzapros.EmptyTable;
 Tzapros.Open;
 i:=1;
 j:=1;
 AssignFile(f,OD.FileName);
 AssignFile(fo,'otvet');
 //AssignFile(fp,OD1.FileName);
 //Reset(fp);
 Reset(f);
 Readln(f);
 ReWrite(fo);
 SB:='В'+StrCount('6.2',10)+'086-003-000424'+StrCount('УВД ПО ЯРОСЛАВСКОЙ ОБЛАСТИ',100)
 +StrCount('ОТВЕТ',6)+'086-000-00000001';
 StrConvert(SB);
 num:=0;
 while not eof(f) do
  begin
   SP:='';
   ConvertStr(SO);
   ObrSC(Sender);
   StrConvert(SO);
   {if SC>''
   then StrConvert(SC);}
   if mSC[1]>'' then
    for mi:=1 to mmax do
     begin
      StrConvert(mSC[mi]);
     end;
   if SP>''
   then StrConvert(SP);
  end;
 Mem.Lines.Append('Всего нестандартных дат - '+IntToStr(num));
 CloseFile(f);
 CloseFile(fo);
 Tzapros.Close;
end;

procedure TForm1.ObrSC(Sender: TObject);
var vp,endpay,pnsapp,begpay,nam,srok,numC,mes:string;
    datar,dat1,dat2,data:TDateTime;
    da:boolean;
 begin
  da:=true;
  Tcart.Open;
//  Tcart.Filter:='codlea=0 and vidpns<3 and vidpns<>5';
  Tcart.Filter:='codlea=0 and vidpns<>3 and vidpns<>5 and (polpns or codpol=0)';
  Tcart.Filtered:=true;
  Tdeti.Open;
  //Tizm.Open;
  nam:=Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40));
  datar:=StrToDate(Copy(SO,156,2)+'.'+Copy(SO,153,2)+'.'+Copy(SO,148,4));
  Tzapros.AppendRecord([nam,datar]);
  //разбираюсь со сроками
  dat1:=StrToDate(Copy(SO,1187,2)+'.'+Copy(SO,1184,2)+'.'+Copy(SO,1179,4));
  dat2:=StrToDate(Copy(SO,1197,2)+'.'+Copy(SO,1194,2)+'.'+Copy(SO,1189,4));
  mmax:=MonthOf(dat2)-MonthOf(dat1)+1;
  if mmax>1
  then
  begin
   srok:='!!!ДАННЫЕ ЗА '+DateToStr(dat1)+'-'+DateToStr(dat2);
   Inc(num);
  end
  else srok:=' за '+IntToStr(MonthOf(dat1))+' месяц';
  if mmax<10 then numC:=RealCount0(2)+IntToStr(mmax)
             else numC:=RealCount0(1)+IntToStr(mmax);
  data:=dat1;
  //проверка за в/л  по инв. и п/к по CART-кто получает на себя
  if Tcart.Locate('nampns;datbst',VarArrayOf([nam,datar]),[loCaseinsensitive,loPartialKey])
   then
    begin
     da:=false;
     Mem.Lines.Append(IntToStr(i)+'.'+srok+' 48/'+IntToStr(Tcart['delo'])+' '+Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40)));//+srok+' пенсия -'+FloatToStrF(sum,ffFixed,7,2)+' пенсия по базе УВД-'+FloatToStrF(Tcart['itgpns']+240,ffFixed,9,2));
     INC(i);
     if Tcart['vidpns']=1
     then vp:='05';
     if Tcart['vidpns']=2
     then vp:='07';
     if Tcart['vidpns']=4
     then vp:='08';
     //проверка не произошло ли изменений в пенсии за запрашиваемый период
     if (dat1<=Tcart['begpay']) and (Tcart['begpay']<=dat2)
     then
      begpay:=Copy(DateToStr(Tcart['begpay']),7,4)+'/'+Copy(DateToStr(Tcart['begpay']),4,2)+'/'+Copy(DateToStr(Tcart['begpay']),1,2)
     else
      begpay:=StrCount(' ',10);
     try
      endpay:=Copy(DateToStr(Tcart['endpay']),7,4)+'/'+Copy(DateToStr(Tcart['endpay']),4,2)+'/'+Copy(DateToStr(Tcart['endpay']),1,2);
     except
      endpay:='9999/99/99';
     end;
     try
      pnsapp:=Copy(DateToStr(Tcart['pnsapp']),7,4)+'/'+Copy(DateToStr(Tcart['pnsapp']),4,2)+'/'+Copy(DateToStr(Tcart['pnsapp']),1,2);
     except
      pnsapp:='9999/99/99';
     end;
     SO:=Copy(SO,1,1177)+'Н'+Copy(SO,1179,20)+numC+Copy(SO,1202,35);
     for mi:=1 to mmax do
      begin
       if MonthOf(data)<10 then mes:='0'+IntToStr(MonthOf(data))
                            else mes:=IntToStr(MonthOf(data));
       mSC[mi]:='С'+RealCount0(12)+'.'+RealCount0(2)+StrCount(' ',33)+StrCount('ОТДЕЛЕНИЕ ПФР '+Trim(Copy(SO,536,50))+' РАЙОН',100)+RealCount0(12)+'.'+RealCount0(8)+vp
       +RealCount(Tcart['itgpns'])+RealCount0(3)+'3'+RealCount0(12)+'.'+RealCount0(14)+'.'+RealCount0(14)
       +'.'+RealCount0(2)+pnsapp+StrCount(' ',30)+endpay+StrCount(' ',30)+begpay
       +StrCount(' ',42)+StrCount('ПО МЕСТУ ЖИТЕЛЬСТВА',36)+RealCount0(8)
       +StrCount(' ',125)+StrCount('МВД РОССИИ',100)+IntToStr(YearOf(data))+'/'+mes+'/01';
       data:=data+31;
       //+Copy(SO,1179,10);
      end;
    end;
  //проверка по потере кормильца по DETI
  if da and Tdeti.Locate('nampns;datbst',VarArrayOf([nam,datar]),[loCaseinsensitive,loPartialKey])
   then
    begin
     da:=false;
     QCart.ParamByName('PD').Value:=Tdeti['delo'];
     QCart.ParamByName('CP').Value:=Tdeti['codpol'];
     QCart.Open;
     Mem.Lines.Append(IntToStr(i)+'.'+srok+' 48/'+IntToStr(Tdeti['delo'])+' '+Trim(Copy(SO,27,40))+' '+Trim(Copy(SO,67,40))+' '+Trim(Copy(SO,107,40)));//+srok+' пенсия -'+FloatToStrF(sum,ffFixed,7,2)+' пенсия по базе УВД c'+DateToStr(Tdeti['begpay'])+'-'+FloatToStrF(Tdeti['itgpns']+240,ffFixed,9,2)+'ДЕТИ');
     INC(i);
     if (dat1<=Qcart['begpay']) and (Qcart['begpay']<=dat2)
      then
       begpay:=Copy(DateToStr(Qcart['begpay']),7,4)+'/'+Copy(DateToStr(Qcart['begpay']),4,2)+'/'+Copy(DateToStr(Qcart['begpay']),1,2)
      else
       begpay:=StrCount(' ',10);
      try
       endpay:=Copy(DateToStr(Qcart['endpay']),7,4)+'/'+Copy(DateToStr(Qcart['endpay']),4,2)+'/'+Copy(DateToStr(Qcart['endpay']),1,2);
      except
       endpay:='9999/99/99';
      end;
      try
       pnsapp:=Copy(DateToStr(Qcart['pnsapp']),7,4)+'/'+Copy(DateToStr(Qcart['pnsapp']),4,2)+'/'+Copy(DateToStr(Qcart['pnsapp']),1,2);
      except
       pnsapp:='9999/99/99';
      end;
      vp:='08';
      //SO:=Copy(SO,1,1177)+'Д'+Copy(SO,1179,20)+numC+Copy(SO,1202,35);
      for mi:=1 to mmax do
       begin
        if MonthOf(data)<10 then mes:='0'+IntToStr(MonthOf(data))
                           else mes:=IntToStr(MonthOf(data));
        mSC[mi]:='С'+RealCount0(12)+'.'+RealCount0(2)+StrCount(' ',33)+StrCount('ОТДЕЛЕНИЕ ПФР '+Trim(Copy(SO,536,50))+' РАЙОН',100)+RealCount0(12)+'.'+RealCount0(8)+vp
        +RealCount(Qcart['itgpns'])+RealCount0(3)+'3'+RealCount0(12)+'.'+RealCount0(14)+'.'+RealCount0(14)
        +'.'+RealCount0(2)+pnsapp+StrCount(' ',30)+endpay+StrCount(' ',30)+begpay
        +StrCount(' ',42)+StrCount('ПО МЕСТУ ЖИТЕЛЬСТВА',36)+RealCount0(8)
        +StrCount(' ',125)+StrCount('МВД РОССИИ',100)+IntToStr(YearOf(data))+'/'+mes+'/01';
        data:=data+31;
        //+Copy(SO,1179,10);
       end;
       //родитель
       //PoiskP(Sender);
       fam:=AnsiUpperCase(Copy(Qcart['nampns'],1,Pos(' ',Qcart['nampns'])-1));
       namr:=Copy(Qcart['nampns'],Pos(' ',Qcart['nampns'])+1,Length(Qcart['nampns'])-Length(fam));
       ot:=AnsiUpperCase(Copy(namr,Pos(' ',namr)+1,Length(namr)-Pos(' ',namr)));
       namr:=AnsiUpperCase(Copy(namr,1,Pos(' ',namr)-1));
       dr:=Copy(DateToStr(Qcart['datbst']),7,4)+'/'+Copy(DateToStr(Qcart['datbst']),4,2)+'/'+Copy(DateToStr(Qcart['datbst']),1,2);
       if Date()-Tdeti['datbst']<StrToDate('01.01.2018')-StrToDate('01.01.2000')
       then
        begin
         if (Qcart['kodpas']<>null)
         then SP:='П'+StrCount(fam,40)+StrCount(namr,40)+StrCount(ot,40)+dr+Copy(SO,705,225)+StrCount(Qcart['kodpas'],121)+StrCount('РОДИТЕЛЬ',10)
         else
          begin
           Mem2.Lines.Append('Не хватает данных: 48/'+IntToStr(Qcart['delo'])+' '+Qcart['nampns']);
           SP:='П'+StrCount(fam,40)+StrCount(namr,40)+StrCount(ot,40)+dr+Copy(SO,705,225)+StrCount(' ',121)+StrCount('РОДИТЕЛЬ',10)
          end;
         end
        else SP:='';
       if SP<>'' then SO:=Copy(SO,1,1177)+'Д'+Copy(SO,1179,20)+numC+Copy(SO,1202,35)
                 else SO:=Copy(SO,1,1177)+'Н'+Copy(SO,1179,20)+numC+Copy(SO,1202,35);
      Qcart.Close;
    end;
    if da
    then
     begin
      SO:=Copy(SO,1,1235)+'Н';
      mSC[1]:='';
      Mem1.Lines.Append(IntToStr(j)+'.'+nam+' '+DateToStr(datar)+' г.р.'+'('+Copy(SO,2,14)+'-'+Trim(Copy(SC,50,100))+')');
      INC(j);
      //Tizm.AppendRecord([Copy(SO,2,14),Trim(Copy(SO,27,40))+' '+Copy(Trim(Copy(SO,67,40)),1,1)+'.'+Copy(Trim(Copy(SO,107,40)),1,1)+'.',null,null,null,Trim(Copy(SC,50,100))]);
     end;
  Tcart.Close;
end;

procedure TForm1.DETI1Click(Sender: TObject);
begin
 Tcart.Open;
 Tcart.Filter:='vidpns=4 and codlea=0';
 Tcart.Filtered:=true;
 Tcart.First;
 Tdeti.EmptyTable;
 Tdeti.Open;
 //Tdeti.Exclusive:=true;
 while not Tcart.Eof do
  begin
   if Tcart['polpns']
   then Tdeti.AppendRecord([Tcart['delo'],Tcart['nampns'],Tcart['datbst'],Tcart['begpay'],Tcart['itgpns'],Tcart['endpay'],Tcart['pnsapp'],Tcart['codpol']]);
   if Tcart['numdep']>0
   then
    begin
     Qdepen.ParamByName('PD').Value:=Tcart['delo'];
     Qdepen.ParamByName('CP').Value:=Tcart['codpol'];
     Qdepen.Open;
     for i:=1 to Qdepen.RecordCount do
      begin
       Tdeti.AppendRecord([Qdepen['delo'],Qdepen['namdpn'],Qdepen['datbst'],Tcart['begpay'],Tcart['itgpns'],Tcart['endpay'],Tcart['pnsapp'],Qdepen['codpol']]);
       Qdepen.Next;
      end;
     Qdepen.Close;
    end;
   Tcart.Next;
  end;
  Tcart.Close;
  Tdeti.Close;
end;

procedure TForm1.N7Click(Sender: TObject);
var s:string;
begin
 OD1.Execute;
 ShowMessage('Открыт файл для скачивания- '+OD1.FileName);
 AssignFile(f,OD1.FileName);
 Reset(f);
 ConvertStr(SB);
 ConvertStr(SO);
 while not eof(f) do
  begin
   SC:='';
   SP:='';
   ConvertStr(S);
   repeat
    begin
     if Copy(s,1,1)='С' then SC:=s;
     if Copy(s,1,1)='П' then SP:=s;
     ConvertStr(S);
    end;
   until (Copy(s,1,1)='О') or (Eof(f));
   if SP<>'' then Zagruz(Sender);
   SO:=S;
  end;
 ConvertStr(SO);
end;

procedure TForm1.Zagruz(Sender: TObject);
var nam:string;
    datar:TDateTime;
begin
 Tcart.Open;
 Tcart.Filter:='vidpns<>3 and codlea=0';
 Tcart.Filtered:=true;
 nam:=Trim(Copy(SP,2,40))+' '+Trim(Copy(SP,42,40))+' '+Trim(Copy(SP,82,40));
 datar:=StrToDate(Copy(SP,130,2)+'.'+Copy(SP,127,2)+'.'+Copy(SP,122,4));
 if Tcart.Locate('nampns;datbst',VarArrayOf([nam,datar]),[loCaseinsensitive,loPartialKey])
 then
  begin
   Tcart.Edit;
   Tcart.FieldByName('kodpas').Value:=Copy(SP,357,121);
   try Tcart.Post
   except ShowMessage('Блокировка данных!');
   end;
  end
 else ShowMessage('Не найдено '+nam);
 Tcart.Close;
end;

procedure TForm1.PoiskP(Sender:TObject);
var s:string;
begin
 ConvertStrP(SB);
 ConvertStrP(S);
 while not eof(fp) do
  begin
   //SC:='';
   SP:='';
   //ConvertStr(fp,S);
   if Copy(S,1,15)=Copy(SO,1,15)
   then
    begin
     repeat
      begin
       if Copy(s,1,1)='С' then SC:=s;
       //if Copy(s,1,1)='П' then SP:=s;
       ConvertStrP(S);
      end;
     until (Copy(s,1,1)='О') or (Eof(f));
    end
    else ConvertStrP(S);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Tcart.Close;
 Ppas.Visible:=false;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 Ppas.Visible:=true;
 Edelo.SetFocus;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 Tcart.Open;
 if not Tcart.Locate('delo;vidpns',VarArrayOf([StrToInt(Trim(Edelo.Text)),4]),[])
   then ShowMessage('Ошибка поиска по CART');
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 if Tcart['delo']=StrToInt(Trim(Edelo.Text))
 then
  Tcart.Edit;
  Tcart.FieldByName('kodpas').Value:=StrCount(CBKod.Text,14)+StrCount(Eser.Text,9)
  +StrCount(Enom.Text,8)+Edata.Text+StrCount(AnsiUpperCase(Eorg.Text),80);
  try Tcart.Post
  except ShowMessage('Блокировка данных!');
 end;
end;

end.


