unit vsl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DB, DBTables, DBGrids, ComCtrls, DateUtils,
  RpCon, RpBase, RpSystem, RpDefine, RpRave,Math, DBCtrls, Buttons, ADODB;
  type
   TMyObj = class(TObject)
    Myar:TDateTime;
  end;
  type
   TVisl = class(TForm)
    Button1: TButton;
    SG: TStringGrid;
    Eprich: TEdit;
    Label1: TLabel;
    Lbsum: TLabel;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Bsum: TButton;
    Label2: TLabel;
    MEdelo: TMaskEdit;
    BBfound: TBitBtn;
    DBTnampns: TDBText;
    Label3: TLabel;
    Eper: TEdit;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    procedure Button1Click(Sender: TObject);
    function Minus(data1,data2:string):string;
    function Dob0(s:string):string;
    procedure SGGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    procedure ConOpen(Connection: TRvCustomConnection);
    procedure ConGetCols(Connection: TRvCustomConnection);
    procedure ConGetRow(Connection: TRvCustomConnection);
    procedure BsumClick(Sender: TObject);
    procedure Vsego(Sender: TObject);
    {procedure SGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBfoundClick(Sender: TObject);
    function Dmes(data:TdateTime):integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Visl: TVisl;
  god,c,r,kol,kof:integer;
  Kopi:string;
implementation

{$R *.dfm}

procedure TVisl.Button1Click(Sender: TObject);
begin
 RV.Open;
 RV.SetParam('fam',DBTnampns.Caption);
 RV.SetParam('delo',MEdelo.Text);
 RV.SetParam('prich',Eprich.Text);
 RV.SetParam('per',Eper.Text);
 RV.Execute;
 RV.Close;
end;

function TVisl.Minus(data1,data2:string):string;
var d1,m1,g1,d2,m2,g2:integer;
    s:string;
begin
 try
  d1:=StrToInt(Copy(data1,1,2));
  d2:=StrToInt(Copy(data2,1,2));
  m1:=StrToInt(Copy(data1,4,2));
  m2:=StrToInt(Copy(data2,4,2));
  g1:=StrToInt(Copy(data1,7,4));
  g2:=StrToInt(Copy(data2,7,4));
 except on EConvertError do
                          begin
                           ShowMessage('Неправильный ввод данных.');
                           exit;
                          end;
 end;
 if StrToDate(data2)>=StrToDate(data1) then
 begin
  if d2>=d1
  then s:=Dob0(IntToStr(d2-d1))
  else
   begin
    s:=Dob0(IntToStr(d2+30-d1));
    m2:=m2-1;
   end;
  if m2>=m1
  then s:=Dob0(IntToStr(m2-m1))+'-'+s
  else
   begin
    s:=Dob0(IntToStr(m2+12-m1))+'-'+s;
    g2:=g2-1;
   end;
  s:=Dob0(IntToStr(g2-g1))+'-'+s;
  Minus:=s;
 end
 else ShowMessage('Неправильный ввод даты');
end;

function TVisl.Dob0(s:string):string;
begin
 if Length(s)<2 then Dob0:='0'+s
                else Dob0:=s;
end;

procedure TVisl.SGGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
   if ACol<=1 then Value:='90\.90\.90;1;_' else
   if ACol>=2 then Value:='99999\,99;1;*';
end;

procedure TVisl.FormActivate(Sender: TObject);
begin
 SG.Cols[0].Text:='Начало периода';
 SG.Cols[1].Text:='Конец периода';
 SG.Cols[2].Text:='Выплачено';
 SG.Cols[3].Text:='След-ло выплатить';
 SG.Cols[4].Text:='Сумма разницы';
 MEdelo.SetFocus;
 DecimalSeparator:=',';
end;

procedure TVisl.SGDblClick(Sender: TObject);
var dd1,dd2:TdateTime;
    dd:string;
    kold1,kold2,dm1,dm2:integer;
    rv,rs:real;
begin
 try
  dd1:=StrToDate(SG.Cells[0,SG.Row]);
 except
 on E: EConvertError do ShowMessage('Ошибка даты-'+SG.Cells[0,SG.Row]);
 end;
 try
 dd2:=StrToDate(SG.Cells[1,SG.Row]);
 except
 on E: EConvertError do ShowMessage('Ошибка даты-'+SG.Cells[1,SG.Row]);
 end;
 dm1:=Dmes(dd1);
 dm2:=Dmes(dd2);
 if (MonthOf(dd1)=MonthOf(dd2)) and (YearOf(dd1)=YearOf(dd2))
  then
   begin
    kold1:=DayOf(dd2)-DayOf(dd1)+1;
    kold2:=0;
    dd:='00-00-00';
   end
  else
   begin
    kold1:=dm1-DayOf(dd1)+1;
    kold2:=DayOf(dd2);
    dd1:=dd1+kold1;
    dd2:=dd2-(kold2-1);
    dd:=Minus(DateToStr(dd1),DateToStr(dd2));
   end;
 try
  rv:=StrToFloat(Copy(dd,1,2))*12*StrToFloat(TRIM(SG.Cells[2,SG.Row]))+StrToFloat(Copy(dd,4,2))*StrToFloat(Trim(SG.Cells[2,SG.Row]))+StrToFloat(Trim(SG.Cells[2,SG.Row]))/dm1*kold1+StrToFloat(TRIM(SG.Cells[2,SG.Row]))/dm2*kold2;
 except
  on E: EConvertError do
                       begin
                        ShowMessage('Ошибка ввода суммы '+SG.Cells[2,SG.Row]);
                        exit;
                       end;
 end;
 try
  rs:=StrToFloat(Copy(dd,1,2))*12*StrToFloat(SG.Cells[3,SG.Row])+StrToFloat(Copy(dd,4,2))*StrToFloat(SG.Cells[3,SG.Row])+StrToFloat(SG.Cells[3,SG.Row])/dm1*kold1+StrToFloat(SG.Cells[3,SG.Row])/dm2*kold2;
 except
  on E: EConvertError do
                       begin
                        ShowMessage('Ошибка ввода суммы '+SG.Cells[3,SG.Row]);
                        Exit;
                       end;
 end;
 SG.Cells[4,SG.Row]:=FloatToStrF((rs-rv),fffixed,9,2);
end;

procedure TVisl.ConOpen(Connection: TRvCustomConnection);
var i:integer;
begin
 i:=1;
 Kol:=0;
 while SG.Cells[0,i]<>'' do
  begin
   Kol:=Kol+1;
   i:=i+1;
  end;
 SG.Cells[1,i]:='ИТОГО:';
 SG.Cells[3,i]:=Lbsum.Caption;
 Con.DataRows:=Kol+1;
 kof:=1;
end;

procedure TVisl.ConGetCols(Connection: TRvCustomConnection);
begin
 Con.WriteField('d1',dtString,15,'d1','');
 Con.WriteField('d2',dtString,15,'d2','');
 Con.WriteField('k',dtString,5,'k','');
 Con.WriteField('r1',dtString,15,'r1','');
 Con.WriteField('r2',dtString,15,'r2','');
end;

procedure TVisl.ConGetRow(Connection: TRvCustomConnection);
begin
 Con.WriteStrData('',SG.Cells[0,kof]);
 Con.WriteStrData('',SG.Cells[1,kof]);
 Con.WriteStrData('',SG.Cells[2,kof]);
 Con.WriteStrData('',SG.Cells[3,kof]);
 Con.WriteStrData('',SG.Cells[4,kof]);
 kof:=kof+1;
end;

procedure TVisl.Vsego(Sender: TObject);
var i:integer;
begin
 i:=1;
 Lbsum.Caption:='0';
 while SG.Cells[0,i]<>'' do
  begin
   Lbsum.Caption:=FloatToStrF(StrToFloat(Lbsum.Caption)+StrToFloat(SG.Cells[4,i]),ffFixed,9,2);
   i:=i+1;
  end;
end;

procedure TVisl.BsumClick(Sender: TObject);
begin
 Vsego(Sender);
end;

procedure TVisl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOcart.Close;
end;

procedure TVisl.BBfoundClick(Sender: TObject);
begin
 DBTnampns.Visible:=true;
 ADOCart.Parameters[0].Value:=StrToFloat(MEdelo.Text);
 if ADOCart.Active then ADOCart.Close;
 try
  ADOcart.Open;
 except ShowMessage('Ошибка при открытии базы CART');
 end;
 if ADOCart.RecordCount=0
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Номер дела не существует');
   MEdelo.SetFocus;
   Exit;
  end;
end;

function TVisl.Dmes(data:TdateTime):integer;
begin
 if (MonthOf(data)=1)or(MonthOf(data)=3)or(MonthOf(data)=5)or(MonthOf(data)=7)or(MonthOf(data)=8)or(MonthOf(data)=10)or(MonthOf(data)=12)
 then Dmes:=31 else
  if (MonthOf(data)=4)or(MonthOf(data)=6)or(MonthOf(data)=9)or(MonthOf(data)=11)
  then Dmes:=30 else
   if YearOf(data) mod 4=0 then Dmes:=29 else Dmes:=28;
end;



end.

