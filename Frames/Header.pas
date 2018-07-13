unit Header;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  THeaderFrame = class(TFrame)
    Line1: TLine;
    RectangleHeader: TRectangle;
    ButtonBack: TButton;
    LabelAppName: TLabel;
    procedure ButtonBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses Main;

procedure THeaderFrame.ButtonBackClick(Sender: TObject);
begin
  TForm(Parent).Close;
end;

end.
