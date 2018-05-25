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
  FMX.ExtCtrls, FMX.TMSPopup;

type
  TSearchParams = record
    AreaFrom: Integer;
    AreaTo: Integer;
  end;

type
  TAppListForm = class(TForm)
    ListView1: TListView;
    PreloaderRectangle: TRectangle;
    BindSourceDB1: TBindSourceDB;
    FDMemTableApps: TFDMemTable;
    RESTResponseDataSetAdapterApps: TRESTResponseDataSetAdapter;
    RESTResponseApps: TRESTResponse;
    RESTRequestApps: TRESTRequest;
    RectangleHeader: TRectangle;
    ButtonBack: TButton;
    BindingsList1: TBindingsList;
    MultiViewSort: TMultiView;
    Button1: TButton;
    Button3: TButton;
    Label1: TLabel;
    ButtonSorting: TButton;
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
    SpeedButton2: TSpeedButton;
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
    RectangleHeaderOfPTSP: TRectangle;
    Label4: TLabel;
    ButtonPropTypesSearchParamsClose: TButton;
    FloatAnimationListBoxPositionClose: TFloatAnimation;
    RadioButtonArea: TRadioButton;
    Label5: TLabel;
    RectangleServiceTypesSearchParams: TRectangle;
    TreeViewServices: TTreeView;
    Rectangle4: TRectangle;
    Label6: TLabel;
    ButtonServTypesSearchParamsClose: TButton;
    FloatAnimation1: TFloatAnimation;
    procedure ButtonBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1PullRefresh(Sender: TObject);
    procedure RESTRequestAppsAfterExecute(Sender: TCustomRESTRequest);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RESTRequestListsAfterExecute(Sender: TCustomRESTRequest);
    procedure ButtonFilteringSubmitClick(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure SpeedButtonCloseClick(Sender: TObject);
    procedure SpeedButtonSortClick(Sender: TObject);
    procedure SpeedButtonFilteringClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButtonApplyClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ButtonSortingClick(Sender: TObject);
    procedure ButtonPropTypesSearchParamsCloseClick(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ButtonServTypesSearchParamsCloseClick(Sender: TObject);
  private
    v_loadLocationTree: boolean;
    v_loadServiceTree: boolean;
    procedure reloadItems(sort_field, sort: String);
    procedure loadLocationTree;
    procedure filter(p_params: TSearchParams);
    procedure loadServiceTree;
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

procedure TAppListForm.ButtonPropTypesSearchParamsCloseClick(Sender: TObject);
begin
  RectanglePropTypesSearchParams.Visible := False;
end;

procedure TAppListForm.ButtonFilteringSubmitClick(Sender: TObject);
var
  // aTask: ITask;
  // v_locations: String;
  // i, iChildren: Integer;
  params: TSearchParams;
begin
  params.AreaFrom := EditAreaFrom.Text.ToInteger;
  params.AreaTo := EditAreaTo.Text.ToInteger;
  RectangleFilteringDetails.Visible := False;
  self.filter(params);

  { v_locations := '';
    for i := 0 to TreeViewLocations.Count - 1 do
    begin

    if TreeViewLocations.ItemByIndex(i).IsChecked = True then
    begin
    v_locations := v_locations + ',' + TreeViewLocations.ItemByIndex(i).Tag.ToString;
    if TreeViewLocations.ItemByIndex(i).ChildrenCount > 0 then
    begin
    for iChildren := 0 to TreeViewLocations.ItemByIndex(i).ChildrenCount - 1 do
    begin
    if TreeViewLocations.ItemByIndex(i).ItemByIndex(iChildren).IsChecked = True then
    begin
    v_locations := v_locations + ',' + TreeViewLocations.ItemByIndex(i).ItemByIndex(iChildren).Tag.ToString;
    end;
    end;
    end;
    end;
    end;

    self.PreloaderRectangle.Visible := True;
    self.RectangleFilteringDetails.Visible := False;
    aTask := TTask.Create(
    procedure()
    begin
    RESTRequestApps.Params.Clear;
    if not DModule.sesskey.IsEmpty then
    begin
    with RESTRequestApps.Params.AddItem do
    begin
    name := 'sesskey';
    Value := DModule.sesskey;
    end;
    with RESTRequestApps.Params.AddItem do
    begin
    name := 'user_id';
    Value := DModule.id.ToString;
    end;
    with RESTRequestApps.Params.AddItem do
    begin
    name := 'locations';
    Value := v_locations;
    end;
    with RESTRequestApps.Params.AddItem do
    begin
    name := 'app_service_type_id';
    Value := FDMemTableAppServiceTypes.FieldByName('id').AsString;
    end;
    with RESTRequestApps.Params.AddItem do
    begin
    name := 'app_service_type_id';
    Value := FDMemTableAppServiceTypes.FieldByName('id').AsString;
    end;
    end;
    RESTRequestApps.Execute;
    end);
    aTask.Start; }
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
        with TTreeViewItem.Create(TreeViewLocations.Items[FDMemTableLocations.FieldByName('pid').AsInteger - 1]) do
        begin
          Parent := TreeViewLocations.Items[FDMemTableLocations.FieldByName('pid').AsInteger - 1];
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

procedure TAppListForm.loadServiceTree;
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

procedure TAppListForm.ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TAppListForm.ButtonServTypesSearchParamsCloseClick(Sender: TObject);
begin
  RectangleServiceTypesSearchParams.Visible := False;
end;

procedure TAppListForm.ButtonSortingClick(Sender: TObject);
begin
  if RectangleFilteringSortingButtons.Visible = True then
    RectangleFilteringSortingButtons.Visible := False
  else
    RectangleFilteringSortingButtons.Visible := True;
end;

procedure TAppListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TAppListForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    self.Free;
end;

procedure TAppListForm.initForm;
var
  aTask: ITask;
begin
  self.v_loadLocationTree := False;
  self.v_loadServiceTree := False;
  self.Show;
  PreloaderRectangle.Visible := True;
  aTask := TTask.Create(
    procedure()
    begin
      self.RESTRequestLists.Execute;
    end);
  aTask.Start;
end;

procedure TAppListForm.reloadItems(sort_field, sort: String);
var
  aTask: ITask;
begin
  PreloaderRectangle.Visible := True;
  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestApps.params.Clear;
      if not DModule.sesskey.IsEmpty then
      begin
        RESTRequestApps.AddParameter('sesskey', DModule.sesskey);
        RESTRequestApps.AddParameter('user_id', DModule.id.ToString);
      end;
      RESTRequestApps.AddParameter('sort_field', sort_field);
      RESTRequestApps.AddParameter('sort', sort);
      RESTRequestApps.AddParameter('action', 'sort');
      RESTRequestApps.Execute;
    end);
  aTask.Start;
end;

procedure TAppListForm.filter(p_params: TSearchParams);
var
  aTask: ITask;
begin
  PreloaderRectangle.Visible := True;
  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestApps.params.Clear;
      if not DModule.sesskey.IsEmpty then
      begin
        RESTRequestApps.AddParameter('sesskey', DModule.sesskey);
        RESTRequestApps.AddParameter('user_id', DModule.id.ToString);
      end;
      if p_params.AreaFrom > 0 then
        RESTRequestApps.AddParameter('area_from', p_params.AreaFrom.ToString);
      if p_params.AreaFrom > 0 then
        RESTRequestApps.AddParameter('area_to', p_params.AreaTo.ToString);

      RESTRequestApps.AddParameter('sort_field', 'id');
      RESTRequestApps.AddParameter('sort', 'desc');
      RESTRequestApps.AddParameter('paction', 'filter');
      RESTRequestApps.Execute;
    end);
  aTask.Start;
