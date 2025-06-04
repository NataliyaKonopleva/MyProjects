unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons, ADODB,DateUtils, jpeg, Outline,
  DirOutln, Spin, Gauges, OleCtrls, Chartfx3, AxCtrls, VCF1, OleServer,
  WordXP;

type
  TFmPer = class(TForm)
    P1: TPanel;
    Edelo: TMaskEdit;
    DBTnampns: TDBText;
    ADOCart: TADOQuery;
    DataSource1: TDataSource;
    Label6: TLabel;
    MEfio: TMaskEdit;
    Button3: TButton;
    Label8: TLabel;
    DBGTp: TDBGrid;
    Label9: TLabel;
    MEgod: TMaskEdit;
    Label10: TLabel;
    CBgod: TComboBox;
    Label11: TLabel;
    Pskl: TPanel;
    ADOCon: TADOConnection;
    ADOmat: TADOQuery;
    DSmat: TDataSource;
    DSzn: TDataSource;
    DSmp: TDataSource;
    ADOzn: TADOQuery;
    ADOmp: TADOQuery;
    Lbitg: TLabel;
    ADOmatitogo: TAggregateField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Button2: TButton;
    Mbnk: TMemo;
    Button1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ADObank: TADOQuery;
    DataSource2: TDataSource;
    Lbbnk: TLabel;
    Lbraz: TLabel;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    RvCustomConnection1: TRvCustomConnection;
    DBText1: TDBText;
    Label1: TLabel;
    Label14: TLabel;
    DBText2: TDBText;
    Button4: TButton;
    Rv1: TRvProject;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Showpen(Sender: TObject);
    procedure DBGTpDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CBgodChange(Sender: TObject);
//    procedure SGmatDrawCell(Sender: TObject; ACol, ARow: Integer;
//      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function Poisk(st: string; n: integer): string;
    procedure Button4Click(Sender: TObject);
//    procedure SGnalDrawCell(Sender: TObject; ACol, ARow: Integer;
//      Rect: TRect; State: TGridDrawState);

 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPer: TFmPer;
implementation

{$R *.dfm}

function TfmPer.Poisk(st: string; n: integer): string;
var i: integer;
    st1: string;
begin
  st1:=st;
  for i:=1 to n do
   st1:=Copy(st1,(Pos('|',st1)+1),50);
  Poisk := st1;
end;

procedure TFmPer.FormActivate(Sender: TObject);
var f: Textfile;
    s: array[0..1237] of char;
    s1: String;
    r: real;
    i: integer;
begin
 try ADOcon.Open
 except
  begin
   ShowMessage('Журналы недоступны! Попробуйте позже!');
   Exit;
  end;
 end;
 CBgod.Text:=IntToStr(YearOf(Date())-1);
 MEgod.Text:=CBgod.Text;
 Edelo.SetFocus;
 Label2.Caption:='Сумма пенсии по Пенсиону за  период 01.02.'+IntToStr(YearOf(Date())-1)+' - 01.02.'+IntToStr(YearOf(Date()));
 Label5.Caption:='Сумма пенсии по Банку за  период 01.02.'+IntToStr(YearOf(Date())-1)+' - 01.02.'+IntToStr(YearOf(Date()));
 ADObank.SQL.Strings[1]:='FROM sverkabnk'+Copy(Trim(CBgod.Text),3,2);
 if ADObank.Active then ADObank.Close;
  try
   ADObank.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы банка');
    Exit;
   end;
  end;
  // Перенос данных из текстового файла банка в таблицу sverkabank19.
 // Достаточно делать один раз.
 {AssignFile(f,'C:\PN_EDO\RECEIVE\SV\bank.txt');
 Reset(f);
 Readln(f,s);
 s1:=''+s;
 r:=StrToFloat(Copy(Poisk(s1,4),1,(Pos('|',Poisk(s1,4))-1)));
 while not eof(f) do
  begin
   Readln(f,s);
   s1:=''+s;
   r:=StrToFloat(Copy(Poisk(s1,4),1,(Pos('|',Poisk(s1,4))-1)));
   ADObank.AppendRecord([StrToInt(Copy(s1,4,(Pos('|',s1)-4))),Copy(Poisk(s1,2),1,(Pos('|',Poisk(s1,2))-1)),r]);
  end;}
