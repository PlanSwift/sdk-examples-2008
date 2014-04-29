VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "PlanSwift Integration Example"
   ClientHeight    =   5190
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12465
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   346
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   831
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox sectiondeletesource 
      Height          =   300
      Left            =   9315
      MultiLine       =   -1  'True
      TabIndex        =   30
      Text            =   "Form1.frx":0000
      Top             =   4575
      Visible         =   0   'False
      Width           =   2910
   End
   Begin VB.TextBox stoprecordingsource 
      Height          =   300
      Left            =   9300
      MultiLine       =   -1  'True
      TabIndex        =   29
      Text            =   "Form1.frx":0124
      Top             =   4260
      Visible         =   0   'False
      Width           =   2910
   End
   Begin VB.TextBox nodemovesource 
      Height          =   300
      Left            =   9285
      MultiLine       =   -1  'True
      TabIndex        =   28
      Text            =   "Form1.frx":023F
      Top             =   3945
      Visible         =   0   'False
      Width           =   2910
   End
   Begin VB.TextBox scriptsource 
      Height          =   300
      Left            =   9285
      MultiLine       =   -1  'True
      TabIndex        =   27
      Text            =   "Form1.frx":0374
      Top             =   3630
      Visible         =   0   'False
      Width           =   2910
   End
   Begin VB.CommandButton refreshbutton 
      Caption         =   "Refresh Now"
      Height          =   315
      Left            =   1740
      TabIndex        =   26
      Top             =   4575
      Width           =   1110
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Manual Refresh"
      Height          =   210
      Left            =   150
      TabIndex        =   25
      Top             =   4620
      Width           =   1500
   End
   Begin VB.OptionButton autorefresh 
      Caption         =   "Automatic Refresh (using Events)"
      Height          =   240
      Left            =   150
      TabIndex        =   24
      Top             =   4275
      Value           =   -1  'True
      Width           =   2775
   End
   Begin VB.CommandButton auditarea 
      Caption         =   "Audit Trail"
      Height          =   375
      Left            =   5850
      TabIndex        =   20
      Top             =   2955
      Width           =   930
   End
   Begin VB.CommandButton getareabutton 
      Caption         =   "Get from PlanSwift"
      Height          =   375
      Left            =   4275
      TabIndex        =   19
      Top             =   2955
      Width           =   1545
   End
   Begin VB.TextBox areaedit 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2070
      TabIndex        =   18
      Top             =   2955
      Width           =   2175
   End
   Begin VB.CommandButton auditsegment 
      Caption         =   "Audit Trail"
      Height          =   375
      Left            =   5850
      TabIndex        =   14
      Top             =   2430
      Width           =   930
   End
   Begin VB.CommandButton getsegmentbutton 
      Caption         =   "Get from PlanSwift"
      Height          =   375
      Left            =   4275
      TabIndex        =   13
      Top             =   2430
      Width           =   1545
   End
   Begin VB.TextBox segmentedit 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2070
      TabIndex        =   12
      Top             =   2430
      Width           =   2175
   End
   Begin VB.CommandButton auditlinear 
      Caption         =   "Audit Trail"
      Height          =   375
      Left            =   5850
      TabIndex        =   6
      Top             =   1920
      Width           =   930
   End
   Begin VB.CommandButton getlinearbutton 
      Caption         =   "Get from PlanSwift"
      Height          =   375
      Left            =   4275
      TabIndex        =   5
      Top             =   1920
      Width           =   1545
   End
   Begin VB.TextBox linearedit 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2070
      TabIndex        =   4
      Top             =   1920
      Width           =   2175
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      Caption         =   "Refresh Type"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   120
      TabIndex        =   23
      Top             =   3855
      Width           =   1620
   End
   Begin VB.Label areaguid 
      Caption         =   "Not Set"
      Height          =   195
      Left            =   8130
      TabIndex        =   22
      Top             =   3030
      Width           =   4170
   End
   Begin VB.Label jobnumber3 
      Caption         =   "Not Set"
      Height          =   195
      Left            =   6840
      TabIndex        =   21
      Top             =   3030
      Width           =   1140
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "Main Floor Sq Footage"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   120
      TabIndex        =   17
      Top             =   3000
      Width           =   1935
   End
   Begin VB.Label segmentguid 
      Caption         =   "Not Set"
      Height          =   195
      Left            =   8130
      TabIndex        =   16
      Top             =   2505
      Width           =   4170
   End
   Begin VB.Label jobnumber2 
      Caption         =   "Not Set"
      Height          =   195
      Left            =   6840
      TabIndex        =   15
      Top             =   2505
      Width           =   1140
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "2x4 Interior Walls"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   525
      TabIndex        =   11
      Top             =   2475
      Width           =   1515
   End
   Begin VB.Label linearguid 
      Caption         =   "Not Set"
      Height          =   195
      Left            =   8130
      TabIndex        =   10
      Top             =   1995
      Width           =   4170
   End
   Begin VB.Label jobnumber1 
      Caption         =   "Not Set"
      Height          =   195
      Left            =   6840
      TabIndex        =   9
      Top             =   1995
      Width           =   1140
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Item GUID"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   8160
      TabIndex        =   8
      Top             =   1560
      Width           =   1305
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Job #"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   6780
      TabIndex        =   7
      Top             =   1560
      Width           =   690
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "2x6 Exterior Walls"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   510
      TabIndex        =   3
      Top             =   1965
      Width           =   1545
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Estimating Items"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Top             =   1440
      Width           =   2085
   End
   Begin VB.Label Label2 
      Caption         =   $"Form1.frx":047C
      Height          =   585
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   12165
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Overview"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   150
      TabIndex        =   0
      Top             =   105
      Width           =   1140
   End
   Begin VB.Menu mnu 
      Caption         =   "mnu"
      Visible         =   0   'False
      Begin VB.Menu auditmnu 
         Caption         =   "Audit Trail"
      End
      Begin VB.Menu div 
         Caption         =   "-"
      End
      Begin VB.Menu p0 
         Caption         =   "p0"
         Index           =   0
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim WithEvents pc As PlanCenter
Attribute pc.VB_VarHelpID = -1
Dim Linear As PlanSwift.Item
Dim Segment As PlanSwift.Item
Dim Area As PlanSwift.Item
Dim EstimateTab As PlanSwift.Tab
Dim clickeditem As PlanSwift.Item

Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, _
   ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Public Function ForceForegroundWindow(ByVal hwnd As Long) As Boolean
  Call SetWindowPos(hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE)
