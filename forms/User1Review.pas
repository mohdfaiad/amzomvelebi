unit User1Review;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Header,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TUser1ReviewForm = class(TForm)
    HeaderFrame1: THeaderFrame;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initForm(p_id: integer);
  end;

var
  User1ReviewForm: TUser1ReviewForm;

implementation

{$R *.fmx}

uses DataModule;
{ TUser1ReviewForm }

procedure TUser1ReviewForm.initForm(p_id: integer);
begin
  self.LabelStatusBar.Text := DModule.statusBarTitle;
end;

end.
