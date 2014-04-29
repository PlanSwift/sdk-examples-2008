Imports System
Imports System.ComponentModel
Imports System.Threading
Imports System.Windows.Forms


Public Class Form1
    Public WithEvents pc As PlanSwift.PlanCenter
    Delegate Sub SetTextCallback(ByVal [text] As String)
    Private OnChangeThread As Thread = Nothing
    Dim Area, Segment, Linear As PlanSwift.IItem
    Dim ClickedItem, IGUID As String
    Dim ClickedSection As Integer
    Dim PropertiesChanged, PropertiesDelete, PropertiesMoved, PropertiesRecord As String
    Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, _
    ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
    Public Const HWND_TOPMOST = -1
    Public Const HWND_NOTOPMOST = -2
    Public Const SWP_NOMOVE = &H2
    Public Const SWP_NOSIZE = &H1


    Public Function ForceForegroundWindow(ByVal hWnd As Long) As Boolean
        Call SetWindowPos(hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE)
    End Function

    Sub EnableManualRefresh()
        If ManualRefresh.Checked Then
            Refresh_btn.Enabled = True
        Else
            Refresh_btn.Enabled = False
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Linear = Nothing
            Segment = Nothing
            Area = Nothing
            pc = CreateObject("PlanSwift.PlanCenter")
            PropertiesChanged = "var tmp: string; begin() tmp := itemproperty(itemid, 'AuditTrail');  tmp := tmp + #13#10 + 'Properties Changed on ' + datetimetostr(now) + ' by ' + currentuser; setitemproperty(itemid, 'AuditTrail', tmp); end;"
            PropertiesMoved = "var tmp: string; begin tmp := itemproperty(itemid, 'AuditTrail'); tmp := tmp + #13#10 + 'Node ' + inttostr(node) + ' on Section ' + inttostr(section) + '  moved on ' + datetimetostr(now) + ' by ' + currentuser; setitemproperty(itemid, 'AuditTrail', tmp); end;"
            PropertiesDelete = "var tmp: string; begin if section = 0 then exit; tmp := itemproperty(itemid, 'AuditTrail'); tmp := tmp + #13#10 + 'Section ' + inttostr(section) + ' deleted on ' + datetimetostr(now) + ' by ' + currentuser; setitemproperty(itemid, 'AuditTrail', tmp); end;"
            PropertiesRecord = "var tmp: string; begin tmp := itemproperty(itemid, 'AuditTrail'); tmp := tmp + #13#10 + 'Section ' + inttostr(section) + ' recorded on ' + datetimetostr(now) + ' by ' + currentuser; setitemproperty(itemid, 'AuditTrail', tmp); end;"
            GetLinear_btn.Focus()
        Catch ex As Exception
            MsgBox(ex.Message & vbCrLf & ex.ToString)
            Application.Exit()
        End Try
    End Sub

    Private Sub Refresh_btn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Refresh_btn.Click
        If Linear IsNot Nothing Then
            LinearEdit.Text = Linear.Properties.ByName("Qty").Value
        End If
        If Segment IsNot Nothing Then
            SegmentEdit.Text = Linear.Properties.ByName("Qty").Value
        End If
        If Area IsNot Nothing Then
            AreaEdit.Text = Area.Properties.ByName("Qty").Value
        End If

    End Sub
    Private Sub GetArea_btn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GetArea_btn.Click
        Dim prop As PlanSwift.IPropertyObject
        Dim EScript As PlanSwift.IEventScript

        If Not pc.JobOpened Then
            MsgBox("Please Open a Job")
            Exit Sub
        End If
        JobNumber3.Text = "Not Set"
        Area = pc.Tabs.[New](PlanSwift.TabType.ttJob, "Estimate").[New](PlanSwift.DigitizerType.dgArea, PlanSwift.ItemType.itNone)
        If Area Is Nothing Then Exit Sub
        Area.Name = "Main Sq Footage"
        Area.Visible = True
        prop = Area.Properties.Add
        prop.Name = "AuditTrail"
        prop.Category = "SDK Sample"
        prop.Formula = "Item Created on " + Date.Now.ToString
        Area.EventScripts.AddCommonEvents()
        EScript = Area.EventScripts.FindByName("OnPropertiesChanged")
        If EScript Is Nothing Then EScript = Area.EventScripts.Add("OnPropertiesChanged")
        EScript.SourceCode = PropertiesChanged
        EScript = Nothing
        EScript = Area.EventScripts.FindByName("OnStopRecording")
        If EScript Is Nothing Then EScript = Area.EventScripts.Add("OnStopRecording")
        EScript.SourceCode = PropertiesRecord
        EScript = Nothing
        EScript = Area.EventScripts.FindByName("OnNodeMoved")
        If EScript Is Nothing Then EScript = Area.EventScripts.Add("OnNodeMoved")
        EScript.SourceCode = PropertiesMoved
        EScript = Nothing
        EScript = Area.EventScripts.FindByName("OnSectionDelete")
        If EScript Is Nothing Then EScript = Area.EventScripts.Add("OnSectionDelete")
        EScript.SourceCode = PropertiesDelete
        ForceForegroundWindow(pc.Handle)
        If Area.DoRecord Then
            AreaEdit.Text = Area.Properties.ByName("Qty").Value
            JobNumber3.Text = pc.JobNumber
            AreaGuid.Text = Area.ItemID
        End If
        pc.RefreshEstimate()
        BringToFront()
    End Sub

    Private Sub GetLinear_btn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GetLinear_btn.Click
        Dim prop As PlanSwift.IPropertyObject
        Dim EScript As PlanSwift.IEventScript
        If Not pc.JobOpened Then
            MsgBox("Please Open a Job")
            Exit Sub
        End If
        JobNumber3.Text = "Not Set"
        Linear = pc.Tabs.[New](PlanSwift.TabType.ttJob, "Estimate").[New](PlanSwift.DigitizerType.dgLinear, PlanSwift.ItemType.itNone)
        If Linear Is Nothing Then Exit Sub
        Linear.Name = "2x6 Exterior Walls"
        Linear.Visible = True
        prop = Linear.Properties.Add
        prop.Name = "AuditTrail"
        prop.Category = "SDK Sample"
        prop.Formula = "Item Created on " + Date.Now.ToString
        Linear.EventScripts.AddCommonEvents()
        EScript = Linear.EventScripts.FindByName("OnPropertiesChanged")
        If EScript Is Nothing Then EScript = Linear.EventScripts.Add("OnPropertiesChanged")
        EScript.SourceCode = PropertiesChanged
        EScript = Nothing
        EScript = Linear.EventScripts.FindByName("OnStopRecording")
        If EScript Is Nothing Then EScript = Linear.EventScripts.Add("OnStopRecording")
        EScript.SourceCode = PropertiesRecord
        EScript = Nothing
        EScript = Linear.EventScripts.FindByName("OnNodeMoved")
        If EScript Is Nothing Then EScript = Linear.EventScripts.Add("OnNodeMoved")
        EScript.SourceCode = PropertiesMoved
        EScript = Nothing
        EScript = Linear.EventScripts.FindByName("OnSectionDelete")
        If EScript Is Nothing Then EScript = Linear.EventScripts.Add("OnSectionDelete")
        EScript.SourceCode = PropertiesDelete
        ForceForegroundWindow(pc.Handle)
        If Linear.DoRecord Then
            LinearEdit.Text = Linear.Properties.ByName("Qty").Value
            JobNumber1.Text = pc.JobNumber
            LinearGuid.Text = Linear.ItemID
        End If
        pc.RefreshEstimate()
        BringToFront()
    End Sub

    Private Sub GetSegment_btn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GetSegment_btn.Click
        Dim prop As PlanSwift.IPropertyObject
        Dim EScript As PlanSwift.IEventScript

        If Not pc.JobOpened Then
            MsgBox("Please Open a Job")
            Exit Sub
        End If
        JobNumber3.Text = "Not Set"
        Segment = pc.Tabs.[New](PlanSwift.TabType.ttJob, "Estimate").[New](PlanSwift.DigitizerType.dgSegment, PlanSwift.ItemType.itNone)
        If Segment Is Nothing Then Exit Sub
        Segment.Name = "2x4 Interior Walls"
        Segment.Visible = True
        prop = Segment.Properties.Add
        prop.Name = "AuditTrail"
        prop.Category = "SDK Sample"
        prop.Formula = "Item Created on " + Date.Now.ToString
        Segment.EventScripts.AddCommonEvents()
        EScript = Segment.EventScripts.FindByName("OnPropertiesChanged")
        If EScript Is Nothing Then EScript = Segment.EventScripts.Add("OnPropertiesChanged")
        EScript.SourceCode = PropertiesChanged
        EScript = Nothing
        EScript = Segment.EventScripts.FindByName("OnStopRecording")
        If EScript Is Nothing Then EScript = Segment.EventScripts.Add("OnStopRecording")
        EScript.SourceCode = PropertiesRecord
        EScript = Nothing
        EScript = Segment.EventScripts.FindByName("OnNodeMoved")
        If EScript Is Nothing Then EScript = Segment.EventScripts.Add("OnNodeMoved")
        EScript.SourceCode = PropertiesMoved
        EScript = Nothing
        EScript = Segment.EventScripts.FindByName("OnSectionDelete")
        If EScript Is Nothing Then EScript = Segment.EventScripts.Add("OnSectionDelete")
        EScript.SourceCode = PropertiesRecord
        ForceForegroundWindow(pc.Handle)
        If Segment.DoRecord Then
            SegmentEdit.Text = Segment.Properties.ByName("Qty").Value
            JobNumber2.Text = pc.JobNumber
            SegmentGuid.Text = Segment.ItemID
        End If
        pc.RefreshEstimate()
        BringToFront()
    End Sub

    Sub ShowPopup(ByVal Button As Button)
        Dim x, y As Integer
        x = Me.Location.X + Button.Location.X + Button.Width
        y = Me.Top + Button.Bottom + 5
        ContextMenuStrip1.Show(x, y)
        Select Case Button.Name
            Case "AuditLinear"
                If LinearEdit.Text = "" Then
                    MsgBox("No Item has Been Drawn")
                    GetLinear_btn.Focus()
                    ContextMenuStrip1.Hide()
                Else
                    ClickedItem = Linear.ItemID
                End If
            Case "AuditSegment"
                If SegmentEdit.Text = "" Then
                    MsgBox("No Item has been Drawn")
                    GetSegment_btn.Focus()
                    ContextMenuStrip1.Hide()
                Else
                    ClickedItem = Segment.ItemID
                End If

            Case "AuditArea"
                If AreaEdit.Text = "" Then
                    MsgBox("No Item has been Drawn")
                    GetArea_btn.Focus()
                    ContextMenuStrip1.Hide()
                Else
                    ClickedItem = Area.ItemID
                End If
        End Select

    End Sub

    Private Sub Form1_FormClosed(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosedEventArgs) Handles MyBase.FormClosed
        Linear = Nothing
        Segment = Nothing
        Area = Nothing
        pc = Nothing
    End Sub

    Private Sub GoToPageToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GoToPageToolStripMenuItem.Click
        Dim Aitem As PlanSwift.IItem
        Aitem = pc.FindItemByGUID(ClickedItem)
        Aitem.ZoomToSection(0)
    End Sub

    Private Sub AuditTrailToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AuditTrailToolStripMenuItem.Click
        Dim tmp As String
        tmp = ""
        If ClickedItem = LinearGuid.Text Then tmp = Linear.Properties.ByName("AuditTrail").Formula
        If ClickedItem = SegmentGuid.Text Then tmp = Segment.Properties.ByName("AuditTrail").Formula
        If ClickedItem = AreaGuid.Text Then tmp = Area.Properties.ByName("AuditTrail").Formula
        MessageBox.Show(tmp, "Audit Information", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly, False)
    End Sub

    Private Sub AuditLinear_MouseClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles AuditLinear.MouseClick
        ShowPopup(AuditLinear)
    End Sub
    Private Sub ManualRefresh_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ManualRefresh.CheckedChanged
        EnableManualRefresh()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AuditSegment.Click
        ShowPopup(AuditSegment)
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AuditArea.Click
        ShowPopup(AuditArea)
    End Sub

    Private Sub OnItemChanged(ByVal GUID As String) Handles pc.OnItemChanged
        ClickedItem = GUID
        Me.OnChangeThread = New Thread(New ThreadStart(AddressOf Me.ThreadSafeText))
        Me.OnChangeThread.Start()
    End Sub

    Private Sub ThreadSafeText()
        Me.SetText(ClickedItem)
    End Sub

    Private Sub SetText(ByVal [text] As String)
        Dim AItem As PlanSwift.IItem

        ' InvokeRequired required compares the thread ID of the
        ' calling thread to the thread ID of the creating thread.
        ' If these threads are different, it returns true.
        If Me.LinearGuid.InvokeRequired Then
            Dim d As New SetTextCallback(AddressOf SetText)
            Me.Invoke(d, New Object() {[text]})
        Else
            If Not AutoRefresh.Checked Then Exit Sub
            AItem = pc.FindItemByGUID([text])
            If AItem Is Nothing Then Exit Sub
            If ClickedItem = LinearGuid.Text Then LinearEdit.Text = AItem.Properties.ByName("Qty").Value
            If ClickedItem = SegmentGuid.Text Then SegmentEdit.Text = AItem.Properties.ByName("Qty").Value
            If ClickedItem = AreaGuid.Text Then AreaEdit.Text = AItem.Properties.ByName("Qty").Value
        End If
    End Sub
End Class
