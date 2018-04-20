unit AppDetails;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Threading,
  FMX.Controls.Presentation, System.PushNotification, FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.DBScope, FMX.DateTimeCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, IdURI,
  FMX.Ani, FMX.ListView, FMX.TabControl, FMX.Bind.GenData, FMX.Layouts,
  FMX.LoadingIndicator, Header;

type
  TAppDetailForm = class(TForm)
    RectanglePreloader: TRectangle;
    RESTRequestApp: TRESTRequest;
    RESTResponseApp: TRESTResponse;
    RESTResponseDataSetAdapterApp: TRESTResponseDataSetAdapter;
    FDMemTableApp: TFDMemTable;
    ButtonOffer: TButton;
    PanelBids: TPanel;
    FloatAnimation1: TFloatAnimation;
    RectangleInnerMain: TRectangle;
    RectangleHeder: TRectangle;
    Button1: TButton;
    ButtonSubmit: TButton;
    EditOfferedPrice: TEdit;
    MemoOfferDescription: TMemo;
    Label1: TLabel;
    DateEditStartDate: TDateEdit;
    RESTRequestOffer: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Label2: TLabel;
    SpeedButtonApplied: TSpeedButton;
    Image1: TImage;
    RectangleMain: TRectangle;
    TabControl1: TTabControl;
    TabItemDetails: TTabItem;
    TabItemOffer: TTabItem;
    ListViewAppDetails: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ListViewOffers: TListView;
    RESTResponseDataSetAdapterBids: TRESTResponseDataSetAdapter;
    FDMemTableBids: TFDMemTable;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    FDMemTableBidsid: TWideStringField;
    FDMemTableBidsuser_id: TWideStringField;
    FDMemTableBidsapp_id: TWideStringField;
    FDMemTableBidsoffered_price: TWideStringField;
    FDMemTableBidsstart_date: TWideStringField;
    FDMemTableBidsoffer_description: TWideStringField;
    FDMemTableBidscreate_date: TWideStringField;
    FDMemTableBidsipaddr: TWideStringField;
    FDMemTableBidsuser: TWideStringField;
    FDMemTableBidsapproved_id: TWideStringField;
    FDMemTableBidsapproved_on_time: TWideStringField;
    FDMemTableBidsapproved_note: TWideStringField;
    FDMemTableBidsapproved: TWideStringField;
    FDMemTableBidsapproved_icon: TWideStringField;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    Label3: TLabel;
    HeaderFrame1: THeaderFrame;
    RESTResponseDataSetAdapterRequiz: TRESTResponseDataSetAdapter;
    FDMemTableapp_property_requisites: TFDMemTable;
    TabItemProperties: TTabItem;
    ListViewProperties: TListView;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    FDMemTableapp_property_requisitesid: TWideStringField;
    FDMemTableapp_property_requisitesapp_id: TWideStringField;
    FDMemTableapp_property_requisitesapp_property_type_id: TWideStringField;
    FDMemTableapp_property_requisitesapp_property_type_name: TWideStringField;
    FDMemTableapp_property_requisiteslocation_id: TWideStringField;
    FDMemTableapp_property_requisiteslocation_address: TWideStringField;
    FDMemTableapp_property_requisitesaddress: TWideStringField;
    FDMemTableapp_property_requisitescadcode: TWideStringField;
    FDMemTableapp_property_requisitesarea: TWideStringField;
    FDMemTableapp_property_requisiteslon_lat: TWideStringField;
    FDMemTableapp_property_requisitesservice_types: TWideStringField;
    FDMemTableapp_property_requisitesapp_user_param: TWideStringField;
    FDMemTableAppid: TWideStringField;
    FDMemTableAppuser_id: TWideStringField;
    FDMemTableAppdeadlineby_user: TWideStringField;
    FDMemTableAppexecute_days: TWideStringField;
    FDMemTableAppimageIndex: TWideStringField;
    FDMemTableAppusername: TWideStringField;
    FDMemTableAppnote: TWideStringField;
    FDMemTableAppstatus_name: TWideStringField;
    FDMemTableAppstatus_color: TWideStringField;
    FDMemTableAppstatus_progress: TWideStringField;
    FDMemTableAppapp_status_id: TWideStringField;
    FDMemTableAppnotification_on_email: TWideStringField;
    FDMemTableAppnotification_on_device: TWideStringField;
    FDMemTableAppcreate_date: TWideStringField;
    FDMemTableAppbidscount: TWideStringField;
    FDMemTableApplocation_name: TWideStringField;
    TabItemOwner: TTabItem;
    ListView2: TListView;
    PanelDetails: TPanel;
    FDMemTableAmzomveli: TFDMemTable;
    FDMemTableAmzomveliid: TWideStringField;
    FDMemTableAmzomveliuser_type_id: TWideStringField;
    FDMemTableAmzomveliuser_status_id: TWideStringField;
    FDMemTableAmzomvelirating: TWideStringField;
    FDMemTableAmzomvelifull_name: TWideStringField;
    FDMemTableAmzomveliphone: TWideStringField;
    FDMemTableAmzomveliemail: TWideStringField;
    FDMemTableAmzomvelicreate_date: TWideStringField;
    FDMemTableAmzomvelimodify_date: TWideStringField;
    FDMemTableAmzomveliregipaddr: TWideStringField;
    FDMemTableAmzomvelicontact_info: TWideStringField;
    RESTResponseDataSetAdapterAmzomveli: TRESTResponseDataSetAdapter;
    BindSourceDB4: TBindSourceDB;
    LinkListControlToField4: TLinkListControlToField;
    procedure RESTRequestAppAfterExecute(Sender: TCustomRESTRequest);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonOfferClick(Sender: TObject);
    procedure ButtonSubmitClick(Sender: TObject);
    procedure RESTRequestOfferAfterExecute(Sender: TCustomRESTRequest);
    procedure Button1Click(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    app_id: integer;
    aTask: ITask;
    procedure initForm(papp_id: integer; showOwner: boolean = false);
  end;

var
  AppDetailForm: TAppDetailForm;

implementation

{$R *.fmx}

uses DataModule, Main;

procedure TAppDetailForm.ButtonOfferClick(Sender: TObject);
begin
  PanelBids.Visible := True;
end;

procedure TAppDetailForm.ButtonSubmitClick(Sender: TObject);
begin
  RectanglePreloader.Visible := True;
  aTask := TTask.Create(
    procedure()
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          RESTRequestOffer.Params.Clear;
          RESTRequestOffer.AddParameter('app_id', self.app_id.ToString);
          RESTRequestOffer.AddParameter('offered_price', EditOfferedPrice.Text);
          RESTRequestOffer.AddParameter('start_date', DateEditStartDate.Text);
          RESTRequestOffer.AddParameter('offer_description', TIdURI.ParamsEncode(MemoOfferDescription.Text));
          RESTRequestOffer.AddParameter('sesskey', DModule.sesskey);
          RESTRequestOffer.AddParameter('user_id', DModule.id.ToString);
          RESTRequestOffer.Execute;
        end);
    end);
  aTask.Start;
