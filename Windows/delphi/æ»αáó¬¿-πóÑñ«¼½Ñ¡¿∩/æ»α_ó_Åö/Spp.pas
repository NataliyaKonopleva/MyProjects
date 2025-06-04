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
    DBEDelo2: TDBEdit;
    DBENampns: TDBEdit;
    BBPrint: TBitBtn;
    LbSP: TLabel;
    DBEDatbst: TDBEdit;
    LbPEN: TLabel;
    Lbnaz: TLabel;
    Lbvidpns: TLabel;
    EditRed: TEdit;
    BBEdit: TBitBtn;
    MMVD: TMemo;
    Memo2: TMemo;
    MNACH: TMemo;
    Lbdata: TLabel;
    Edinput: TMaskEdit;
    Lb48: TLabel;
    DBEDelo1: TDBEdit;
    Lbcifra: TLabel;
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
    Edit1: TEdit;
    Edit2: TEdit;
    Epnsapp: TEdit;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Showpen(Sender:TObject);
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
  Editred.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';
  Edit1.Width:=90;
  Edit2.Width:=90;
  ADOCart.Parameters[0].Value:=StrToFloat(edinput.Text);
  ADOcart.Parameters[1].Value:='SOS';
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
    edinput.SetFocus;
    Exit;
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
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 panel1.Visible:=false;
 PFIO.Visible:=false;
 Print;
 panel1.Visible:=True;
 PFIO.Visible:=True;
 Epnsapp.Width:=25;
 edinput.SetFocus;
end;

procedure TfmExampl.BBEditClick(Sender: TObject);
begin
 Epnsapp.SetFocus;
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
 except ShowMessage('Ошибка при открытии базы CART');
 end;
 if ADOCart.RecordCount=0
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Нет такого пенсионера в УВД!');
   EditFio.SetFocus;
   Exit;
  end;
 DBFIO.Visible:=true;
 Editred.Text:='';
 Edit1.Text:='';
 Edit2.Text:='';
 Edit1.Width:=90;
 Edit2.Width:=90;
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 edinput.Text:=ADOcart['delo'];
 Showpen(Sender);
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

procedure TfmExampl.Edit1Change(Sender: TObject);
begin
 Edit1.Width:=593;
end;

procedure TfmExampl.Edit2Change(Sender: TObject);
begin
 Edit2.Width:=593;
end;

procedure TfmExampl.Showpen(Sender:TObject);
begin
  case ADOcart['vidpns'] of
   1: Lbvidpns.Caption:='за выслугу лет';
   2: Lbvidpns.Caption:='по инвалидности';
   4: Lbvidpns.Caption:='по потере кормильца';
  end;
  try
   Epnsapp.Width:=200;
   Epnsapp.Text:=FormatDateTime('dddddd',ADOcart['pnsapp']);
  except
  end;
  Editred.Text:='Выслуга лет составляет: календарная-'+Copy(ADOcart['wslkal'],1,2)+' лет, льготная-'+Copy(ADOcart['wsllgt'],1,2)+' лет.';
  if not (ADOcart['wslsta']=null)
  then
   Edit1.Text:='Пенсия выплачивается за общий трудовой стаж - '+Copy(ADOcart['wslsta'],1,2)+' лет.';
end;

end.
