<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class TMain
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
    Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(TMain))
    Me.Button4 = New System.Windows.Forms.Button
    Me.Outlook_btn = New System.Windows.Forms.Button
    Me.Word_btn = New System.Windows.Forms.Button
    Me.Excel_btn = New System.Windows.Forms.Button
    Me.AutoCad_lbl = New System.Windows.Forms.Label
    Me.Outlook_lbl = New System.Windows.Forms.Label
    Me.Word_lbl = New System.Windows.Forms.Label
    Me.Excel_lbl = New System.Windows.Forms.Label
    Me.SuspendLayout()
    '
    'Button4
    '
    Me.Button4.Location = New System.Drawing.Point(24, 140)
    Me.Button4.Name = "Button4"
    Me.Button4.Size = New System.Drawing.Size(131, 25)
    Me.Button4.TabIndex = 12
    Me.Button4.Text = "Export To Autocad"
    Me.Button4.UseVisualStyleBackColor = True
    '
    'Outlook_btn
    '
    Me.Outlook_btn.Location = New System.Drawing.Point(24, 100)
    Me.Outlook_btn.Name = "Outlook_btn"
    Me.Outlook_btn.Size = New System.Drawing.Size(131, 25)
    Me.Outlook_btn.TabIndex = 11
    Me.Outlook_btn.Text = "Export To Outlook"
    Me.Outlook_btn.UseVisualStyleBackColor = True
    '
    'Word_btn
    '
    Me.Word_btn.Location = New System.Drawing.Point(24, 60)
    Me.Word_btn.Name = "Word_btn"
    Me.Word_btn.Size = New System.Drawing.Size(131, 25)
    Me.Word_btn.TabIndex = 10
    Me.Word_btn.Text = "Export To Word"
    Me.Word_btn.UseVisualStyleBackColor = True
    '
    'Excel_btn
    '
    Me.Excel_btn.Location = New System.Drawing.Point(24, 20)
    Me.Excel_btn.Name = "Excel_btn"
    Me.Excel_btn.Size = New System.Drawing.Size(131, 25)
    Me.Excel_btn.TabIndex = 8
    Me.Excel_btn.Text = "Export To Excel"
    Me.Excel_btn.UseVisualStyleBackColor = True
    '
    'AutoCad_lbl
    '
    Me.AutoCad_lbl.AutoSize = True
    Me.AutoCad_lbl.Location = New System.Drawing.Point(161, 140)
    Me.AutoCad_lbl.Name = "AutoCad_lbl"
    Me.AutoCad_lbl.Size = New System.Drawing.Size(33, 13)
    Me.AutoCad_lbl.TabIndex = 19
    Me.AutoCad_lbl.Text = "Label"
    '
    'Outlook_lbl
    '
    Me.Outlook_lbl.AutoSize = True
    Me.Outlook_lbl.Location = New System.Drawing.Point(161, 101)
    Me.Outlook_lbl.Name = "Outlook_lbl"
    Me.Outlook_lbl.Size = New System.Drawing.Size(33, 13)
    Me.Outlook_lbl.TabIndex = 18
    Me.Outlook_lbl.Text = "Label"
    '
    'Word_lbl
    '
    Me.Word_lbl.AutoSize = True
    Me.Word_lbl.Location = New System.Drawing.Point(161, 62)
    Me.Word_lbl.Name = "Word_lbl"
    Me.Word_lbl.Size = New System.Drawing.Size(33, 13)
    Me.Word_lbl.TabIndex = 17
    Me.Word_lbl.Text = "Label"
    '
    'Excel_lbl
    '
    Me.Excel_lbl.AutoSize = True
    Me.Excel_lbl.Location = New System.Drawing.Point(161, 20)
    Me.Excel_lbl.Name = "Excel_lbl"
    Me.Excel_lbl.Size = New System.Drawing.Size(33, 13)
    Me.Excel_lbl.TabIndex = 16
    Me.Excel_lbl.Text = "Label"
    '
    'TMain
    '
    Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
    Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
    Me.ClientSize = New System.Drawing.Size(362, 189)
    Me.Controls.Add(Me.AutoCad_lbl)
    Me.Controls.Add(Me.Outlook_lbl)
    Me.Controls.Add(Me.Word_lbl)
    Me.Controls.Add(Me.Excel_lbl)
    Me.Controls.Add(Me.Button4)
    Me.Controls.Add(Me.Outlook_btn)
    Me.Controls.Add(Me.Word_btn)
    Me.Controls.Add(Me.Excel_btn)
    Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
    Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
    Me.Name = "TMain"
    Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
    Me.Text = "VB Planswift SDK Demo"
    Me.ResumeLayout(False)
    Me.PerformLayout()

  End Sub
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents Outlook_btn As System.Windows.Forms.Button
    Friend WithEvents Word_btn As System.Windows.Forms.Button
    Friend WithEvents Excel_btn As System.Windows.Forms.Button
    Friend WithEvents AutoCad_lbl As System.Windows.Forms.Label
    Friend WithEvents Outlook_lbl As System.Windows.Forms.Label
    Friend WithEvents Word_lbl As System.Windows.Forms.Label
    Friend WithEvents Excel_lbl As System.Windows.Forms.Label
End Class