end;

procedure TfmPer.Showpen(Sender: TObject);
var i,j:integer;
    itog:real;
    sp:string;
begin
 //Суммируем за год по банку
 itog:=0;
 for i:=1 to ADObank.RecordCount do
  begin
   itog:=itog+ADObank['summa'];
   ADObank.Next;
  end; 
 Lbbnk.Caption:=FloatToStr(itog);
 //Выводим разницу сумм
 itog:= ADOcart['summa']-itog;
 Lbraz.Caption:=FloatToStrF(itog,ffFixed,10,2);
 ADOcart.Edit;
 ADOcart.FieldValues['bnk']:=100;
 try
  ADOcart.Refresh;
 except
 end;
 Lbitg.Caption:='Итого выплачено по Пенсиону за '+MEgod.Text+' год:  '+FloatToStr(itog)+' руб.';
 Edelo.Text:='';
 MEfio.Text:='';
 Edelo.SetFocus;
end;

procedure TFmPer.Button1Click(Sender: TObject);
begin
 Screen.Cursor := crHourGlass;
 ADOCart.Parameters[0].Value:=StrToFloat(Edelo.Text);
 ADOcart.Parameters[1].Value:='SOS';
 ADOcart.Parameters[2].Value:=200;
 ADOcart.SQL.Strings[1]:='FROM sverka'+Copy(Trim(CBgod.Text),3,2);
 if ADOCart.Active then ADOCart.Close;
  try
   ADOcart.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы CART');
    Exit;
   end;
  end;
  if ADOCart.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('Номер дела не существует');
    Screen.Cursor := crDefault;
    Edelo.SetFocus;
    Exit;
   end
  else if ADOCart.RecordCount>1 then
   begin
    MessageBeep(MB_OK);
    ShowMessage('По этому номеру больше одного получателя, введите номер разрешения');
    Screen.Cursor := crDefault;
    MEfio.SetFocus;
    Exit;
   end;
 ADObank.Parameters[0].Value:=StrToFloat(Edelo.Text);
 ADObank.Parameters[1].Value:='SOS';
 ADObank.SQL.Strings[1]:='FROM sverkabnk'+Copy(Trim(CBgod.Text),3,2);
 if ADObank.Active then ADObank.Close;
  try
   ADObank.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы BANK');
    Exit;
   end;
  end;
  Showpen(Sender);
  Screen.Cursor := crDefault;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOcart.Close;
 ADOzn.Close;
 ADOmat.Close;
end;

procedure TFmPer.DBGTpDblClick(Sender: TObject);
begin
 DBGTp.Visible:=false;
 Edelo.Text:=IntToStr(ADOcart['delo']);
 Showpen(Sender);
end;

procedure TFmPer.Button3Click(Sender: TObject);
begin
  ADOCart.Parameters[0].Value:=0;
  ADOcart.Parameters[1].Value:=Trim(MEFIO.Text)+'%';
  ADOcart.Parameters[2].Value:=200;
  ADOcart.SQL.Strings[1]:='FROM sverka'+Copy(Trim(CBgod.Text),3,2);
  if ADOCart.Active then ADOCart.Close;
  try
   ADOcart.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы CART');
   end;
  end;
  if ADOCart.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('Нет такого пенсионера в УВД');
    MEFIO.SetFocus;
    Exit;
   end;
  ADObank.Parameters[0].Value:=0;
  ADObank.Parameters[1].Value:=Trim(MEFIO.Text)+'%';
  ADObank.SQL.Strings[1]:='FROM sverkabnk'+Copy(Trim(CBgod.Text),3,2);
  if ADObank.Active then ADObank.Close;
  try
   ADObank.Open;
  except
   begin
    ShowMessage('Ошибка при открытии базы BANK');
   end;
  end;
  if ADObank.RecordCount=0
  then
   begin
    MessageBeep(MB_OK);
    ShowMessage('Не найдено разрешение.');
    MEFIO.SetFocus;
    Exit;
   end;
   Showpen(Sender);
 // DBGTp.Visible:=true;
