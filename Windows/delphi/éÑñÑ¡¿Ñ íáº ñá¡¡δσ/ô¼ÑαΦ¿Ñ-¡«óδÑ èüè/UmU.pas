unit UmU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,SudU,DateUtils;

type
  TFmum = class(TFmPer)
    procedure FormShow(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmum: TFmum;

implementation

{$R *.dfm}


procedure TFmum.FormShow(Sender: TObject);
begin
 {if YearOf(Date())<>201
 then Fmum.Close;}
end;

end.
