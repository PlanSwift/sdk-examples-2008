unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, planswiftevents, planswift_tlb, Menus;

type
  TForm1 = class(TForm)
    Label13: TLabel;
    Label16: TLabel;
    refreshbutton: TButton;
    autorefresh: TRadioButton;
    manualrefresh: TRadioButton;
    Label14: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    linearedit: TEdit;
    segmentedit: TEdit;
    areaedit: TEdit;
    Label2: TLabel;
    GetLinearButton: TButton;
    GetSegmentButton: TButton;
    GetAreaButton: TButton;
    Label15: TLabel;
    Button6: TButton;
    auditlinear: TButton;
    Button7: TButton;
    Label5: TLabel;
    Label6: TLabel;
    jobnumber1: TLabel;
    linearguid: TLabel;
    jobnumber2: TLabel;
    segmentguid: TLabel;
    jobnumber3: TLabel;
    areaguid: TLabel;
    scriptsource: TLabel;
    popupmenu: TPopupMenu;
    AuditTrail1: TMenuItem;
    N1: TMenuItem;
    nodemovesource: TLabel;
    stoprecordingsource: TLabel;
    sectiondeletesource: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetLinearButtonClick(Sender: TObject);
    procedure GetSegmentButtonClick(Sender: TObject);
    procedure GetAreaButtonClick(Sender: TObject);
    procedure refreshbuttonClick(Sender: TObject);
    procedure auditlinearClick(Sender: TObject);
    Procedure GoToPage(Sender: TObject);
    procedure AuditTrail1Click(Sender: TObject);
  private
    pcevents: TPlanSwiftIPlanCenterEvents;
    pc: IPlanCenter;
    linear: iitem;
    segment: iitem;
    currentitem: iitem;
    area: iitem;
    procedure PSItemChanged(const GUID: WideString);
    Procedure PSItemDeleted(const GUID: WideString);
    procedure PSClosed;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function ForceForegroundWindow(hwnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);

  if GetForegroundWindow = hwnd then
    Result := True
  else
    begin
    // Windows 98/2000 doesn't want to foreground a window when some other
    // window has keyboard focus

    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
      ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
      (Win32MinorVersion > 0)))) then
    begin
      // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
      // Converted to Delphi by Ray Lischner
      // Published in The Delphi Magazine 55, page 16

      Result := False;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd, nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then
      begin
        // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
          SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else
    begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;

    Result := (GetForegroundWindow = hwnd);
    end;
end; { ForceForegroundWindow }

procedure TForm1.refreshbuttonClick(Sender: TObject);
begin
  if linear <> nil then
    linearedit.Text := linear.Properties.ByName('Qty').value;
  if segment <> nil then
    segmentedit.Text := segment.Properties.ByName('Qty').value;
  if area <> nil then
    areaedit.Text := area.Properties.ByName('Qty').value;
end;

Procedure TForm1.GoToPage(Sender: TObject);
begin
  currentitem.ZoomToSection(tmenuitem(sender).tag);
end;

procedure TForm1.auditlinearClick(Sender: TObject);
var
  pt: tpoint;
  p: tmenuitem;
  ndx: integer;
begin
  pt.X := tbutton(sender).left + tbutton(sender).width;
  pt.y := tbutton(sender).Top;
  pt := clienttoscreen(pt);
  for ndx := popupmenu.Items.Count -1 downto 2 do
    popupmenu.Items.Delete(ndx);
  case tbutton(sender).tag of
    0: currentitem := linear;
    1: currentitem := segment;
    2: currentitem := area;
  end;
  if currentitem = nil then exit;
  for ndx := 0 to currentitem.Sections.Count -1 do
    begin
      p := tmenuitem.Create(popupmenu);
      popupmenu.Items.Add(p);
      p.Caption := currentitem.Sections[ndx].Page.Name;
      p.Tag := currentitem.sections[ndx].Index;
      p.OnClick := gotopage;
      p.Visible := true;
    end;
  popupmenu.Popup(pt.x, pt.y);
end;

procedure TForm1.AuditTrail1Click(Sender: TObject);
var
  tmp: string;
