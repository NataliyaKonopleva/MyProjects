unit Spp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, Grids, DBGrids;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    DataSource1: TDataSource;
    Table1: TTable;
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
    LbCPO: TLabel;
    Memo2: TMemo;
    MNACH: TMemo;
    Lbdata: TLabel;
    Edinput: TMaskEdit;
    Lb48: TLabel;
    DBEDelo1: TDBEdit;
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
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    procedure BBPOLClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
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
  try
   Cursor:=crHourGlass;
   try
    if not table1.Locate('delo',StrToFloat(Trim(edinput.text)),[])
     then
      begin
       MessageBeep(MB_OK);
       ShowMessage('����� ���� �� ����������!');
       edinput.SetFocus;
      end;
   except on E: EConvertError
   do begin
       ShowMessage('�� ��������� ������������ ��������.');
       ShowMessage('�������� ����� ���� ��� ��� � ������� "�����".');
      end;
   end;
  except on E: EDatabaseError
  do ShowMessage('������ ������');
  end;
  Cursor:=crDefault;
  case table1['vidpns'] of
   1: Lbvidpns.Caption:='�� ������� ���';
   2: Lbvidpns.Caption:='�� ������������';
   4: Lbvidpns.Caption:='�� ������ ���������';
  end;
  try
   Epnsapp.Width:=200;
   Epnsapp.Text:=FormatDateTime('dddddd',table1['pnsapp']);
  except
  end;
  Editred.Text:='������� ��� ����������: �����������-'+Copy(table1['wslkal'],1,2)+' ���, ��������-'+Copy(table1['wsllgt'],1,2)+' ���.';
  if not (table1['wslsta']=null)
  then
   Edit1.Text:='������ ������������� �� ����� �������� ���� - '+Copy(table1['wslsta'],1,2)+' ���.';
end;
procedure TfmExampl.FormActivate(Sender: TObject);
begin
 try
  if not FileExists('F:\DATA\CART.MDX') then
   table1.AddIndex('cart2','nampns',[ixExpression]);
  table1.IndexName:='cart2';
  table1.Open;
  except
  on E: EDBEngineError do ShowMessage('������ ��� �������� ����');
 end;
 table1.Filter:='vidpns<>3 and codlea=0';
 table1.Filtered:=True;
 edinput.SetFocus;
 Lbdata.Caption:=DateToStr(date());
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  table1.Close;
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

procedure TfmExampl.BBPOLClick(Sender: TObject);
begin
 //table1.Next;
 table1.Prior;
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
     ShowMessage('������ ���������� �� ����������!');
     editFIO.SetFocus;
    end;
   Editred.Text:='';
   Edit1.Text:='';
   Edit2.Text:='';
   Edit1.Width:=90;
   Edit2.Width:=90;
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 edinput.Text:=table1['delo'];
 case table1['vidpns'] of
  1: Lbvidpns.Caption:='�� ������� ���';
  2: Lbvidpns.Caption:='�� ������������';
  4: Lbvidpns.Caption:='�� ������ ���������';
 end;
 try
  Epnsapp.Width:=160;
  Epnsapp.Text:=FormatDateTime('dddddd',table1['pnsapp']);
 except
 end;
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
 Editred.Text:='������� ��� ����������: �����������-'+Copy(table1['wslkal'],1,2)+' ���, ��������-'+Copy(table1['wsllgt'],1,2)+' ���.';
  if not (table1['wslsta']=null)
  then
   Edit1.Text:='������ ������������� �� ����� �������� ���� - '+Copy(table1['wslsta'],1,2)+' ���.';
end;
procedure TfmExampl.Edit1Change(Sender: TObject);
begin
 Edit1.Width:=593;
end;

procedure TfmExampl.Edit2Change(Sender: TObject);
begin
 Edit2.Width:=593;
end;

end.
