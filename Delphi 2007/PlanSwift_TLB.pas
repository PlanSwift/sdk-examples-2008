unit PlanSwift_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 8291 $
// File generated on 7/23/2008 3:35:48 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Documents and Settings\Darryl Holloman\My Documents\RAD Studio\Projects\Planswift\PlanSwift 802\PlanSwift.tlb (1)
// LIBID: {6B7CA65D-A963-45DC-BFA6-7BE872C71D0F}
// LCID: 0
// Helpfile: 
// HelpString: PlanSwift Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PlanSwiftMajorVersion = 1;
  PlanSwiftMinorVersion = 0;

  LIBID_PlanSwift: TGUID = '{6B7CA65D-A963-45DC-BFA6-7BE872C71D0F}';

  IID_IPlanCenter: TGUID = '{68535E07-5C73-4983-9A08-1C794351F060}';
  CLASS_PlanCenter: TGUID = '{ED85DDB4-8ACC-4BCE-935F-2B52F0A5F443}';
  IID_IPage: TGUID = '{110AA9E7-6631-4380-858C-B335FC2B848F}';
  CLASS_Page: TGUID = '{9B3F6AA7-312C-4454-9DE0-6A587F385A2A}';
  IID_IPages: TGUID = '{4E70F949-1157-4EBE-BC8E-85D082322D74}';
  CLASS_Pages: TGUID = '{07F40B93-1730-437F-911C-9E39922879CC}';
  IID_IPoint: TGUID = '{CBBE5370-39EA-42BF-8C0F-A6AB79E3D517}';
  CLASS_Point: TGUID = '{3C26ADC8-A914-4ADE-973D-958DE391D619}';
  IID_IItem: TGUID = '{9D78AB3F-4E0E-4D54-A703-088EE038FF31}';
  CLASS_Item: TGUID = '{3976C1D5-C67E-48E7-8E31-DEAB82BC4035}';
  IID_IDigitizer: TGUID = '{22BC7236-7AF4-485B-974C-8D216413E7FE}';
  CLASS_Digitizer: TGUID = '{A5C0EF67-0E91-452D-A6EA-5CCBE2D5543F}';
  IID_ITab: TGUID = '{4E338943-81AC-4327-BA56-B40B8588C413}';
  CLASS_Tab: TGUID = '{55705053-7A7D-488B-812D-5E391E3AD5DC}';
  IID_ITabs: TGUID = '{D3CBCD32-A052-46C0-8CF1-CD92F4560A33}';
  CLASS_Tabs: TGUID = '{0EC1C726-71FA-4114-8B4C-2782091CED36}';
  IID_IProperties: TGUID = '{1BEEFD77-B579-4AB8-B6E8-F5BA24D738B6}';
  CLASS_Properties: TGUID = '{EFFDE775-53C8-473F-8257-FA8C7D28D2B0}';
  IID_IPropertyObject: TGUID = '{42D13D22-4470-43AE-ACB6-01903DB28231}';
  CLASS_PropertyObject: TGUID = '{506C2605-F90D-4A39-84E2-CE8D83A6D57D}';
  IID_ISection: TGUID = '{6AB00FD2-06B4-41BD-BC92-8CE18E6C8133}';
  CLASS_Section: TGUID = '{7AB85A98-1A57-4B08-B467-F213AF9130B6}';
  IID_ISections: TGUID = '{C289639D-BAFA-44DB-991A-AD7750F1D30C}';
  CLASS_Sections: TGUID = '{C1C883D1-E084-4E7F-87D9-110D7E601046}';
  IID_INodes: TGUID = '{F1A5990F-BF94-4EED-828D-0D0B2A894725}';
  CLASS_Nodes: TGUID = '{53CA65C8-DCD2-4F37-A798-F37405E3A625}';
  IID_INode: TGUID = '{1B9B5034-1EA6-494B-8075-EA53793DD679}';
  CLASS_Node: TGUID = '{D03E73A6-4496-447C-830E-B6604F8E9286}';
  IID_ISelectionList: TGUID = '{221D7881-9EEF-46FA-968E-61F693A1469B}';
  CLASS_SelectionList: TGUID = '{D10060A5-FE7B-4814-A6C8-4D42AC06F5B9}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ValueType
type
  ValueType = TOleEnum;
const
  vtNumber = $00000000;
  vtFill = $00000002;
  vtTemplate = $00000003;
  vtDigitizerType = $00000004;
  vtItemType = $00000005;
  vtText = $00000001;

// Constants for enum ItemType
type
  ItemType = TOleEnum;
