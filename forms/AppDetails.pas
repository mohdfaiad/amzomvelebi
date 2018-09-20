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
  FMX.LoadingIndicator, Header, System.ImageList, FMX.ImgList, System.Actions,
  FMX.ActnList;

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
    RESTRequestOffer: TRESTRequest;
    RESTResponseOffer: TRESTResponse;
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
    FDMemTableAppcanbid: TWideStringField;
    StyleBookAppDetails: TStyleBook;
    LabelDetails: TLabel;
    Image2: TImage;
    RectangleOffer: TRectangle;
    RectangleBody: TRectangle;
    ButtonApprove: TButton;
    FMXLoadingIndicatorApproved: TFMXLoadingIndicator;
    ButtonCancel: TButton;
    Image3: TImage;
    EditPrice: TEdit;
    RectanglePrice: TRectangle;
    LabelPrice: TLabel;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    ImageListAppDetails: TImageList;
    Label4: TLabel;
    Image4: TImage;
    Label5: TLabel;
    Image5: TImage;
    Label6: TLabel;
    Image6: TImage;
    LabelLari: TLabel;
    ActionListAppDetails: TActionList;
    ActionSendAppOffer: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonOfferClick(Sender: TObject);
    procedure ButtonSubmitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure TabControl1Change(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ListViewOffersUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure EditPriceKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure ActionSendAppOfferExecute(Sender: TObject);
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
  RectangleOffer.Visible := True;
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
          { RESTRequestOffer.AddParameter('offer_description',
            TIdURI.ParamsEncode(MemoOfferDescription.Text)); }
          RESTRequestOffer.AddParameter('sesskey', DModule.sesskey);
          RESTRequestOffer.AddParameter('user_id', DModule.id.ToString);
          RESTRequestOffer.Execute;
        end);
    end);
  aTask.Start;
end;

procedure TAppDetailForm.EditPriceKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = 10) or (Key = 13) then
    ActionSendAppOffer.Execute;
end;

procedure TAppDetailForm.ActionSendAppOfferExecute(Sender: TObject);
begin
  if EditPrice.Text.IsEmpty = True then
  begin
    ShowMessage('გთხოვთ შეავსოთ ფასის ველი');
    exit;
  end;
  FMXLoadingIndicatorApproved.Visible := True;
  RESTRequestOffer.Params.Clear;
  RESTRequestOffer.AddParameter('app_id', self.app_id.ToString);
  RESTRequestOffer.AddParameter('offered_price', EditPrice.Text);
  RESTRequestOffer.AddParameter('offer_description',
    TIdURI.ParamsEncode(MemoOfferDescription.Text));
  RESTRequestOffer.AddParameter('sesskey', DModule.sesskey);
  RESTRequestOffer.AddParameter('user_id', DModule.id.ToString);
  RESTRequestOffer.ExecuteAsync(
    procedure
    begin
      self.initForm(self.app_id);
      RectangleOffer.Visible := false;
      FMXLoadingIndicatorApproved.Visible := false;
      ShowMessage(self.RESTResponseOffer.Content);
    end, True, True);
end;

procedure TAppDetailForm.Button1Click(Sender: TObject);
begin
  self.PanelBids.Visible := false;
end;

procedure TAppDetailForm.ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TAppDetailForm.ButtonCancelClick(Sender: TObject);
begin
  RectangleOffer.Visible := false;
end;

procedure TAppDetailForm.FormClose(Sender: TObject;

var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TAppDetailForm.FormKeyUp(Sender: TObject;

var Key: Word;

var KeyChar: Char; Shift: TShiftState);
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
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  TabItemOwner.Visible := showOwner;
  self.app_id := papp_id;
  HeaderFrame1.LabelAppName.Text := 'განცხადება N ' + papp_id.ToString;
  self.Show;
  // DateEditStartDate.Format := 'dd-mm-yyyy';
  // DateEditStartDate.DateTime := Now() + 1;
  RectanglePreloader.Visible := True;
  if (not DModule.sesskey.IsEmpty) and (showOwner = false) then
    ButtonOffer.Visible := True
  else
    ButtonOffer.Visible := false;
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
  RESTRequestApp.ExecuteAsync(
    procedure
    begin
      self.RectanglePreloader.Visible := false;
    end, True, True);
end;

procedure TAppDetailForm.ListViewOffersUpdateObjects(const Sender: TObject;
const AItem: TListViewItem);
begin
  if TListItemText(AItem.Objects.DrawableByName('approved_id')).Text.ToInteger > 0
  then
  begin
    TListItemImage(AItem.Objects.FindDrawable('approved_icon')).ImageIndex := 2;
  end
  else
  begin
    TListItemImage(AItem.Objects.FindDrawable('approved_icon')).ImageIndex := 1;
  end;
end;

procedure TAppDetailForm.TabControl1Change(Sender: TObject);
begin
  if FDMemTableApp.FieldByName('canbid').AsString = '1' then
    ButtonOffer.Visible := True
  else
    ButtonOffer.Visible := false;
end;

end.
