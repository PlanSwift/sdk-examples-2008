{ *****************************************************************************

  NOTE:    When using this component at the same time with the PlanSwift_TLB.pas in
           your Delphi projects, make sure you always put the PlanSwift_TLB unit name
           AFTER this component unit name in the USES clause of the interface
           section of your unit; otherwise you may get interface conflict
           errors from the Delphi compiler.

  ***************************************************************************** }

{$IFDEF VER100}
{$DEFINE D3}
{$ENDIF}

unit PlanSwiftEvents;

interface

uses
  Windows, ActiveX, Classes, ComObj, OleCtrls, StdVCL, PlanSwift_TLB;

type
  { backward compatibility types }
  {$IFDEF D3}
  OLE_COLOR = TOleColor;
  {$ENDIF}

  TPlanSwiftEventsBaseSink = class (TObject, IUnknown, IDispatch)
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    function GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; virtual; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; virtual; stdcall;
    function GetTypeInfoCount(out Count: Integer): HResult; virtual; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word;
             var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; virtual; stdcall;
  protected
    FCookie: integer;
    FCP: IConnectionPoint;
    FSinkIID: TGUID;
    FSource: IUnknown;
    function DoInvoke (DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var dps: TDispParams; pDispIds: PDispIdList;
             VarResult, ExcepInfo, ArgErr: Pointer): HResult; virtual; abstract;
  public
    destructor Destroy; override;
    procedure Connect (const ASource: IUnknown);
    procedure Disconnect;
    property SinkIID: TGUID read FSinkIID write FSinkIID;
    property Source: IUnknown read FSource;
  end;


  TIPlanCenterEventsOnPageChangedEvent = procedure of object;  //procedure (Sender: TObject) of object;
  TIPlanCenterEventsOnJobOpenedEvent = procedure of object;
  TIPlanCenterEventsOnJobClosedEvent = procedure of object;
  TIPlanCenterEventsOnStartUpEvent = procedure of object;
  TIPlanCenterEventsOnShutDownEvent = procedure of object;
  TIPlanCenterEventsOnItemChangedEvent = procedure (const GUID: WideString) of object;
  TIPlanCenterEventsOnStartRecordingEvent = procedure (const GUID: WideString) of object;
  TIPlanCenterEventsOnStopRecordingEvent = procedure (const GUID: WideString) of object;
  TIPlanCenterEventsOnItemDeleteEvent = procedure (const GUID: WideString) of object;


  TPlanSwiftIPlanCenterEvents = class (TPlanSwiftEventsBaseSink)
  protected
    function DoInvoke (DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var dps: TDispParams; pDispIds: PDispIdList;
            VarResult, ExcepInfo, ArgErr: Pointer): HResult; override;

  public
    constructor Create; virtual;
  protected
    procedure DoOnPageChanged; safecall;
    procedure DoOnJobOpened; safecall;
    procedure DoOnJobClosed; safecall;
    procedure DoOnStartUp; safecall;
    procedure DoOnShutDown; safecall;
    procedure DoOnItemChanged(const GUID: WideString); safecall;
    procedure DoOnStartRecording(const GUID: WideString); safecall;
    procedure DoOnStopRecording(const GUID: WideString); safecall;
    procedure DoOnItemDelete(const GUID: WideString); safecall;
  protected
    FOnPageChanged: TIPlanCenterEventsOnPageChangedEvent;
    FOnJobOpened: TIPlanCenterEventsOnJobOpenedEvent;
    FOnJobClosed: TIPlanCenterEventsOnJobClosedEvent;
    FOnStartUp: TIPlanCenterEventsOnStartUpEvent;
    FOnShutDown: TIPlanCenterEventsOnShutDownEvent;
    FOnItemChanged: TIPlanCenterEventsOnItemChangedEvent;
    FOnStartRecording: TIPlanCenterEventsOnStartRecordingEvent;
    FOnStopRecording: TIPlanCenterEventsOnStopRecordingEvent;
    FOnItemDelete: TIPlanCenterEventsOnItemDeleteEvent;
  published
    property OnPageChanged: TIPlanCenterEventsOnPageChangedEvent read FOnPageChanged write FOnPageChanged;
    property OnJobOpened: TIPlanCenterEventsOnJobOpenedEvent read FOnJobOpened write FOnJobOpened;
    property OnJobClosed: TIPlanCenterEventsOnJobClosedEvent read FOnJobClosed write FOnJobClosed;
    property OnStartUp: TIPlanCenterEventsOnStartUpEvent read FOnStartUp write FOnStartUp;
    property OnShutDown: TIPlanCenterEventsOnShutDownEvent read FOnShutDown write FOnShutDown;
    property OnItemChanged: TIPlanCenterEventsOnItemChangedEvent read FOnItemChanged write FOnItemChanged;
    property OnStartRecording: TIPlanCenterEventsOnStartRecordingEvent read FOnStartRecording write FOnStartRecording;
    property OnStopRecording: TIPlanCenterEventsOnStopRecordingEvent read FOnStopRecording write FOnStopRecording;
    property OnItemDelete: TIPlanCenterEventsOnItemDeleteEvent read FOnItemDelete write FOnItemDelete;
  end;