const
  itNone = $00000000;
  itPart = $00000001;
  itAssembly = $00000002;
  itFolder = $00000003;

// Constants for enum DigitizerType
type
  DigitizerType = TOleEnum;
const
  dgArea = $00000000;
  dgLinear = $00000001;
  dgSegment = $00000002;
  dgCount = $00000003;
  dgNone = $00000004;

// Constants for enum TabType
type
  TabType = TOleEnum;
const
  ttJob = $00000000;
  ttCommonLocal = $00000001;
  ttCommonNetwork = $00000002;

// Constants for enum NodeType
type
  NodeType = TOleEnum;
const
  ntNormal = $00000000;
  ntArc = $00000001;
  ntArcChild = $00000002;

// Constants for enum ArcNodeType
type
  ArcNodeType = TOleEnum;
const
  anSegments = $00000000;
  anDegrees = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IPlanCenter = interface;
  IPlanCenterDisp = dispinterface;
  IPage = interface;
  IPageDisp = dispinterface;
  IPages = interface;
  IPagesDisp = dispinterface;
  IPoint = interface;
  IPointDisp = dispinterface;
  IItem = interface;
  IItemDisp = dispinterface;
  IDigitizer = interface;
  IDigitizerDisp = dispinterface;
  ITab = interface;
  ITabDisp = dispinterface;
  ITabs = interface;
  ITabsDisp = dispinterface;
  IProperties = interface;
  IPropertiesDisp = dispinterface;
  IPropertyObject = interface;
  IPropertyObjectDisp = dispinterface;
  ISection = interface;
  ISectionDisp = dispinterface;
  ISections = interface;
  ISectionsDisp = dispinterface;
  INodes = interface;
  INodesDisp = dispinterface;
  INode = interface;
  INodeDisp = dispinterface;
  ISelectionList = interface;
  ISelectionListDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  PlanCenter = IPlanCenter;
  Page = IPage;
  Pages = IPages;
  Point = IPoint;
  Item = IItem;
  Digitizer = IDigitizer;
  Tab = ITab;
  Tabs = ITabs;
  Properties = IProperties;
  PropertyObject = IPropertyObject;
  Section = ISection;
  Sections = ISections;
  Nodes = INodes;
  Node = INode;
  SelectionList = ISelectionList;


// *********************************************************************//
// Interface: IPlanCenter
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {68535E07-5C73-4983-9A08-1C794351F060}
// *********************************************************************//
  IPlanCenter = interface(IDispatch)
    ['{68535E07-5C73-4983-9A08-1C794351F060}']
    procedure About; safecall;
    function Get_JobNumber: WideString; safecall;
    function Get_JobName: WideString; safecall;
    procedure Set_JobName(const NewName: WideString); safecall;
    function Get_FolderPath: WideString; safecall;
    function OpenJob(const aValue: WideString): WordBool; safecall;
    procedure CloseJob; safecall;
    function Get_Pages: IPages; safecall;
    procedure Print; safecall;
    function Get_Zoom: Double; safecall;
    procedure Set_Zoom(Value: Double); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure ZoomExtents; safecall;
    function Get_Tabs: ITabs; safecall;
    function OpenJobEx: WordBool; safecall;
    function Get_JobOpened: WordBool; safecall;
    function LocalPlanPath: WideString; safecall;
    function NetworkPlanPath: WideString; safecall;
    function ArchivePlanPath: WideString; safecall;
    function LocalDataPath: WideString; safecall;
    function NetworkDataPath: WideString; safecall;
    function FindItemByGUID(const ItemID: WideString): IItem; safecall;
    function CurrentItem: IItem; safecall;
    function Get_KeyCode: WideString; safecall;
    procedure Set_KeyCode(const Value: WideString); safecall;
    function aPoint(x: Single; y: Single): IPoint; safecall;
    function GetEdition: WideString; safecall;
    function IsBeta: WordBool; safecall;
    function SelectionList: ISelectionList; safecall;
    property JobNumber: WideString read Get_JobNumber;
    property JobName: WideString read Get_JobName write Set_JobName;
    property FolderPath: WideString read Get_FolderPath;
    property Pages: IPages read Get_Pages;
    property Zoom: Double read Get_Zoom write Set_Zoom;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Tabs: ITabs read Get_Tabs;
    property JobOpened: WordBool read Get_JobOpened;
    property KeyCode: WideString read Get_KeyCode write Set_KeyCode;
  end;

