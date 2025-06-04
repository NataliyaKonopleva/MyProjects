unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons, jpeg;

type
  TFmPer = class(TForm)
    DataSource1: TDataSource;
    Tp: TTable;
    Tbnk: TTable;
    DataSource2: TDataSource;
    Treg: TTable;
    ToolBar1: TToolBar;
    TB1: TToolButton;
    TB2: TToolButton;
    TB3: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    P1: TPanel;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    Breg: TButton;
    Tproch: TTable;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    N3: TMenuItem;
    Label7: TLabel;
    CBbnk: TComboBox;
    CBVip: TComboBox;
    CBdok: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MEnom: TMaskEdit;
    Label5: TLabel;
    Efio: TEdit;
    Label6: TLabel;
    MEsum: TMaskEdit;
    Label8: TLabel;
    CBcom: TComboBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    N5: TMenuItem;
    Pfio: TPanel;
    Efio1: TEdit;
    Label9: TLabel;
    Bfio: TButton;
    Pnd: TPanel;
    Enom: TEdit;
    Label10: TLabel;
    Bnd: TButton;
    ToolButton4: TToolButton;
    Pprn: TPanel;
    Label11: TLabel;
    CBbnk1: TComboBox;
    Label12: TLabel;
    CBvip1: TComboBox;
    Label13: TLabel;
    MEnpp: TMaskEdit;
    Button1: TButton;
    ToolButton5: TToolButton;
    PM2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure TB2Click(Sender: TObject);
    procedure BregClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BndClick(Sender: TObject);
    procedure TB3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ConOpen(Connection: TRvCustomConnection);
    procedure ConGetRow(Connection: TRvCustomConnection);
    procedure ConGetCols(Connection: TRvCustomConnection);
    procedure MEnomDblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPer: TFmPer;

implementation

{$R *.dfm}

procedure TFmPer.FormActivate(Sender: TObject);
begin
 try
 if not FileExists('F:\DATA\BNKREG.MDX') then
  begin
   Treg.AddIndex('data','data',[]);
   Treg.AddIndex('codb','codbnk',[]);
   Treg.AddIndex('fio','fam',[]);
   Treg.AddIndex('nd','nomdok',[]);
  end;
 except on E: EDataBaseError do ShowMessage('Ошибка!Проверьте индексы.');
 end;
 try
  Treg.Open;
 except on E: EDataBaseError do ShowMessage('Документы в банки пакуются в конверты.Попробуйте позже!');
 end;
 Tbnk.Open;
 try
 if not FileExists('F:\DATA\CART.MDX') then
  tp.AddIndex('cart2','nampns',[ixExpression]);
  tp.IndexName:='cart2';
  tp.Open;
 except
 on E: EDBEngineError do ShowMessage('Ошибка при открытии базы');
 end;
 tp.Filter:='vidpns<>3';
 tp.Filtered:=true;
end;

procedure TFmPer.N2Click(Sender: TObject);
begin
 Treg.Filtered:=false;
 Treg.IndexName:='data';
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Tp.Close;
 Tbnk.Close;
 Treg.Close;
end;
procedure TFmPer.N1Click(Sender: TObject);
begin
 Treg.Filtered:=false;
 Treg.IndexName:='codb';
end;

procedure TFmPer.TB2Click(Sender: TObject);
begin
 Treg.Filtered:=false;
 CBbnk.Text:=CBbnk.Items[0];
 CBvip.Text:='';
 CBdok.Text:='';
 MEnom.Text:='';
 MEsum.Text:='';
 CBcom.Text:='';
 P1.Visible:=true;
end;

procedure TFmPer.BregClick(Sender: TObject);
var sum:real;
    cb,cv:integer;
begin
 cb:=1;
 cv:=0;
 if (CBbnk.Text='') or (CBvip.Text='')or(CBdok.Text='')or(MEnom.Text='')or(Efio.Text='')
 then
  begin
   ShowMessage('Вы не заполнили все требуемые поля');
   exit;
  end;
 try
  sum:=StrToFloat(Trim(MEsum.Text));
 except
  sum:=0;
 end;
 case CBbnk.ItemIndex of
 0: cb:=1;
 1: cb:=2;
 2: cb:=3;
 3: cb:=8;
 4: cb:=10;
 end;
 cv:=CBvip.ItemIndex+1;
 Treg.AppendRecord([Treg.RecordCount+1,cb,cv,CBdok.Text,MEnom.Text,sum,Efio.Text,CBcom.Text,date(),0,CBbnk.Text,CBvip.Text]);