End Function


Private Sub auditarea_Click()
  Dim ndx As Integer
  Dim m As Menu
  On Error Resume Next
  For ndx = p0.UBound To 1 Step -1
    Unload p0(ndx)
  Next
  ndx = Area.Sections.Count
  If Err.Number <> 0 Then Exit Sub
  If ndx < 1 Then Exit Sub
  p0(0).Caption = Area.Sections(0).Page.Name
  For ndx = 1 To Area.Sections.Count - 1
    Load p0(ndx)
    p0(ndx).Caption = Area.Sections(ndx).Page.Name
    p0(ndx).Visible = True
  Next
  Set clickeditem = Area
  Call Me.PopupMenu(mnu, , auditarea.Left + auditarea.Width, auditarea.Top)
End Sub

Private Sub auditlinear_Click()
  Dim ndx As Integer
  Dim m As Menu
  On Error Resume Next
  For ndx = p0.UBound To 1 Step -1
    Unload p0(ndx)
  Next
  ndx = Linear.Sections.Count
  If Err.Number <> 0 Then Exit Sub
  If ndx < 1 Then Exit Sub
  p0(0).Caption = Linear.Sections(0).Page.Name
  For ndx = 1 To Linear.Sections.Count - 1
    Load p0(ndx)
    p0(ndx).Caption = Linear.Sections(ndx).Page.Name
    p0(ndx).Visible = True
  Next
  Set clickeditem = Linear
  Call Me.PopupMenu(mnu, , auditlinear.Left + auditlinear.Width, auditlinear.Top)
End Sub

Private Sub auditmnu_Click()
  Dim prop As PlanSwift.PropertyObject
'  On Error Resume Next
  Set prop = clickeditem.Properties.ByName("AuditTrail")
'  If Err.Number <> 0 Then Exit Sub
  MsgBox (prop.Formula)
End Sub

Private Sub auditsegment_Click()
  Dim ndx As Integer
  Dim m As Menu
  On Error Resume Next
  For ndx = p0.UBound To 1 Step -1
    Unload p0(ndx)
  Next
  ndx = Segment.Sections.Count
  If Err.Number <> 0 Then Exit Sub
  If ndx < 1 Then Exit Sub
  p0(0).Caption = Segment.Sections(0).Page.Name
  For ndx = 1 To Segment.Sections.Count - 1
    Load p0(ndx)
    p0(ndx).Caption = Segment.Sections(ndx).Page.Name
    p0(ndx).Visible = True
  Next
  Set clickeditem = Segment
  Call Me.PopupMenu(mnu, , auditsegment.Left + auditsegment.Width, auditsegment.Top)

