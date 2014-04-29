Public Class Outlook_frm
Dim OLook As Microsoft.Office.Interop.Outlook.Application
Private Sub Send_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles Send_btn.Click
CreateObject("C:\Users\Brandin Thomas\Desktop\Template\Work Order2.doc")
End Sub
End Class