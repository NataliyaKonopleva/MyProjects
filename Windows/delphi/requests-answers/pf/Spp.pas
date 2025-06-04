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
    DBENampns: TDBEdit;
    BBPrint: TBitBtn;
    LbPEN: TLabel;
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
    Lbadres: TLabel;
    DBTadres1: TDBText;
    Label4: TLabel;
    Editreg: TEdit;
    Editreg1: TEdit;
    Editadr1: TEdit;
    Editadr2: TEdit;
    EDellea: TEdit;
    DBTdatbst: TDBText;
    Rv: TRvProject;
    RvSystem1: TRvSystem;
    DataSource1: TDataSource;
    ADOCon: TADOConnection;
    ADOcart: TADOQuery;
    ADObank: TADOQuery;
    DBEadr2: TDBEdit;
    procedure bbFindClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBPrintClick(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    procedure BBFIOClick(Sender: TObject);
    procedure BBOkClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure DBFIODblClick(Sender: TObject);
    procedure Showbank(Sender: TObject);
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
   Showbank(Sender);
end;

procedure TfmExampl.FormActivate(Sender: TObject);
begin
 edinput.SetFocus;
 Lbdata.Caption:=DateToStr(date());
end;

procedure TfmExampl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOCart.Close;
end;

procedure TfmExampl.BBPrintClick(Sender: TObject);
begin
 RV.Open;
 RV.SetParam('delo',DBEDelo1.Text);
 RV.SetParam('reg1',Editreg1.Text);
 RV.SetParam('adr1',Editadr1.Text);
 RV.SetParam('adr2',Editadr2.Text);
 RV.SetParam('nampns',DBENampns.Text);
 RV.SetParam('datbst',DBTdatbst.Caption);
 RV.SetParam('adres1',DBTadres1.Caption);
 RV.SetParam('adres2',DBEadr2.Text);
 RV.SetParam('red',EditRed.Text);
 RV.ExecuteReport('Report4');
 RV.ClearParams;
 PFIO.Visible:=true;
 edinput.SetFocus;
end;

procedure TfmExampl.BBEditClick(Sender: TObject);
begin
 Editred.SetFocus;
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
   ADOCart.Parameters[0].Value:=0.5;
   ADOCart.Parameters[1].Value:=trim(EditFIO.Text)+'%';
   if ADOCart.Active then ADOCart.Close;
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
   PFIO1.Visible:=false;
   DBFIO.Visible:=true;
end;

procedure TfmExampl.DBFIODblClick(Sender: TObject);
begin
 edinput.Text:=FloatToStr(ADOCart['delo']);
 Showbank(Sender);
 PFIO1.Visible:=false;
 DBFIO.Visible:=false;
end;

procedure TfmExampl.Showbank(Sender:TObject);
 begin
   ADObank.Open;
   Editreg1.Text:=ADObank['nampf']+' район';
   Editadr1.Text:=ADObank['adres1'];
   try
    Editadr2.Text:=ADObank['adres2'];
   except
   end;
   ADObank.Close;
 end;
end.