// *********************************************************************//
// DispIntf:  IPlanCenterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {68535E07-5C73-4983-9A08-1C794351F060}
// *********************************************************************//
  IPlanCenterDisp = dispinterface
    ['{68535E07-5C73-4983-9A08-1C794351F060}']
    procedure About; dispid 201;
    property JobNumber: WideString readonly dispid 202;
    property JobName: WideString dispid 203;
    property FolderPath: WideString readonly dispid 204;
    function OpenJob(const aValue: WideString): WordBool; dispid 205;
    procedure CloseJob; dispid 206;
    property Pages: IPages readonly dispid 207;
    procedure Print; dispid 208;
    property Zoom: Double dispid 209;
    property Visible: WordBool dispid 210;
    procedure ZoomExtents; dispid 211;
    property Tabs: ITabs readonly dispid 212;
    function OpenJobEx: WordBool; dispid 213;
    property JobOpened: WordBool readonly dispid 214;
    function LocalPlanPath: WideString; dispid 215;
    function NetworkPlanPath: WideString; dispid 216;
    function ArchivePlanPath: WideString; dispid 217;
    function LocalDataPath: WideString; dispid 218;
    function NetworkDataPath: WideString; dispid 219;
    function FindItemByGUID(const ItemID: WideString): IItem; dispid 220;
    function CurrentItem: IItem; dispid 221;
    property KeyCode: WideString dispid 222;
    function aPoint(x: Single; y: Single): IPoint; dispid 223;
    function GetEdition: WideString; dispid 224;
    function IsBeta: WordBool; dispid 225;
    function SelectionList: ISelectionList; dispid 226;
  end;

// *********************************************************************//
// Interface: IPage
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {110AA9E7-6631-4380-858C-B335FC2B848F}
// *********************************************************************//
  IPage = interface(IDispatch)
    ['{110AA9E7-6631-4380-858C-B335FC2B848F}']
    function Get_ScaleX: Double; safecall;
    procedure Set_ScaleX(Value: Double); safecall;
    function Get_ScaleY: Double; safecall;
    procedure Set_ScaleY(Value: Double); safecall;
    function Get_Origin: IPoint; safecall;
    procedure Set_Origin(const Value: IPoint); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_FileName: WideString; safecall;
    procedure Print; safecall;
    function HasOrigin: WordBool; safecall;
    procedure MakeActive; safecall;
    function Scaled: WordBool; safecall;
    property ScaleX: Double read Get_ScaleX write Set_ScaleX;
    property ScaleY: Double read Get_ScaleY write Set_ScaleY;
    property Origin: IPoint read Get_Origin write Set_Origin;
    property Name: WideString read Get_Name write Set_Name;
    property FileName: WideString read Get_FileName;
  end;

// *********************************************************************//
// DispIntf:  IPageDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {110AA9E7-6631-4380-858C-B335FC2B848F}
// *********************************************************************//
  IPageDisp = dispinterface
    ['{110AA9E7-6631-4380-858C-B335FC2B848F}']
    property ScaleX: Double dispid 201;
    property ScaleY: Double dispid 202;
    property Origin: IPoint dispid 203;
    property Name: WideString dispid 204;
    property FileName: WideString readonly dispid 205;
    procedure Print; dispid 206;
    function HasOrigin: WordBool; dispid 207;
    procedure MakeActive; dispid 208;
    function Scaled: WordBool; dispid 209;
  end;

// *********************************************************************//
// Interface: IPages
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4E70F949-1157-4EBE-BC8E-85D082322D74}
// *********************************************************************//
  IPages = interface(IDispatch)
    ['{4E70F949-1157-4EBE-BC8E-85D082322D74}']
    function Get_Item(Index: Integer): IPage; safecall;
    function Get_Count: Integer; safecall;
    function SelectedPage: IPage; safecall;
    function Add(const FileName: WideString): IPage; safecall;
    procedure Delete(Index: Integer); safecall;
    property Item[Index: Integer]: IPage read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IPagesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4E70F949-1157-4EBE-BC8E-85D082322D74}
// *********************************************************************//
  IPagesDisp = dispinterface
    ['{4E70F949-1157-4EBE-BC8E-85D082322D74}']
    property Item[Index: Integer]: IPage readonly dispid 0; default;
    property Count: Integer readonly dispid 201;
    function SelectedPage: IPage; dispid 202;
    function Add(const FileName: WideString): IPage; dispid 203;
    procedure Delete(Index: Integer); dispid 204;
  end;

// *********************************************************************//
// Interface: IPoint
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CBBE5370-39EA-42BF-8C0F-A6AB79E3D517}
// *********************************************************************//
  IPoint = interface(IDispatch)
    ['{CBBE5370-39EA-42BF-8C0F-A6AB79E3D517}']
    function Get_x: Single; safecall;
    procedure Set_x(Value: Single); safecall;
    function Get_y: Single; safecall;
    procedure Set_y(Value: Single); safecall;
    property x: Single read Get_x write Set_x;
    property y: Single read Get_y write Set_y;
  end;