end;


procedure TFmPer.N3Click(Sender: TObject);
begin
 Treg.Filtered:=false;
 Pfio.Visible:=true;
 Efio1.SetFocus;
end;

procedure TFmPer.BfioClick(Sender: TObject);
begin
 Treg.IndexName:='fio';
 if not Treg.Locate('fam',trim(EFIO1.Text),[loCaseinsensitive,loPartialKey])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Нет такого пенсионера!');
  end;
 Pfio.Visible:=false;
end;

procedure TFmPer.N5Click(Sender: TObject);
begin
 Treg.Filtered:=false;
 Pnd.Visible:=true;
 Enom.SetFocus;
end;

procedure TFmPer.BndClick(Sender: TObject);
begin
 Treg.IndexName:='nd';
 if not Treg.Locate('nomdok',Trim(Enom.Text),[loCaseinsensitive,loPartialKey])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Нет такого документа!');
  end;
 Pnd.Visible:=false;
end;

procedure TFmPer.TB3Click(Sender: TObject);
begin
 Treg.Filtered:=false;
 Pprn.Visible:=true;
end;

procedure TFmPer.Button1Click(Sender: TObject);
var cb,cv:integer;
begin
 Pprn.Visible:=false;
 case CBbnk1.ItemIndex of
 0: cb:=1;
 1: cb:=2;
 2: cb:=3;
 3: cb:=8;
 4: cb:=10;
 end;
 cv:=CBvip1.ItemIndex+1;
 Treg.Filter:='codbnk='+IntToStr(cb)+' and codv='+IntToStr(cv)+' and Npp>'+Trim(MEnpp.Text);
 Treg.Filtered:=true;
 //if Treg.RecordCount=100 then накопилось на 2 стр.
 RV.SetParam('codv',CBvip1.Items[cv-1]);
 RV.SetParam('codbnk',Treg['nambnk']);
 RV.Open;
 RV.Execute;
 RV.Close;
 Treg.Filtered:=false;
end;

procedure TFmPer.ConOpen(Connection: TRvCustomConnection);
begin
 Con.DataRows:=Treg.RecordCount;
 Treg.First;
end;

procedure TFmPer.ConGetCols(Connection: TRvCustomConnection);
begin
 Con.WriteField('data',dtString,10,'data','');
 Con.WriteField('npp',dtString,6,'npp','');
 Con.WriteField('fam',dtString,40,'fam','');
 Con.WriteField('dok',dtString,15,'dok','');
 Con.WriteField('nom',dtString,15,'nom','');
 Con.WriteField('sum',dtString,9,'sum','');
 Con.WriteField('tema',dtString,20,'tema','');
end;

procedure TFmPer.ConGetRow(Connection: TRvCustomConnection);
var vid:string;
begin
   Con.WriteStrData('',DateToStr(Treg['data']));
   Con.WriteStrData('',IntToStr(Treg['npp']));
   Con.WriteStrData('',Treg['fam']);
   Con.WriteStrData('',Treg['dok']);
   Con.WriteStrData('',Treg['nomdok']);
   Con.WriteStrData('',FloatToStrF(Treg['summa'],ffFixed,9,2));
   try
    Con.WriteStrData('',Treg['tema']);
   except
    Con.WriteStrData('',' ');
   end;
   Treg.Next;
end;

procedure TFmPer.MEnomDblClick(Sender: TObject);
begin
if Tp.Locate('delo',StrToInt(Trim(MEnom.Text)),[])
then Efio.Text:=Copy(Tp['nampns'],1,Pos(' ',Tp['nampns']))+'48/'+MEnom.Text;
end;

procedure TFmPer.MenuItem1Click(Sender: TObject);
begin
 Treg.Filter:='otpr=0';
 Treg.Filtered:=true;
 Treg.IndexName:='codb';
end;

procedure TFmPer.MenuItem2Click(Sender: TObject);
begin
 Treg.Filter:='otpr=0';
 Treg.Filtered:=true;
 Treg.IndexName:='data';
end;

procedure TFmPer.MenuItem3Click(Sender: TObject);
begin
 Treg.Filter:='otpr=0';
 Treg.Filtered:=true;
 Pfio.Visible:=true;
 Efio1.SetFocus;
end;

procedure TFmPer.MenuItem4Click(Sender: TObject);
begin
 Treg.Filter:='otpr=0';
 Treg.Filtered:=true;
 Pnd.Visible:=true;
 Enom.SetFocus;
end;

end.
