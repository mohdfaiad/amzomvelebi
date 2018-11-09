unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.StdCtrls, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.Layouts, FMX.Ani, FMX.Effects,
  FMX.Filter.Effects, System.ImageList, FMX.ImgList, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.DBScope,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.TabControl, FMX.Gestures, System.Threading,
  System.PushNotification,
  System.Notification,
  FMX.ScrollBox, FMX.Memo,
  DW.PushClient,
  IdURI, System.IOUtils,
  Inifiles, FMX.Header, User2ListFR,
  FMX.LoadingIndicator, MyContractsUnit, AppOfferedUnit
{$IFDEF ANDROID}
     // System.Android.Service,
 {FMX.PushNotification.Android,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  // Androidapi.JNI.PlayServices,
  Androidapi.JNI.Net,
  Androidapi.JNI.Telephony,
  Androidapi.JNI.Provider,
  Androidapi.JNI.Util,
  Androidapi.JNI.Support,
  System.Android.Notification,}
{$ENDIF ANDROID}
{$IFDEF IOS}
    , FMX.PushNotification.IOS
{$ENDIF};

type
  TMainForm = class(TForm)
    ActionList1: TActionList;
    AuthAction: TAction;
    RectangleNonAuth: TRectangle;
    RectangleProfile: TRectangle;
    ButtonUserNotifications: TButton;
    ActionAppAdding: TAction;
    ActionUserArea: TAction;
    RESTRequestVersioning: TRESTRequest;
    RESTResponseVersioning: TRESTResponse;
    TimerVersioning: TTimer;
    BindingsList1: TBindingsList;
    TabControl1: TTabControl;
    TabItemMain: TTabItem;
    TabItemUserArea: TTabItem;
    GestureManager1: TGestureManager;
    ActiontabSliderRight: TAction;
    ActiontabSliderLeft: TAction;
    ChangeTabActionRight: TChangeTabAction;
    ChangeTabActionLeft: TChangeTabAction;
    StyleBookMain: TStyleBook;
    ButtonSettings: TButton;
    ButtonSignOut: TButton;
    ActionSignOut: TAction;
    RESTRequestSignOut: TRESTRequest;
    RESTResponseSignOut: TRESTResponse;
    RESTResponseDataSetAdapterInit: TRESTResponseDataSetAdapter;
    FDMemTableInit: TFDMemTable;
    PreloaderRectangle: TRectangle;
    BindSourceDB1: TBindSourceDB;
    ImageList1: TImageList;
    RectangleMainHeader: TRectangle;
    ButtonMasterView: TButton;
    ActionRegAmzomveli: TAction;
    ButtonLocationsConfig: TButton;
    ActionUserNotifications: TAction;
    BindSourceDB2: TBindSourceDB;
    ButtonServiceTypes: TButton;
    ActionServiceTypes: TAction;
    ActionLocationsConfig: TAction;
    MultiView1: TMultiView;
    RESTRequestDeviceToken: TRESTRequest;
    ActionRegGanmcxadebeli: TAction;
    LabelFullName: TLabel;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    TabItemAmzomvelebi: TTabItem;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    ButtonAmzReg: TButton;
    ButtonAuth: TButton;
    ButtonContracts: TButton;
    ActionMyContracts: TAction;
    ImageLogo: TImage;
    TabItemBidedApps: TTabItem;
    BindSourceDB3: TBindSourceDB;
    SpeedButtonNotifications: TSpeedButton;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    ImageListRed: TImageList;
    RectangleConnectionStatus: TRectangle;
    LabelConnectionStatus: TLabel;
    VertScrollBox1: TVertScrollBox;
    HorzScrollBox1: THorzScrollBox;
    RectangleService2: TRectangle;
    Image5: TImage;
    Label4: TLabel;
    RectangleService6: TRectangle;
    Image6: TImage;
    Label5: TLabel;
    RectangleService5: TRectangle;
    Image8: TImage;
    Label7: TLabel;
    LabelDetails: TLabel;
    Image9: TImage;
    LabelServices: TLabel;
    ImageServicesIcon: TImage;
    RectangleBannerApps: TRectangle;
    RectangleApps: TRectangle;
    LabelApps: TLabel;
    RectangleAppsCount: TRectangle;
    LabelTotalAppsCount: TLabel;
    RectangleText: TRectangle;
    TextMainPageText: TText;
    ImageAzomva: TImage;
    ActionAppsList: TAction;
    RectangleAuthReg: TRectangle;
    Label1: TLabel;
    Image2: TImage;
    RectangleReg: TRectangle;
    Image3: TImage;
    Label3: TLabel;
    NotificationCenter1: TNotificationCenter;
    LinkPropertyToFieldText: TLinkPropertyToField;
    TimerInitActivation: TTimer;
    FDMemTableInitmainFields: TWideStringField;
    FDMemTableInitmainFieldstotal_apps_count: TWideStringField;
    FDMemTableInitmainFieldsweek_apps_count: TWideStringField;
    FDMemTableInitmainFieldsusers2count: TWideStringField;
    FDMemTableInitmainFieldsapp_name: TWideStringField;
    FDMemTableInitmainFieldsAmzomvelebi_GCMAppID: TWideStringField;
    FDMemTableInitmainFieldsAmzomvelebi_GCMServerKey: TWideStringField;
    FDMemTableInitmainFieldsuserAgent: TWideStringField;
    FDMemTableInitmainFieldsaction: TWideStringField;
    FDMemTableInitmainFieldsmsg: TWideStringField;
    FDMemTableInitpages: TWideStringField;
    FDMemTableInitpagesid: TWideStringField;
    FDMemTableInitpagestitle: TWideStringField;
    FDMemTableInitpagescontent: TWideStringField;
    FDMemTableInitpagesmeta_keywords: TWideStringField;
    FDMemTableInitpagesmeta_description: TWideStringField;
    FDMemTableInitpagescreate_date: TWideStringField;
    FDMemTableInitpagesmodify_date: TWideStringField;
    FDMemTableInituser: TWideStringField;
    FDMemTableInituserid: TWideStringField;
    FDMemTableInituseruser_type_id: TWideStringField;
    FDMemTableInituseruser_status_id: TWideStringField;
    FDMemTableInituserrating: TWideStringField;
    FDMemTableInituserfull_name: TWideStringField;
    FDMemTableInituserphone: TWideStringField;
    FDMemTableInituseremail: TWideStringField;
    FDMemTableInitusercreate_date: TWideStringField;
    FDMemTableInitusermodify_date: TWideStringField;
    FDMemTableInituserregipaddr: TWideStringField;
    FDMemTableInitusersesskey: TWideStringField;
    FDMemTableInituserloginstatus: TWideStringField;
    FDMemTableInituserisSetLocations: TWideStringField;
    FDMemTableInitusernotifications: TWideStringField;
    AppOfferedFrame1: TAppOfferedFrame;
    RectangleStatusBar: TRectangle;
    RectangleMain: TRectangle;
    LabelStatusBar: TLabel;
    MyContractsFrame1: TMyContractsFrame;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    RectangleHowItWork: TRectangle;
    RectangleInfo: TRectangle;
    LabelInfoTitle: TLabel;
    VertScrollBox2: TVertScrollBox;
    TextInfo: TText;
    InfoButtonAddApp: TButton;
    FloatAnimationInfoDialog: TFloatAnimation;
    ActionService1: TAction;
    ActionService2: TAction;
    ActionService3: TAction;
    FDMemTableServices: TFDMemTable;
    RESTResponseDataSetAdapterServices: TRESTResponseDataSetAdapter;
    FDMemTableServicesid: TWideStringField;
    FDMemTableServicestitle: TWideStringField;
    FDMemTableServicescontent: TWideStringField;
    FDMemTableServicesmeta_keywords: TWideStringField;
    FDMemTableServicesmeta_description: TWideStringField;
    FDMemTableServicescreate_date: TWideStringField;
    FDMemTableServicesmodify_date: TWideStringField;
    ActionHowItWorks: TAction;
    procedure ActionUserAreaExecute(Sender: TObject);
    procedure TimerVersioningTimer(Sender: TObject);
    procedure RESTRequestVersioningAfterExecute(Sender: TCustomRESTRequest);
    procedure ActionSignOutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionUserNotificationsExecute(Sender: TObject);
    procedure ActionServiceTypesExecute(Sender: TObject);
    procedure ActionLocationsConfigExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure ActionMyContractsExecute(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure ActionAppsListExecute(Sender: TObject);
    procedure RectangleAppsClick(Sender: TObject);
    procedure RectangleBannerAppsClick(Sender: TObject);
    procedure LabelAppsClick(Sender: TObject);
    procedure LabelTotalAppsCountClick(Sender: TObject);
    procedure AuthActionExecute(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure RectangleAuthRegClick(Sender: TObject);
    procedure ActionRegAmzomveliExecute(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure RectangleRegClick(Sender: TObject);
    procedure NotificationCenter1ReceiveLocalNotification(Sender: TObject;
      ANotification: TNotification);
    procedure TimerInitActivationTimer(Sender: TObject);
    procedure AppOfferedFrame1RESTRequestOffersAfterExecute
      (Sender: TCustomRESTRequest);
    procedure ColorPanel1Change(Sender: TObject);
    procedure ActionService1Execute(Sender: TObject);
    procedure ActionService2Execute(Sender: TObject);
    procedure ActionService3Execute(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure TextInfoClick(Sender: TObject);
    procedure LabelInfoTitleClick(Sender: TObject);
    procedure InfoButtonAddAppClick(Sender: TObject);
    procedure RectangleHowItWorkClick(Sender: TObject);
    procedure ActionHowItWorksExecute(Sender: TObject);
    procedure TextMainPageTextClick(Sender: TObject);
  private
    procedure PushClientChangeHandler(Sender: TObject;
      AChange: TPushService.TChanges);
    procedure PushClientReceiveNotificationHandler(Sender: TObject;
      const ANotification: TPushServiceNotification);
{$IFDEF ANDROID}
    // procedure ServiceAppStart;
    // function isServiceStarted: Boolean;
{$ENDIF ANDROID}
    procedure checkVersion;
    procedure clearINIParams;
    function getDeviceID: string;
    // procedure OnServiceConnectionChange(Sender: TObject; AChange: TPushService.TChanges);
    // function isServiceStarted: Boolean;

    { Private declarations }
  public
    { Public declarations }
    FPushClient: TPushClient;
    v_Ini: TIniFile;
    v_app_id, v_user_id, v_action: string;
    v_notification_received: Boolean;
    PushServiceConnection: TPushServiceConnection;
    procedure DoAuthenticate;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses auth, DataModule, UserArea, AppList,
  UserLocations, UserNotifications, UserServiceTypes, AppDetails,
  UserAmzomveliReg, MyContracts, User1Review, FMX.StatusBar;

procedure TMainForm.DoAuthenticate;
begin
  if not DModule.user_type_id = 2 then
  begin
    ShowMessage
      ('თქვენ ხართ დარეგისტრირებული როგორც დამკვეთი, გთხოვთ ჩამოწეროთ თქვენს მოწყობილობაში მეორე აპლიკაცია რომელიც არის განკუთვნილი დამკვეთებისთვის.');
    self.Close;
  end;
  self.RectangleNonAuth.Visible := False;
  LabelFullName.Text := DModule.full_name;
  ButtonUserNotifications.Text := '(' + DModule.notifications.ToString +
    ') შეტყობინებები';
  SpeedButtonNotifications.Text := DModule.notifications.ToString;
  SpeedButtonNotifications.Visible := True;
  self.RectangleProfile.Visible := True;
  FPushClient.Active := True;
  // LabelApps.Text:=FPushClient.Active.ToString(true);
  ButtonAmzReg.Visible := False;
  ButtonAuth.Visible := False;
  self.AppOfferedFrame1.initFrame;
  self.MyContractsFrame1.initFrame;
  TabItemAmzomvelebi.Visible := True;
  TabItemBidedApps.Visible := True;
  TabItemAmzomvelebi.Text := self.AppOfferedFrame1.FDMemTableOffers.
    RecordCount.ToString;
  TabItemBidedApps.Text := self.MyContractsFrame1.FDMemTableContracts.
    RecordCount.ToString;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  TabItemAmzomvelebi.Visible := False;
  self.v_notification_received := False;
  self.SpeedButtonNotifications.Visible := False;
  self.PreloaderRectangle.Visible := True;
  TabItemBidedApps.Visible := False;
  TabItemAmzomvelebi.Visible := False;
  FPushClient := TPushClient.Create;
  FPushClient.GCMAppID := '33239165112';
  // FPushClient.ServerKey :=
  // 'AAAA-dL2vgs:APA91bHselPykPJp2XxIRxe4mmUhR5G_onOl0a1bPLS_zGaertyAxYuKMXEAPFHnHiwr7GmZEyO7fXux8jka_9sYo1DtCENhk8X7wvPA8CxCl9uJlQuBHukNtjgtMJidSi_xoBeYJZ1W';
  // FPushClient.BundleID := cFCMBundleID;

  FPushClient.UseSandbox := True; // Change this to False for production use!
  FPushClient.OnChange := PushClientChangeHandler;
  FPushClient.OnReceiveNotification := PushClientReceiveNotificationHandler;
  self.v_Ini := TIniFile.Create(TPath.Combine(TPath.GetHomePath,
    DModule.settingsIniFile));
  self.v_Ini.AutoSave := True;
  // User2ListFrame1.initFrame;

  {TMSFMXHTMLText1.Text :=
    'სარეგისტრაციოდ წარდგენილ დოკუმენტაციაზე თანდართული აზომვითი ნახაზის' +
    sLineBreak +
    '(ქაღალდზე დაბეჭდილი  და მისი იდენტური ელექტრონული ვერსია მყარ დისკზე ჩაწერილი) მომზადება,'
    + sLineBreak +
    'რომელსაც ქმნის უფლებამოსილი პირი, ან კომპანია თქვენი დაკვეთის' + sLineBreak
    + sLineBreak + sLineBreak +
    'ნახაზის წარდგენა საჭიროა საჯარო რეესტრში მიწის ნაკვეთის პირველადი რეგისტრაციისას, ან დაზუსტებისას.'
    + sLineBreak +
    'აგრეთვე, უკვე რეგისტრირებული მიწის ნაკვეთის დაყოფა/გაერთიანებისას.' +
    sLineBreak + sLineBreak + sLineBreak +
    'ყურადღება: მიწის ნაკვეთის საკადასტრო აგეგმვითი/აზომვითი სამუშაოს შესრულებისას გამიჯნულია'
    + sLineBreak + 'პასუხისმგებლობა ამზომველსა და მესაკუთრეს შორის.' +
    sLineBreak +
    'კერძოდ, უძრავი ნივთის ადგილმდებარეობასა და საზღვრის იდენტიფიცირებაზე პასუხისმგებელია მესაკუთრე,'
    + sLineBreak +
    'ხოლო აზომვითი სამუშაოების სრულყოფილად შესრულებასა და ნახაზის სისწორეზე - ამზომველი.';}
end;

procedure TMainForm.PushClientReceiveNotificationHandler(Sender: TObject;
  const ANotification: TPushServiceNotification);
var
  MyNotification: TNotification;
  NotificationCenter: TNotificationCenter;
begin
  NotificationCenter := TNotificationCenter.Create(nil);
  MyNotification := NotificationCenter.CreateNotification;
  try
    MyNotification.Name := ANotification.JSON.GetValue('formAction')
      .Value.Replace('"', '') + '_' + ANotification.JSON.GetValue
      ('notification_id').Value.Replace('"', '') + '_' +
      ANotification.JSON.GetValue('app_id').Value.Replace('"', '');
    MyNotification.Title := ANotification.JSON.GetValue('title')
      .Value.Replace('"', '');
    MyNotification.AlertBody := ANotification.JSON.GetValue('description')
      .Value.Replace('"', '');
    MyNotification.EnableSound := True;
    MyNotification.Number := 2;
    MyNotification.HasAction := True;
    MyNotification.AlertAction := 'Launch';
    NotificationCenter.PresentNotification(MyNotification);
    NotificationCenter.ApplicationIconBadgeNumber := 2;
  finally
    NotificationCenter.Free;
    MyNotification.DisposeOf;
  end;
end;

procedure TMainForm.NotificationCenter1ReceiveLocalNotification(Sender: TObject;
  ANotification: TNotification);
var
  app_id: string;
begin
  self.NotificationCenter1.CancelNotification(ANotification.Name);
  app_id := TPushServiceNotification(Sender).JSON.GetValue('app_id')
    .Value.Replace('"', '');
  exit;
  if TPushServiceNotification(ANotification).JSON.GetValue('formAction')
    .Value.Replace('"', '') = 'TAppDetailForm' then
  begin
    with TAppDetailForm.Create(Application) do
    begin
      initForm(self.v_app_id.ToInteger);
    end;
  end
  else if self.v_action = 'TUser1ReviewForm' then
  begin
    if self.v_user_id.ToInteger > 0 then
    begin
      with TUser1ReviewForm.Create(Application) do
      begin
        initForm(self.v_user_id.ToInteger);
      end;
    end;
  end;
end;

procedure TMainForm.Rectangle1Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItemAmzomvelebi;
end;

procedure TMainForm.RectangleAppsClick(Sender: TObject);
begin
  ActionAppsList.Execute;
end;

procedure TMainForm.RectangleAuthRegClick(Sender: TObject);
begin
  AuthAction.Execute;
end;

procedure TMainForm.RectangleBannerAppsClick(Sender: TObject);
begin
  ActionAppsList.Execute;
end;

procedure TMainForm.RectangleHowItWorkClick(Sender: TObject);
begin
  RectangleHowItWork.Visible := False;
end;

procedure TMainForm.RectangleRegClick(Sender: TObject);
begin
  ActionRegAmzomveli.Execute;
end;

procedure TMainForm.PushClientChangeHandler(Sender: TObject;
  AChange: TPushService.TChanges);
var
  aTask: ITask;
begin
  if TPushService.TChange.DeviceToken in AChange then
  begin
    aTask := TTask.Create(
      procedure()
      begin
        RESTRequestDeviceToken.Params.Clear;
        RESTRequestDeviceToken.AddParameter('deviceid', self.getDeviceID);
        RESTRequestDeviceToken.AddParameter('devicetoken',
          TIdURI.ParamsEncode(FPushClient.DeviceToken));
        RESTRequestDeviceToken.AddParameter('sesskey', DModule.sesskey);
        RESTRequestDeviceToken.AddParameter('user_id', DModule.id.ToString);
        RESTRequestDeviceToken.Execute;
      end);
    aTask.Start;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FPushClient.Free;
end;

procedure TMainForm.ActionAppsListExecute(Sender: TObject);
begin
  if Assigned(AppListForm) then
    AppListForm.initForm
  else
  begin
    with TAppListForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.ActionHowItWorksExecute(Sender: TObject);
begin
  LabelInfoTitle.Text := FDMemTableServices.FieldByName('pages.title').AsString;
  TextInfo.Text := FDMemTableInit.FieldByName('pages.content').AsString;
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.ActionLocationsConfigExecute(Sender: TObject);
begin
  if Assigned(UserLocationsForm) then
    UserLocationsForm.initForm
  else
  begin
    with TUserLocationsForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.ActionMyContractsExecute(Sender: TObject);
begin
  if Assigned(MyContractsForm) then
    MyContractsForm.initForm
  else
  begin
    with TMyContractsForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.ActionRegAmzomveliExecute(Sender: TObject);
begin
  if Assigned(UserAmzomveliRegForm) then
    UserAmzomveliRegForm.initForm
  else
  begin
    // ამზომველის რეგისტრაცია
    with TUserAmzomveliRegForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.ActionService1Execute(Sender: TObject);
begin
  FDMemTableServices.First;
  LabelInfoTitle.Text := FDMemTableServices.FieldByName('title').AsString;
  TextInfo.Text := FDMemTableServices.FieldByName('content').AsString;
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.ActionService2Execute(Sender: TObject);
begin
  FDMemTableServices.First;
  FDMemTableServices.Next;
  LabelInfoTitle.Text := FDMemTableServices.FieldByName('title').AsString;
  TextInfo.Text := FDMemTableServices.FieldByName('content').AsString;
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.ActionService3Execute(Sender: TObject);
begin
  FDMemTableServices.Last;
  LabelInfoTitle.Text := FDMemTableServices.FieldByName('title').AsString;
  TextInfo.Text := FDMemTableServices.FieldByName('content').AsString;
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.ActionServiceTypesExecute(Sender: TObject);
begin
  if Assigned(UserServiceTypesForm) then
    UserServiceTypesForm.initForm
  else
  begin
    with TUserServiceTypesForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.ActionSignOutExecute(Sender: TObject);
begin
  TimerVersioning.Enabled := False;
  RESTRequestSignOut.Params.Clear;
  RESTRequestSignOut.AddParameter('sesskey', DModule.sesskey);
  RESTRequestSignOut.AddParameter('user_id', DModule.id.ToString);
  RESTRequestSignOut.ExecuteAsync(
    procedure
    begin
      RectangleProfile.Visible := False;
      RectangleNonAuth.Visible := True;
      TabItemBidedApps.Visible := False;
      DModule.SignOut;
      self.clearINIParams;
    end, True, True);
end;

procedure TMainForm.ActionUserAreaExecute(Sender: TObject);
begin
  if Assigned(UserAreaForm) then
    UserAreaForm.initForm
  else
  begin
    with TUserAreaForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.ActionUserNotificationsExecute(Sender: TObject);
begin
  with TUserNotificationsForm.Create(Application) do
  begin
    initForm;
  end;
end;

procedure TMainForm.AppOfferedFrame1RESTRequestOffersAfterExecute
  (Sender: TCustomRESTRequest);
begin
  AppOfferedFrame1.RESTRequestOffersAfterExecute(Sender);
  TabItemAmzomvelebi.Visible := True;
end;

procedure TMainForm.AuthActionExecute(Sender: TObject);
begin
  if Assigned(authForm) then
    authForm.initForm
  else
  begin
    with TauthForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  self.TabControl1.ActiveTab := TabItemAmzomvelebi;
  self.MultiView1.HideMaster;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItemUserArea;
  self.MultiView1.HideMaster;
end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
  self.MultiView1.HideMaster;
  if Assigned(AppListForm) then
    AppListForm.initForm
  else
  begin
    with TAppListForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.RESTRequestVersioningAfterExecute
  (Sender: TCustomRESTRequest);
var
  aTask: ITask;
begin
  // self.showConnectionIsOnline;
  TimerInitActivation.Enabled := True;
  self.PreloaderRectangle.Visible := False;
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItemMain then
  begin
    TabItemMain.ImageIndex := 1;
    TabItemUserArea.ImageIndex := 8;
    TabItemAmzomvelebi.ImageIndex := 6;
    TabItemBidedApps.ImageIndex := 4;
  end
  else if TabControl1.ActiveTab = TabItemUserArea then
  begin
    TabItemMain.ImageIndex := 0;
    TabItemUserArea.ImageIndex := 9;
    TabItemAmzomvelebi.ImageIndex := 6;
    TabItemBidedApps.ImageIndex := 4;
  end
  else if TabControl1.ActiveTab = TabItemAmzomvelebi then
  begin
    TabItemMain.ImageIndex := 0;
    TabItemUserArea.ImageIndex := 8;
    TabItemAmzomvelebi.ImageIndex := 7;
    TabItemBidedApps.ImageIndex := 4;
  end
  else if TabControl1.ActiveTab = TabItemBidedApps then
  begin
    TabItemMain.ImageIndex := 0;
    TabItemUserArea.ImageIndex := 8;
    TabItemAmzomvelebi.ImageIndex := 6;
    TabItemBidedApps.ImageIndex := 5;
  end;
end;

procedure TMainForm.TextInfoClick(Sender: TObject);
begin
  RectangleHowItWork.Visible := False;
end;

procedure TMainForm.TextMainPageTextClick(Sender: TObject);
begin
  ActionHowItWorks.Execute;
end;

procedure TMainForm.TimerInitActivationTimer(Sender: TObject);
begin
  self.TimerInitActivation.Enabled := False;
  self.checkVersion;
end;

procedure TMainForm.TimerVersioningTimer(Sender: TObject);
var
  aTask: ITask;
  hash, phone, email: String;
begin
  TimerVersioning.Enabled := False;
  aTask := TTask.Create(
    procedure()
    var
      hash, phone, email: String;
    begin
      RESTRequestVersioning.Params.Clear;
      RESTRequestVersioning.AddParameter('version', DModule.currentVersion);
      hash := self.v_Ini.ReadString('auth', 'hash', '');
      phone := self.v_Ini.ReadString('auth', 'phone', '');
      email := self.v_Ini.ReadString('auth', 'email', '');
      if self.v_Ini.ReadString('auth', 'hash', '').IsEmpty = False then
      begin
        RESTRequestVersioning.AddParameter('op', 'login_with_hash');
        RESTRequestVersioning.AddParameter('hash', hash);
        RESTRequestVersioning.AddParameter('phone', phone);
        RESTRequestVersioning.AddParameter('email', email);
      end;
      RESTRequestVersioning.Execute;

    end);
  aTask.Start;
end;

procedure TMainForm.checkVersion;
var
  msg: string;
  action: integer;
begin
  action := FDMemTableInit.FieldByName('mainFields.action').AsInteger;
  msg := FDMemTableInit.FieldByName('mainFields.msg').AsString;
  if action = 1 then
  begin
    ShowMessage(msg);
    self.Close;
  end;

  if FDMemTableInit.FieldByName('user.loginstatus').AsString = '1' then
  begin
    DModule.id := FDMemTableInit.FieldByName('user.id').AsInteger;
    DModule.user_type_id := FDMemTableInit.FieldByName('user.user_type_id')
      .AsInteger;
    DModule.full_name := FDMemTableInit.FieldByName('user.full_name').AsString;
    DModule.phone := FDMemTableInit.FieldByName('user.phone').AsString;
    DModule.email := FDMemTableInit.FieldByName('user.email').AsString;
    DModule.sesskey := FDMemTableInit.FieldByName('user.sesskey').AsString;
    DModule.notifications := FDMemTableInit.FieldByName('user.notifications')
      .AsInteger;
    self.DoAuthenticate;
  end
  else
    self.clearINIParams;
  FPushClient.GCMAppID := FDMemTableInit.FieldByName
    ('mainFields.Amzomvelebi_GCMAppID').AsString;
  FPushClient.ServerKey := FDMemTableInit.FieldByName
    ('mainFields.Amzomvelebi_GCMServerKey').AsString;

  FPushClient.UseSandbox := False; // Change this to False for production use!
  FPushClient.OnChange := PushClientChangeHandler;
  FPushClient.OnReceiveNotification := PushClientReceiveNotificationHandler;
end;

procedure TMainForm.clearINIParams;
var
  Ini: TIniFile;
begin
  self.v_Ini.WriteString('auth', 'hash', '');
  self.v_Ini.WriteString('auth', 'full_name', '');
  self.v_Ini.WriteString('auth', 'phone', '');
  self.v_Ini.WriteString('auth', 'email', '');
  self.v_Ini.WriteString('auth', 'fname', '');
end;

{$IFDEF IOS}

function TMainForm.getDeviceID: string;
begin
  Result := 'iOS';
end;
{$ENDIF IOS}
{$IFDEF ANDROID}

function TMainForm.getDeviceID: string;
{ var
  obj: JObject;
  tm: JTelephonyManager;
  identifier: String; }
begin
  { obj := TANdroidHelper.Context.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
    if obj <> nil then
    begin
    tm := TJTelephonyManager.Wrap((obj as ILocalObject).GetObjectID);
    if tm <> nil then
    identifier := JStringToString(tm.getDeviceID);
    end;
    if identifier = '' then
    identifier := JStringToString(TJSettings_Secure.JavaClass.getString(TANdroidHelper.Activity.getContentResolver,
    TJSettings_Secure.JavaClass.ANDROID_ID));
    Result := identifier; }
  Result := 'deprecated';
end;

procedure TMainForm.Image2Click(Sender: TObject);
begin
  AuthAction.Execute;
end;

procedure TMainForm.Image3Click(Sender: TObject);
begin
  ActionRegAmzomveli.Execute;
end;

{$ENDIF ANDROID}

procedure TMainForm.Image5Click(Sender: TObject);
begin
  ActionService1.Execute
end;

procedure TMainForm.Image6Click(Sender: TObject);
begin
  ActionService2.Execute
end;

procedure TMainForm.Image8Click(Sender: TObject);
begin
  ActionService3.Execute
end;

procedure TMainForm.InfoButtonAddAppClick(Sender: TObject);
begin
  ActionAppAdding.Execute;
end;

procedure TMainForm.Label1Click(Sender: TObject);
begin
  AuthAction.Execute;
end;

procedure TMainForm.Label3Click(Sender: TObject);
begin
  ActionRegAmzomveli.Execute;
end;

procedure TMainForm.Label4Click(Sender: TObject);
begin
  ActionService1.Execute
end;

procedure TMainForm.Label5Click(Sender: TObject);
begin
  ActionService2.Execute
end;

procedure TMainForm.Label7Click(Sender: TObject);
begin
  ActionService3.Execute
end;

procedure TMainForm.LabelAppsClick(Sender: TObject);
begin
  ActionAppsList.Execute;
end;

procedure TMainForm.LabelInfoTitleClick(Sender: TObject);
begin
  RectangleHowItWork.Visible := False;
end;

procedure TMainForm.LabelTotalAppsCountClick(Sender: TObject);
begin
  ActionAppsList.Execute;
end;

procedure TMainForm.ColorPanel1Change(Sender: TObject);
begin
  TmyWindow.StatusBarColor(self, $FFFF3434);
end;

initialization

TmyWindow.Init;

end.