implementation

uses
  SysUtils;


procedure BuildPositionalDispIds (pDispIds: PDispIdList; const dps: TDispParams);
var
  i: integer;
begin
  Assert (pDispIds <> nil);
  
  for i := 0 to dps.cArgs - 1 do
    pDispIds^ [i] := dps.cArgs - 1 - i;

  if (dps.cNamedArgs <= 0) then Exit;

  for i := 0 to dps.cNamedArgs - 1 do
    pDispIds^ [dps.rgdispidNamedArgs^ [i]] := i;
end;


{ TPlanSwiftEventsBaseSink }

function TPlanSwiftEventsBaseSink.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TPlanSwiftEventsBaseSink.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
  pointer (TypeInfo) := nil;
end;

function TPlanSwiftEventsBaseSink.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
  Count := 0;
end;

function TPlanSwiftEventsBaseSink.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
  Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
var
  dps: TDispParams absolute Params;
  bHasParams: boolean;
  pDispIds: PDispIdList;
  iDispIdsSize: integer;
begin
  { validity checks }
  if (Flags AND DISPATCH_METHOD = 0) then
    raise Exception.Create (Format ('%s only supports sinking of method calls!', [ClassName]));

  pDispIds := nil;
  iDispIdsSize := 0;
  bHasParams := (dps.cArgs > 0);
  if (bHasParams) then
  begin
    iDispIdsSize := dps.cArgs * SizeOf (TDispId);
    GetMem (pDispIds, iDispIdsSize);
  end;  { if }

  try
    if (bHasParams) then BuildPositionalDispIds (pDispIds, dps);
    Result := DoInvoke (DispId, IID, LocaleID, Flags, dps, pDispIds, VarResult, ExcepInfo, ArgErr);
  finally
    if (bHasParams) then FreeMem (pDispIds, iDispIdsSize);
  end;  { finally }
end;

function TPlanSwiftEventsBaseSink.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if (GetInterface (IID, Obj)) then
  begin
    Result := S_OK;
    Exit;
  end
  else
    if (IsEqualIID (IID, FSinkIID)) then
      if (GetInterface (IDispatch, Obj)) then
      begin
        Result := S_OK;
        Exit;
      end;
  Result := E_NOINTERFACE;
  pointer (Obj) := nil;
end;

function TPlanSwiftEventsBaseSink._AddRef: Integer;
begin
  Result := 2;
end;

function TPlanSwiftEventsBaseSink._Release: Integer;
begin
  Result := 1;
end;

destructor TPlanSwiftEventsBaseSink.Destroy;
begin
  Disconnect;
  inherited;
end;

procedure TPlanSwiftEventsBaseSink.Connect (const ASource: IUnknown);
var
  pcpc: IConnectionPointContainer;
