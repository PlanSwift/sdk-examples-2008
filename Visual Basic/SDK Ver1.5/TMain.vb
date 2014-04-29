

Public Class TMain
  'Public Dim pc As PlanSwift.PlanCenter
Private Sub TMain_FormClosing( ByVal sender As System.Object,  ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing
pc = Nothing
End Sub

Private Sub Excel_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles Excel_btn.Click
   TExcel_frm.ShowDialog 
End Sub

Private Sub TMain_Load( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles MyBase.Load
    On Error Resume Next 
    pc = GetObject("Planswift.Plancenter")
    If Err.Number <> 0 then
      Err.Clear 
      pc = CreateObject("Planswift.Plancenter")
      If Err.Number <> 0 then
        MsgBox("Can not find planswift")
        Exit Sub
      End If
    End If
    If pc.JobOpened = False
      pc.OpenJobEx 
    End If
    Excel_lbl.Text = "Demonstrates exporting basic job" & vbCrLf & "information to an Excel spreadsheet."
    Word_lbl.Text = "Demonstrates exporting basic job" & vbCrLf & "information to an MS Word Document."
    Outlook_lbl.Text = "Demonstrates exporting basic job" & vbCrLf & "information to MS Outlook Email."
    AutoCad_lbl.Text = "Demonstrates drawing digitizer objects" & vbCrLf & "in AutoCads Modelspace Window."
End Sub

Private Sub Word_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles Word_btn.Click
    TWord_frm.ShowDialog
End Sub

Private Sub Outlook_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles Outlook_btn.Click
    TOutlook.ShowDialog

End Sub

Private Sub Button4_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles Button4.Click
    TAutoCad_frm.ShowDialog
End Sub
End Class
