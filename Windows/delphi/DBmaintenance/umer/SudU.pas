unit SudU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ToolWin, ComCtrls, Menus, StdCtrls, Mask, ExtCtrls,
  DBCtrls, Grids, DBGrids, RpBase, RpSystem, RpDefine, RpRave, RpCon,
  RpFiler, RpRender, RpRenderRTF, Buttons,DateUtils, ADODB,Upens3,Upens1,Urit,
  Upam,UOt,Upos,Upfr;

type
  TFmPer = class(TForm)
    ToolBar1: TToolBar;
    TB1: TToolButton;
    TB2: TToolButton;
    TB3: TToolButton;
    TB4: TToolButton;
    Pdan: TPanel;
    DB: TDBGrid;
    RV: TRvProject;
    RvSystem1: TRvSystem;
    Con: TRvCustomConnection;
    B1pens: TButton;
    Pdelo: TPanel;
    Lbel4: TLabel;
    MEdelo1: TMaskEdit;
    Bfound: TBitBtn;
    Pfio: TPanel;
    Label4: TLabel;
    Efio: TEdit;
    Bfio: TBitBtn;
    Ezvan: TEdit;
    Bprn: TButton;
    Bkor: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    ADOCon: TADOConnection;
    ADOum: TADOTable;
    DataSource5: TDataSource;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ADOcart: TADOTable;
    Label7: TLabel;
    Edata: TEdit;
    Label8: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Pknop: TPanel;
    Pvipl: TPanel;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Evet: TEdit;
    Label16: TLabel;
    DBES3: TDBEdit;
    DBED3: TDBEdit;
    DBES1: TDBEdit;
    DBED1: TDBEdit;
    DBESR: TDBEdit;
    DBEDR: TDBEdit;
    DBESP: TDBEdit;
    DBEDP: TDBEdit;
    DBEfam: TDBEdit;
    DBEdelo: TDBEdit;
    DBEnampst: TDBEdit;
    DBEnad: TDBEdit;
    DBEitgpns: TDBEdit;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEstuv: TDBEdit;
    DBESpos: TDBEdit;
    Edpos: TMaskEdit;
    Lb3: TLabel;
    Lb1: TLabel;
    Lbr: TLabel;
    Lbp: TLabel;
    Epens: TEdit;
    Brit: TButton;
    Bpam: TButton;
    Evv: TEdit;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    Label19: TLabel;
    ADObank: TADOTable;
    DataSource1: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PM2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    Animate1: TAnimate;
    PM3: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    Psum: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    MEds: TMaskEdit;
    MEs: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    Lbsum: TLabel;
    Bpos: TButton;
    PM4: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N7: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BfoundClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BfioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB1Click(Sender: TObject);
    //procedure ADOumAfterScroll(DataSet: TDataSet);
    procedure BkorClick(Sender: TObject);
    procedure EpensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEitgpnsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBES3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBED3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBES1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBED1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBESRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEDRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBESPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBESposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEDPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EvvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprnClick(Sender: TObject);
    procedure B1pensClick(Sender: TObject);
    procedure BritClick(Sender: TObject);
    procedure BpamClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ADOumAfterScroll(DataSet: TDataSet);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BposClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  //  procedure ADOumFilterRecord(DataSet: TDataSet; var Accept: Boolean);
   
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
 {AssignFile(F,'F:\DATA\config.txt');
 Reset(F);
 Readln(F,S);
 ADOcon.ConnectionString:=S;
 ADOcon.Connected:=true;}
 try
  ADOum.Open;
 except
 ShowMessage('Ошибка при открытии базы POSPOGR');
 end;
 ADOum.Sort:='delowib';
 ADOum.Last;
 try
  ADObank.Open;
 except
 ShowMessage('Ошибка при открытии базы BANK');
 end; 
 DB.SetFocus;
end;

procedure TFmPer.N1Click(Sender: TObject);
begin
 Pdelo.Visible:=true;
 MEdelo1.SetFocus;