end;

procedure TAppListForm.ListBoxItem1Click(Sender: TObject);
begin
  RectangleServiceTypesSearchParams.Visible := True;
  if self.v_loadServiceTree = False then
    self.loadServiceTree;
end;

procedure TAppListForm.ListBoxItem2Click(Sender: TObject);
begin
  RectanglePropTypesSearchParams.Visible := True;
  if self.v_loadLocationTree = False then
    self.loadLocationTree;
end;

procedure TAppListForm.ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
const ItemObject: TListItemDrawable);
var
  id: Integer;
begin
  if (ItemObject is TListItemText) or (ItemObject is TListItemImage) then
  begin
    if (ItemObject.name = 'app_property_requisites_count') or (ItemObject.name = 'ArrowImage') then
    begin
      if ListView1.Selected.Height = 90 then
      begin
        ListView1.Selected.Height := 170;
        TListItem(ListView1.Selected).View.FindDrawable('details').Visible := True;
      end
      else
      begin
        ListView1.Selected.Height := 90;
        TListItem(ListView1.Selected).View.FindDrawable('details').Visible := False;
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

procedure TAppListForm.ListView1PullRefresh(Sender: TObject);
begin
  self.ListView1.PullRefreshWait := True;
  self.reloadItems('id', 'desc');
end;

procedure TAppListForm.RESTRequestAppsAfterExecute(Sender: TCustomRESTRequest);
begin
  self.ListView1.PullRefreshWait := False;
  PreloaderRectangle.Visible := False;
end;

procedure TAppListForm.RESTRequestListsAfterExecute(Sender: TCustomRESTRequest);
begin
  self.reloadItems('id', 'desc');
end;

procedure TAppListForm.SpeedButton1Click(Sender: TObject);
begin
  RectangleFilteringDetails.Visible := False;
end;

procedure TAppListForm.SpeedButton2Click(Sender: TObject);
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