// *********************************************************************//
// DispIntf:  IPointDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CBBE5370-39EA-42BF-8C0F-A6AB79E3D517}
// *********************************************************************//
  IPointDisp = dispinterface
    ['{CBBE5370-39EA-42BF-8C0F-A6AB79E3D517}']
    property x: Single dispid 201;
    property y: Single dispid 202;
  end;

// *********************************************************************//
// Interface: IItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9D78AB3F-4E0E-4D54-A703-088EE038FF31}
// *********************************************************************//
  IItem = interface(IDispatch)
    ['{9D78AB3F-4E0E-4D54-A703-088EE038FF31}']
    function Get_ItemType: ItemType; safecall;
    procedure Set_ItemType(Value: ItemType); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IItem; safecall;
    function ItemList: WideString; safecall;
    function Edit: WordBool; safecall;
    function Get_Properties: IProperties; safecall;
    function New(dgtype: Integer; ittype: Integer): IItem; safecall;
    function ItemID: WideString; safecall;
    function DoRecord: WordBool; safecall;
    function Get_DigiType: Integer; safecall;
    procedure Set_DigiType(Value: Integer); safecall;
    function Get_Sections: ISections; safecall;
    procedure Delete(Index: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Owner: IItem; safecall;
    function IsChild: WordBool; safecall;
    function Tab: ITab; safecall;
    function FullName: WideString; safecall;
    property ItemType: ItemType read Get_ItemType write Set_ItemType;
    property Name: WideString read Get_Name write Set_Name;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IItem read Get_Item; default;
    property Properties: IProperties read Get_Properties;
    property DigiType: Integer read Get_DigiType write Set_DigiType;
    property Sections: ISections read Get_Sections;
    property Visible: WordBool read Get_Visible write Set_Visible;
  end;

// *********************************************************************//
// DispIntf:  IItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9D78AB3F-4E0E-4D54-A703-088EE038FF31}
// *********************************************************************//
  IItemDisp = dispinterface
    ['{9D78AB3F-4E0E-4D54-A703-088EE038FF31}']
    property ItemType: ItemType dispid 201;
    property Name: WideString dispid 202;
    property Count: Integer readonly dispid 203;
    property Item[Index: Integer]: IItem readonly dispid 0; default;
    function ItemList: WideString; dispid 205;
    function Edit: WordBool; dispid 206;
    property Properties: IProperties readonly dispid 204;
    function New(dgtype: Integer; ittype: Integer): IItem; dispid 207;
    function ItemID: WideString; dispid 208;
    function DoRecord: WordBool; dispid 209;
    property DigiType: Integer dispid 210;
    property Sections: ISections readonly dispid 211;
    procedure Delete(Index: Integer); dispid 212;
    property Visible: WordBool dispid 213;
    function Owner: IItem; dispid 214;
    function IsChild: WordBool; dispid 215;
    function Tab: ITab; dispid 216;
    function FullName: WideString; dispid 217;
  end;

// *********************************************************************//
// Interface: IDigitizer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {22BC7236-7AF4-485B-974C-8D216413E7FE}
// *********************************************************************//
  IDigitizer = interface(IDispatch)
    ['{22BC7236-7AF4-485B-974C-8D216413E7FE}']
  end;

// *********************************************************************//
// DispIntf:  IDigitizerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {22BC7236-7AF4-485B-974C-8D216413E7FE}
// *********************************************************************//
  IDigitizerDisp = dispinterface
    ['{22BC7236-7AF4-485B-974C-8D216413E7FE}']
  end;

// *********************************************************************//
// Interface: ITab
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4E338943-81AC-4327-BA56-B40B8588C413}
// *********************************************************************//
  ITab = interface(IDispatch)
    ['{4E338943-81AC-4327-BA56-B40B8588C413}']
    function Get_TabType: TabType; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    procedure MakeActive; safecall;
    function Get_Item(Index: Integer): IItem; safecall;
    function Get_Count: Integer; safecall;
    function ItemList: WideString; safecall;
    function New(dgtype: Integer; ittype: Integer): IItem; safecall;
    procedure Delete(Index: Integer); safecall;
    property TabType: TabType read Get_TabType;
    property Name: WideString read Get_Name write Set_Name;
    property Item[Index: Integer]: IItem read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ITabDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4E338943-81AC-4327-BA56-B40B8588C413}
