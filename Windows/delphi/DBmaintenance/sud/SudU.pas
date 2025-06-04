unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons, Lsp;

type
  TFmPer = class(TForm)
    DataSource1: TDataSource;
    Tp: TTable;
    Tpp: TTable;
    DataSource2: TDataSource;
    Tprn: TTable;
    ToolBar1: TToolBar;
    TB1: TToolButton;
    TB2: TToolButton;
    TB3: TToolButton;
    TB4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    PM3: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    P1: TPanel;
    Edelo: TMaskEdit;
    DBText1: TDBText;
    Label1: TLabel;
    Lbcodrnk: TLabel;
    Button1: TButton;
    DB: TDBGrid;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    CBmes: TComboBox;
    Pdelo: TPanel;
    Lbel4: TLabel;
    MEdelo1: TMaskEdit;
    Bfound: TBitBtn;
    Pfio: TPanel;
    Label4: TLabel;
    Efio: TEdit;
    Bfio: TBitBtn;
    PM4: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    Rv1: TRvProject;
    Mbnk: TMemo;
    MEp: TComboBox;
    Label5: TLabel;
    Lbitogo: TLabel;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    MEo: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure TB2Click(Sender: TObject);
    procedure EdeloDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ConOpen(Connection: TRvCustomConnection);
    procedure ConGetCols(Connection: TRvCustomConnection);
    procedure ConGetRow(Connection: TRvCustomConnection);
    procedure Button1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BfoundClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure Stat(Sender:TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPer: TFmPer;
  zv:array [1..16] of string;
  zap,nn,zap1:integer;
  vsego,vsego1:real;
implementation

{$R *.dfm}

procedure TFmPer.FormActivate(Sender: TObject);
begin
 zv[1]:='рядовой';
 zv[2]:='ефрейтор';
 zv[3]:='мл.сержант';
 zv[4]:='сержант';
 zv[5]:='ст.сержант';
 zv[6]:='старшина';
 zv[7]:='прапорщик';
 zv[8]:='ст.прапорщик';
 zv[9]:='мл.лейтенант';
 zv[10]:='лейтенант';
 zv[11]:='ст.лейтенант';
 zv[12]:='капитан';
 zv[13]:='майор';
 zv[14]:='подполковник';
 zv[15]:='полковник';
 zv[16]:='генерал-майор';
 //Tp.Open;
 //Tpp.Open;
 try
 if not FileExists('F:\DATA\CARTPRN.MDX') then
  begin
   Tprn.AddIndex('cart2','nampns',[ixExpression]);
   Tprn.AddIndex('cart1','delo',[]);
  end;
 try
  Tprn.IndexName:='cart1';
  Tprn.Open;
 except on E: EDataBaseError do ShowMessage('Ошибка!Проверьте индексы.');
 end;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы');
 end;
end;

procedure TFmPer.TB2Click(Sender: TObject);
begin
 p1.Visible:=true;
 Edelo.SetFocus;
end;

procedure TFmPer.EdeloDblClick(Sender: TObject);
var i:integer;
begin
 Tp.Open;
 Tp.Filter:='vidpns<>3';
 Tp.Filtered:=true;
 if Tp.Locate('delo',Edelo.Text,[])
  then
   begin
    if Tprn.Locate('delo',Edelo.Text,[])
     then
      begin
       ShowMessage('Этому пенсионеру доплата уже подсчитана!');
       Edelo.SetFocus;
       exit;
      end;
   end
   else
    begin
      ShowMessage('Номер дела не существует!');
      Edelo.SetFocus;
      exit;
     end;
  i:=Tp['codrnk'];
  if Tp['vidpns']<3 then Lbcodrnk.Caption:=zv[i];
  if (Tp['povmin']+Tp['povs16']+Tp['nadb_1']+Tp['nadb_2']+Tp['nadb_3']+Tp['nadrad']+Tp['ps45_1']+Tp['ps45_2'])=0
  then MEp.Text:=FloatToStrF(230.25*28.156*tp['penprc']/100,ffFixed,9,2)
  else MEp.Text:=FloatToStrF(230.25*2.722*tp['penprc']/100,ffFixed,9,2);
  MEo.SetFocus;
 end;

procedure TFmPer.Button2Click(Sender: TObject);
var bank:string;
    codb:integer;
begin
 Lbitogo.Caption:=FloatToStrF(StrToFloat(Trim(MEo.Text))+StrToFloat(Trim(MEp.Text)),ffFixed,9,2);
 if Tprn.Locate('delo',Edelo.Text,[])
     then
      begin
       ShowMessage('Этому пенсионеру доплата уже подсчитана!');
       Edelo.SetFocus;
       exit;
      end
     else
     begin
      if (Tp['codbnk']=1) or (Tp['codbnk']=4) or (Tp['codbnk']=5) or (Tp['codbnk']=6) or (Tp['codbnk']=9) or (Tp['codbnk']=11) or (Tp['codbnk']=15) or (Tp['codbnk']=16) or (Tp['codbnk']>=18)
       then
        begin
         bank:='Яр.гор.';
         codb:=1;
        end;
      if (Tp['codbnk']=2) or (Tp['codbnk']=17)
       then
        begin
         bank:='Рыб.';
         codb:=2;
        end;
      if (Tp['codbnk']=3) or (Tp['codbnk']=7)
       then
        begin
         bank:='Рост.';
         codb:=3;
        end;
      if Tp['codbnk']=8
       then
        begin
         bank:='Перес.';
         codb:=8;
        end;
      if (Tp['codbnk']=10) or (Tp['codbnk']=12) or (Tp['codbnk']=13) or (Tp['codbnk']=14)
       then
        begin
         bank:='Угл.';
         codb:=10;
        end;
      Tprn.AppendRecord([Tp['delo'],Tp['vidpns'],Tp['nampns'],Tp['codrnk'],Tp['pnslst'],codb,Tp['codreg'],StrToFloat(Trim(MEo.Text)),StrToFloat(Trim(MEp.Text)),null,bank]);
      Meo.Text:=',';
     end;
end;

procedure TFmPer.N3Click(Sender: TObject);
begin
 DB.SetFocus;
end;

procedure TFmPer.N5Click(Sender: TObject);
var vsego:real;
begin
 vsego:=0;
 Tprn.Filter:='codbnk=1 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.IndexName:='cart1';
 Tprn.First;
 while not Tprn.Eof do
  begin
   vsego:=vsego+Tprn['doplo']+Tprn['doplp'];
   Tprn.Next;
  end;
 RV.Open;
 RV.SetParam('vsego',FloatToStrF(vsego,ffFixed,12,2));
 RV.SetParam('bank','Ярославское гор. отделение № 17/0169');
 RV.SetParam('mes',CBmes.Text);
 RV.SetParam('col',IntToStr(zap));
 RV.Execute;
 RV.Close;
 Tprn.Filtered:=false;
end;

procedure TFmPer.ConOpen(Connection: TRvCustomConnection);
begin
 Con.DataRows:=zap;
 Tprn.First;
 nn:=1;
end;

procedure TFmPer.ConGetCols(Connection: TRvCustomConnection);
begin
 Con.WriteField('nn',dtString,5,'nn','');
 Con.WriteField('delo',dtString,10,'delo','');
 Con.WriteField('fam',dtString,40,'fam','');
 Con.WriteField('doplo',dtString,15,'doplo','');
 Con.WriteField('doplp',dtString,15,'doplp','');
 Con.WriteField('itogo',dtString,15,'itogo','');
end;

procedure TFmPer.ConGetRow(Connection: TRvCustomConnection);
var vid:string;
begin
 //if not Tprn.Eof then
  //begin
   //Tprn.Edit;
   //Tprn.FieldValues['data']:=Date();
   if Tprn['vidpns']=1 then vid:='за выслугу';
   if Tprn['vidpns']=2 then vid:=' по инвалид.';
   if Tprn['vidpns']=4 then vid:='по п/к';
   Con.WriteStrData('',IntToStr(nn));
   Con.WriteStrData('','48/'+IntToStr(Tprn['delo']));
   Con.WriteStrData('',Tprn['nampns']);
   Con.WriteStrData('',vid);
   Con.WriteStrData('',Tprn['pnslst']);
   Con.WriteStrData('',FloatToStrF((Tprn['doplo']+Tprn['doplp']),ffFixed,9,2));
   Tprn.Next;
   nn:=nn+1;
  //end;

end;

procedure TFmPer.Button1Click(Sender: TObject);
begin
 EdeloDblClick(Sender);
end;

procedure TFmPer.N6Click(Sender: TObject);
var vsego:real;
begin
 vsego:=0;
 Tprn.Filter:='codbnk=2 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 while not Tprn.Eof do
  begin
   vsego:=vsego+Tprn['doplo']+Tprn['doplp'];
   Tprn.Next;
  end;
 RV.Open;
 RV.SetParam('vsego',FloatToStrF(vsego,ffFixed,12,2));
 RV.SetParam('bank','Рыбинское гор. отделение № 1576/095');
 RV.SetParam('mes',CBmes.Text);
 RV.SetParam('adrbnk','152901,г.Рыбинск,Волжская наб.,47/49');
 RV.SetParam('col',IntToStr(zap));
 RV.Execute;
 RV.Close;
 Tprn.Filtered:=false;
end;

procedure TFmPer.N7Click(Sender: TObject);
var vsego:real;
begin
 vsego:=0;
 Tprn.Filter:='codbnk=3 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 while not Tprn.Eof do
  begin
   vsego:=vsego+Tprn['doplo']+Tprn['doplp'];
   Tprn.Next;
  end;
 RV.Open;
 RV.SetParam('vsego',FloatToStrF(vsego,ffFixed,12,2));
 RV.SetParam('bank','Ростовское гор. отделение № 2525');
 RV.SetParam('adrbnk','152100,г.Ростов,1 Микр-н.,36А');
 RV.SetParam('col',IntToStr(zap));
 RV.SetParam('mes',CBmes.Text);
 RV.Execute;
 RV.Close;
 Tprn.Filtered:=false;
end;

procedure TFmPer.N8Click(Sender: TObject);
var vsego:real;
begin
 vsego:=0;
 Tprn.Filter:='codbnk=8 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 while not Tprn.Eof do
  begin
   vsego:=vsego+Tprn['doplo']+Tprn['doplp'];
   Tprn.Next;
  end;
 RV.Open;
 RV.SetParam('vsego',FloatToStrF(vsego,ffFixed,12,2));
 RV.SetParam('bank','Переславское гор. отделение № 7443');
 RV.SetParam('adrbnk','152040,г.Переславль,ул.Менделеева,2');
 RV.SetParam('mes',CBmes.Text);
 RV.SetParam('col',IntToStr(zap));
 RV.Execute;
 RV.Close;
 Tprn.Filtered:=false;
end;

procedure TFmPer.N9Click(Sender: TObject);
var vsego:real;
begin
 vsego:=0;
 Tprn.Filter:='codbnk=10 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 while not Tprn.Eof do
  begin
   vsego:=vsego+Tprn['doplo']+Tprn['doplp'];
   Tprn.Next;
  end;
 RV.Open;
 RV.SetParam('vsego',FloatToStrF(vsego,ffFixed,12,2));
 RV.SetParam('bank','Угличское гор. отделение № 2532');
 RV.SetParam('adrbnk','152620,г.Углич,микр.Мирный,9');
 RV.SetParam('mes',CBmes.Text);
 RV.SetParam('col',IntToStr(zap));
 RV.Execute;
 RV.Close;
 Tprn.Filtered:=false;
 end;

procedure TFmPer.N1Click(Sender: TObject);
begin
 Pdelo.Visible:=true;
 MEdelo1.SetFocus;
end;

procedure TFmPer.BfoundClick(Sender: TObject);
begin
 Tprn.IndexName:='cart1';
 if not Tprn.Locate('delo',MEdelo1.Text,[])
     then
      begin
       ShowMessage('Этому пенсионеру доплата не занесена!');
       MEdelo1.SetFocus;
      end;
  Pdelo.Visible:=false;
 end;

procedure TFmPer.N2Click(Sender: TObject);
begin
 Pfio.Visible:=true;
 Efio.SetFocus;
end;

procedure TFmPer.BfioClick(Sender: TObject);
begin
 Tprn.IndexName:='cart2';
 if not Tprn.Locate('nampns',trim(EFIO.Text),[loCaseinsensitive,loPartialKey])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Этому пенсионеру доплата не занесена!');
   //EFIO.SetFocus;
  end;
 Pfio.Visible:=false;
end;

procedure TFmPer.Stat(Sender:TObject);
begin
 vsego:=0;
 zap:=Tprn.RecordCount;
 Tprn.First;
 while not Tprn.Eof do
  begin
   vsego:=vsego+Tprn['doplo']+Tprn['doplp'];
   Tprn.Next;
  end;
end;

procedure TFmPer.N10Click(Sender: TObject);
var i:integer;
    bank:string;
begin
 Mbnk.Lines.Append('Суммы для заявки:');
 Mbnk.Lines.Append('');
 vsego1:=0;
 zap1:=0;
 for i:=1 to 3 do
  begin
   Tprn.Filter:='codbnk='+IntToStr(i)+' and data=null';
   Tprn.Filtered:=True;
   Stat(Sender);
   Tprn.Filtered:=false;
   case i of
    1: bank:='Ярославский банк - ';
    2: bank:='Рыбинский банк - ';
    3: bank:='Ростовский банк - ';
   end;
   Mbnk.Lines.Append(bank+FloatToStrF(vsego,ffCurrency,12,2)+'  '+IntToStr(zap)+' чел.');
   vsego1:=vsego1+vsego;
   zap1:=zap1+zap;
  end;
  Tprn.Filter:='codbnk=8 and data=null';
  Tprn.Filtered:=True;
  Stat(Sender);
  Tprn.Filtered:=false;
  bank:='Переславский банк - ';
  Mbnk.Lines.Append(bank+FloatToStrF(vsego,ffCurrency,12,2)+'  '+IntToStr(zap)+' чел.');
  vsego1:=vsego1+vsego;
  zap1:=zap1+zap;
  Tprn.Filter:='codbnk=10 and data=null';
  Tprn.Filtered:=True;
  Stat(Sender);
  Tprn.Filtered:=false;
  bank:='Угличский банк - ';
  Mbnk.Lines.Append(bank+FloatToStrF(vsego,ffCurrency,12,2)+'  '+IntToStr(zap)+' чел.');
  vsego1:=vsego1+vsego;
  zap1:=zap1+zap;
  Mbnk.Lines.Append('Всего: '+FloatToStrF(vsego1,ffCurrency,12,2)+'  '+IntToStr(zap1)+' чел.');
  RV1.Open;
  RV1.SetParam('mem',Mbnk.Lines.Text);
  RV1.Execute;
  RV1.ClearParams;
  RV1.Close;
  Mbnk.Clear;
end;

procedure TFmPer.N11Click(Sender: TObject);
 var i:integer;
     bank:string;
begin
 Vsego1:=0;
 Mbnk.Lines.Append('Выплаченные суммы:');
 Mbnk.Lines.Append('');
 for i:=1 to 3 do
  begin
   Tprn.Filter:='codbnk='+IntToStr(i)+' and data<>null';
   Tprn.Filtered:=True;
   Stat(Sender);
   Tprn.Filtered:=false;
   case i of
    1: bank:='Ярославский банк - ';
    2: bank:='Рыбинский банк - ';
    3: bank:='Ростовский банк - ';
   end;
   Mbnk.Lines.Append(bank+FloatToStrF(vsego,ffCurrency,12,2)+'  '+IntToStr(zap)+' чел.');
   vsego1:=vsego1+vsego;
  end;
  Tprn.Filter:='codbnk=8 and data<>null';
  Tprn.Filtered:=True;
  Stat(Sender);
  Tprn.Filtered:=false;
  bank:='Переславский банк - ';
  Mbnk.Lines.Append(bank+FloatToStrF(vsego,ffCurrency,12,2)+'  '+IntToStr(zap)+' чел.');
  vsego1:=vsego1+vsego;
  Tprn.Filter:='codbnk=10 and data<>null';
  Tprn.Filtered:=True;
  Stat(Sender);
  Tprn.Filtered:=false;
  bank:='Угличский банк - ';
  Mbnk.Lines.Append(bank+FloatToStrF(vsego,ffCurrency,12,2)+'  '+IntToStr(zap)+' чел.');
  vsego1:=vsego1+vsego;
  Mbnk.Lines.Append('Всего: '+FloatToStrF(vsego1,ffCurrency,12,2));
  RV1.Open;
  RV1.SetParam('mem',Mbnk.Lines.Text);
  RV1.Execute;
  RV1.ClearParams;
  RV1.Close;
  Mbnk.Clear;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Tp.Close;
 Tpp.Close;
 Tprn.Close;
end;

procedure TFmPer.N12Click(Sender: TObject);
var i,zap:integer;
begin
 Tprn.Filter:='codbnk=1 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 for i:=1 to zap do
  begin
   Tprn.Edit;
   Tprn.FieldValues['data']:=Date();
   Tprn.Next;
  end;
 Tprn.Filtered:=false;
end;

procedure TFmPer.N13Click(Sender: TObject);
var i,zap:integer;
begin
 Tprn.Filter:='codbnk=2 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 for i:=1 to zap do
  begin
   Tprn.Edit;
   Tprn.FieldValues['data']:=Date();
   Tprn.Next;
  end;
 Tprn.Filtered:=false;
end;

procedure TFmPer.N14Click(Sender: TObject);
var i,zap:integer;
begin
 Tprn.Filter:='codbnk=3 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 for i:=1 to zap do
  begin
   Tprn.Edit;
   Tprn.FieldValues['data']:=Date();
   Tprn.Next;
  end;
 Tprn.Filtered:=false;
end;

procedure TFmPer.N15Click(Sender: TObject);
var i,zap:integer;
begin
 Tprn.Filter:='codbnk=8 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 for i:=1 to zap do
  begin
   Tprn.Edit;
   Tprn.FieldValues['data']:=Date();
   Tprn.Next;
  end;
  Tprn.Filtered:=false;
end;

procedure TFmPer.N16Click(Sender: TObject);
var i,zap:integer;
begin
 Tprn.Filter:='codbnk=10 and data=null';
 Tprn.Filtered:=True;
 zap:=Tprn.RecordCount;
 Tprn.First;
 for i:=1 to zap do
  begin
   Tprn.Edit;
   Tprn.FieldValues['data']:=Date();
   Tprn.Next;
  end;
  Tprn.Filtered:=false;
end;


end.
