unit skl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,SudU, StdCtrls, jpeg, ExtCtrls,DateUtils;

type
  TFmSKL = class(TFmPer)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmSKL: TFmSKL;

implementation

{$R *.dfm}

procedure TFmSKL.FormShow(Sender: TObject);
begin
 {if YearOf(Date())<>2012
 then FmSkl.Close;}
end;

end.
