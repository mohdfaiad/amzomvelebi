unit MyContracts;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Header, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Layouts, FMX.LoadingIndicator, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, System.Threading, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.DBScope, Data.Bind.Controls, Fmx.Bind.Navigator, System.ImageList, FMX.ImgList;

type
  TMyContractsForm = class(TForm)
    HeaderFrame1: THeaderFrame;
    RESTRequestContracts: TRESTRequest;
    RESTResponseContracts: TRESTResponse;
    RESTResponseDataSetAdapterContracts: TRESTResponseDataSetAdapter;
    FDMemTableContracts: TFDMemTable;
    RectanglePreloader: TRectangle;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    FDMemTableContractsapp_id: TWideStringField;
    FDMemTableContractsamzomveli_id: TWideStringField;
    FDMemTableContractsganmcxadebeli_id: TWideStringField;
    FDMemTableContractsganmcxadebeli_name: TWideStringField;
    FDMemTableContractsoffered_price: TWideStringField;
    FDMemTableContractsoffer_description: TWideStringField;
    FDMemTableContractscreate_date: TWideStringField;
    FDMemTableContractsimageindex: TWideStringField;
    NavigatorBindSourceDB1: TBindNavigator;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initForm;
  end;

var
  MyContractsForm: TMyContractsForm;

implementation

{$R *.fmx}

uses DataModule, Main;
{ TMyContractsForm }

procedure TMyContractsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TMyContractsForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TMyContractsForm.initForm;
var
  aTask: ITask;
begin
  self.show;
  HeaderFrame1.LabelAppName.Text := 'ჩემი შეთანხმებების სია';
  RectanglePreloader.Visible := True;
  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestContracts.Params.Clear;
      if not DModule.sesskey.IsEmpty then
      begin
        with RESTRequestContracts.Params.AddItem do
        begin
          name := 'sesskey';
          Value := DModule.sesskey;
        end;
        with RESTRequestContracts.Params.AddItem do
        begin
          name := 'user_id';
          Value := DModule.id.ToString;
        end;
      end
      else
        self.Close;
      self.RESTRequestContracts.Execute;
    end);
  aTask.Start;
end;

end.
