<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class TExcel_frm
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
    Me.Tabs_cbx = New System.Windows.Forms.ComboBox
    Me.ok_btn = New System.Windows.Forms.Button
    Me.Label1 = New System.Windows.Forms.Label
    Me.SuspendLayout()
    '
    'Tabs_cbx
    '
    Me.Tabs_cbx.FormattingEnabled = True
    Me.Tabs_cbx.Location = New System.Drawing.Point(12, 31)
    Me.Tabs_cbx.Name = "Tabs_cbx"
    Me.Tabs_cbx.Size = New System.Drawing.Size(189, 21)
    Me.Tabs_cbx.TabIndex = 4
    '
    'ok_btn
    '
    Me.ok_btn.Location = New System.Drawing.Point(207, 29)
    Me.ok_btn.Name = "ok_btn"
    Me.ok_btn.Size = New System.Drawing.Size(75, 23)
    Me.ok_btn.TabIndex = 5
    Me.ok_btn.Text = "Send"
    Me.ok_btn.UseVisualStyleBackColor = True
    '
    'Label1
    '
    Me.Label1.AutoSize = True
    Me.Label1.Location = New System.Drawing.Point(12, 15)
    Me.Label1.Name = "Label1"
    Me.Label1.Size = New System.Drawing.Size(62, 13)
    Me.Label1.TabIndex = 3
    Me.Label1.Text = "Select Tab:"
    '
    'TExcel_frm
    '
    Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
    Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
    Me.ClientSize = New System.Drawing.Size(294, 79)
    Me.Controls.Add(Me.Tabs_cbx)
    Me.Controls.Add(Me.ok_btn)
    Me.Controls.Add(Me.Label1)
    Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
    Me.Name = "TExcel_frm"
    Me.Text = "Export to Excel"
    Me.ResumeLayout(False)
    Me.PerformLayout()

  End Sub
    Friend WithEvents Tabs_cbx As System.Windows.Forms.ComboBox
    Friend WithEvents ok_btn As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label

End Class
