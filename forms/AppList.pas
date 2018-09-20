unit AppList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  REST.Client, Data.Bind.ObjectScope, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FMX.StdCtrls, FMX.Objects, FMX.ListView,
  FMX.Controls.Presentation, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Threading,
  FMX.MultiView, FMX.Layouts, FMX.ListBox, FMX.Ani, FMX.LoadingIndicator,
  FMX.TMSBaseControl, FMX.TreeView, FMX.Edit, FMX.BezierPanel, FMX.TMSPanel,
  FMX.ExtCtrls, FMX.TMSPopup, Header, System.ImageList, FMX.ImgList,
  System.Generics.Collections;

type
  TSearchParams = record
    AreaFrom: Integer;
    AreaTo: Integer;
    ServiceTypes: TList<Integer>; // TArray<String>
    PropertyTypes: TList<Integer>;
  end;

type
  TAppListForm = class(TForm)
    ListViewAppsList: TListView;
    PreloaderRectangle: TRectangle;
    BindSourceDB1: TBindSourceDB;
    FDMemTableApps: TFDMemTable;
    RESTResponseDataSetAdapterApps: TRESTResponseDataSetAdapter;
    RESTResponseApps: TRESTResponse;
    RESTRequestApps: TRESTRequest;
    BindingsList1: TBindingsList;
    MultiViewSort: TMultiView;
    Button1: TButton;
    Button3: TButton;
    RectangleMain: TRectangle;
    RESTRequestLists: TRESTRequest;
    RESTResponseLists: TRESTResponse;
    RESTResponseDataSetAdapterLists: TRESTResponseDataSetAdapter;
    FDMemTableLocations: TFDMemTable;
    FDMemTableLocationsid: TWideStringField;
    FDMemTableLocationspid: TWideStringField;
    FDMemTableLocationstitle: TWideStringField;
    FDMemTableLocationsmap_title: TWideStringField;
    FDMemTableLocationschildren: TWideStringField;
    BindSourceDB2: TBindSourceDB;
    ButtonFilteringSubmit: TButton;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    LinkListControlToField1: TLinkListControlToField;
    FDMemTableAppsid: TWideStringField;
    FDMemTableAppsuser_id: TWideStringField;
    FDMemTableAppscreate_date: TWideStringField;
    FDMemTableAppsdeadlineby_user: TWideStringField;
    FDMemTableAppsimageIndex: TWideStringField;
    FDMemTableAppsusername: TWideStringField;
    FDMemTableAppsnote: TWideStringField;
    FDMemTableAppsstatus_name: TWideStringField;
    FDMemTableAppsstatus_color: TWideStringField;
    FDMemTableAppsstatus_progress: TWideStringField;
    FDMemTableAppsapp_status_id: TWideStringField;
    FDMemTableAppsnotification_on_email: TWideStringField;
    FDMemTableAppsnotification_on_device: TWideStringField;
    FDMemTableAppsapp_property_requisites: TWideStringField;
    FDMemTableAppslocation: TWideStringField;
    FDMemTableAppsarea: TWideStringField;
    FDMemTableAppsapp_property_requisites_count: TWideStringField;
    FDMemTableAppsdropdownarrow_imageindex: TWideStringField;
    RectangleSorting: TRectangle;
    RectangleSortingContent: TRectangle;
    Label2: TLabel;
    Line1: TLine;
    Line2: TLine;
    Rectangle1: TRectangle;
    SpeedButtonClose: TSpeedButton;
    SpeedButtonApply: TSpeedButton;
    RectangleFilteringDetails: TRectangle;
    RectangleFilteringDetailsContent: TRectangle;
    Label3: TLabel;
    Line3: TLine;
    RectanglePropTypesSearchParams: TRectangle;
    SpeedButton1: TSpeedButton;
    RectangleFilteringSortingButtons: TRectangle;
    SpeedButtonSort: TSpeedButton;
    SpeedButtonFiltering: TSpeedButton;
    RadioButtonByLocation: TRadioButton;
    RadioButtonByDate: TRadioButton;
    RadioButtonByBids: TRadioButton;
    Rectangle2: TRectangle;
    Button2: TButton;
    EditAreaFrom: TEdit;
    TreeViewLocations: TTreeView;
    FDMemTableAppServiceTypes: TFDMemTable;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTableAppServiceTypesid: TWideStringField;
    FDMemTableAppServiceTypestitle: TWideStringField;
    BindSourceDB3: TBindSourceDB;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    FloatAnimationListBoxPosition: TFloatAnimation;
    EditAreaTo: TEdit;
    RectangleParams: TRectangle;
    FloatAnimationListBoxPositionClose: TFloatAnimation;
    RadioButtonArea: TRadioButton;
    LabelArrow: TLabel;
    RectangleServiceTypesSearchParams: TRectangle;
    TreeViewServices: TTreeView;
    FloatAnimation1: TFloatAnimation;
    HeaderFrame1: THeaderFrame;
    StyleBookAppList: TStyleBook;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    ImageListAppList: TImageList;
    TreeViewPropTypes: TTreeView;
    FDMemTablePropTypes: TFDMemTable;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTablePropTypesid: TWideStringField;
    FDMemTablePropTypestitle: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListViewAppsListPullRefresh(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonFilteringSubmitClick(Sender: TObject);
    procedure ListViewAppsListItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure SpeedButtonCloseClick(Sender: TObject);
    procedure SpeedButtonSortClick(Sender: TObject);
    procedure SpeedButtonFilteringClick(Sender: TObject);
    procedure SpeedButtonApplyClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure ListViewAppsListUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
  private
    v_loadLocationTree: boolean;
    v_loadServiceTree: boolean;
    v_loadPropTypes: boolean;
    procedure reloadItems(sort_field, sort: String);
    procedure loadLocationTree;
    procedure filter(p_params: TSearchParams);
    procedure loadServiceTypes;
    procedure loadPropertyTypes;
    { Private declarations }
  public
    { Public declarations }
    procedure initForm;
  end;

var
  AppListForm: TAppListForm;

implementation

{$R *.fmx}

uses DataModule, AppDetails, Main;

{ TAppListForm }

procedure TAppListForm.Button1Click(Sender: TObject);
begin
  self.reloadItems('id', 'desc');
  self.MultiViewSort.HideMaster;
end;

procedure TAppListForm.Button2Click(Sender: TObject);
var
  sort: string;
begin
  if RadioButtonByLocation.IsChecked then
    sort := 'location'
  else if RadioButtonByBids.IsChecked then
    sort := 'bids'
  else if RadioButtonByDate.IsChecked then
    sort := 'create_date';
  self.reloadItems(sort, 'desc');
  // models/apps.php line:18
end;

procedure TAppListForm.Button3Click(Sender: TObject);
begin
  self.PreloaderRectangle.Visible := True;
  self.reloadItems('id', 'desc');
  self.MultiViewSort.HideMaster;
end;

procedure TAppListForm.ButtonFilteringSubmitClick(Sender: TObject);
var
  // aTask: ITask;
  // v_locations: String;
  // i, iChildren: Integer;
  params: TSearchParams;
  i: Integer;
begin
  if not EditAreaFrom.Text.IsEmpty then
    params.AreaFrom := EditAreaFrom.Text.ToInteger
  else
    params.AreaFrom := 0;
  if not EditAreaTo.Text.IsEmpty then
    params.AreaTo := EditAreaTo.Text.ToInteger
  else
    params.AreaTo := 0;

  // მომსახურების ტიპების ჩადება პარამეტრების ლისტში
  for i := 0 to TreeViewServices.Count - 1 do
  begin
    if TreeViewServices.Items[i].IsChecked then
      params.ServiceTypes.Add(TreeViewServices.Items[i].Tag);
  end;
  // ქონების ტიპების ჩადება პარამეტრების ლისტში
  for i := 0 to TreeViewServices.Count - 1 do
  begin
    if TreeViewServices.Items[i].IsChecked then
      params.ServiceTypes.Add(TreeViewServices.Items[i].Tag);
  end;

  RectangleFilteringDetails.Visible := False;
  self.filter(params);
end;

procedure TAppListForm.loadLocationTree;
var
  v_pid: Integer;
begin
  self.v_loadLocationTree := True;
  FDMemTableLocations.First;
  if TreeViewLocations.Count = 0 then
  begin
    TreeViewLocations.BeginUpdate;
    while not FDMemTableLocations.Eof do
    begin
      v_pid := FDMemTableLocations.FieldByName('pid').AsInteger;
      if v_pid = 0 then
      begin
        with TTreeViewItem.Create(TreeViewLocations) do
        begin
          Parent := TreeViewLocations;
          Text := FDMemTableLocations.FieldByName('title').AsString;
          Tag := FDMemTableLocations.FieldByName('id').AsInteger;
          Index := FDMemTableLocations.FieldByName('id').AsInteger;
        end;
      end
      else
      begin
        with TTreeViewItem.Create(TreeViewLocations.Items
          [FDMemTableLocations.FieldByName('pid').AsInteger - 1]) do
        begin
          Parent := TreeViewLocations.Items
            [FDMemTableLocations.FieldByName('pid').AsInteger - 1];
          Text := FDMemTableLocations.FieldByName('title').AsString;
          Tag := FDMemTableLocations.FieldByName('id').AsInteger;
        end;
      end;
      FDMemTableLocations.Next;
    end;
    TreeViewLocations.EndUpdate;
    // TreeViewLocations.ExpandAll;
  end;
end;

procedure TAppListForm.loadServiceTypes;
begin
  self.v_loadServiceTree := True;
  FDMemTableAppServiceTypes.First;
  if TreeViewServices.Count = 0 then
  begin
    TreeViewServices.BeginUpdate;
    while not FDMemTableAppServiceTypes.Eof do
    begin
      with TTreeViewItem.Create(TreeViewServices) do
      begin
        Parent := TreeViewServices;
        Text := FDMemTableAppServiceTypes.FieldByName('title').AsString;
        Tag := FDMemTableAppServiceTypes.FieldByName('id').AsInteger;
        Index := FDMemTableAppServiceTypes.FieldByName('id').AsInteger;
      end;
      FDMemTableAppServiceTypes.Next;
    end;
    TreeViewServices.EndUpdate;
  end;
end;

procedure TAppListForm.loadPropertyTypes;
begin
  self.v_loadPropTypes := True;
  FDMemTablePropTypes.First;
  if TreeViewPropTypes.Count = 0 then
  begin
    TreeViewPropTypes.BeginUpdate;
    while not FDMemTablePropTypes.Eof do
    begin
      with TTreeViewItem.Create(TreeViewPropTypes) do
      begin
        Parent := TreeViewServices;
        Text := FDMemTablePropTypes.FieldByName('title').AsString;
        Tag := FDMemTablePropTypes.FieldByName('id').AsInteger;
        Index := FDMemTablePropTypes.FieldByName('id').AsInteger;
      end;
      FDMemTablePropTypes.Next;
    end;
    TreeViewPropTypes.EndUpdate;
  end;
end;

procedure TAppListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TAppListForm.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    self.Free;
end;

procedure TAppListForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TAppListForm.initForm;
begin
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.v_loadLocationTree := False;
  self.v_loadServiceTree := False;
  self.v_loadPropTypes := False;
  self.Show;
  PreloaderRectangle.Visible := True;
  self.RESTRequestLists.ExecuteAsync(
    procedure
    begin
      self.reloadItems('id', 'desc');
      self.loadPropertyTypes;
      self.loadServiceTypes;
    end, True, True);
  SpeedButtonFiltering.Width := self.Width / 2;
  SpeedButtonSort.Width := self.Width / 2;
end;

procedure TAppListForm.reloadItems(sort_field, sort: String);
begin
  PreloaderRectangle.Visible := True;
  RESTRequestApps.params.Clear;
  if not DModule.sesskey.IsEmpty then
  begin
    RESTRequestApps.AddParameter('sesskey', DModule.sesskey);
    RESTRequestApps.AddParameter('user_id', DModule.id.ToString);
  end;
  RESTRequestApps.AddParameter('sort_field', sort_field); // სორტირების ველები
  RESTRequestApps.AddParameter('sort', sort); // სორტირების მნიშვნელობები
  RESTRequestApps.AddParameter('action', 'sort'); // ქმედება
  RESTRequestApps.ExecuteAsync(
    procedure
    begin
      self.ListViewAppsList.PullRefreshWait := False;
      PreloaderRectangle.Visible := False;
    end, True, True);
end;

procedure TAppListForm.filter(p_params: TSearchParams);
var
  v_ServiceType, v_PropertyType: String;
  listItem: Integer;
begin
  PreloaderRectangle.Visible := True;
  RESTRequestApps.params.Clear;
  if not DModule.sesskey.IsEmpty then
  begin
    RESTRequestApps.AddParameter('sesskey', DModule.sesskey);
    RESTRequestApps.AddParameter('user_id', DModule.id.ToString);
  end;
  // ფართობი დან
  if p_params.AreaFrom > 0 then
    RESTRequestApps.AddParameter('area_from', p_params.AreaFrom.ToString);
  // ფართობი მდე
  if p_params.AreaFrom > 0 then
    RESTRequestApps.AddParameter('area_to', p_params.AreaTo.ToString);
  v_ServiceType := '';
  // მომსახურების ტიპების ამოღება ლისტიდან
  for listItem in p_params.ServiceTypes do
  begin
    v_ServiceType := v_ServiceType + listItem.ToString + ',';
  end;
  // ქონების ტიპების ამოღება ლისტიდან
  for listItem in p_params.PropertyTypes do
  begin
    v_PropertyType := v_PropertyType + listItem.ToString + ',';
  end;
  // მომსახურების ტიპების სერიალიზაცია
  if not v_ServiceType.IsEmpty then
    RESTRequestApps.AddParameter('service_types',
      v_ServiceType.Remove(v_ServiceType.Length - 1));
  // ქონების ტიპების სერიალიზაცია
  if not v_PropertyType.IsEmpty then
    RESTRequestApps.AddParameter('property_types',
      v_PropertyType.Remove(v_PropertyType.Length - 1));

  RESTRequestApps.AddParameter('sort_field', 'id'); // სორტირების ველი
  RESTRequestApps.AddParameter('sort', 'desc'); // სორტირების მეთოდი
  RESTRequestApps.AddParameter('paction', 'filter'); // ქმედება
  RESTRequestApps.ExecuteAsync(
    procedure
    begin
      self.ListViewAppsList.PullRefreshWait := False;
      PreloaderRectangle.Visible := False;
    end, True, True);
end;

procedure TAppListForm.ListBoxItem1Click(Sender: TObject);
begin
  if RectangleServiceTypesSearchParams.Visible = False then
  begin
    RectangleServiceTypesSearchParams.Visible := True;
    RectanglePropTypesSearchParams.Visible := False; // ქონების ტიპების აკეცვა
    if self.v_loadServiceTree = False then
      self.loadServiceTypes;
    if self.v_loadPropTypes = False then
      self.loadPropertyTypes;
  end
  else
    RectangleServiceTypesSearchParams.Visible := False;
end;

procedure TAppListForm.ListBoxItem2Click(Sender: TObject);
begin
  if RectanglePropTypesSearchParams.Visible = False then
  begin
    RectanglePropTypesSearchParams.Visible := True;
    if self.v_loadLocationTree = False then
      self.loadLocationTree;
  end
  else
  begin
    RectanglePropTypesSearchParams.Visible := False;
  end;
end;

procedure TAppListForm.ListViewAppsListItemClickEx(const Sender: TObject;
ItemIndex: Integer; const LocalClickPos: TPointF;
const ItemObject: TListItemDrawable);
var
  id, v_height: Integer;
begin
  if (ItemObject is TListItemText) or (ItemObject is TListItemImage) then
  begin
    if (ItemObject.Name = 'app_property_requisites_count') or
      (ItemObject.Name = 'ArrowIcon') or (ItemObject.Name = 'SelectedLineRedBG')
    then
    begin
      v_height := TListItemText(ListViewAppsList.Selected.View.FindDrawable
        ('v_app_property_requisites_count')).Text.ToInteger * 35;
      if ListViewAppsList.Selected.Height = 150 then
      begin
        ListViewAppsList.Selected.Height := v_height + 150;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details')
          .Visible := True;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details').Height
          := v_height;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('ArrowIcon'))
          .ImageIndex := 3;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable
          ('IconCalendar')).ImageIndex := 5;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable
          ('SelectedLineRedBG')).Visible := True;

        TListItemText(ListViewAppsList.Selected.View.FindDrawable('create_date')
          ).TextColor := TAlphaColorRec.White;

        TListItemText(ListViewAppsList.Items[ItemIndex].View.FindDrawable
          ('create_date')).TextColor := TAlphaColor($FFFFFF);
      end
      else
      begin
        ListViewAppsList.Selected.Height := 150;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details')
          .Visible := False;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('ArrowIcon'))
          .ImageIndex := 2;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable
          ('IconCalendar')).ImageIndex := 1;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable
          ('SelectedLineRedBG')).Visible := False;

        TListItemText(ListViewAppsList.Selected.View.FindDrawable('create_date')
          ).TextColor := TAlphaColorRec.Black;
        TListItemText(ListViewAppsList.Selected.View.FindDrawable
          ('app_property_requisites_count')).TextColor := TAlphaColorRec.Black;
      end;
    end
    else
    begin
      id := self.FDMemTableApps.FieldByName('id').AsInteger;
      with TAppDetailForm.Create(Application) do
      begin
        initForm(id);
      end;
    end;
  end;
