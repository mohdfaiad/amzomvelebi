program Amzomvelebi;

uses
  FMX.Forms,
  FMX.Types,
  Main in 'Main.pas' {MainForm},
  auth in 'auth.pas' {authForm},
  UserArea in 'forms\UserArea.pas' {UserAreaForm},
  HelperUnit in 'HelperUnit.pas',
  AppDetails in 'forms\AppDetails.pas' {AppDetailForm},
  MyAppDetails in 'forms\MyAppDetails.pas' {MyAppDetailsForm},
  BidsByApp in 'forms\BidsByApp.pas' {BidsByAppForm},
  AppList in 'forms\AppList.pas' {AppListForm},
  DataModule in 'DataModule.pas' {DModule: TDataModule},
  UserAmzomveliReg in 'forms\UserAmzomveliReg.pas' {UserAmzomveliRegForm},
  UserLocations in 'forms\UserLocations.pas' {UserLocationsForm},
  UserNotifications in 'forms\UserNotifications.pas' {UserNotificationsForm},
  UserServiceTypes in 'forms\UserServiceTypes.pas' {UserServiceTypesForm},
  User1Review in 'forms\User1Review.pas' {User1ReviewForm},
  User2Review in 'forms\User2Review.pas' {User2ReviewForm: TFrame},
  Header in 'Frames\Header.pas' {HeaderFrame: TFrame},
  User2ListFR in 'Frames\User2ListFR.pas' {User2ListFrame: TFrame},
  MyContracts in 'forms\MyContracts.pas' {MyContractsForm};

{$R *.res}

begin
  Application.Initialize;
  //VKAutoShowMode := TVKAutoShowMode.Always;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDModule, DModule);
  Application.Run;

end.
