unit auth;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.TabControl, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, FMX.Ani,
  System.JSON, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, IdURI,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.DBScope, REST.JSON,
  System.Threading,
  Inifiles,
  System.IOUtils, FMX.Layouts, FMX.LoadingIndicator, Header;

type
  TauthForm = class(TForm)
    EditAuthEmail: TEdit;
    EditAuthPassword: TEdit;
    ButtonAuth: TButton;
    RectangleMain: TRectangle;
    RESTRequestReg: TRESTRequest;
    RESTResponseReg: TRESTResponse;
    RESTRequestAuth: TRESTRequest;
    RESTResponseAuth: TRESTResponse;
    RESTResponseDataSetAdapterAuth: TRESTResponseDataSetAdapter;
    FDMemTableAuth: TFDMemTable;
    EditPhoneNumberForActivation: TEdit;
    ButtonGetActivationCode: TButton;
    EditActivationCode: TEdit;
    FloatAnimation1: TFloatAnimation;
    ButtonSetActivationCode: TButton;
    FloatAnimationEmailAuth: TFloatAnimation;
    Timer1: TTimer;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    TimerAuthProccess: TTimer;
    FDMemTableAuthid: TWideStringField;
    FDMemTableAuthuser_type_id: TWideStringField;
    FDMemTableAuthuser_status_id: TWideStringField;
    FDMemTableAuthfull_name: TWideStringField;
    FDMemTableAuthphone: TWideStringField;
    FDMemTableAuthemail: TWideStringField;
    FDMemTableAuthcreate_date: TWideStringField;
    FDMemTableAuthmodify_date: TWideStringField;
    FDMemTableAuthregipaddr: TWideStringField;
    FDMemTableAuthsesskey: TWideStringField;
    FDMemTableAuthloginstatus: TWideStringField;
    FDMemTableAuthisSetLocations: TWideStringField;
    FDMemTableAuthnotifications: TWideStringField;
    HeaderFrame1: THeaderFrame;
    FloatAnimationPassAuth: TFloatAnimation;
    StyleBookLoginForm: TStyleBook;
    Image1: TImage;
    RectanglePRecovery: TRectangle;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    FMXLoadingIndicatorLogin: TFMXLoadingIndicator;
    Button1: TButton;
    FMXLoadingIndicatorActivationCode: TFMXLoadingIndicator;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    RESTRequestPRecovery: TRESTRequest;
    RESTResponsePRecovery: TRESTResponse;
    RESTRequestLoginPRecovery: TRESTRequest;
    FMXLoadingIndicatorSetActCode: TFMXLoadingIndicator;
    RESTResponseLoginPRecovery: TRESTResponse;
    RESTAdapterLoginPRecovery: TRESTResponseDataSetAdapter;
    FDMemTableLoginPRecovery: TFDMemTable;
    FDMemTableLoginPRecoveryid: TWideStringField;
    FDMemTableLoginPRecoveryuser_type_id: TWideStringField;
    FDMemTableLoginPRecoveryuser_status_id: TWideStringField;
    FDMemTableLoginPRecoveryfull_name: TWideStringField;
    FDMemTableLoginPRecoveryphone: TWideStringField;
    FDMemTableLoginPRecoveryemail: TWideStringField;
    FDMemTableLoginPRecoverycreate_date: TWideStringField;
    FDMemTableLoginPRecoverymodify_date: TWideStringField;
    FDMemTableLoginPRecoveryregipaddr: TWideStringField;
    FDMemTableLoginPRecoverysesskey: TWideStringField;
    FDMemTableLoginPRecoveryloginstatus: TWideStringField;
    FDMemTableLoginPRecoveryisSetLocations: TWideStringField;
    FDMemTableLoginPRecoverynotifications: TWideStringField;
    ButtonGetActCode: TButton;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    procedure ButtonAuthClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure RESTRequestAuthAfterExecute(Sender: TCustomRESTRequest);
    procedure TimerAuthProccessTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FloatAnimationEmailAuthFinish(Sender: TObject);
    procedure FloatAnimationPassAuthFinish(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonGetActivationCodeClick(Sender: TObject);
    procedure ButtonSetActivationCodeClick(Sender: TObject);
    procedure ButtonGetActCodeClick(Sender: TObject);
  private
    function equalPassword(pass1, pass2: string): boolean;
    function checkEmailPass(EmailAddress, password, op: string): boolean;
    function setUserFields: boolean;
    { Private declarations }
  public
    { Public declarations }
    closeAfterReg: boolean;
    isConsole: boolean;
    procedure initForm;
    function consoleAuth(AuthEmail, AuthPassword: string): TFDMemTable;
  end;

var
  authForm: TauthForm;

implementation

{$R *.fmx}

uses DataModule, HelperUnit, Main, UserLocations, SetNewPassword;

procedure TauthForm.Timer1Timer(Sender: TObject);
begin
  FloatAnimationEmailAuth.Enabled := False;
  FloatAnimationPassAuth.Enabled := False;
  EditAuthEmail.FontColor := TAlphaColors.Grey;
end;

procedure TauthForm.RESTRequestAuthAfterExecute(Sender: TCustomRESTRequest);
begin
  self.isConsole := False;
  TimerAuthProccess.Enabled := True;
end;

procedure TauthForm.TimerAuthProccessTimer(Sender: TObject);
var
  Ini: TIniFile;
  id, user_type_id, loginstatus, notifications, isSetLocations: integer;
  full_name, phone, email, sesskey: string;
begin
  TTimer(Sender).Enabled := False;
  FMXLoadingIndicatorLogin.Visible := False;
  if self.isConsole = False then
  begin
    id := FDMemTableAuth.FieldByName('id').AsInteger;
    user_type_id := FDMemTableAuth.FieldByName('user_type_id').AsInteger;
    loginstatus := FDMemTableAuth.FieldByName('loginstatus').AsInteger;
    full_name := FDMemTableAuth.FieldByName('full_name').AsString;
    phone := FDMemTableAuth.FieldByName('phone').AsString;
    email := FDMemTableAuth.FieldByName('email').AsString;
    sesskey := FDMemTableAuth.FieldByName('sesskey').AsString;
    notifications := FDMemTableAuth.FieldByName('notifications').AsInteger;
    isSetLocations := FDMemTableAuth.FieldByName('isSetLocations').AsInteger;
  end
  else if self.isConsole = True then
  begin
    id := FDMemTableLoginPRecovery.FieldByName('id').AsInteger;
    user_type_id := FDMemTableLoginPRecovery.FieldByName('user_type_id')
      .AsInteger;
    loginstatus := FDMemTableLoginPRecovery.FieldByName('loginstatus')
      .AsInteger;
    full_name := FDMemTableLoginPRecovery.FieldByName('full_name').AsString;
    phone := FDMemTableLoginPRecovery.FieldByName('phone').AsString;
    email := FDMemTableLoginPRecovery.FieldByName('email').AsString;
    sesskey := FDMemTableLoginPRecovery.FieldByName('sesskey').AsString;
    notifications := FDMemTableLoginPRecovery.FieldByName('notifications')
      .AsInteger;
    isSetLocations := FDMemTableLoginPRecovery.FieldByName('isSetLocations')
      .AsInteger;
  end;
  if loginstatus = 1 then
  begin
    DModule.id := id;
    DModule.user_type_id := user_type_id;
    DModule.full_name := full_name;
    DModule.phone := phone;
    DModule.email := email;
    DModule.sesskey := sesskey;
    DModule.notifications := notifications;

    // ---------------
    Ini := TIniFile.Create(TPath.Combine(TPath.GetHomePath,
      DModule.settingsIniFile));
    try
      Ini.AutoSave := True;
      Ini.WriteInteger('auth', 'id', DModule.id);
      Ini.WriteInteger('auth', 'user_type_id', DModule.user_type_id);
      Ini.WriteString('auth', 'full_name', DModule.full_name);
      Ini.WriteString('auth', 'phone', DModule.phone);
      Ini.WriteString('auth', 'email', DModule.email);
      Ini.WriteString('auth', 'hash', DModule.sesskey);
      Ini.UpdateFile;
    finally
      Ini.Free;
    end;
    if self.isConsole = True then
    begin
      with TsetNewPasswordForm.Create(Application) do
      begin
        initForm(id);
      end
    end;
    MainForm.DoAuthenticate;
    // ----------------

    if (isSetLocations = 0) and (DModule.user_type_id = 2) then
    begin
      with TUserLocationsForm.Create(Application) do
      begin
        initForm;
      end;
    end;
    self.Close;
  end;
end;

function TauthForm.consoleAuth(AuthEmail, AuthPassword: string): TFDMemTable;
begin
  RESTRequestAuth.Params.Clear;
  with RESTRequestAuth.Params.AddItem do
  begin
    name := 'email';
    Value := AuthEmail;
  end;
  with RESTRequestAuth.Params.AddItem do
  begin
    name := 'password';
    Value := AuthPassword;
  end;
  with RESTRequestAuth.Params.AddItem do
  begin
    name := 'op';
    Value := 'login';
  end;
  RESTRequestAuth.Execute;
  Result := FDMemTableAuth;
end;

procedure TauthForm.Button1Click(Sender: TObject);
begin
  RectanglePRecovery.Visible := True;
  self.HeaderFrame1.LabelAppName.Text := 'პაროლის აღდგენა';
end;

procedure TauthForm.ButtonAuthClick(Sender: TObject);
var
  aTask: ITask;
begin
  if self.checkEmailPass(EditAuthEmail.Text, EditAuthPassword.Text, 'signin') = False
  then
    exit;
  FMXLoadingIndicatorLogin.Visible := True;
  aTask := TTask.Create(
    procedure()
    var
      HelperUnit: THelperUnit;
    begin
      if TOSVersion.Check(6) then
      begin
        HelperUnit := THelperUnit.Create;
        try
          HelperUnit.AndroidCheckAndRequestStatePermission;
        finally
          HelperUnit.Free;
        end;
      end;
      RESTRequestAuth.Params.Clear;
      with RESTRequestAuth.Params.AddItem do
      begin
        name := 'email';
        Value := EditAuthEmail.Text;
      end;
      with RESTRequestAuth.Params.AddItem do
      begin
        name := 'password';
        Value := EditAuthPassword.Text;
      end;
      with RESTRequestAuth.Params.AddItem do
      begin
        name := 'op';
        Value := 'login';
      end;
      RESTRequestAuth.Execute;
    end);
  aTask.Start;
end;

procedure TauthForm.ButtonGetActCodeClick(Sender: TObject);
begin
  if EditPhoneNumberForActivation.Text.Length < 9 then
  begin
    FMXLoadingIndicatorActivationCode.Visible := True;
    RESTRequestPRecovery.Params.Clear;
    RESTRequestPRecovery.AddParameter('code',
      EditPhoneNumberForActivation.Text);
    RESTRequestPRecovery.ExecuteAsync(
      procedure
      begin
        FMXLoadingIndicatorActivationCode.Visible := False;
        if RESTResponsePRecovery.Status.Success then
        begin
          ShowMessage(RESTResponsePRecovery.Content);
        end
        else
        begin
          ShowMessage('მოთხოვნის შესრულების დროს დაფიქსირდა შეცდომა!');
        end;
      end, True, True);
  end
  else
  begin
    ShowMessage('გთხოვთ მიუთითოთ 9 ნიშნა მობილური ტელეფონის ნომერი.');
  end;
end;

procedure TauthForm.ButtonGetActivationCodeClick(Sender: TObject);
begin
  FMXLoadingIndicatorActivationCode.Visible := True;
  RESTRequestPRecovery.Params.Clear;
  RESTRequestPRecovery.AddParameter('code', EditPhoneNumberForActivation.Text);
  RESTRequestPRecovery.ExecuteAsync(
    procedure
    begin
      FMXLoadingIndicatorSetActCode.Visible := False;
      self.isConsole := True;
      self.TimerAuthProccess.Enabled := True;
    end, True, True);
end;

procedure TauthForm.ButtonSetActivationCodeClick(Sender: TObject);
var
  aTask: ITask;
begin
  FMXLoadingIndicatorSetActCode.Visible := True;
  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestLoginPRecovery.Params.Clear;
      RESTRequestLoginPRecovery.AddParameter('code', EditActivationCode.Text);
      RESTRequestLoginPRecovery.Execute;
    end);
  aTask.Start;