// *********************************************************************//
  ITabDisp = dispinterface
    ['{4E338943-81AC-4327-BA56-B40B8588C413}']
    property TabType: TabType readonly dispid 201;
    property Name: WideString dispid 202;
    procedure MakeActive; dispid 203;
    property Item[Index: Integer]: IItem readonly dispid 0; default;
    property Count: Integer readonly dispid 205;
    function ItemList: WideString; dispid 206;
    function New(dgtype: Integer; ittype: Integer): IItem; dispid 204;
    procedure Delete(Index: Integer); dispid 207;
  end;

// *********************************************************************//
// Interface: ITabs
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3CBCD32-A052-46C0-8CF1-CD92F4560A33}
// *********************************************************************//
  ITabs = interface(IDispatch)
    ['{D3CBCD32-A052-46C0-8CF1-CD92F4560A33}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): ITab; safecall;
    function SelectedTab: ITab; safecall;
    function TabList: WideString; safecall;
    function ByName(const Name: WideString): ITab; safecall;
    function New(aTabType: Integer; const aTabName: WideString): ITab; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: ITab read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ITabsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3CBCD32-A052-46C0-8CF1-CD92F4560A33}
// *********************************************************************//
  ITabsDisp = dispinterface
    ['{D3CBCD32-A052-46C0-8CF1-CD92F4560A33}']
    property Count: Integer readonly dispid 201;
    property Item[Index: Integer]: ITab readonly dispid 0; default;
    function SelectedTab: ITab; dispid 202;
    function TabList: WideString; dispid 203;
    function ByName(const Name: WideString): ITab; dispid 204;
    function New(aTabType: Integer; const aTabName: WideString): ITab; dispid 205;
  end;

// *********************************************************************//
// Interface: IProperties
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BEEFD77-B579-4AB8-B6E8-F5BA24D738B6}
// *********************************************************************//
  IProperties = interface(IDispatch)
    ['{1BEEFD77-B579-4AB8-B6E8-F5BA24D738B6}']
    function Get_Item(Index: Integer): IPropertyObject; safecall;
    function Count: Integer; safecall;
    function PropertyList: WideString; safecall;
    function ByName(const Name: WideString): IPropertyObject; safecall;
    function Add: IPropertyObject; safecall;
    property Item[Index: Integer]: IPropertyObject read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IPropertiesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1BEEFD77-B579-4AB8-B6E8-F5BA24D738B6}
// *********************************************************************//
  IPropertiesDisp = dispinterface
    ['{1BEEFD77-B579-4AB8-B6E8-F5BA24D738B6}']
    property Item[Index: Integer]: IPropertyObject readonly dispid 0; default;
    function Count: Integer; dispid 201;
    function PropertyList: WideString; dispid 202;
    function ByName(const Name: WideString): IPropertyObject; dispid 203;
    function Add: IPropertyObject; dispid 204;
  end;

