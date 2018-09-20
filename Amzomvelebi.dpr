program Amzomvelebi;

uses
  FMX.Forms,
  FMX.Types,
  Main in 'Main.pas' {MainForm},
  auth in 'auth.pas' {authForm},
  UserArea in 'forms\UserArea.pas' {UserAreaForm},
  HelperUnit in 'HelperUnit.pas',
  AppDetails in 'forms\AppDetails.pas' {AppDetailForm},
  BidsByApp in 'forms\BidsByApp.pas' {BidsByAppForm},
  AppList in 'forms\AppList.pas' {AppListForm},
  DataModule in 'DataModule.pas' {DModule: TDataModule},
  UserAmzomveliReg in 'forms\UserAmzomveliReg.pas' {UserAmzomveliRegForm},
  UserLocations in 'forms\UserLocations.pas' {UserLocationsForm},
  UserNotifications in 'forms\UserNotifications.pas' {UserNotificationsForm},
  UserServiceTypes in 'forms\UserServiceTypes.pas' {UserServiceTypesForm},
  User1Review in 'forms\User1Review.pas' {User1ReviewForm},
  Header in 'Frames\Header.pas' {HeaderFrame: TFrame},
  User2ListFR in 'Frames\User2ListFR.pas' {User2ListFrame: TFrame},
  MyContracts in 'forms\MyContracts.pas' {MyContractsForm},
  MyContractsUnit in 'Frames\MyContractsUnit.pas' {MyContractsFrame: TFrame},
  AppOfferedUnit in 'Frames\AppOfferedUnit.pas' {AppOfferedFrame: TFrame},
  SetNewPassword in 'forms\SetNewPassword.pas' {setNewPasswordForm},
  DW.PushClient in 'Lib\PushNotifications-master\DW.PushClient.pas',
  DW.iOSapi.UserNotifications in 'Lib\PushNotifications-master\DW.iOSapi.UserNotifications.pas',
  DW.RegisterFCM in 'Lib\PushNotifications-master\DW.RegisterFCM.pas',
  DW.RemoteNotificationsPatch.iOS in 'Lib\PushNotifications-master\DW.RemoteNotificationsPatch.iOS.pas',
  SharedVariables in 'Lib\PushNotifications-master\SharedVariables.pas';

{$R *.res}

begin
  Application.Initialize;
  //VKAutoShowMode := TVKAutoShowMode.Always;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDModule, DModule);
  Application.Run;

end.