end;

procedure TFmPer.BfoundClick(Sender: TObject);
begin
  if not ADOum.Locate('delo',MEdelo1.Text,[])
     then
      begin
       ShowMessage('Нет такого пенсионера!');
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
 ADOum.IndexFieldNames:='fam';
 if not ADOum.Locate('fam',trim(EFIO.Text),[loCaseinsensitive,loPartialKey])
 then
  begin
   MessageBeep(MB_OK);
   ShowMessage('Нет такого пенсионера!');
  end;
 Pfio.Visible:=false;
end;

procedure TFmPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ADOum.Close;
 //ADOcart.Close;
 ADObank.Close;
end;

procedure TFmPer.TB1Click(Sender: TObject);
begin
 try
  ADOcart.Open;
 except
  ShowMessage('Ошибка при открытии базы CART');
 end;
 ADOcart.Filter:='vidpns<>3 and codlea=1';
 ADOcart.Filtered:=true;
 ADOcart.First;
 while not ADOcart.Eof do
  begin
   try
    Animate1.Visible:=true;
    Animate1.Active:=true;
   except end; 
   if not ADOum.Locate('delo;datar',VarArrayOf([ADOcart['delo'],ADOcart['datbst']]),[])
 {ADOum.Locate('delo',ADOcart['delo'],[])}
   then
    begin
     //ADOum.Last;
     ADOum.AppendRecord([ADOcart['delo'],ADOcart['nampns'],ADOcart['datbst'],ADOcart['mstslb'],ADOcart['codrnk'],ADOcart['catrnk'],ADOcart['nampst'],ADOcart['artdis'],ADOcart['vidpns'],ADOcart['grpinv'],ADOcart['catinv'],ADOcart['stat45'],ADOcart['wslkal'],ADOcart['wsllgt'],ADOcart['wslnad'],ADOcart['wslsta'],ADOcart['itgpns'],ADOcart['begpay'],ADOcart['pnsapp'],ADOcart['codbnk'],ADOcart['datdea'],ADOcart['adres1'],ADOcart['adres2'],null,null,null,null,null,null,(ADOcart['itgpns']*3)]);
    end;
   ADOcart.Next;
  end;
  Animate1.Visible:=false;
  ADOcart.Close;
end;

procedure TFmPer.ADOumAfterScroll(DataSet: TDataSet);
var s:string;
    cr:integer;