// *********************************************************************//
// Interface: IPropertyObject
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {42D13D22-4470-43AE-ACB6-01903DB28231}
// *********************************************************************//
  IPropertyObject = interface(IDispatch)
    ['{42D13D22-4470-43AE-ACB6-01903DB28231}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(Value: WordBool); safecall;
    function Get_Digits: Integer; safecall;
    procedure Set_Digits(Value: Integer); safecall;
    function Get_Column: WideString; safecall;
    procedure Set_Column(const Value: WideString); safecall;
    function Get_Units: WideString; safecall;
    procedure Set_Units(const Value: WideString); safecall;
    function Get_Formula: WideString; safecall;
    procedure Set_Formula(const Value: WideString); safecall;
    function Get_ValueType: Integer; safecall;
    procedure Set_ValueType(Value: Integer); safecall;
    function Get_Category: WideString; safecall;
    procedure Set_Category(const Value: WideString); safecall;
    function Value: WideString; safecall;
    function Edit: WordBool; safecall;
    function EditFormula: WordBool; safecall;
    function Owner: IItem; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property Digits: Integer read Get_Digits write Set_Digits;
    property Column: WideString read Get_Column write Set_Column;
    property Units: WideString read Get_Units write Set_Units;
    property Formula: WideString read Get_Formula write Set_Formula;
    property ValueType: Integer read Get_ValueType write Set_ValueType;
    property Category: WideString read Get_Category write Set_Category;
  end;

// *********************************************************************//
// DispIntf:  IPropertyObjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {42D13D22-4470-43AE-ACB6-01903DB28231}
// *********************************************************************//
  IPropertyObjectDisp = dispinterface
    ['{42D13D22-4470-43AE-ACB6-01903DB28231}']
    property Name: WideString dispid 201;
    property Locked: WordBool dispid 202;
    property Digits: Integer dispid 203;
    property Column: WideString dispid 204;
    property Units: WideString dispid 205;
    property Formula: WideString dispid 206;
    property ValueType: Integer dispid 207;
    property Category: WideString dispid 208;
    function Value: WideString; dispid 209;
    function Edit: WordBool; dispid 210;
    function EditFormula: WordBool; dispid 211;
    function Owner: IItem; dispid 212;
  end;

// *********************************************************************//
// Interface: ISection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6AB00FD2-06B4-41BD-BC92-8CE18E6C8133}
// *********************************************************************//
  ISection = interface(IDispatch)
    ['{6AB00FD2-06B4-41BD-BC92-8CE18E6C8133}']
    function Get_Nodes: INodes; safecall;
    function Get_Selected: WordBool; safecall;
    procedure Set_Selected(Value: WordBool); safecall;
    function Get_Subtract: WordBool; safecall;
    procedure Set_Subtract(Value: WordBool); safecall;
    function Owner: IItem; safecall;
    function Page: IPage; safecall;
    property Nodes: INodes read Get_Nodes;
    property Selected: WordBool read Get_Selected write Set_Selected;
    property Subtract: WordBool read Get_Subtract write Set_Subtract;
  end;

// *********************************************************************//
// DispIntf:  ISectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6AB00FD2-06B4-41BD-BC92-8CE18E6C8133}
// *********************************************************************//
  ISectionDisp = dispinterface
    ['{6AB00FD2-06B4-41BD-BC92-8CE18E6C8133}']
    property Nodes: INodes readonly dispid 201;
    property Selected: WordBool dispid 202;
    property Subtract: WordBool dispid 203;
    function Owner: IItem; dispid 204;
    function Page: IPage; dispid 205;
  end;

// *********************************************************************//
// Interface: ISections
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C289639D-BAFA-44DB-991A-AD7750F1D30C}
// *********************************************************************//
  ISections = interface(IDispatch)
    ['{C289639D-BAFA-44DB-991A-AD7750F1D30C}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): ISection; safecall;
    procedure Delete(Index: Integer); safecall;
    function Add(const aPageName: WideString): ISection; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: ISection read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ISectionsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C289639D-BAFA-44DB-991A-AD7750F1D30C}
// *********************************************************************//
  ISectionsDisp = dispinterface
    ['{C289639D-BAFA-44DB-991A-AD7750F1D30C}']
    property Count: Integer readonly dispid 201;
    property Item[Index: Integer]: ISection readonly dispid 0; default;
    procedure Delete(Index: Integer); dispid 202;
    function Add(const aPageName: WideString): ISection; dispid 203;
  end;

// *********************************************************************//
// Interface: INodes
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F1A5990F-BF94-4EED-828D-0D0B2A894725}
// *********************************************************************//
  INodes = interface(IDispatch)
    ['{F1A5990F-BF94-4EED-828D-0D0B2A894725}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): INode; safecall;
    procedure Delete(Index: Integer); safecall;
    function Add: INode; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: INode read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  INodesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F1A5990F-BF94-4EED-828D-0D0B2A894725}
// *********************************************************************//
  INodesDisp = dispinterface
    ['{F1A5990F-BF94-4EED-828D-0D0B2A894725}']
    property Count: Integer readonly dispid 201;
    property Item[Index: Integer]: INode readonly dispid 0; default;
    procedure Delete(Index: Integer); dispid 202;
    function Add: INode; dispid 203;
  end;

// *********************************************************************//
// Interface: INode
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1B9B5034-1EA6-494B-8075-EA53793DD679}
// *********************************************************************//
  INode = interface(IDispatch)
    ['{1B9B5034-1EA6-494B-8075-EA53793DD679}']
    function Get_x: Single; safecall;
    procedure Set_x(Value: Single); safecall;
    function Get_y: Single; safecall;
    procedure Set_y(Value: Single); safecall;
    function Get_Selected: WordBool; safecall;
    procedure Set_Selected(Value: WordBool); safecall;
    function Get_Point: IPoint; safecall;
    procedure Set_Point(const Value: IPoint); safecall;
    function Get_NodeType: NodeType; safecall;
    procedure Set_NodeType(Value: NodeType); safecall;
    function Owner: ISection; safecall;
    property x: Single read Get_x write Set_x;
    property y: Single read Get_y write Set_y;
    property Selected: WordBool read Get_Selected write Set_Selected;
    property Point: IPoint read Get_Point write Set_Point;
    property NodeType: NodeType read Get_NodeType write Set_NodeType;
  end;

