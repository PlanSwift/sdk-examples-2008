<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class TWord_frm
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
    Me.Label11 = New System.Windows.Forms.Label
    Me.Send_btn = New System.Windows.Forms.Button
    Me.SuspendLayout()
    '
    'Tabs_cbx
    '
    Me.Tabs_cbx.FormattingEnabled = True
    Me.Tabs_cbx.Location = New System.Drawing.Point(15, 25)
    Me.Tabs_cbx.Name = "Tabs_cbx"
    Me.Tabs_cbx.Size = New System.Drawing.Size(174, 21)
    Me.Tabs_cbx.TabIndex = 105
    '
    'Label11
    '
    Me.Label11.AutoSize = True
    Me.Label11.Location = New System.Drawing.Point(12, 9)
    Me.Label11.Name = "Label11"
    Me.Label11.Size = New System.Drawing.Size(62, 13)
    Me.Label11.TabIndex = 104
    Me.Label11.Text = "Select Tab:"
    '
    'Send_btn
    '
    Me.Send_btn.Location = New System.Drawing.Point(195, 23)
    Me.Send_btn.Name = "Send_btn"
    Me.Send_btn.Size = New System.Drawing.Size(75, 23)
    Me.Send_btn.TabIndex = 4
    Me.Send_btn.Text = "Send"
    Me.Send_btn.UseVisualStyleBackColor = True
    '
    'TWord_frm
    '
    Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
    Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
    Me.ClientSize = New System.Drawing.Size(282, 69)
    Me.Controls.Add(Me.Tabs_cbx)
    Me.Controls.Add(Me.Label11)
    Me.Controls.Add(Me.Send_btn)
    Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
    Me.Name = "TWord_frm"
    Me.Text = "Word"
    Me.ResumeLayout(False)
    Me.PerformLayout()

  End Sub
    Friend WithEvents Tabs_cbx As System.Windows.Forms.ComboBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Send_btn As System.Windows.Forms.Button
End Class