end;

function TauthForm.checkEmailPass(EmailAddress, password, op: string): boolean;
// var
// HelperUnit: THelperUnit;
begin
  // HelperUnit := THelperUnit.Create;
  if self.EditAuthEmail.Text.Length < 6 then
  begin
    FloatAnimationEmailAuth.Enabled := True;
    Timer1.Enabled := True;
    self.FMXLoadingIndicatorLogin.Visible := False;
    Result := False;
  end;
  if self.EditAuthPassword.Text.Length < 3 then
  begin
    FloatAnimationPassAuth.Enabled := True;
    self.FMXLoadingIndicatorLogin.Visible := False;
    Result := False;
  end;
  if (self.EditAuthEmail.Text.Length > 6) and
    (self.EditAuthPassword.Text.Length >= 3) then
    Result := True;
end;

function TauthForm.equalPassword(pass1, pass2: string): boolean;
begin
  if pass1.Equals(pass2) then
  begin
    Result := True;
  end
  else
  begin
    EditAuthPassword.FontColor := TAlphaColors.Red;
    Result := False;
  end;
end;

procedure TauthForm.FloatAnimationPassAuthFinish(Sender: TObject);
begin
  EditAuthPassword.Position.X := 20;
end;

procedure TauthForm.FloatAnimationEmailAuthFinish(Sender: TObject);
begin
  EditAuthEmail.Position.X := 20;
