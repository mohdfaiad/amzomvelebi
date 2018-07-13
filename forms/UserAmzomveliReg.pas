unit UserAmzomveliReg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.StdCtrls, FMX.Ani,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, System.IOUtils,
  System.Threading, IdURI, FMX.Layouts, FMX.TreeView,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, FMX.ListBox, Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.DBScope, Header, FMX.LoadingIndicator,
  System.JSON, Inifiles;

type
  TUserAmzomveliRegForm = class(TForm)
    FullNameEdit: TEdit;
    EmailEdit: TEdit;
    FloatAnimationEmailReg: TFloatAnimation;
    PhoneEdit: TEdit;
    PasswordEdit: TEdit;
    CPasswordEdit: TEdit;
    RegButton: TButton;
    RESTRequestReg: TRESTRequest;
    RESTResponseReg: TRESTResponse;
    RectanglePreloader: TRectangle;
    RESTResponseDataSetAdapterReg: TRESTResponseDataSetAdapter;
    FDMemTableAuth: TFDMemTable;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    Timer1: TTimer;
    RectangleConfirmation: TRectangle;
    ButtonConfirmation: TButton;
    EditConfirmation: TEdit;
    LabelConfirmation: TLabel;
    HeaderFrame1: THeaderFrame;
    StyleBook1: TStyleBook;
    ImageSignUp: TImage;
    VertScrollBox1: TVertScrollBox;
    procedure RegButtonClick(Sender: TObject);
    procedure RESTRequestLocationDetailsAfterExecute
      (Sender: TCustomRESTRequest);
    procedure RESTRequestRegAfterExecute(Sender: TCustomRESTRequest);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    function equalPassword(pass1, pass2: string): boolean;
    { Private declarations }
  public
    { Public declarations }
    v_detailRequestId: integer;
    locationsSL, locationsSLDetails: TStringList;
    procedure initForm;
  end;

var
  UserAmzomveliRegForm: TUserAmzomveliRegForm;

implementation

{$R *.fmx}

uses DataModule, Main, UserLocations;

procedure TUserAmzomveliRegForm.ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TUserAmzomveliRegForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TUserAmzomveliRegForm.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    self.Free;
end;

procedure TUserAmzomveliRegForm.initForm;
begin
  self.Show;
  self.HeaderFrame1.LabelAppName.Text := 'ამზომველის რეგისტრაცია';
  // self.RectanglePreloader.Visible := True;
end;

function TUserAmzomveliRegForm.equalPassword(pass1, pass2: string): boolean;
begin
  if pass1.Equals(pass2) then
  begin
    Result := True;
  end
  else
  begin
    PasswordEdit.FontColor := TAlphaColors.Red;
    Result := False;
  end;
end;

procedure TUserAmzomveliRegForm.RegButtonClick(Sender: TObject);
var
  password: string;
  aTask: ITask;
begin
  self.RectanglePreloader.Visible := True;
  aTask := TTask.Create(
    procedure()
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          { if self.checkEmailPass(EmailEdit.Text, password, 'signup') = False then
            begin
            ShowMessage('ელ. ფოსტის ფორმატი არ არის სწორი!');
            exit;
            end; }

          if self.equalPassword(PasswordEdit.Text, CPasswordEdit.Text) = True
          then
            password := PasswordEdit.Text
          else
          begin
            ShowMessage('პაროლები არ ემთხვევა ერთმანეთს!');
            exit;
          end;
          RESTRequestReg.Params.Clear;
          with RESTRequestReg.Params.AddItem do
          begin
            name := 'user_type_id';
            Value := '2'
          end;
          with RESTRequestReg.Params.AddItem do
          begin
            name := 'full_name';
            Value := TIdURI.ParamsEncode(FullNameEdit.Text);
          end;
          with RESTRequestReg.Params.AddItem do
          begin
            name := 'email';
            Value := TIdURI.ParamsEncode(EmailEdit.Text);
          end;
          with RESTRequestReg.Params.AddItem do
          begin
            name := 'phone';
            Value := PhoneEdit.Text;
          end;
          with RESTRequestReg.Params.AddItem do
          begin
            name := 'password';
            Value := password;
          end;
          RESTRequestReg.Execute;
        end);
    end);
  aTask.Start;
end;

procedure TUserAmzomveliRegForm.RESTRequestLocationDetailsAfterExecute
  (Sender: TCustomRESTRequest);
begin
  RectanglePreloader.Visible := False;
end;

procedure TUserAmzomveliRegForm.RESTRequestRegAfterExecute
  (Sender: TCustomRESTRequest);
var
  jsonObject: TJSONObject;
  msg: string;
  status: integer;
begin
  jsonObject := TJSONObject.ParseJSONValue
    (TEncoding.UTF8.GetBytes(self.RESTResponseReg.Content), 0) as TJSONObject;
  status := jsonObject.GetValue('status').Value.ToInteger;
  msg := jsonObject.GetValue('msg').Value;
  FMXLoadingIndicator1.Visible := False;
  if status = 1 then
  begin
    RectanglePreloader.Visible := False;
    ShowMessage(msg);
    self.Close;
  end
  else if status = 0 then
  begin
    RectanglePreloader.Visible := False;
    ShowMessage(msg);
  end
  else if status = 3 then
  begin
    RectangleConfirmation.Visible := True;
    LabelConfirmation.Text := msg;
  end;
end;

end.
