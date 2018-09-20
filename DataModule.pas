unit DataModule;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, FMX.Maps,
  System.IOUtils;

type
  TDModule = class(TDataModule)
    RESTClient: TRESTClient;
  private
    { Private declarations }
  public
    { Public declarations }
    id: integer;
    user_type_id: integer;
    full_name: string;
    phone: string;
    email: string;
    create_date: TDateTime;
    sesskey: string;
    notifications: integer;
    MyPosition: TMapCoordinate;
    procedure SignOut;

  const
    currentVersion = '1.0.0';
    settingsIniFile = 'AmzomvelebiSettings.ini';
    statusBarTitle = ''; // '     Azomva';
    statusBarOpacity = 0.6;
  end;

var
  DModule: TDModule;
  // Ini: TMemIniFile;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses Main;
{$R *.dfm}
{ TDModule }

procedure TDModule.SignOut;
begin
  self.sesskey := '';
  self.id := 0;
  self.user_type_id := 0;
  self.full_name := '';
  self.phone := '';
  self.email := '';

  MainForm.ButtonAmzReg.Visible := True;
  MainForm.ButtonAuth.Visible := True;
  MainForm.SpeedButtonNotifications.Visible := False;
end;

{
  initialization

  Ini := TMemIniFile.Create(TPath.Combine(TPath.GetHomePath, 'AzomvaSettings.ini'));

  if Ini.ReadString('auth', 'hash', '').IsEmpty = False then
  begin
  DModule.id := Ini.ReadString('auth', 'hash', '').ToInteger;
  DModule.user_type_id := Ini.ReadString('auth', 'user_type_id', '').ToInteger;
  DModule.fname := Ini.ReadString('auth', 'fname', '');
  DModule.lname := Ini.ReadString('auth', 'lname', '');
  DModule.phone := Ini.ReadString('auth', 'phone', '');
  DModule.email := Ini.ReadString('auth', 'email', '');
  DModule.sesskey := Ini.ReadString('auth', 'sesskey', '');
  MainForm.DoAuthenticate;
  end
  else
  DModule.SignOut;
}
end.
