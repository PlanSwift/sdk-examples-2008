<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
  Inherits System.Windows.Forms.Form

  'Form overrides dispose to clean up the component list.
  <System.Diagnostics.DebuggerNonUserCode()> _
  Protected Overrides Sub Dispose(ByVal disposing As Boolean)
    Try
      If disposing AndAlso components IsNot Nothing Then
        components.Dispose()
      End If
    Finally
      MyBase.Dispose(disposing)
    End Try
  End Sub

  'Required by the Windows Form Designer
  Private components As System.ComponentModel.IContainer

  'NOTE: The following procedure is required by the Windows Form Designer
  'It can be modified using the Windows Form Designer.  
  'Do not modify it using the code editor.
  <System.Diagnostics.DebuggerStepThrough()> _
  Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.JobNumber1 = New System.Windows.Forms.Label
        Me.LinearGuid = New System.Windows.Forms.Label
        Me.JobNumber2 = New System.Windows.Forms.Label
        Me.SegmentGuid = New System.Windows.Forms.Label
        Me.JobNumber3 = New System.Windows.Forms.Label
        Me.AreaGuid = New System.Windows.Forms.Label
        Me.AuditLinear = New System.Windows.Forms.Button
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AuditTrailToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.GoToPageToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.AuditSegment = New System.Windows.Forms.Button
        Me.AuditArea = New System.Windows.Forms.Button
        Me.GetLinear_btn = New System.Windows.Forms.Button
        Me.GetSegment_btn = New System.Windows.Forms.Button
        Me.GetArea_btn = New System.Windows.Forms.Button
        Me.LinearEdit = New System.Windows.Forms.TextBox
        Me.SegmentEdit = New System.Windows.Forms.TextBox
        Me.AreaEdit = New System.Windows.Forms.TextBox
        Me.Label12 = New System.Windows.Forms.Label
        Me.Label13 = New System.Windows.Forms.Label
        Me.Label14 = New System.Windows.Forms.Label
        Me.AutoRefresh = New System.Windows.Forms.RadioButton
        Me.ManualRefresh = New System.Windows.Forms.RadioButton
        Me.Refresh_btn = New System.Windows.Forms.Button
        Me.StopRecordingSource = New System.Windows.Forms.Label
        Me.NodeMovedSource = New System.Windows.Forms.Label
        Me.ScriptSource = New System.Windows.Forms.Label
        Me.SectionDeleteSource = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.ContextMenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Tahoma", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(12, 18)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(85, 19)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Overview"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Tahoma", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(16, 101)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(148, 19)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Estimating Items"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Tahoma", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(12, 226)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(117, 19)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "Refresh Type"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Tahoma", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(470, 97)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(50, 19)
        Me.Label4.TabIndex = 4
        Me.Label4.Text = "Job#"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Tahoma", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(569, 97)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(96, 19)
        Me.Label5.TabIndex = 5
        Me.Label5.Text = "Item GUID"
        '
        'JobNumber1
        '
        Me.JobNumber1.AutoSize = True
        Me.JobNumber1.Location = New System.Drawing.Point(471, 126)
        Me.JobNumber1.Name = "JobNumber1"
        Me.JobNumber1.Size = New System.Drawing.Size(43, 13)
        Me.JobNumber1.TabIndex = 6
        Me.JobNumber1.Text = "Not Set"
        '
        'LinearGuid
        '
        Me.LinearGuid.AutoSize = True
        Me.LinearGuid.Location = New System.Drawing.Point(570, 126)
        Me.LinearGuid.Name = "LinearGuid"
        Me.LinearGuid.Size = New System.Drawing.Size(43, 13)
        Me.LinearGuid.TabIndex = 7
        Me.LinearGuid.Text = "Not Set"
        '
        'JobNumber2
        '
        Me.JobNumber2.AutoSize = True
        Me.JobNumber2.Location = New System.Drawing.Point(471, 155)
        Me.JobNumber2.Name = "JobNumber2"
        Me.JobNumber2.Size = New System.Drawing.Size(43, 13)
        Me.JobNumber2.TabIndex = 8
        Me.JobNumber2.Text = "Not Set"
        '
        'SegmentGuid
        '
        Me.SegmentGuid.AutoSize = True
        Me.SegmentGuid.Location = New System.Drawing.Point(570, 155)
        Me.SegmentGuid.Name = "SegmentGuid"
        Me.SegmentGuid.Size = New System.Drawing.Size(43, 13)
        Me.SegmentGuid.TabIndex = 9
        Me.SegmentGuid.Text = "Not Set"
        '
        'JobNumber3
        '
        Me.JobNumber3.AutoSize = True
        Me.JobNumber3.Location = New System.Drawing.Point(471, 184)
        Me.JobNumber3.Name = "JobNumber3"
        Me.JobNumber3.Size = New System.Drawing.Size(43, 13)
        Me.JobNumber3.TabIndex = 10
        Me.JobNumber3.Text = "Not Set"
        '
        'AreaGuid
        '
        Me.AreaGuid.AutoSize = True
        Me.AreaGuid.Location = New System.Drawing.Point(570, 184)
        Me.AreaGuid.Name = "AreaGuid"
        Me.AreaGuid.Size = New System.Drawing.Size(43, 13)
        Me.AreaGuid.TabIndex = 11
        Me.AreaGuid.Text = "Not Set"
        '
        'AuditLinear
        '
        Me.AuditLinear.Location = New System.Drawing.Point(384, 121)
        Me.AuditLinear.Name = "AuditLinear"
        Me.AuditLinear.Size = New System.Drawing.Size(70, 23)
        Me.AuditLinear.TabIndex = 12
        Me.AuditLinear.Tag = "0"
        Me.AuditLinear.Text = "Audit Trail"
        Me.AuditLinear.UseVisualStyleBackColor = True
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AuditTrailToolStripMenuItem, Me.GoToPageToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(138, 48)
        '
        'AuditTrailToolStripMenuItem
        '
        Me.AuditTrailToolStripMenuItem.Name = "AuditTrailToolStripMenuItem"
        Me.AuditTrailToolStripMenuItem.Size = New System.Drawing.Size(137, 22)
        Me.AuditTrailToolStripMenuItem.Text = "Audit Trail"
        '
        'GoToPageToolStripMenuItem
        '
        Me.GoToPageToolStripMenuItem.Name = "GoToPageToolStripMenuItem"
        Me.GoToPageToolStripMenuItem.Size = New System.Drawing.Size(137, 22)
        Me.GoToPageToolStripMenuItem.Text = "GoTo Page"
        '
        'AuditSegment
        '
        Me.AuditSegment.Location = New System.Drawing.Point(384, 150)
        Me.AuditSegment.Name = "AuditSegment"
        Me.AuditSegment.Size = New System.Drawing.Size(70, 23)
        Me.AuditSegment.TabIndex = 13
        Me.AuditSegment.Tag = "1"
        Me.AuditSegment.Text = "Audit Trail"
        Me.AuditSegment.UseVisualStyleBackColor = True
        '
        'AuditArea
        '
        Me.AuditArea.Location = New System.Drawing.Point(384, 179)
        Me.AuditArea.Name = "AuditArea"
        Me.AuditArea.Size = New System.Drawing.Size(70, 23)
        Me.AuditArea.TabIndex = 14
        Me.AuditArea.Tag = "2"
        Me.AuditArea.Text = "Audit Trail"
        Me.AuditArea.UseVisualStyleBackColor = True
        '
        'GetLinear_btn
        '
        Me.GetLinear_btn.Location = New System.Drawing.Point(267, 121)
        Me.GetLinear_btn.Name = "GetLinear_btn"
        Me.GetLinear_btn.Size = New System.Drawing.Size(111, 23)
        Me.GetLinear_btn.TabIndex = 15
        Me.GetLinear_btn.Text = "Get From PlanSwift"
        Me.GetLinear_btn.UseVisualStyleBackColor = True
        '
        'GetSegment_btn
        '
        Me.GetSegment_btn.Location = New System.Drawing.Point(267, 150)
        Me.GetSegment_btn.Name = "GetSegment_btn"
        Me.GetSegment_btn.Size = New System.Drawing.Size(111, 23)
        Me.GetSegment_btn.TabIndex = 16
        Me.GetSegment_btn.Text = "Get From PlanSwift"
        Me.GetSegment_btn.UseVisualStyleBackColor = True
        '
        'GetArea_btn
        '
        Me.GetArea_btn.Location = New System.Drawing.Point(267, 179)
        Me.GetArea_btn.Name = "GetArea_btn"
        Me.GetArea_btn.Size = New System.Drawing.Size(111, 23)
        Me.GetArea_btn.TabIndex = 17
        Me.GetArea_btn.Text = "Get From PlanSwift"
        Me.GetArea_btn.UseVisualStyleBackColor = True
        '
        'LinearEdit
        '
        Me.LinearEdit.Location = New System.Drawing.Point(135, 123)
        Me.LinearEdit.Name = "LinearEdit"
        Me.LinearEdit.Size = New System.Drawing.Size(126, 20)
        Me.LinearEdit.TabIndex = 18
        '
        'SegmentEdit
        '
        Me.SegmentEdit.Location = New System.Drawing.Point(135, 152)
        Me.SegmentEdit.Name = "SegmentEdit"
        Me.SegmentEdit.Size = New System.Drawing.Size(126, 20)
        Me.SegmentEdit.TabIndex = 19
        '
        'AreaEdit
        '
        Me.AreaEdit.Location = New System.Drawing.Point(135, 178)
        Me.AreaEdit.Name = "AreaEdit"
        Me.AreaEdit.Size = New System.Drawing.Size(126, 20)
        Me.AreaEdit.TabIndex = 20
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Location = New System.Drawing.Point(38, 126)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(91, 13)
        Me.Label12.TabIndex = 21
        Me.Label12.Text = "2x6 Exterior Walls"
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(41, 155)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(88, 13)
        Me.Label13.TabIndex = 22
        Me.Label13.Text = "2x4 Interior Walls"
        Me.Label13.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Location = New System.Drawing.Point(15, 184)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(114, 13)
        Me.Label14.TabIndex = 23
        Me.Label14.Text = "Main Floor Sq Footage"
        Me.Label14.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'AutoRefresh
        '
        Me.AutoRefresh.AutoSize = True
        Me.AutoRefresh.Checked = True
        Me.AutoRefresh.Location = New System.Drawing.Point(16, 248)
        Me.AutoRefresh.Name = "AutoRefresh"
        Me.AutoRefresh.Size = New System.Drawing.Size(184, 17)
        Me.AutoRefresh.TabIndex = 24
        Me.AutoRefresh.TabStop = True
        Me.AutoRefresh.Text = "Automatic Refresh (Using Events)"
        Me.AutoRefresh.UseVisualStyleBackColor = True
        '
        'ManualRefresh
        '
        Me.ManualRefresh.AutoSize = True
        Me.ManualRefresh.Location = New System.Drawing.Point(16, 274)
        Me.ManualRefresh.Name = "ManualRefresh"
        Me.ManualRefresh.Size = New System.Drawing.Size(100, 17)
        Me.ManualRefresh.TabIndex = 25
        Me.ManualRefresh.Text = "Manual Refresh"
        Me.ManualRefresh.UseVisualStyleBackColor = True
        '
        'Refresh_btn
        '
        Me.Refresh_btn.Enabled = False
        Me.Refresh_btn.Location = New System.Drawing.Point(122, 271)
        Me.Refresh_btn.Name = "Refresh_btn"
        Me.Refresh_btn.Size = New System.Drawing.Size(90, 23)
        Me.Refresh_btn.TabIndex = 26
        Me.Refresh_btn.Text = "Refresh Now"
        Me.Refresh_btn.UseVisualStyleBackColor = True
        '
        'StopRecordingSource
        '
        Me.StopRecordingSource.AutoSize = True
        Me.StopRecordingSource.Location = New System.Drawing.Point(507, 271)
        Me.StopRecordingSource.Name = "StopRecordingSource"
        Me.StopRecordingSource.Size = New System.Drawing.Size(163, 13)
        Me.StopRecordingSource.TabIndex = 27
        Me.StopRecordingSource.Text = "// OnStopRecordingEvent Script"
        Me.StopRecordingSource.Visible = False
        '
        'NodeMovedSource
        '
        Me.NodeMovedSource.AutoSize = True
        Me.NodeMovedSource.Location = New System.Drawing.Point(507, 252)
        Me.NodeMovedSource.Name = "NodeMovedSource"
        Me.NodeMovedSource.Size = New System.Drawing.Size(154, 13)
        Me.NodeMovedSource.TabIndex = 28
        Me.NodeMovedSource.Text = "// OnNodeMoved Event Script"
        Me.NodeMovedSource.Visible = False
        '
        'ScriptSource
        '
        Me.ScriptSource.AutoSize = True
        Me.ScriptSource.Location = New System.Drawing.Point(507, 232)
        Me.ScriptSource.Name = "ScriptSource"
        Me.ScriptSource.Size = New System.Drawing.Size(185, 13)
        Me.ScriptSource.TabIndex = 29
        Me.ScriptSource.Text = "// OnPropertiesChanged Event Script"
        Me.ScriptSource.Visible = False
        '
        'SectionDeleteSource
        '
        Me.SectionDeleteSource.AutoSize = True
        Me.SectionDeleteSource.Location = New System.Drawing.Point(507, 291)
        Me.SectionDeleteSource.Name = "SectionDeleteSource"
        Me.SectionDeleteSource.Size = New System.Drawing.Size(159, 13)
        Me.SectionDeleteSource.TabIndex = 30
        Me.SectionDeleteSource.Text = "// OnSectionDeleteEvent Script"
        Me.SectionDeleteSource.Visible = False
        '
        'Label6
        '
        Me.Label6.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Label6.Location = New System.Drawing.Point(13, 37)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(774, 46)
        Me.Label6.TabIndex = 31
        Me.Label6.Text = resources.GetString("Label6.Text")
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(803, 313)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.SectionDeleteSource)
        Me.Controls.Add(Me.ScriptSource)
        Me.Controls.Add(Me.NodeMovedSource)
        Me.Controls.Add(Me.StopRecordingSource)
        Me.Controls.Add(Me.Refresh_btn)
        Me.Controls.Add(Me.ManualRefresh)
        Me.Controls.Add(Me.AutoRefresh)
        Me.Controls.Add(Me.Label14)
        Me.Controls.Add(Me.Label13)
        Me.Controls.Add(Me.Label12)
        Me.Controls.Add(Me.AreaEdit)
        Me.Controls.Add(Me.SegmentEdit)
        Me.Controls.Add(Me.LinearEdit)
        Me.Controls.Add(Me.GetArea_btn)
        Me.Controls.Add(Me.GetSegment_btn)
        Me.Controls.Add(Me.GetLinear_btn)
        Me.Controls.Add(Me.AuditArea)
        Me.Controls.Add(Me.AuditSegment)
        Me.Controls.Add(Me.AuditLinear)
        Me.Controls.Add(Me.AreaGuid)
        Me.Controls.Add(Me.JobNumber3)
        Me.Controls.Add(Me.SegmentGuid)
        Me.Controls.Add(Me.JobNumber2)
        Me.Controls.Add(Me.LinearGuid)
        Me.Controls.Add(Me.JobNumber1)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Integration Example"
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
  Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
  Friend WithEvents Label3 As System.Windows.Forms.Label
  Friend WithEvents Label4 As System.Windows.Forms.Label
  Friend WithEvents Label5 As System.Windows.Forms.Label
  Friend WithEvents JobNumber1 As System.Windows.Forms.Label
  Friend WithEvents LinearGuid As System.Windows.Forms.Label
  Friend WithEvents JobNumber2 As System.Windows.Forms.Label
  Friend WithEvents SegmentGuid As System.Windows.Forms.Label
  Friend WithEvents JobNumber3 As System.Windows.Forms.Label
  Friend WithEvents AreaGuid As System.Windows.Forms.Label
  Friend WithEvents AuditLinear As System.Windows.Forms.Button
  Friend WithEvents AuditSegment As System.Windows.Forms.Button
  Friend WithEvents AuditArea As System.Windows.Forms.Button
  Friend WithEvents GetLinear_btn As System.Windows.Forms.Button
  Friend WithEvents GetSegment_btn As System.Windows.Forms.Button
  Friend WithEvents GetArea_btn As System.Windows.Forms.Button
  Friend WithEvents LinearEdit As System.Windows.Forms.TextBox
  Friend WithEvents SegmentEdit As System.Windows.Forms.TextBox
  Friend WithEvents AreaEdit As System.Windows.Forms.TextBox
  Friend WithEvents Label12 As System.Windows.Forms.Label
  Friend WithEvents Label13 As System.Windows.Forms.Label
  Friend WithEvents Label14 As System.Windows.Forms.Label
  Friend WithEvents AutoRefresh As System.Windows.Forms.RadioButton
  Friend WithEvents ManualRefresh As System.Windows.Forms.RadioButton
  Friend WithEvents Refresh_btn As System.Windows.Forms.Button
  Friend WithEvents StopRecordingSource As System.Windows.Forms.Label
  Friend WithEvents NodeMovedSource As System.Windows.Forms.Label
  Friend WithEvents ScriptSource As System.Windows.Forms.Label
  Friend WithEvents SectionDeleteSource As System.Windows.Forms.Label
  Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
  Friend WithEvents AuditTrailToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents GoToPageToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents Label6 As System.Windows.Forms.Label

End Class