end;

procedure TFmPer.CBgodChange(Sender: TObject);
begin
 MEgod.Text:=CBgod.Text;
 if ADOmat.Active then ADOmat.Close;
 if ADOzn.Active then ADOzn.Close;
 if ADOmp.Active then ADOmp.Close;
 if DBTnampns.Caption<>''
 then Showpen(Sender);
end;

{procedure TFmPer.SGmatDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Col: integer absolute ACol;
  Row: integer absolute ARow;
  Buf: array[byte] of char;begin
  if State = [gdFixed] then Exit;
  with SGmat do
  begin
    Canvas.Font := Font;
    Canvas.Font.Color := clWindowText;
    //Canvas.Brush.Color := clWindow;
    Canvas.Brush.Color := clInactiveCaption;
    Canvas.FillRect(Rect);
    StrPCopy(Buf, Cells[ACol, ARow]);
    DrawText(Canvas.Handle, Buf, -1, Rect,
    DT_SINGLELINE or DT_VCENTER or DT_NOCLIP or DT_RIGHT);
  end;
end;  }

{procedure TFmPer.SGnalDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Col: integer absolute ACol;
  Row: integer absolute ARow;
  Buf: array[byte] of char;
begin
  if State = [gdFixed] then Exit;
  with SGnal do
  begin
    Canvas.Font := Font;
    Canvas.Font.Color := clWindowText;
    //Canvas.Brush.Color := clWindow;
    Canvas.Brush.Color := clInactiveCaption;
    Canvas.FillRect(Rect);
    StrPCopy(Buf, Cells[ACol, ARow]);
    DrawText(Canvas.Handle, Buf, -1, Rect,
    DT_SINGLELINE or DT_VCENTER or DT_NOCLIP or DT_RIGHT);
  end;
end;}

procedure TFmPer.Button2Click(Sender: TObject);
begin
 //MEfio.Text:=ADObank['pnslst'];
 //Edelo.Text:=ADObank['delo'];
 RV.Open;
 RV.SetParam('fam',DBTnampns.Caption);
 RV.SetParam('delo',ADOcart['delo']);
 RV.SetParam('period','01.02.'+IntToStr(YearOf(Date())-1)+'-31.01.'+IntToStr(YearOf(Date())));
 RV.SetParam('pnslst',ADOcart['pnslst']);
 RV.SetParam('v',Lbbnk.Caption);
 RV.SetParam('s',DBEdit1.Text);
 RV.SetParam('r',Lbraz.Caption);
 RV.Execute;
 RV.Close;
 MEfio.Text:='';
 Edelo.Text:='';
end;

procedure TFmPer.Button4Click(Sender: TObject);
begin
 RV1.Open;
 RV1.SetParam('fam',DBTnampns.Caption);
 RV1.SetParam('delo',ADOcart['delo']);
 RV1.SetParam('period','01.02.'+IntToStr(YearOf(Date())-1)+'-31.01.'+IntToStr(YearOf(Date())));
 RV1.SetParam('pnslst',ADOcart['pnslst']);
 RV1.SetParam('v',Lbbnk.Caption);
 RV1.SetParam('s',DBEdit1.Text);
 RV1.SetParam('r',Lbraz.Caption);
 RV1.Execute;
 RV1.Close;
 MEfio.Text:='';
 Edelo.Text:='';
end;

end.
