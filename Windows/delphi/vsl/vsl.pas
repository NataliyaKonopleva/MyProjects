unit vsl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DB, DBTables, DBGrids, ComCtrls, DateUtils,
  RpCon, RpBase, RpSystem, RpDefine, RpRave,Math;
  type
   TMyObj = class(TObject)
    Myar:TDateTime;
  end;
  type
   TVisl = class(TForm)
    Button1: TButton;
    SG: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Lbkal: TLabel;
    Lblgt: TLabel;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Bsum: TButton;
    procedure Button1Click(Sender: TObject);
    function Minus(data1,data2:string):string;
    function Dob0(s:string):string;
    procedure SGGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    function Plus(s1,s2:string):string;
    procedure SGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ConOpen(Connection: TRvCustomConnection);
    procedure ConGetCols(Connection: TRvCustomConnection);
    procedure ConGetRow(Connection: TRvCustomConnection);
    procedure SGMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BsumClick(Sender: TObject);
    procedure Vsego(Sender: TObject);
    procedure Kof05(Sender: TObject);
    procedure Kof15(Sender: TObject);
    procedure Kof2(Sender: TObject);
    procedure Kof3(Sender: TObject);
    procedure Kof133(Sender: TObject);
    procedure SGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Kof125(Sender:TObject);
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
 RV.SetParam('fam',Edit1.Text);
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
 if StrToDate(data2)>StrToDate(data1) then
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
   if ACol=2 then Value:='9\,90;1;_';
end;

procedure TVisl.FormActivate(Sender: TObject);
var i:integer;
begin
 SG.Cols[0].Text:='Начало периода';
 SG.Cols[1].Text:='Конец периода';
 SG.Cols[2].Text:='Коэф.';
 SG.Cols[3].Text:='Календарная в/л';
 SG.Cols[4].Text:='Льготная в/л';
 edit1.SetFocus;
 DecimalSeparator:=',';
end;

procedure TVisl.SGDblClick(Sender: TObject);
var d1,d2:string;
begin
 god:=StrToInt(Copy(IntToStr(YearOf(Date())+5),3,2));
 try
  if StrToInt(Copy(SG.Cells[0,SG.Row],7,2))<=god
  then d1:=Copy(SG.Cells[0,SG.Row],1,6)+'20'+Copy(SG.Cells[0,SG.Row],7,2)
  else d1:=Copy(SG.Cells[0,SG.Row],1,6)+'19'+Copy(SG.Cells[0,SG.Row],7,2);
  if StrToInt(Copy(SG.Cells[1,SG.Row],7,2))<=god
  then d2:=Copy(SG.Cells[1,SG.Row],1,6)+'20'+Copy(SG.Cells[1,SG.Row],7,2)
  else d2:=Copy(SG.Cells[1,SG.Row],1,6)+'19'+Copy(SG.Cells[1,SG.Row],7,2);
 except on EConvertError do
                          begin
                           ShowMessage('Неправильный ввод данных.');
                           exit;
                          end;
 end;
 SG.Cells[3,SG.Row]:=Minus(d1,d2);
 if SG.Cells[2,SG.Row]='1,00' then SG.Cells[4,SG.Row]:=Minus(d1,d2);
 if SG.Cells[2,SG.Row]='0,50' then Kof05(Sender);
 if SG.Cells[2,SG.Row]='1,50' then Kof15(Sender);
 if SG.Cells[2,SG.Row]='2,00' then Kof2(Sender);
 if SG.Cells[2,SG.Row]='3,00' then Kof3(Sender);
 if SG.Cells[2,SG.Row]='1,33' then Kof133(Sender);
 if SG.Cells[2,SG.Row]='1,25' then Kof125(Sender);
end;

function TVisl.Plus(s1,s2:string):string;
var d1,m1,g1,d2,m2,g2,d,m,g:integer;
    s:string;
begin
  g1:=StrToInt(Copy(s1,1,2));
  g2:=StrToInt(Copy(s2,1,2));
  m1:=StrToInt(Copy(s1,4,2));
  m2:=StrToInt(Copy(s2,4,2));
  d1:=StrToInt(Copy(s1,7,2));
  d2:=StrToInt(Copy(s2,7,2));
  d:=d1+d2;
  m:=m1+m2;
  g:=g1+g2;
  if d<30 then
           begin
            s:=Dob0(IntToStr(d));
            if m<12 then s:=Dob0(IntToStr(g))+'-'+Dob0(IntToStr(m))+'-'+s
                    else s:=Dob0(IntToStr(g+1))+'-'+Dob0(IntToStr(m-12))+'-'+s;
           end
          else
           begin
            s:=Dob0(IntToStr(d-30));
            if m+1<12 then s:=Dob0(IntToStr(g))+'-'+Dob0(IntToStr(m+1))+'-'+s
                      else s:=Dob0(IntToStr(g+1))+'-'+Dob0(IntToStr(m+1-12))+'-'+s;
           end;
   Plus:=s;
