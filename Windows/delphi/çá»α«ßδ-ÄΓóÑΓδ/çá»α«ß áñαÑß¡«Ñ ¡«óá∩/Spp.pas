unit Spp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  QuickRpt, QRCtrls, Grids, DBGrids, Printers, RpBase, RpSystem, RpDefine,
  RpRave, ADODB;

type
  TfmExampl = class(TForm)
    Panel1: TPanel;
    bbFind: TBitBtn;
    bbclose: TBitBtn;
    BBPrint: TBitBtn;
    Edinput: TMaskEdit;
    Lboutput: TLabel;
    DBFIO: TDBGrid;
    Editreg: TEdit;
    Editreg1: TEdit;
    EDellea: TEdit;
    Rv: TRvProject;
    RvSystem1: TRvSystem;
    Memo: TMemo;
    Editadr1: TEdit;
    Editadr2: TEdit;
    Epen: TEdit;
    Label1: TLabel;
    Editfio: TEdit;
    BBfio: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure Showpen(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExampl: TfmExampl;

implementation

{$R *.dfm}

procedure TfmExampl.Showpen(Sender: TObject);
begin
  Memo.Lines.Append('- '+ADOcart['nampns']+', '+DateToStr(ADOcart['datbst'])+' г.р.');
  Edinput.SetFocus;
end;
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

procedure TfmExampl.FormActivate(Sender: TObject);
begin
 edinput.SetFocus;
 Memo.Clear;
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOCart.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 Memo.Lines.Append('');
 Memo.Lines.Append('');
 Memo.Lines.Append('');
 Memo.Lines.Append('');
 Memo.Lines.Append('Начальник ЦПО                                                                                      А.В. Сидоров');
 Memo.Lines.Append('');
 Memo.Lines.Append('Ст.инспектор(инспектор)');
 RV.Open;
 RV.SetParam('dellea',Edellea.Text);
 RV.SetParam('Epen',Epen.Text);
 RV.SetParam('mem',Memo.Lines.Text);
 RV.ExecuteReport('Report8');
 RV.ClearParams;
 edinput.SetFocus;
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
 Showpen(Sender);
 DBFIO.Visible:=false;
end;

end.