end;

procedure TauthForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TauthForm.FormCreate(Sender: TObject);
begin
  self.closeAfterReg := False;
end;

procedure TauthForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
Shift: TShiftState);
begin
  if Key = 137 then
    self.Free;
end;

procedure TauthForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  if RectanglePRecovery.Visible = True then
  begin
    RectanglePRecovery.Visible := False;
    self.HeaderFrame1.LabelAppName.Text := 'მომხმარებლის ავტორიზაცია';
  end
  else
    self.Close;
end;

procedure TauthForm.initForm;
var
  HelperUnit: THelperUnit;
begin
  self.Show;
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  if TOSVersion.Major >= 6 then
  begin
    HelperUnit := THelperUnit.Create;
    try
      HelperUnit.AndroidCheckAndRequestStoragePermission;
    finally
      HelperUnit.Free;
    end;
  end;
end;

function TauthForm.setUserFields: boolean;
var
  jsonObject: TJSONObject;
  JSONValue, jv: TJsonValue;
  v_result: string;
begin
  jsonObject := TJSONObject.ParseJSONValue
    (TEncoding.UTF8.GetBytes(self.RESTResponseAuth.Content), 0) as TJSONObject;
  v_result := jsonObject.GetValue('result').ToString;
  JSONValue := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(v_result), 0);
  try
    if JSONValue is TJSONArray then
    begin
      for jv in TJSONArray(JSONValue) do
      begin
        DModule.id := (jv as TJSONObject).Get('id')
          .JSONValue.ToString.ToInteger;
        DModule.user_type_id := (jv as TJSONObject).Get('user_type_id')
          .JSONValue.ToString.ToInteger;
        DModule.full_name := (jv as TJSONObject).Get('full_name')
          .JSONValue.ToString;
        DModule.phone := (jv as TJSONObject).Get('phone').JSONValue.ToString;
        DModule.email := (jv as TJSONObject).Get('email').JSONValue.ToString;
      end;
    end;
  finally
    JSONValue.Free;
  end;
end;

end.