// *********************************************************************//
// DispIntf:  INodeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1B9B5034-1EA6-494B-8075-EA53793DD679}
// *********************************************************************//
  INodeDisp = dispinterface
    ['{1B9B5034-1EA6-494B-8075-EA53793DD679}']
    property x: Single dispid 201;
    property y: Single dispid 202;
    property Selected: WordBool dispid 203;
    property Point: IPoint dispid 204;
    property NodeType: NodeType dispid 205;
    function Owner: ISection; dispid 206;
  end;

// *********************************************************************//
// Interface: ISelectionList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {221D7881-9EEF-46FA-968E-61F693A1469B}
// *********************************************************************//
  ISelectionList = interface(IDispatch)
    ['{221D7881-9EEF-46FA-968E-61F693A1469B}']
    function Get_Item(Index: Integer): ISection; safecall;
    function Get_Count: Integer; safecall;
    property Item[Index: Integer]: ISection read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ISelectionListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {221D7881-9EEF-46FA-968E-61F693A1469B}
// *********************************************************************//
  ISelectionListDisp = dispinterface
    ['{221D7881-9EEF-46FA-968E-61F693A1469B}']
    property Item[Index: Integer]: ISection readonly dispid 0; default;
    property Count: Integer readonly dispid 201;
  end;

// *********************************************************************//
// The Class CoPlanCenter provides a Create and CreateRemote method to          
// create instances of the default interface IPlanCenter exposed by              
// the CoClass PlanCenter. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPlanCenter = class
    class function Create: IPlanCenter;
    class function CreateRemote(const MachineName: string): IPlanCenter;
  end;

// *********************************************************************//
// The Class CoPage provides a Create and CreateRemote method to          
// create instances of the default interface IPage exposed by              
// the CoClass Page. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPage = class
    class function Create: IPage;
    class function CreateRemote(const MachineName: string): IPage;
  end;

// *********************************************************************//
// The Class CoPages provides a Create and CreateRemote method to          
// create instances of the default interface IPages exposed by              
// the CoClass Pages. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPages = class
    class function Create: IPages;
    class function CreateRemote(const MachineName: string): IPages;
  end;

// *********************************************************************//
// The Class CoPoint provides a Create and CreateRemote method to          
// create instances of the default interface IPoint exposed by              
// the CoClass Point. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPoint = class
    class function Create: IPoint;
    class function CreateRemote(const MachineName: string): IPoint;
  end;

// *********************************************************************//
// The Class CoItem provides a Create and CreateRemote method to          
// create instances of the default interface IItem exposed by              
// the CoClass Item. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoItem = class
    class function Create: IItem;
    class function CreateRemote(const MachineName: string): IItem;
  end;

// *********************************************************************//
// The Class CoDigitizer provides a Create and CreateRemote method to          
// create instances of the default interface IDigitizer exposed by              
// the CoClass Digitizer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDigitizer = class
    class function Create: IDigitizer;
    class function CreateRemote(const MachineName: string): IDigitizer;
  end;

// *********************************************************************//
// The Class CoTab provides a Create and CreateRemote method to          
// create instances of the default interface ITab exposed by              
// the CoClass Tab. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTab = class
    class function Create: ITab;
    class function CreateRemote(const MachineName: string): ITab;
  end;

// *********************************************************************//
// The Class CoTabs provides a Create and CreateRemote method to          
// create instances of the default interface ITabs exposed by              
// the CoClass Tabs. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTabs = class
    class function Create: ITabs;
    class function CreateRemote(const MachineName: string): ITabs;
  end;

// *********************************************************************//
// The Class CoProperties provides a Create and CreateRemote method to          
// create instances of the default interface IProperties exposed by              
// the CoClass Properties. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoProperties = class
    class function Create: IProperties;
    class function CreateRemote(const MachineName: string): IProperties;
  end;

// *********************************************************************//
// The Class CoPropertyObject provides a Create and CreateRemote method to          
// create instances of the default interface IPropertyObject exposed by              
// the CoClass PropertyObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPropertyObject = class
    class function Create: IPropertyObject;
    class function CreateRemote(const MachineName: string): IPropertyObject;
  end;

// *********************************************************************//
// The Class CoSection provides a Create and CreateRemote method to          
// create instances of the default interface ISection exposed by              
// the CoClass Section. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSection = class
    class function Create: ISection;
    class function CreateRemote(const MachineName: string): ISection;
  end;