begin
  tmp := currentitem.Properties.ByName('AuditTrail').Formula;
  MessageDlg(tmp, mtInformation, [mbOK], 0);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  linear := nil;
  segment := nil;
  area := nil;
  pcevents.Disconnect;
  pcevents.Free;
  pc := nil;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    linear := nil;
    segment := nil;
    area := nil;
    pc := CoPlanCenter.Create;
    pcevents := TPlanSwiftIPlanCenterEvents.Create;
    pcevents.OnItemChanged := PSItemChanged;
    pcevents.OnShutDown := PSClosed;
    pcevents.OnItemDelete := PSItemDeleted;
    pcevents.Connect(pc);
  except
    MessageDlg('Could not create PlanSwift Object. Is PlanSwift Installed?', mtError, [mbOK], 0);
    application.Terminate;
  end;
end;

procedure TForm1.GetLinearButtonClick(Sender: TObject);
var
  prop: ipropertyobject;
  s: ieventscript;
begin
  if not pc.JobOpened then
    begin
      MessageDlg('Please open a job in PlanSwift first', mtError, [mbOK], 0);
      exit;
    end;
  jobnumber1.Caption := 'Not Set';

  //  **** NOTE: Calling tabs.new will not create a second tab with the same name, it will just return the existing tab...
  Linear := pc.Tabs.New(ttJob, 'Estimate').New(dgLinear, itnone);
  if linear = nil then exit;
  Linear.Name := '2x6 Exterior Walls';
  Linear.Visible := true;
  prop := Linear.Properties.Add;
  prop.Name := 'AuditTrail';
  prop.Category := 'SDK Sample';
  prop.ValueType := vtText;
  prop.formula := 'Item Created on ' + datetostr(now);
  Linear.EventScripts.AddCommonEvents;

  s := Linear.EventScripts.FindByName('OnPropertiesChanged');
  if s = nil then
    s := Linear.EventScripts.Add('OnPropertiesChanged');
  s.SourceCode := scriptsource.Caption;

  s := nil;
  s := Linear.EventScripts.FindByName('OnStopRecording');
  if s = nil then
    s := Linear.EventScripts.Add('OnStopRecording');
  s.SourceCode := stoprecordingsource.Caption;

  s := nil;
  s := Linear.EventScripts.FindByName('OnNodeMoved');
  if s = nil then
    s := Linear.EventScripts.Add('OnNodeMoved');
  s.SourceCode := nodemovesource.Caption;

  s := nil;
  s := linear.eventscripts.findbyname('OnSectionDelete');
  if s = nil then
    s := linear.eventscripts.add('OnSectionDelete');
  s.sourcecode := sectiondeletesource.Caption;

  Forceforegroundwindow(pc.handle);
  if Linear.DoRecord then
    begin
      Linearedit.Text := Linear.Properties.ByName('Qty').Value;
      jobnumber1.Caption := pc.JobNumber;
      Linearguid.Caption := Linear.ItemID;
    end;
  pc.RefreshEstimate;
  application.BringToFront;
end;

procedure TForm1.GetSegmentButtonClick(Sender: TObject);
var
  prop: ipropertyobject;
  s: ieventscript;
begin
  if not pc.JobOpened then
    begin
      MessageDlg('Please open a job in PlanSwift first', mtError, [mbOK], 0);
      exit;
    end;
  jobnumber2.Caption := 'Not Set';

  //  **** NOTE: Calling tabs.new will not create a second tab with the same name, it will just return the existing tab...
  segment := pc.Tabs.New(ttJob, 'Estimate').New(dgSegment, itnone);
  if segment = nil then exit;
  segment.name := '2x4 Interior Walls';
  segment.Visible := true;
  prop := segment.Properties.Add;
  prop.Name := 'AuditTrail';
  prop.Category := 'SDK Sample';
  prop.ValueType := vtText;
  prop.formula := 'Item Created on ' + datetostr(now);
  segment.EventScripts.AddCommonEvents;

  s := segment.EventScripts.FindByName('OnPropertiesChanged');
  if s = nil then
    s := segment.EventScripts.Add('OnPropertiesChanged');
  s.SourceCode := scriptsource.Caption;

  s := nil;
  s := segment.EventScripts.FindByName('OnStopRecording');
  if s = nil then
    s := segment.EventScripts.Add('OnStopRecording');
  s.SourceCode := stoprecordingsource.Caption;

  s := nil;
  s := segment.EventScripts.FindByName('OnNodeMoved');
  if s = nil then
    s := segment.EventScripts.Add('OnNodeMoved');
  s.SourceCode := nodemovesource.Caption;

  s := nil;
  s := segment.eventscripts.findbyname('OnSectionDelete');
  if s = nil then
    s := segment.eventscripts.add('OnSectionDelete');
  s.sourcecode := sectiondeletesource.Caption;

  Forceforegroundwindow(pc.handle);
  if segment.DoRecord then
    begin
      segmentedit.Text := segment.Properties.ByName('Qty').Value;
      jobnumber2.Caption := pc.JobNumber;
      segmentguid.Caption := segment.ItemID;
    end;
  pc.RefreshEstimate;
  application.BringToFront;