end;

procedure TAppDetailForm.Button1Click(Sender: TObject);
begin
  self.PanelBids.Visible := false;
end;

procedure TAppDetailForm.ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TAppDetailForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TAppDetailForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    self.Free;
end;

procedure TAppDetailForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TAppDetailForm.initForm(papp_id: integer; showOwner: boolean = false);
begin
  TabItemOwner.Visible := showOwner;
  self.app_id := papp_id;
  HeaderFrame1.LabelAppName.Text := 'განცხადება N ' + papp_id.ToString;
  self.Show;
  DateEditStartDate.Format := 'dd-mm-yyyy';
  DateEditStartDate.DateTime := Now()+1;
  RectanglePreloader.Visible := True;
  if not DModule.sesskey.IsEmpty then
    ButtonOffer.Visible := True
  else
    ButtonOffer.Visible := false;

  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestApp.Params.Clear;
      RESTRequestApp.AddParameter('app_id', self.app_id.ToString);
      if not DModule.sesskey.IsEmpty then
      begin
        RESTRequestApp.AddParameter('sesskey', DModule.sesskey);
        RESTRequestApp.AddParameter('user_id', DModule.id.ToString);
        if showOwner = True then
        begin
          RESTRequestApp.AddParameter('op', 'showownerinfo');
          TabControl1.ActiveTab := TabItemOwner;
        end
        else
          TabControl1.ActiveTab := TabItemDetails;
      end
      else
      begin
        TabItemOffer.Visible := false;
      end;
      RESTRequestApp.Execute;
    end);
  aTask.Start;
end;

procedure TAppDetailForm.RESTRequestAppAfterExecute(Sender: TCustomRESTRequest);
begin
  self.RectanglePreloader.Visible := false;
end;

procedure TAppDetailForm.RESTRequestOfferAfterExecute(Sender: TCustomRESTRequest);
begin
  self.initForm(self.app_id);
  PanelBids.Visible := false;
  RectanglePreloader.Visible := false;
  ShowMessage(self.RESTResponse1.Content);
end;

end.
