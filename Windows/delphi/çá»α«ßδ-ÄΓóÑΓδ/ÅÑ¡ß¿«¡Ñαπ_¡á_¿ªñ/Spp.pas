unit Spp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, Grids, DBGrids,Printers, RpCon, RpBase, RpSystem,
  RpDefine, RpRave, ADODB;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    DBENampns: TDBEdit;
    BBPrint: TBitBtn;
    LbPEN: TLabel;
    LbSUM: TLabel;
    BBEdit: TBitBtn;
    MMVD: TMemo;
    LbCPO: TLabel;
    Memo2: TMemo;
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
    DBEind: TDBEdit;
    Label1: TLabel;
    Mem: TMemo;
    CBrod: TCheckBox;
    CBtrud: TCheckBox;
    CBobz: TCheckBox;
    CBuch: TCheckBox;
    CBPF: TCheckBox;
    CBPFr: TCheckBox;
    MemBox: TMemo;
    Rv: TRvProject;
    RvSystem1: TRvSystem;
    Lbrod: TLabel;
    Lbtrud: TLabel;
    Lbobz: TLabel;
    Much: TMemo;
    MPFot: TMemo;
    MPFr: TMemo;
    Mins: TMemo;
    Con: TRvCustomConnection;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    DBMemo1: TDBMemo;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure ConOpen(Connection: TRvCustomConnection);
    procedure ConGetCols(Connection: TRvCustomConnection);
    procedure ConGetRow(Connection: TRvCustomConnection);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExampl: TfmExampl;
  i:integer;
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
 if CBrod.Checked then MemBox.Lines.Append(Lbrod.caption);
 if CBtrud.Checked then MemBox.Lines.Append(Lbtrud.caption);
 if CBobz.Checked then MemBox.Lines.Append(Lbobz.caption);
 if CBPF.Checked then MemBox.Lines.AddStrings(MPFot.Lines);
 if CBPFr.Checked then MemBox.Lines.AddStrings(MPFr.Lines);
 if CBuch.Checked then MemBox.Lines.AddStrings(Much.Lines);
 if Mem.Lines.Count>0 then MemBox.Lines.AddStrings(Mem.Lines);
 MemBox.Lines.AddStrings(Mins.Lines);
 RV.SetParam('nampns',ADOcart['nampns']);
 RV.SetParam('adr',ADOcart['adres']);
 //try RV.SetParam('adr2',ADOcart['adres2']);
 //except
 //end;
 RV.SetParam('delo',ADOcart['delo']);
 RV.Open;
 RV.Execute;
 RV.ClearParams;
 MemBox.Clear;
 edinput.SetFocus;
end;

procedure TfmExampl.BBEditClick(Sender: TObject);
begin
 Mem.Width:=625;
 Mem.SetFocus;
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
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;
procedure TfmExampl.ConOpen(Connection: TRvCustomConnection);
begin
 Con.DataRows:=MemBox.Lines.Count;
 i:=0;
end;

procedure TfmExampl.ConGetCols(Connection: TRvCustomConnection);
begin
 Con.WriteField('stroka',dtString,80,'stroka','');
end;

procedure TfmExampl.ConGetRow(Connection: TRvCustomConnection);
begin
 if MemBox.Lines.Count >= i
 then Con.WriteStrData('', MemBox.Lines[i]);
 Inc(i);
end;

end.