end;

procedure TForm1.GetAreaButtonClick(Sender: TObject);
var
  prop: ipropertyobject;
  s: ieventscript;
begin
  if not pc.JobOpened then
    begin
      MessageDlg('Please open a job in PlanSwift first', mtError, [mbOK], 0);
      exit;
    end;
  jobnumber3.Caption := 'Not Set';

  //  **** NOTE: Calling tabs.new will not create a second tab with the same name, it will just return the existing tab...
  area := pc.Tabs.New(ttJob, 'Estimate').New(dgArea, itnone);
  if area = nil then exit;
  area.Name := 'Main Floor Sq Footage';
  area.Visible := true;
  prop := area.Properties.Add;
  prop.Name := 'AuditTrail';
  prop.Category := 'SDK Sample';
  prop.ValueType := vtText;
  prop.formula := 'Item Created on ' + datetostr(now);
  area.EventScripts.AddCommonEvents;

  s := area.EventScripts.FindByName('OnPropertiesChanged');
  if s = nil then
    s := area.EventScripts.Add('OnPropertiesChanged');
  s.SourceCode := scriptsource.Caption;

  s := nil;
  s := area.EventScripts.FindByName('OnStopRecording');
  if s = nil then
    s := area.EventScripts.Add('OnStopRecording');
  s.SourceCode := stoprecordingsource.Caption;

  s := nil;
  s := area.EventScripts.FindByName('OnNodeMoved');
  if s = nil then
    s := area.EventScripts.Add('OnNodeMoved');
  s.SourceCode := nodemovesource.Caption;

  s := nil;
  s := area.eventscripts.findbyname('OnSectionDelete');
  if s = nil then
    s := area.eventscripts.add('OnSectionDelete');
  s.sourcecode := sectiondeletesource.Caption;

  Forceforegroundwindow(pc.handle);
  if area.DoRecord then
    begin
      areaedit.Text := area.Properties.ByName('Qty').Value;
      jobnumber3.Caption := pc.JobNumber;
      areaguid.Caption := area.ItemID;
    end;
  pc.RefreshEstimate;
  application.BringToFront;
end;

procedure TForm1.PSClosed;
begin
  close;
end;

procedure TForm1.PSItemChanged(const GUID: WideString);
var
  itm: iitem;
begin
  if not autorefresh.Checked then exit;
  itm := pc.FindItemByGUID(guid);
  if itm = nil then exit;
  if GUID = linearguid.Caption then
    linearedit.Text := itm.Properties.ByName('Qty').Value;
  if GUID = segmentguid.Caption then
    segmentedit.Text := itm.Properties.ByName('Qty').Value;
  if GUID = areaguid.Caption then
    areaedit.text := itm.Properties.ByName('Qty').value;
end;

procedure TForm1.PSItemDeleted(const GUID: WideString);
begin
  if guid = linearGUID.Caption  then
    begin
      linearguid.Caption := 'Not Set';
      linearedit.Text := '';
      linear := nil;
      jobnumber1.Caption := 'Not Set';
    end;
  if guid = segmentGUID.Caption then
    begin
      segmentguid.Caption := 'Not Set';
      segmentedit.Text := '';
      segment := nil;
      jobnumber2.Caption := 'Not Set';
    end;
  if guid = areaGUID.Caption then
    begin
      areaguid.Caption := 'Not Set';
      areaedit.Text := '';
      area := nil;
      jobnumber3.Caption := 'Not Set';
    end;
end;

end.
