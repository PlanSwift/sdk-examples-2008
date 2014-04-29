<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class TOutlook
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
    Me.to_txt = New System.Windows.Forms.TextBox
    Me.Label1 = New System.Windows.Forms.Label
    Me.Label2 = New System.Windows.Forms.Label
    Me.CC_txt = New System.Windows.Forms.TextBox
    Me.Subject_txt = New System.Windows.Forms.TextBox
    Me.Label3 = New System.Windows.Forms.Label
    Me.send_btn = New System.Windows.Forms.Button
    Me.Cancel = New System.Windows.Forms.Button
    Me.Tab_cbx = New System.Windows.Forms.ComboBox
    Me.GroupBox1 = New System.Windows.Forms.GroupBox
    Me.Count_ck = New System.Windows.Forms.CheckBox
    Me.Segment_ck = New System.Windows.Forms.CheckBox
    Me.Linear_ck = New System.Windows.Forms.CheckBox
    Me.Area_ck = New System.Windows.Forms.CheckBox
    Me.Folders_ck = New System.Windows.Forms.CheckBox
    Me.Parts_ck = New System.Windows.Forms.CheckBox
    Me.Assem_ck = New System.Windows.Forms.CheckBox
    Me.Label4 = New System.Windows.Forms.Label
    Me.GroupBox1.SuspendLayout()
    Me.SuspendLayout()
    '
    'to_txt
    '
    Me.to_txt.Location = New System.Drawing.Point(58, 12)
    Me.to_txt.Name = "to_txt"
    Me.to_txt.Size = New System.Drawing.Size(343, 20)
    Me.to_txt.TabIndex = 0
    '
    'Label1
    '
    Me.Label1.AutoSize = True
    Me.Label1.Location = New System.Drawing.Point(29, 15)
    Me.Label1.Name = "Label1"
    Me.Label1.Size = New System.Drawing.Size(23, 13)
    Me.Label1.TabIndex = 1
    Me.Label1.Text = "To:"
    '
    'Label2
    '
    Me.Label2.AutoSize = True
    Me.Label2.Location = New System.Drawing.Point(28, 41)
    Me.Label2.Name = "Label2"
    Me.Label2.Size = New System.Drawing.Size(24, 13)
    Me.Label2.TabIndex = 3
    Me.Label2.Text = "CC:"
    '
    'CC_txt
    '
    Me.CC_txt.Location = New System.Drawing.Point(58, 38)
    Me.CC_txt.Name = "CC_txt"
    Me.CC_txt.Size = New System.Drawing.Size(343, 20)
    Me.CC_txt.TabIndex = 2
    '
    'Subject_txt
    '
    Me.Subject_txt.Location = New System.Drawing.Point(58, 64)
    Me.Subject_txt.Name = "Subject_txt"
    Me.Subject_txt.Size = New System.Drawing.Size(343, 20)
    Me.Subject_txt.TabIndex = 4
    '
    'Label3
    '
    Me.Label3.AutoSize = True
    Me.Label3.Location = New System.Drawing.Point(6, 67)
    Me.Label3.Name = "Label3"
    Me.Label3.Size = New System.Drawing.Size(46, 13)
    Me.Label3.TabIndex = 5
    Me.Label3.Text = "Subject:"
    '
    'send_btn
    '
    Me.send_btn.Location = New System.Drawing.Point(373, 229)
    Me.send_btn.Name = "send_btn"
    Me.send_btn.Size = New System.Drawing.Size(75, 23)
    Me.send_btn.TabIndex = 6
    Me.send_btn.Text = "Send"
    Me.send_btn.UseVisualStyleBackColor = True
    '
    'Cancel
    '
    Me.Cancel.Location = New System.Drawing.Point(292, 229)
    Me.Cancel.Name = "Cancel"
    Me.Cancel.Size = New System.Drawing.Size(75, 23)
    Me.Cancel.TabIndex = 7
    Me.Cancel.Text = "Cancel"
    Me.Cancel.UseVisualStyleBackColor = True
    '
    'Tab_cbx
    '
    Me.Tab_cbx.FormattingEnabled = True
    Me.Tab_cbx.Location = New System.Drawing.Point(75, 19)
    Me.Tab_cbx.Name = "Tab_cbx"
    Me.Tab_cbx.Size = New System.Drawing.Size(176, 21)
    Me.Tab_cbx.TabIndex = 8
    '
    'GroupBox1
    '
    Me.GroupBox1.Controls.Add(Me.Count_ck)
    Me.GroupBox1.Controls.Add(Me.Segment_ck)
    Me.GroupBox1.Controls.Add(Me.Linear_ck)
    Me.GroupBox1.Controls.Add(Me.Area_ck)
    Me.GroupBox1.Controls.Add(Me.Folders_ck)
    Me.GroupBox1.Controls.Add(Me.Parts_ck)
    Me.GroupBox1.Controls.Add(Me.Assem_ck)
    Me.GroupBox1.Controls.Add(Me.Label4)
    Me.GroupBox1.Controls.Add(Me.Tab_cbx)
    Me.GroupBox1.Location = New System.Drawing.Point(12, 92)
    Me.GroupBox1.Name = "GroupBox1"
    Me.GroupBox1.Size = New System.Drawing.Size(436, 131)
    Me.GroupBox1.TabIndex = 9
    Me.GroupBox1.TabStop = False
    Me.GroupBox1.Text = "Planswift Job  Summary "
    '
    'Count_ck
    '
    Me.Count_ck.AutoSize = True
    Me.Count_ck.Location = New System.Drawing.Point(280, 54)
    Me.Count_ck.Name = "Count_ck"
    Me.Count_ck.Size = New System.Drawing.Size(54, 17)
    Me.Count_ck.TabIndex = 17
    Me.Count_ck.Text = "Count"
    Me.Count_ck.UseVisualStyleBackColor = True
    '
    'Segment_ck
    '
    Me.Segment_ck.AutoSize = True
    Me.Segment_ck.Location = New System.Drawing.Point(154, 100)
    Me.Segment_ck.Name = "Segment_ck"
    Me.Segment_ck.Size = New System.Drawing.Size(68, 17)
    Me.Segment_ck.TabIndex = 16
    Me.Segment_ck.Text = "Segment"
    Me.Segment_ck.UseVisualStyleBackColor = True
    '
    'Linear_ck
    '
    Me.Linear_ck.AutoSize = True
    Me.Linear_ck.Location = New System.Drawing.Point(154, 77)
    Me.Linear_ck.Name = "Linear_ck"
    Me.Linear_ck.Size = New System.Drawing.Size(55, 17)
    Me.Linear_ck.TabIndex = 15
    Me.Linear_ck.Text = "Linear"
    Me.Linear_ck.UseVisualStyleBackColor = True
    '
    'Area_ck
    '
    Me.Area_ck.AutoSize = True
    Me.Area_ck.Location = New System.Drawing.Point(154, 54)
    Me.Area_ck.Name = "Area_ck"
    Me.Area_ck.Size = New System.Drawing.Size(48, 17)
    Me.Area_ck.TabIndex = 14
    Me.Area_ck.Text = "Area"
    Me.Area_ck.UseVisualStyleBackColor = True
    '
    'Folders_ck
    '
    Me.Folders_ck.AutoSize = True
    Me.Folders_ck.Location = New System.Drawing.Point(19, 100)
    Me.Folders_ck.Name = "Folders_ck"
    Me.Folders_ck.Size = New System.Drawing.Size(60, 17)
    Me.Folders_ck.TabIndex = 13
    Me.Folders_ck.Text = "Folders"
    Me.Folders_ck.UseVisualStyleBackColor = True
    '
    'Parts_ck
    '
    Me.Parts_ck.AutoSize = True
    Me.Parts_ck.Location = New System.Drawing.Point(19, 77)
    Me.Parts_ck.Name = "Parts_ck"
    Me.Parts_ck.Size = New System.Drawing.Size(50, 17)
    Me.Parts_ck.TabIndex = 12
    Me.Parts_ck.Text = "Parts"
    Me.Parts_ck.UseVisualStyleBackColor = True
    '
    'Assem_ck
    '
    Me.Assem_ck.AutoSize = True
    Me.Assem_ck.Location = New System.Drawing.Point(19, 54)
    Me.Assem_ck.Name = "Assem_ck"
    Me.Assem_ck.Size = New System.Drawing.Size(78, 17)
    Me.Assem_ck.TabIndex = 11
    Me.Assem_ck.Text = "Assemblies"
    Me.Assem_ck.UseVisualStyleBackColor = True
    '
    'Label4
    '
    Me.Label4.AutoSize = True
    Me.Label4.Location = New System.Drawing.Point(7, 22)
    Me.Label4.Name = "Label4"
    Me.Label4.Size = New System.Drawing.Size(62, 13)
    Me.Label4.TabIndex = 10
    Me.Label4.Text = "Select Tab:"
    '
    'TOutlook
    '
    Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
    Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
    Me.ClientSize = New System.Drawing.Size(460, 259)
    Me.Controls.Add(Me.GroupBox1)
    Me.Controls.Add(Me.Cancel)
    Me.Controls.Add(Me.send_btn)
    Me.Controls.Add(Me.Label3)
    Me.Controls.Add(Me.Subject_txt)
    Me.Controls.Add(Me.Label2)
    Me.Controls.Add(Me.CC_txt)
    Me.Controls.Add(Me.Label1)
    Me.Controls.Add(Me.to_txt)
    Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
    Me.Name = "TOutlook"
    Me.Text = "TOutlook"
    Me.GroupBox1.ResumeLayout(False)
    Me.GroupBox1.PerformLayout()
    Me.ResumeLayout(False)
    Me.PerformLayout()

  End Sub
    Friend WithEvents to_txt As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents CC_txt As System.Windows.Forms.TextBox
    Friend WithEvents Subject_txt As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents send_btn As System.Windows.Forms.Button
    Friend WithEvents Cancel As System.Windows.Forms.Button
    Friend WithEvents Tab_cbx As System.Windows.Forms.ComboBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Assem_ck As System.Windows.Forms.CheckBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Count_ck As System.Windows.Forms.CheckBox
    Friend WithEvents Segment_ck As System.Windows.Forms.CheckBox
    Friend WithEvents Linear_ck As System.Windows.Forms.CheckBox
    Friend WithEvents Area_ck As System.Windows.Forms.CheckBox
    Friend WithEvents Folders_ck As System.Windows.Forms.CheckBox
    Friend WithEvents Parts_ck As System.Windows.Forms.CheckBox
End Class