end;

procedure TVisl.SGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 If Button=mbLeft
 then
  begin
   SG.MouseToCell(x,y,c,r);
   Kopi:=SG.Cells[c,r];
 end;
end;

procedure TVisl.SGMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 If Button=mbLeft
 then
  begin
   SG.MouseToCell(x,y,c,r);
   SG.Cells[c,r]:=Kopi;
  end;
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
 SG.Cells[3,i]:=Lbkal.Caption;
 SG.Cells[4,i]:=Lblgt.Caption;
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
 LbKal.Caption:='00-00-00';
 Lblgt.Caption:='00-00-00';
 while SG.Cells[0,i]<>'' do
  begin
   Lbkal.Caption:=Plus(Lbkal.Caption,SG.Cells[3,i]);
   Lblgt.Caption:=Plus(Lblgt.Caption,SG.Cells[4,i]);
   i:=i+1;
  end;
end;

procedure TVisl.BsumClick(Sender: TObject);
begin
 Vsego(Sender);
end;

procedure TVisl.Kof05(Sender: TObject);
var g,m,d:integer;
    s:string;
 begin
  g:=StrToInt(Copy(SG.Cells[3,SG.Row],1,2));
  m:=StrToInt(Copy(SG.Cells[3,SG.Row],4,2));
  d:=StrToInt(Copy(SG.Cells[3,SG.Row],7,2));
  s:=Dob0(IntToStr(g div 2));
  if (g mod 2)>0 then m:=m+12;
  s:=s+'-'+Dob0(IntToStr(m div 2));
  if (m mod 2)>0 then d:=d+30;
  s:=s+'-'+Dob0(IntToStr(d div 2));
  SG.Cells[4,SG.Row]:=s;
  if SG.Cells[2,SG.Row]='0,50' then SG.Cells[3,SG.Row]:=s;
 end;

procedure TVisl.Kof15(Sender: TObject);
begin
 Kof05(Sender);
 SG.Cells[4,SG.Row]:=Plus(SG.Cells[3,SG.Row],SG.Cells[4,SG.Row]);
end;

procedure TVisl.Kof2(Sender: TObject);
begin
 SG.Cells[4,SG.Row]:=Plus(SG.Cells[3,SG.Row],SG.Cells[3,SG.Row]);
end;

procedure TVisl.Kof3(Sender: TObject);
begin
 Kof2(Sender);
 SG.Cells[4,SG.Row]:=Plus(SG.Cells[4,SG.Row],SG.Cells[3,SG.Row]);
end;

procedure TVisl.Kof133(Sender: TObject);
var g,m,d,mm,dd:integer;
    s:string;
 begin
  g:=StrToInt(Copy(SG.Cells[3,SG.Row],1,2));
  m:=StrToInt(Copy(SG.Cells[3,SG.Row],4,2));
  d:=StrToInt(Copy(SG.Cells[3,SG.Row],7,2));
  dd:=d+m*30+g*12*30;
  dd:=Round(dd*1.33);
  mm:=Floor(dd/30);
  d:=dd-mm*30;
  m:=mm mod 12;
  g:=mm div 12;
  s:=Dob0(IntToStr(g))+'-'+Dob0(IntToStr(m))+'-'+Dob0(IntToStr(d));
  SG.Cells[4,SG.Row]:=s;
end;


procedure TVisl.SGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s:string;
begin
  if Key=9 then
  if SG.Col=2 then
   begin
    s:=FloatToStrF(StrToFloat(SG.Cells[2,SG.Row]),ffFixed,4,2);
    SG.Cells[2,SG.Row]:=s;
    SGDblClick(Sender);
   end;
  //if SG.Col=1 then SG.Cells[2,SG.Row]:='1,00';
end;

procedure TVisl.Kof125(Sender:TObject);
var st:string;
begin
 Visl.Kof05(Sender);
 st:=SG.Cells[3,SG.Row];
 SG.Cells[3,SG.Row]:=SG.Cells[4,SG.Row];
 Visl.Kof05(Sender);
 SG.Cells[3,SG.Row]:=st;
 SG.Cells[4,SG.Row]:=Plus(SG.Cells[4,SG.Row],SG.Cells[3,SG.Row]);
end;

end.

