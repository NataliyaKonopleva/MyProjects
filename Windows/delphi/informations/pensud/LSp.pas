unit LSp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, DateUtils, Grids, DBGrids, ADODB;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    BBPrint: TBitBtn;
    LbPEN: TLabel;
    Lbvidpns: TLabel;
    BBEdit: TBitBtn;
    MNACH: TMemo;
    Edinput: TMaskEdit;
    Lboutput: TLabel;
    PFIO: TPanel;
    Label3: TLabel;
    BBOk: TBitBtn;
    BBNo: TBitBtn;
    PFIO1: TPanel;
    LbFIO: TLabel;
    EditFIO: TEdit;
    BBFIO: TBitBtn;
    DBFIO: TDBGrid;
    Lbpd: TLabel;
    Lbzv: TLabel;
    Lbcodrnk: TLabel;
    Lbdata: TLabel;
    LbNampns: TLabel;
    EDatbst: TEdit;
    Lbpnsapp: TLabel;
    Lbdelo: TLabel;
    LbUVD: TLabel;
    LbUv: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Lbgr: TLabel;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure Showpen(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
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

procedure TfmExampl.Showpen(Sender: TObject);
 var s:string;
     cr:integer;
begin
  Lbdelo.caption:=ADOcart['delo'];
  LbNampns.Caption:=ADOcart['nampns'];
  EDatbst.Text:=ADOcart['datbst'];
  try
   Lbpnsapp.Caption:='c '+DateToStr(ADOcart['pnsapp'])+' г.';
  except
  end;
  s:='рядовой      ефрейтор     мл.сержант   сержант      ст.сержант   старшина     прапорщик    ст.прапорщик мл.лейтенант лейтенант    ст.лейтенант капитан      майор        подполковник полковник    генерал-майор';
  cr:=ADOcart['codrnk'];
  lbcodrnk.Caption:=copy(s,((cr-1)*13+1),13);
  case ADOcart['vidpns'] of
  1: Lbvidpns.Caption:='за выслугу лет';
  2: Lbvidpns.Caption:='по инвалидности';
  4: Lbvidpns.Caption:='по потере кормильца';
  end;
end;

procedure TfmExampl.FormActivate(Sender: TObject);
begin
 Edinput.SetFocus;
 Lbdata.Caption:=DateToStr(date());
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOcart.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 panel1.Visible:=false;
 Print;
 panel1.Visible:=True;
 edinput.SetFocus;
 PFIO.Visible:=true;
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
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 edinput.Text:=ADOcart['delo'];
 Showpen(sender);
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

end.