end;

procedure TAppListForm.ListViewAppsListPullRefresh(Sender: TObject);
begin
  self.ListViewAppsList.PullRefreshWait := True;
  self.reloadItems('id', 'desc');
end;

procedure TAppListForm.ListViewAppsListUpdateObjects(const Sender: TObject;
const AItem: TListViewItem);
begin
  TListItemImage(AItem.Objects.FindDrawable('IconCreateDate')).ImageIndex := 0;
  TListItemImage(AItem.Objects.FindDrawable('IconCalendar')).ImageIndex := 1;
  TListItemImage(AItem.Objects.FindDrawable('ArrowImage')).ImageIndex := 2;
  TListItemText(AItem.Objects.FindDrawable('location')).Width :=
    ListViewAppsList.Width - 100;
end;

procedure TAppListForm.SpeedButton1Click(Sender: TObject);
begin
  RectangleFilteringDetails.Visible := False;
end;

procedure TAppListForm.SpeedButtonFilteringClick(Sender: TObject);
begin
  RectangleFilteringDetails.Visible := True;
end;

procedure TAppListForm.SpeedButtonApplyClick(Sender: TObject);
begin
  RectangleSorting.Visible := False;
end;

procedure TAppListForm.SpeedButtonCloseClick(Sender: TObject);
begin
  RectangleSorting.Visible := False;
end;

procedure TAppListForm.SpeedButtonSortClick(Sender: TObject);
begin
  self.MultiViewSort.ShowMaster;
end;

end.