End Sub

Private Sub Form_Load()
  On Error Resume Next
  Set pc = CreateObject("Planswift.Plancenter")
  If Err.Number <> 0 Then
    MsgBox ("Can not find PlanSwift, Is it installed?")
    Unload Me
  End If
  Set Linear = Nothing
  Set Segment = Nothing
  Set Area = Nothing
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Set Linear = Nothing
  Set Segment = Nothing
  Set Area = Nothing
  Set EstimateTab = Nothing
  Set pc = Nothing
End Sub

Private Sub getareabutton_Click()
  Dim prop As PlanSwift.PropertyObject
  Dim s As PlanSwift.EventScript
  On Error Resume Next
  If Not pc.JobOpened Then
    MsgBox ("Please open a job in planswift first")
    Exit Sub
  End If
  jobnumber3.Caption = "Not Set"
  Set EstimateTab = pc.Tabs.New(ttJob, "Estimate")
  Set Area = EstimateTab.New(dgArea, itNone)
  Area.Name = "Main Floor Sq Footage"
  If Err.Number <> 0 Then Exit Sub
  Area.Visible = True
  Set prop = Area.Properties.Add
  prop.Name = "AuditTrail"
  prop.Category = "SDK Sample"
  prop.ValueType = vtText
  prop.Formula = "Item Created on " & CStr(Now)
  Area.EventScripts.AddCommonEvents

  Set s = Area.EventScripts.FindByName("OnPropertiesChanged")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Area.EventScripts.Add("OnPropertiesChanged")
  End If
  s.SourceCode = scriptsource.Text

  Set s = Nothing
  Set s = Area.EventScripts.FindByName("OnStopRecording")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Area.EventScripts.Add("OnStopRecording")
  End If
  s.SourceCode = stoprecordingsource.Text

  Set s = Nothing
  Set s = Area.EventScripts.FindByName("OnNodeMoved")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Area.EventScripts.Add("OnNodeMoved")
  End If
  s.SourceCode = nodemovesource.Text

  Set s = Nothing
  Set s = Area.EventScripts.FindByName("OnSectionDelete")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Area.EventScripts.Add("OnSectionDelete")
  End If
  s.SourceCode = sectiondeletesource.Text

  ForceForegroundWindow (pc.Handle)
  If Area.DoRecord Then
      areaedit.Text = Linear.Properties.ByName("Qty").Value
      jobnumber3.Caption = pc.JobNumber
      areaguid.Caption = Area.ItemID
  End If
  pc.RefreshEstimate
  Me.SetFocus

End Sub

Private Sub getlinearbutton_Click()
  Dim prop As PlanSwift.PropertyObject
  Dim s As PlanSwift.EventScript
  On Error Resume Next
  If Not pc.JobOpened Then
    MsgBox ("Please open a job in planswift first")
    Exit Sub
  End If
  jobnumber1.Caption = "Not Set"
  Set EstimateTab = pc.Tabs.New(ttJob, "Estimate")
  Set Linear = EstimateTab.New(dgLinear, itNone)
  Linear.Name = "2x6 Exterior Walls"
  If Err.Number <> 0 Then Exit Sub
  Linear.Visible = True
  Set prop = Linear.Properties.Add
  prop.Name = "AuditTrail"
  prop.Category = "SDK Sample"
  prop.ValueType = vtText
  prop.Formula = "Item Created on " & CStr(Now)
  Linear.EventScripts.AddCommonEvents

  Set s = Linear.EventScripts.FindByName("OnPropertiesChanged")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Linear.EventScripts.Add("OnPropertiesChanged")
  End If
  s.SourceCode = scriptsource.Text

  Set s = Nothing
  Set s = Linear.EventScripts.FindByName("OnStopRecording")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Linear.EventScripts.Add("OnStopRecording")
  End If
  s.SourceCode = stoprecordingsource.Text

  Set s = Nothing
  Set s = Linear.EventScripts.FindByName("OnNodeMoved")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Linear.EventScripts.Add("OnNodeMoved")
  End If
  s.SourceCode = nodemovesource.Text

  Set s = Nothing
  Set s = Linear.EventScripts.FindByName("OnSectionDelete")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Linear.EventScripts.Add("OnSectionDelete")
  End If
  s.SourceCode = sectiondeletesource.Text

  ForceForegroundWindow (pc.Handle)
  If Linear.DoRecord Then
      linearedit.Text = Linear.Properties.ByName("Qty").Value
      jobnumber1.Caption = pc.JobNumber
      linearguid.Caption = Linear.ItemID
  End If
  pc.RefreshEstimate
  Me.SetFocus
