unit OOMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Buttons, PlanSwift_tlb, calcExample;

type
  TMain = class(TForm)
    calc_btn: TButton;
    Label1: TLabel;
    procedure calc_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  pc:IPlanCenter;
  ItemNumber:Integer;
  oSheet:Variant;


implementation

{$R *.dfm}

uses
comobj, OOoMessages, OOoTools, OOoConstants, OOoXray;

procedure openPlanswift;
begin
   //pc := CoPlanCenter.Create;
   try
    pc := getactiveoleobject('PlanSwift.PlanCenter') as IPlanCenter;
  except
    pc := createoleobject('PlanSwift.PlanCenter') as IPlanCenter;
  end;
  if not pc.JobOpened then
    if not pc.OpenJobEx then
    begin
      showmessage('You must open a job to use this example');
      exit;
    end;
end;

procedure openOpenOffice;
begin
  ConnectOpenOffice;
end;
//Export Items to Calc
procedure ExporttoCalc(AItem:IItem);
var
IType:Planswift_Tlb.ItemType;
IName,ITab,IQty,IITab,INumber,IPriceEach,IPriceTotal:String;
oProp:IProperties;
begin
  oSheet.getCellByPosition(0, ItemNumber).String := pc.Tabs.SelectedTab.Title;
  oSheet.getCellByPosition(1,ItemNumber).String := AItem.Properties.ByName('Name').Value;
  if AItem.Type_ <>  itFolder then
  begin
    oSheet.getCellByPosition(2,ItemNumber).String := AItem.Properties.ByName('Item #').Value;
    oSheet.getCellByPosition(3,ItemNumber).String := AItem.Properties.ByName('Qty').Value;
    oSheet.getCellByPosition(4,ItemNumber).String := AItem.Properties.ByName('Price Each').Value;
    oSheet.getCellByPosition(5,ItemNumber).String := AItem.Properties.ByName('Price Total').Value;
  end;
  case AItem.Type_ of
  itpart: oSheet.getCellByPosition(6,ItemNumber).String := 'Part';
  itAssembly: oSheet.getCellByPosition(6,ItemNumber).String := 'Assembly';
  itFolder: oSheet.getCellByPosition(6,ItemNumber).String := 'Folder';
  itNone: oSheet.getCellByPosition(6,ItemNumber).String := 'None';
  end;
end;

procedure GetItems(AItem:IItem);
var
 ChildIndex:Integer;
 begin
  inc(ItemNumber);
   ExporttoCalc(AItem);
   for ChildIndex := 0 to Aitem.count -1 do
    GetItems(AItem.Item[ChildIndex])

 end;

procedure TMain.calc_btnClick(Sender: TObject);
var
CurrentTab:Planswift_tlb.ITab;
myDoc, aRange, fields, unoWrap, sortDx : Variant;
TabIndex,ItemIndex,n : Integer;
begin

  calc_frm := tcalc_frm.create(nil);
  for TabIndex := 0 to pc.Tabs.count - 1 do
    if pc.Tabs[TabIndex].Type_ = ttJob then
      Calc_frm.Tabs_cbx.Items.Add(pc.Tabs[TabIndex].Title);
      Calc_frm.Tabs_cbx.itemindex := 0;
      Calc_frm.Caption := 'Export to Calc';
      if Calc_frm.showModal = mrOk then
      begin
      cursor := crhourglass;
      refresh;
      //lcid := getuserdefaultlcid;
      myDoc:= StarDesktop.loadComponentFromURL('private:factory/scalc', '_blank', 0, dummyArray);
      oSheet:= myDoc.Sheets.getByIndex(0);
      oSheet.getCellRangeByName('A1').String:= 'Tab';
      oSheet.getCellRangeByName('B1').String:= 'Name';
      oSheet.getCellRangeByName('C1').String:= 'ItemNumber';
      oSheet.getCellRangeByName('D1').String:= 'Qty';
      oSheet.getCellRangeByName('E1').String:= 'Price Each';
      oSheet.getCellRangeByName('F1').String:= 'Price Total';
      oSheet.getCellRangeByName('G1').String:= 'Item Type';
      ItemNumber := 0;
      CurrentTab := pc.Tabs.ByName(Calc_frm.Tabs_cbx.Text);
      CurrentTab.MakeActive;
      for ItemIndex := 0 to CurrentTab.Count - 1 do
        GetItems(CurrentTab[ItemIndex]);
  end;
  cursor := crdefault;
  if Calc_frm <> nil then
    Calc_frm.Free;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  pc := nil;
  DisconnectOpenOffice;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
   openPlanSwift;
   openOpenOffice;
end;

end.
