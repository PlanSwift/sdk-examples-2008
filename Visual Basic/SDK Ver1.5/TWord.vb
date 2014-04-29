
Public Class TWord_frm
Dim oWord As Microsoft.Office.Interop.Word.Application
Dim oWordDoc As Microsoft.Office.Interop.Word.Document
Dim oFields As Microsoft.Office.Interop.Word.Field
Dim ItemNumber As Integer = 2
  Sub SendToWord(ByVal AItem As PlanSwift.Item)
    'Send Items to Excel
    Dim IType As Integer = AItem.ItemType
    Dim ItemProp, IName, IQty ,ITab,INumber,IPriceEach, IPriceTotal
    ItemProp = AItem.Properties
    ITab = pc.Tabs.SelectedTab.Name
    IName = AItem.Name
    If AItem.ItemType <> PlanSwift.ItemType.itFolder then
      If ItemNumber > = 20 Then
        oWordDoc.Tables(2).Rows.Add(oWordDoc.Tables(2).Rows(ItemNumber))
      End IF
        INumber = AItem.Properties.ByName("Item #").Value
        IQty = AItem.Properties.ByName("Qty").Value
        IPriceEach = AItem.Properties.ByName("Price Each").Value
        IPriceTotal = AItem.Properties.ByName("Price Total").Value
        oWordDoc.Tables(2).Cell(ItemNumber,1).Range.Text = IQty
        oWordDoc.Tables(2).Cell(ItemNumber,2).Range.Text = IName
        oWordDoc.Tables(2).Cell(ItemNumber,3).Range.Text = IPriceEach
        oWordDoc.Tables(2).Cell(ItemNumber,4).Range.Text = IPriceTotal
        ItemNumber = ItemNumber + 1
      
    End If   
  End Sub
  Sub GetItems(ByVal AItem As PlanSwift.Item)
    SendToWord(AItem)
  For ChildIndex = 0 to AItem.Count - 1
    GetItems(AItem.Item(ChildIndex))
  Next
  End Sub
Private Sub Word_frm_Load( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles MyBase.Load
  Dim TabIndex As Integer 
  'Add Planswift tabs to combobox   
  For TabIndex = 0 to pc.Tabs.Count -1 
    If pc.Tabs(TabIndex).TabType = PlanSwift.TabType.ttJob Then
      Tabs_cbx.Items.Add(pc.Tabs(TabIndex).Name)
    End If
  Next
End Sub

Public Sub Send_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles Send_btn.Click
 If Tabs_cbx.Text = "" Then
  MessageBox.Show("Please Select a Tab","Select a Tab",MessageBoxButtons.OK,MessageBoxIcon.Error)
  Tabs_cbx.Focus
  Exit Sub
 End If   
    Dim oMissing As Object = System.Reflection.Missing.Value
    Dim oTrue As Object = True
    Dim oFalse As Object = False
    Dim CurrentTab
    Dim oTemplatePath As Object = My.Application.Info.DirectoryPath & "\Templates\Work Order.dotx"
    'MsgBox(oTemplatePath)
    on Error Resume next
    oWord = getObject("Word.Application")
    If Err.Description>vbNullString then
      Err.Clear
      oWord = CreateObject("Word.Application")
      If Err.Description > vbNullString then
        MsgBox("Application Not Found",MsgBoxStyle.Critical,"Error!")
        Me.Close
        Exit sub
        Else
        oWord.Visible = True
        oWordDoc = oWord.Documents.Open(oTemplatePath)
      End If
    Else
      oWord.Visible = True
      oWordDoc = oWord.Documents.Open(oTemplatePath)
      oWordDoc.Tables(2).Style = "Medium Shading 1 - Accent 1"
      oWordDoc.Tables(2).Columns(3).Width = 40
      oWordDoc.Tables(2).Columns(4).Width = 70
      oWordDoc.Tables(2).Rows(ItemNumber).delete
    End If
    'Gather information from Planswift and send to Word
    CurrentTab = pc.Tabs.ByName(Tabs_cbx.Text)
    CurrentTab.MakeActive
    For ItemIndex = 0 To CurrentTab.Count - 1
      GetItems(CurrentTab(ItemIndex))
    next
    'Free Microsoft Word
    oWord = Nothing
    oWordDoc = Nothing
    Me.close
End Sub

End Class