begin
  Evv.Text:='';
  Lb1.Caption:='';
  Lb3.Caption:='';
  Lbr.Caption:='';
  Lbp.Caption:='';
 if (ADOum['kodpens']=4) or (Pos('*',ADOum['dolgn'])<>0) then
 begin
  DBEnampst.Text:='Пенсия по случаю потери кормильца.';
  DBEnad.Text:='';
  DBEstuv.Text:='';
  Lb1.Caption:='не положено.';
  Lb3.Caption:='не положено.';
  Lbr.Caption:='не положена.';
  Lbp.Caption:='не положена.';
 end else
 begin
  if ADOum['wslnad']<>null then
  begin
   try
    if (StrToInt(Copy(ADOum['wslnad'],1,2))<20) or ((Pos('б',ADOum['statuv'])=0) and (Pos('е',ADOum['statuv'])=0) and (Pos('ж',ADOum['statuv'])=0) and (Pos('з',ADOum['statuv'])=0))
    then begin
          //Lb3.Caption:='не положено.';
          Lbr.Caption:='не положена.';
          Lbp.Caption:='не положена.';
         end;
   except end;
  end;
  try
   if  (ADOum['wslgt']<>null) or (ADOum['wslgt']<>'  .  .  ') then
   if (StrToInt(Copy(ADOum['wslgt'],1,2))<25) or ((Pos('б',ADOum['statuv'])=0) and (Pos('ж',ADOum['statuv'])=0) and (Pos('з',ADOum['statuv'])=0)) or (ADOum['kodzwan']<13)
   then Lb3.Caption:='не положено.' else Lb1.Caption:='не положено.';
  except end;
 end;
 Edata.Text:='';
 try
  Edata.Text:=DateToStr(ADOum['datar'])+' - '+DateToStr(ADOum['delowib']);
 except end;
 try
 Epens.Text:=DateToStr(ADOum['srwipl1']);
 except end;
 Evet.Text:='';
 if ADOum['uchwoin']<>null then
 begin
  if (Pos('г',ADOum['uchwoin'])<>0) or (Pos('д1',ADOum['uchwoin'])<>0)
  then begin
        Lbr.Caption:='';
        Lbp.Caption:='';
       end;
  if Pos('г1',ADOum['uchwoin'])<>0
  then Evet.Text:='Участник ВОВ.' else
   if (Pos('г4',ADOum['uchwoin'])<>0) or (Pos('г5',ADOum['uchwoin'])<>0)
   then Evet.Text:='Участник боевых действий.' else
    if Pos('д1',ADOum['uchwoin'])<>0
    then Evet.Text:='Служба в тылу.';
  end;
 if ADOum['veter']<>null then
 if (ADOum['veter']='да') or (ADOum['veter']='ДА')
 then begin
       Lbr.Caption:='';
       Lbp.Caption:='';
       Evv.Text:='ДА';
      end; 
 Ezvan.Text:='';
 if ADOum['kodpens']<3 then
 begin
  s:='рядовой      ефрейтор     мл.сержант   сержант      ст.сержант   старшина     прапорщик    ст.прапорщик мл.лейтенант лейтенант    ст.лейтенант капитан      майор        подполковник полковник    генерал-майор';
  cr:=ADOum['kodzwan'];
  Ezvan.Text:=copy(s,(cr-1)*13+1,13);
 end;
 Edpos.Text:='';
 if ADOum['datpens_2']<>null then Edpos.Text:=DateToStr(ADOum['datpens_2']);
end;

procedure TFmPer.BkorClick(Sender: TObject);
begin
 Epens.ReadOnly:=false;
 DBEitgpns.ReadOnly:=false;
 DBEspos.ReadOnly:=false;
 Edpos.ReadOnly:=false;
 if ADOum['kodpens']<>4 then
 begin
  DBEs3.ReadOnly:=false;
  DBEd3.ReadOnly:=false;
  DBEs1.ReadOnly:=false;
  DBEd1.ReadOnly:=false;
  DBEsr.ReadOnly:=false;
  DBEdr.ReadOnly:=false;
  DBEsp.ReadOnly:=false;
  DBEdp.ReadOnly:=false;
 end;
 Epens.SetFocus;
end;

procedure TFmPer.EpensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if Epens.Modified then
   begin
    ADOum.Edit;
    ADOum.FieldValues['srwipl1']:=StrToDate(Epens.Text);
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!'); end;
   end;
   Epens.ReadOnly:=true;
   DBEitgpns.SetFocus;
  end;
end;

procedure TFmPer.DBEitgpnsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
   if DBEitgpns.Modified then
   begin
    DBESpos.Text:=FloatToStr(StrToFloat(DBEitgpns.Text)*3);
    ADOum.Edit;
    ADOum.FieldValues['itpens']:=StrToFloat(DBEitgpns.Text);
    ADOum.FieldValues['pens_2']:=StrToFloat(DBESpos.Text);
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!'); end;
   end;
   DBEitgpns.ReadOnly:=true;
   DBEspos.SetFocus;
  end;
end;

procedure TFmPer.EdposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if Edpos.Modified then
    if Trim(Edpos.Text)<>'' then
     begin
      ADOum.Edit;
      try ADOum.FieldValues['datpens_2']:=StrToDate(Edpos.Text);
      except
       begin
        ShowMessage('Некорректный ввод даты!Правильно:01.01.2009');
        Exit;
       end;
      end;
      try
       ADOum.Post;
      except ShowMessage('Блокировка данных!'); end;
     end;
   Edpos.ReadOnly:=true;
   DBEs3.SetFocus;
  end;