End Sub

Private Sub getsegmentbutton_Click()
  Dim prop As PlanSwift.PropertyObject
  Dim s As PlanSwift.EventScript
  On Error Resume Next
  If Not pc.JobOpened Then
    MsgBox ("Please open a job in planswift first")
    Exit Sub
  End If
  jobnumber2.Caption = "Not Set"
  Set EstimateTab = pc.Tabs.New(ttJob, "Estimate")
  Set Segment = EstimateTab.New(dgSegment, itNone)
  Segment.Name = "2x4 Interior Walls"
  If Err.Number <> 0 Then Exit Sub
  Segment.Visible = True
  Set prop = Segment.Properties.Add
  prop.Name = "AuditTrail"
  prop.Category = "SDK Sample"
  prop.ValueType = vtText
  prop.Formula = "Item Created on " & CStr(Now)
  Segment.EventScripts.AddCommonEvents

  Set s = Segment.EventScripts.FindByName("OnPropertiesChanged")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Segment.EventScripts.Add("OnPropertiesChanged")
  End If
  s.SourceCode = scriptsource.Text

  Set s = Nothing
  Set s = Segment.EventScripts.FindByName("OnStopRecording")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Segment.EventScripts.Add("OnStopRecording")
  End If
  s.SourceCode = stoprecordingsource.Text

  Set s = Nothing
  Set s = Segment.EventScripts.FindByName("OnNodeMoved")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Segment.EventScripts.Add("OnNodeMoved")
  End If
  s.SourceCode = nodemovesource.Text

  Set s = Nothing
  Set s = Segment.EventScripts.FindByName("OnSectionDelete")
  If Err.Number <> 0 Then
    Err.Clear
    Set s = Segment.EventScripts.Add("OnSectionDelete")
  End If
  s.SourceCode = sectiondeletesource.Text

  ForceForegroundWindow (pc.Handle)
  If Segment.DoRecord Then
      segmentedit.Text = Segment.Properties.ByName("Qty").Value
      jobnumber2.Caption = pc.JobNumber
      segmentguid.Caption = Segment.ItemID
  End If
  pc.RefreshEstimate
  Me.SetFocus

End Sub

Private Sub p0_Click(Index As Integer)
  On Error Resume Next
  clickeditem.ZoomToSection (Index)
End Sub

Private Sub pc_OnItemChanged(ByVal GUID As String)
  Dim itm As PlanSwift.Item
  If Not autorefresh.Value Then Exit Sub
  On Error Resume Next
  Set itm = pc.FindItemByGUID(GUID)
  If GUID = linearguid.Caption Then linearedit.Text = itm.Properties.ByName("Qty").Value
  If GUID = segmentguid.Caption Then segmentedit.Text = itm.Properties.ByName("Qty").Value
  If GUID = areaguid.Caption Then areaedit.Text = itm.Properties.ByName("Qty").Value
End Sub

Private Sub pc_OnItemDelete(ByVal GUID As String)
  If GUID = linearguid.Caption Then
      linearguid.Caption = "Not Set"
      linearedit.Text = ""
      Set Linear = Nothing
      jobnumber1.Caption = "Not Set"
    End If
  If GUID = segmentguid.Caption Then
      segmentguid.Caption = "Not Set"
      segmentedit.Text = ""
      Set Segment = Nothing
      jobnumber2.Caption = "Not Set"
    End If
  If GUID = areaguid.Caption Then
      areaguid.Caption = "Not Set"
      areaedit.Text = ""
      Set Area = Nothing
      jobnumber3.Caption = "Not Set"
    End If
End Sub

Private Sub pc_OnJobClosed()
  Unload Me
End Sub

Private Sub refreshbutton_Click()
  On Error Resume Next
  linearedit.Text = Linear.Properties.ByName("Qty").Value
  segmentedit.Text = Segment.Properties.ByName("Qty").Value
  areaedit.Text = Area.Properties.ByName("Qty").Value
End Sub