// *********************************************************************//
// The Class CoSections provides a Create and CreateRemote method to          
// create instances of the default interface ISections exposed by              
// the CoClass Sections. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSections = class
    class function Create: ISections;
    class function CreateRemote(const MachineName: string): ISections;
  end;

// *********************************************************************//
// The Class CoNodes provides a Create and CreateRemote method to          
// create instances of the default interface INodes exposed by              
// the CoClass Nodes. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNodes = class
    class function Create: INodes;
    class function CreateRemote(const MachineName: string): INodes;
  end;

// *********************************************************************//
// The Class CoNode provides a Create and CreateRemote method to          
// create instances of the default interface INode exposed by              
// the CoClass Node. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNode = class
    class function Create: INode;
    class function CreateRemote(const MachineName: string): INode;
  end;

// *********************************************************************//
// The Class CoSelectionList provides a Create and CreateRemote method to          
// create instances of the default interface ISelectionList exposed by              
// the CoClass SelectionList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSelectionList = class
    class function Create: ISelectionList;
    class function CreateRemote(const MachineName: string): ISelectionList;
  end;

implementation

uses ComObj;

class function CoPlanCenter.Create: IPlanCenter;
begin
  Result := CreateComObject(CLASS_PlanCenter) as IPlanCenter;
end;

class function CoPlanCenter.CreateRemote(const MachineName: string): IPlanCenter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PlanCenter) as IPlanCenter;
end;

class function CoPage.Create: IPage;
begin
  Result := CreateComObject(CLASS_Page) as IPage;
end;

class function CoPage.CreateRemote(const MachineName: string): IPage;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Page) as IPage;
end;

class function CoPages.Create: IPages;
begin
  Result := CreateComObject(CLASS_Pages) as IPages;
end;

class function CoPages.CreateRemote(const MachineName: string): IPages;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Pages) as IPages;
end;

class function CoPoint.Create: IPoint;
begin
  Result := CreateComObject(CLASS_Point) as IPoint;
end;

class function CoPoint.CreateRemote(const MachineName: string): IPoint;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Point) as IPoint;
end;

class function CoItem.Create: IItem;
begin
  Result := CreateComObject(CLASS_Item) as IItem;
end;

class function CoItem.CreateRemote(const MachineName: string): IItem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Item) as IItem;
end;

class function CoDigitizer.Create: IDigitizer;
begin
  Result := CreateComObject(CLASS_Digitizer) as IDigitizer;
end;

class function CoDigitizer.CreateRemote(const MachineName: string): IDigitizer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Digitizer) as IDigitizer;
end;

class function CoTab.Create: ITab;
begin
  Result := CreateComObject(CLASS_Tab) as ITab;
end;

class function CoTab.CreateRemote(const MachineName: string): ITab;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Tab) as ITab;
end;

class function CoTabs.Create: ITabs;
begin
  Result := CreateComObject(CLASS_Tabs) as ITabs;
end;

class function CoTabs.CreateRemote(const MachineName: string): ITabs;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Tabs) as ITabs;
end;

class function CoProperties.Create: IProperties;
begin
  Result := CreateComObject(CLASS_Properties) as IProperties;
end;

class function CoProperties.CreateRemote(const MachineName: string): IProperties;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Properties) as IProperties;
end;

class function CoPropertyObject.Create: IPropertyObject;
begin
  Result := CreateComObject(CLASS_PropertyObject) as IPropertyObject;
end;

class function CoPropertyObject.CreateRemote(const MachineName: string): IPropertyObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PropertyObject) as IPropertyObject;
end;

class function CoSection.Create: ISection;
begin
  Result := CreateComObject(CLASS_Section) as ISection;
end;

class function CoSection.CreateRemote(const MachineName: string): ISection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Section) as ISection;
end;

class function CoSections.Create: ISections;
begin
  Result := CreateComObject(CLASS_Sections) as ISections;
end;

class function CoSections.CreateRemote(const MachineName: string): ISections;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Sections) as ISections;
end;

class function CoNodes.Create: INodes;
begin
  Result := CreateComObject(CLASS_Nodes) as INodes;
end;

class function CoNodes.CreateRemote(const MachineName: string): INodes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Nodes) as INodes;
end;

class function CoNode.Create: INode;
begin
  Result := CreateComObject(CLASS_Node) as INode;
end;

class function CoNode.CreateRemote(const MachineName: string): INode;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Node) as INode;
end;

class function CoSelectionList.Create: ISelectionList;
begin
  Result := CreateComObject(CLASS_SelectionList) as ISelectionList;
end;

class function CoSelectionList.CreateRemote(const MachineName: string): ISelectionList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SelectionList) as ISelectionList;
end;

end.