end;

procedure TFmPer.DBES3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if (DBEs3.Modified) then
   begin
    ADOum.Edit;
    if Trim(DBEs3.Text)<>''
    then
     begin
      try ADOum.FieldValues['pens_3']:=StrToFloat(DBEs3.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['pens_3']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!'); end;
   end;
   DBEs3.ReadOnly:=true;
   DBEd3.SetFocus;
  end;
end;

procedure TFmPer.DBED3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if DBEd3.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEd3.Text)<>''
    then
     begin
      try ADOum.FieldValues['datpens_3']:=StrToDate(DBEd3.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['datpens_3']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!'); end;
   end;
   DBEd3.ReadOnly:=true;
   DBEs1.SetFocus;
  end;
end;

procedure TFmPer.DBES1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if DBEs1.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEs1.Text)<>''
    then
     begin
      try ADOum.FieldValues['pens_1']:=StrToFloat(DBEs1.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['pens_1']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!'); end;
   end;
   DBEs1.ReadOnly:=true;
   DBEd1.SetFocus;
  end;
end;

procedure TFmPer.DBED1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if DBEd1.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEd1.Text)<>''
    then
     begin
      try ADOum.FieldValues['datpens_1']:=StrToDate(DBEd1.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['datpens_1']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!'); end;
   end;
   DBEd1.ReadOnly:=true;
   DBEsr.SetFocus;
  end;
end;

procedure TFmPer.DBESRKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if DBEsr.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEsr.Text)<>''
    then
     begin
      try ADOum.FieldValues['ritusl']:=StrToFloat(DBEsr.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['ritusl']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!');end;
   end;
   DBEsr.ReadOnly:=true;
   DBEdr.SetFocus;
  end;
end;

procedure TFmPer.DBEDRKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //ADOum.FieldByName('dritusl').EditMask:='00/00/0000;0;';
 if Key=13 then
  begin
   if DBEdr.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEdr.Text)<>''
    then
     begin
      try ADOum.FieldValues['dritusl']:=StrToDate(DBEdr.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['dritusl']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!');end;
   end;
   DBEdr.ReadOnly:=true;
   DBEsp.SetFocus;
  end;
end;

procedure TFmPer.DBESPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if DBEsp.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEsp.Text)<>''
    then
     begin
      try ADOum.FieldValues['memorial']:=StrToFloat(DBEsp.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['memorial']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!');end;
   end;
   DBEsp.ReadOnly:=true;
   DBEdp.SetFocus;
  end;
end;

procedure TFmPer.DBESposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if DBEspos.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEspos.Text)<>''
    then
     begin
      try ADOum.FieldValues['pens_2']:=StrToFloat(DBEspos.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end 
    else ADOum.FieldValues['pens_2']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!');end;
   end;
   DBEspos.ReadOnly:=true;
   Edpos.SetFocus;
  end;
end;

procedure TFmPer.DBEDPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  begin
   if DBEdp.Modified then
   begin
    ADOum.Edit;
    if Trim(DBEdp.Text)<>''
    then
     begin
      try ADOum.FieldValues['dmem']:=StrToDate(DBEdp.Text);
      except ShowMessage('Некорректный ввод данных!');
      end;
     end
    else ADOum.FieldValues['dmem']:=null;
    try
     ADOum.Post;
    except ShowMessage('Блокировка данных!');end;
   end;
   DBEdp.ReadOnly:=true;
   Bkor.SetFocus;
  end;
end;

procedure TFmPer.EvvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13
 then
 begin if Trim(AnsiUpperCase(Evv.Text))='ДА'
       then begin
             Lbr.Caption:='';
             Lbp.Caption:='';
             ADOum.Edit;
             ADOum.FieldValues['veter']:=1;
             ADOum.Post;
            end
       else if Trim(AnsiUpperCase(Evv.Text))='НЕТ'
            then begin
                  ADOum.Edit;
                  ADOum.FieldValues['veter']:=0;
                  ADOum.Post;
                 end;
  Bkor.SetFocus;
 end;
end;

procedure TFmPer.BprnClick(Sender: TObject);
begin
 if Lb3.Caption='' then
 begin
  sumpens:=ADOum['itpens'];
  Application.CreateForm(TFm3pens,Fm3pens);
  Fm3pens.Show;
  Fm3pens.SetFocus;
  Fm3pens.Lbfam.Caption:='Семье умершего '+Trim(Ezvan.Text)+'а '+DBEfam.Text+' (п/д 48/'+DBEdelo.Text+')';
  Fm3pens.Lbnampst.Caption:='Последняя должность: '+DBEnampst.Text;
  Fm3pens.Lbfam1.Caption:=DBEfam.Text+' умер '+DateToStr(ADOum['delowib'])+' г. будучи на пенсии.';
  Fm3pens.Lbwsl.Caption:='Льготная выслуга составляет:  '+DBEdit1.Text+'.   Уволен по ст. '+DBEstuv.Text;
  Fm3pens.Ebank.Text:=ADObank['nambnk']+' банк.';
  adrbnk:=ADObank['adres1']+' '+ADObank['adres2'];
  nbnk:=ADObank['nomerb'];
  delo:=ADOum['delo'];
  ADOum.Close;
 end;
end;


procedure TFmPer.B1pensClick(Sender: TObject);
begin
 if Lb1.Caption='' then
  begin
   sumpens1:=ADOum['itpens'];
   Application.CreateForm(TFm1pens,Fm1pens);
   Fm1pens.Show;
   Fm1pens.SetFocus;
   Fm1pens.Lbfam.Caption:='Семье умершего '+Trim(Ezvan.Text)+'а '+DBEfam.Text+' (п/д 48/'+DBEdelo.Text+')';
   Fm1pens.Lbnampst.Caption:='Последняя должность: '+DBEnampst.Text;
   Fm1pens.Lbfam1.Caption:=DBEfam.Text+' умер '+DateToStr(ADOum['delowib'])+' г. будучи на пенсии.';
   Fm1pens.Lbwsl.Caption:='Льготная выслуга составляет:  '+DBEdit1.Text+'.   Уволен по ст. '+DBEstuv.Text;
   Fm1pens.Ebank.Text:=ADObank['nambnk']+' банк.';
   adrbnk1:=ADObank['adres1']+' '+ADObank['adres2'];
   nbnk1:=ADObank['nomerb'];
   delo1:=ADOum['delo'];
   ADOum.Close;
  end;
end;

procedure TFmPer.BritClick(Sender: TObject);
var F:Textfile;
    S1,S2,rmax,S:string;
begin
 if Lbr.Caption='' then
  begin
   rmax:='6000,00';
   AssignFile(F,'F:\DATA\srit.txt');
   Reset(F);
   Read(F,S1);
   while (Not EOF(F)) and (ADOum['delowib']>=StrToDate(Copy(S1,1,10))) do
    begin
     S2:=S1;
     Readln(F,S);
     if Not EOF(F) then
      begin
       Read(F,S1);
       if ADOum['delowib']<StrToDate(Copy(S1,1,10))
        then
         begin
          rmax:=Trim(Copy(S2,12,8));
          //Exit;
         end;
      end else rmax:=Trim(Copy(S2,12,8));
    end;
   CloseFile(F);
   Application.CreateForm(TFmR,FmR);
   FmR.Show;
   FmR.SetFocus;
   FMR.Enampns.Text:=Trim(DBEfam.Text);
   FMR.Edelo.Text:=ADOum['delo'];
   FMR.Lbvet.Text:=Evet.Text;
   FMR.MEmax.Text:=rmax;
   FMR.MEdatbst.Text:=ADOum['datar'];
   FMR.MEdatdea.Text:=ADOum['delowib'];
   FMR.Edolg.Text:=DBEnampst.Text;
   delo2:=ADOum['delo'];
   FMR.Ebank.Text:=ADObank['nambnk']+' банк.';
   adrbnk2:=ADObank['adres1']+' '+ADObank['adres2'];
   nbnk2:=ADObank['nomerb'];
   ADOum.Close;
  end;
end;

procedure TFmPer.BpamClick(Sender: TObject);
begin
 if Lbp.Caption='' then
  begin
   Application.CreateForm(TFmR,FmR);
   FMpam.Show;
   FMpam.SetFocus;
   FMpam.Enampns.Text:=Trim(DBEfam.Text);
   FMpam.Edelo.text:=DBEdelo.Text;
   Fmpam.MEdatbst.text:=DateToStr(ADOum['datar']);
   Fmpam.MEdatdea.text:=DateToStr(ADOum['delowib']);
   FMpam.Lbvet.Text:=Evet.Text;
   Fmpam.Edolg.Text:=DBEnampst.Text;
   delo3:=ADOum['delo'];
   FMpam.Ebank.Text:=ADObank['nambnk']+' банк.';
   adrbnk3:=ADObank['adres1']+' '+ADObank['adres2'];
   nbnk3:=ADObank['nomerb'];
   ADOum.Close;
  end;
end;

procedure TFmPer.N4Click(Sender: TObject);
begin
 Application.CreateForm(TFmOt,FmOt);
 FMOt.Show;
 FMOt.SetFocus;
end;

procedure TFmPer.N5Click(Sender: TObject);
begin
 Psum.Visible:=true;
 Lbsum.Caption:='Ритуальные услуги';
 MEds.SetFocus;
end;

procedure TFmPer.N6Click(Sender: TObject);
begin
 Psum.Visible:=true;
 Lbsum.Caption:='Памятники';
 MEds.SetFocus;
end;

procedure TFmPer.Button2Click(Sender: TObject);
begin
 Psum.Visible:=false;
end;

procedure TFmPer.Button1Click(Sender: TObject);
var F:TextFile;
begin
 if Lbsum.Caption='Ритуальные услуги'
 then AssignFile(F,'F:\DATA\srit.txt')
 else AssignFile(F,'F:\DATA\spam.txt');
 Append(F);
 Writeln(F,MEds.text+' '+FloatToStrF(StrToFloat(MEs.text),ffFixed,8,2));
 CloseFile(F);
end;

procedure TFmPer.BposClick(Sender: TObject);
begin
 Application.CreateForm(TFmpos,Fmpos);
 Fmpos.Show;
 Fmpos.SetFocus;
 Fmpos.fam.text:=DBEfam.Text+'    ('+Edata.Text+')';
 Fmpos.Esum.Text:=DBESpos.Text;
 Fmpos.Esum1.Text:=Fmpam.Perev(StrToFloat(DBESpos.Text));
 bank:=ADObank['nambnk'];
 adrbnkP:=ADObank['adres1']+' '+ADObank['adres2'];
 nbnkP:=ADObank['nomerb'];
 deloP:=ADOum['delo'];
 ADOum.Close;
end;

procedure TFmPer.MenuItem2Click(Sender: TObject);
begin
 Application.CreateForm(TFmpamPF,FmpamPF);
 FmpamPF.Show;
 FmpamPF.SetFocus;
 with FmpamPF do
  begin
   Edelo.SetFocus;
  end;
end;

procedure TFmPer.MenuItem1Click(Sender: TObject);
begin
 Application.CreateForm(TFmRPF,FmRPF);
 FmRPF.Show;
 FmRPF.SetFocus;
 FmRPF.Edelo.SetFocus;
 FmRPF.MEmax.Text:='11000,00';
end;

procedure TFmPer.N7Click(Sender: TObject);
begin
 Application.CreateForm(TFmPF,FmPF);
 FmPF.Show;
 FmPF.SetFocus;
end;

end.
