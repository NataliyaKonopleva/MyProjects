unit nalu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,SudU;

type
  TFmNal = class(TFmPer)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmNal: TFmNal;

implementation

{$R *.dfm}

procedure TFmNal.FormShow(Sender: TObject);
begin
 //if not ((Date()>=StrToDate('01.01.2011')) and (Date()<=StrToDate('28.12.2011')))
 //then FmNal.Close;
end;

end.
