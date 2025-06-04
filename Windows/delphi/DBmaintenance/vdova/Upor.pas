unit Upor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,Uved, RpBase, RpSystem, RpDefine,
  RpRave, DB, ADODB;

type
  TFmPor = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Button3: TButton;
    Els: TEdit;
    Edelo: TEdit;
    Efam: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Eadr1: TEdit;
    Label6: TLabel;
    Esum: TEdit;
    Esum1: TEdit;
    Ekom: TEdit;
    Edata: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Ruv: TRvProject;
    RvSystem1: TRvSystem;
    Ebnk: TComboBox;
    Eadr2: TEdit;
    ADOCon: TADOConnection;
    ADObank: TADOTable;
    ADOsem: TADOTable;
    Button4: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EbnkChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPor: TFmPor;

implementation

{$R *.dfm}

procedure TFmPor.Button3Click(Sender: TObject);
begin
 Esum1.Text:=FmUv.Perev(StrToFloat(Copy(Esum.Text,1,Pos('руб.',Trim(Esum.Text))-1)));
end;

procedure TFmPor.Button1Click(Sender: TObject);
begin
 Els.SetFocus;
end;

procedure TFmPor.Button2Click(Sender: TObject);
begin
 Ruv.Open;
 Ruv.ClearParams;
 Ruv.SetParam('ls',Els.Text);
 Ruv.SetParam('delo','48/'+Trim(Edelo.Text));
 Ruv.SetParam('fam',Efam.Text);
 Ruv.SetParam('bnk',Label4.Caption);
 Ruv.SetParam('adr2',Label5.Caption);
 Ruv.SetParam('sum',Copy(Esum.Text,1,Pos('руб.',Esum.Text)-1));
 if Length(Esum1.Text)>48
 then
  begin
   Ruv.SetParam('sum1',Copy(Esum1.Text,1,Pos('РУБЛ',Esum1.Text)-1));
   Ruv.SetParam('sum2',Copy(Esum1.Text,Pos('РУБЛ',Esum1.Text),13));
  end
 else Ruv.SetParam('sum1',Esum1.Text);
 Ruv.SetParam('kom',Ekom.Text);
 if Trim(Edelo.Text)='б/н'
 then Ruv.ExecuteReport('Rpor1')
 else Ruv.ExecuteReport('Rpor');
 Ruv.Close;
end;

procedure TFmPor.EbnkChange(Sender: TObject);
var i:integer;
begin
 //ADOcon.Open;
 ADObank.Open;
 case Ebnk.ItemIndex of
 0: i:=1;
 1: i:=2;
 2: i:=8;
 3: i:=10;
 end;
 if  ADObank.Locate('codbnk',i,[])
  then
    begin
     Eadr1.Text:=ADObank['nomerb'];
     Eadr2.Text:=ADObank['adres1']+' '+ADObank['adres2'];
    end
   else ShowMessage('Ошибка поиска в базе банков!');
  //ADOcon.Close;
end;

procedure TFmPor.FormActivate(Sender: TObject);
begin
 ADOcon.Open;
 ADOsem.Open;
 ADOsem.First;
 ADObank.Open;
 ADObank.First;
 Ebnk.Text:='Ярославский банк';
 Eadr1.Text:=ADObank['nomerb'];
 Eadr2.Text:=ADObank['adres1']+' '+ADObank['adres2'];
 Efam.Text:=ADOsem['nampns'];
 Els.Text:='Деньги перечислить на л/счет № '+ADOsem['ls']+' в отделение СБ № '+ADOsem['nb'];
end;

procedure TFmPor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOsem.Close;
end;

procedure TFmPor.Button4Click(Sender: TObject);
begin
 ADOsem.Next;
 Efam.Text:=ADOsem['nampns'];
  Els.Text:='Деньги перечислить на л/счет № '+ADOsem['ls']+' в отделение СБ № '+ADOsem['nb'];
end;

end.