begin
  Assert (ASource <> nil);
  Disconnect;
  try
    OleCheck (ASource.QueryInterface (IConnectionPointContainer, pcpc));
    OleCheck (pcpc.FindConnectionPoint (FSinkIID, FCP));
    OleCheck (FCP.Advise (Self, FCookie));
    FSource := ASource;
  except
    raise Exception.Create (Format ('Unable to connect %s.'#13'%s',
      [ClassName, Exception (ExceptObject).Message]));
  end;  { finally }
end;

procedure TPlanSwiftEventsBaseSink.Disconnect;
begin
  if (FSource = nil) then Exit;
  try
    OleCheck (FCP.Unadvise (FCookie));
    FCP := nil;
    FSource := nil;
  except
    pointer (FCP) := nil;
    pointer (FSource) := nil;
  end;  { except }
end;


//SinkImplStart//

function TPlanSwiftIPlanCenterEvents.DoInvoke (DispID: Integer; const IID: TGUID; LocaleID: Integer;
  Flags: Word; var dps: TDispParams; pDispIds: PDispIdList;
  VarResult, ExcepInfo, ArgErr: Pointer): HResult;
type
  POleVariant = ^OleVariant;
begin
  Result := DISP_E_MEMBERNOTFOUND;

    case DispId of
      201 :
      begin
        DoOnPageChanged ();
        Result := S_OK;
      end;
      202 :
      begin
        DoOnJobOpened ();
        Result := S_OK;
      end;
      203 :
      begin
        DoOnJobClosed ();
        Result := S_OK;
      end;
      204 :
      begin
        DoOnStartUp ();
        Result := S_OK;
      end;
      205 :
      begin
        DoOnShutDown ();
        Result := S_OK;
      end;
      206 :
      begin
        DoOnItemChanged (dps.rgvarg^ [pDispIds^ [0]].bstrval);
        Result := S_OK;
      end;
      207 :
      begin
        DoOnStartRecording(dps.rgvarg^ [pDispIds^ [0]].bstrVal);
        Result := S_OK;
      end;
      208 :
      begin
        DoOnStopRecording(dps.rgvarg^ [pDispIds^ [0]].bstrVal);
        Result := S_OK;
      end;
      209 :
      begin
        DoOnItemDelete(dps.rgvarg^ [pDispIds^ [0]].bstrVal);
        Result := S_OK;
      end;
    end;  { case }
end;

constructor TPlanSwiftIPlanCenterEvents.Create;
begin
  inherited Create;
  FSinkIID := IPlanCenterEvents;
end;

//SinkImplementation//
procedure TPlanSwiftIPlanCenterEvents.DoOnPageChanged;
begin
  if not Assigned (OnPageChanged) then System.Exit;
  OnPageChanged;
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnJobOpened;
begin
  if not Assigned (OnJobOpened) then System.Exit;
  OnJobOpened;
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnJobClosed;
begin
  if not Assigned (OnJobClosed) then System.Exit;
  OnJobClosed;
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnStartUp;
begin
  if not Assigned (OnStartUp) then System.Exit;
  OnStartUp;
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnShutDown;
begin
  if not Assigned (OnShutDown) then System.Exit;
  OnShutDown;
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnItemChanged(const GUID: WideString);
begin
  if not Assigned (OnItemChanged) then System.Exit;
  OnItemChanged (GUID);
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnStartRecording(const GUID: WideString);
begin
  if not Assigned (OnStartRecording) then System.Exit;
  OnStartRecording (GUID);
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnStopRecording(const GUID: WideString);
begin
  if not Assigned (OnStopRecording) then System.Exit;
  OnStopRecording (GUID);
end;

procedure TPlanSwiftIPlanCenterEvents.DoOnItemDelete(const GUID: WideString);
begin
  if not Assigned (OnItemDelete) then System.Exit;
  OnItemDelete (GUID);
end;

end.
