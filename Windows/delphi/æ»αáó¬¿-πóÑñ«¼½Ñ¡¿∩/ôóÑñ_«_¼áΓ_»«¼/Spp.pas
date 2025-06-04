unit Spp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, Grids, DBGrids,Printers, RpBase, RpSystem, RpDefine,
  RpRave;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    DataSource1: TDataSource;
    Table1: TTable;
    DBENampns: TDBEdit;
    BBPrint: TBitBtn;
    LbPEN: TLabel;
    LbSUM: TLabel;
    Lbvidpns: TLabel;
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
    DBEDelo1: TDBEdit;
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
    DBEadres1: TDBEdit;
    DBEadres2: TDBEdit;
    DBEind: TDBEdit;
    ESum: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edata: TEdit;
    Label5: TLabel;
    Rv: TRvProject;
    RvSystem1: TRvSystem;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
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
  try
   try
    if not table1.Locate('delo',StrToFloat(Trim(edinput.text)),[])
     then
      begin
       MessageBeep(MB_OK);
       ShowMessage('Номер дела не существует!');
       edinput.SetFocus;
      end;
   except on E: EConvertError
   do begin
       ShowMessage('Вы выполнили некорректное действие.');
       ShowMessage('Наберите номер дела или ФИО и нажмите "Найти".');
      end;
   end;
  except on E: EDatabaseError
  do ShowMessage('Ошибка поиска');
  end;
 Editred.Text:='';
end;
procedure TfmExampl.FormActivate(Sender: TObject);
begin
 try
  if not FileExists('F:\DATA\CART.MDX') then
   table1.AddIndex('cart2','nampns',[ixExpression]);
  table1.IndexName:='cart2';
  table1.Open;
  except
  on E: EDBEngineError do ShowMessage('Ошибка при открытии базы');
 end;
 table1.Filter:='vidpns<>3 and codlea=0';
 table1.Filtered:=True;
 edinput.SetFocus;
 Lbdata.Caption:=DateToStr(date());
 Edata.Text:=DateToStr(date());
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  table1.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 RV.Open;
 RV.SetParam('delo',DBEDelo1.Text);
 RV.SetParam('nampns',DBENampns.Text);
 RV.SetParam('adres1',DBEadres1.Text);
 RV.SetParam('adres2',DBEadres2.Text);
 RV.SetParam('red',EditRed.Text);
 RV.SetParam('ind',DBEind.Text);
 RV.SetParam('sum',Esum.Text);
 RV.SetParam('data',Edata.Text+' г.');
 RV.ExecuteReport('Report5');
 RV.ClearParams;
 PFIO.Visible:=True;
 edinput.SetFocus;
end;

procedure TfmExampl.BBEditClick(Sender: TObject);
begin
 DBENampns.SetFocus;
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
   if table1.Locate('nampns',trim(EditFIO.Text),[loCaseinsensitive,loPartialKey])
   then
    begin
     DBFIO.Visible:=true;
     edinput.Text:=table1['delo'];
    end
   else
    begin
     MessageBeep(MB_OK);
     ShowMessage('Такого пенсионера не существует!');
     editFIO.SetFocus;
    end;
   Editred.Text:='';
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 edinput.Text:=table1['delo'];
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;
end.
