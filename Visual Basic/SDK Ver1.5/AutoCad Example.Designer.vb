<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class TAutoCad_frm
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
    Me.send_btn = New System.Windows.Forms.Button
    Me.Label1 = New System.Windows.Forms.Label
    Me.SuspendLayout()
    '
    'Tabs_cbx
    '
    Me.Tabs_cbx.FormattingEnabled = True
    Me.Tabs_cbx.Location = New System.Drawing.Point(12, 40)
    Me.Tabs_cbx.Name = "Tabs_cbx"
    Me.Tabs_cbx.Size = New System.Drawing.Size(232, 21)
    Me.Tabs_cbx.TabIndex = 0
    '
    'send_btn
    '
    Me.send_btn.Location = New System.Drawing.Point(250, 38)
    Me.send_btn.Name = "send_btn"
    Me.send_btn.Size = New System.Drawing.Size(75, 23)
    Me.send_btn.TabIndex = 1
    Me.send_btn.Text = "Send"
    Me.send_btn.UseVisualStyleBackColor = True
    '
    'Label1
    '
    Me.Label1.AutoSize = True
    Me.Label1.Location = New System.Drawing.Point(12, 24)
    Me.Label1.Name = "Label1"
    Me.Label1.Size = New System.Drawing.Size(107, 13)
    Me.Label1.TabIndex = 2
    Me.Label1.Text = "Select Tab to Export:"
    '
    'TAutoCad_frm
    '
    Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
    Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
    Me.ClientSize = New System.Drawing.Size(335, 103)
    Me.Controls.Add(Me.Label1)
    Me.Controls.Add(Me.send_btn)
    Me.Controls.Add(Me.Tabs_cbx)
    Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
    Me.Name = "TAutoCad_frm"
    Me.Text = "AutoCad Example"
    Me.ResumeLayout(False)
    Me.PerformLayout()

  End Sub
    Friend WithEvents Tabs_cbx As System.Windows.Forms.ComboBox
    Friend WithEvents send_btn As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
End Class
