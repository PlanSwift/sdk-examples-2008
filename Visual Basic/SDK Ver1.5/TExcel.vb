Public Class TExcel_frm
  Dim Excel As Microsoft.Office.Interop.Excel.Application
'**********************************EXPORT TO EXCEL*********************************************
  Dim i As Integer = 2
  Dim didcreate As Boolean 

  Sub SendToExcel(ByVal AItem As PlanSwift.Item)' Sub Funciton
    'Send Items to Excel
    Dim IType As planswift.ItemType
    Dim ItemProp, IName, IQty,ITab,INumber,IPriceEach, IPriceTotal
    
    ItemProp = AItem.Properties
    ITab = pc.Tabs.SelectedTab.Title
    IName = AItem.Name
    If AItem.Type_ = PlanSwift.ItemType.itFolder then
      INumber = ""
      IQty = ""
      IPriceEach = ""
      IPriceTotal = ""
    Else
      INumber = AItem.Properties.ByName("Item #").Value
      IQty = AItem.Properties.ByName("Qty").Value
      IPriceEach = AItem.Properties.ByName("Price Each").Value
      IPriceTotal = AItem.Properties.ByName("Price Total").Value
    End If
    
    IType = AItem.Type_
    Excel.Cells(i,1).Value = ITab
    Excel.Cells(i,2).Value = IName
    Excel.Cells(i,3).Value = INumber
    Excel.Cells(i,4).Value = IQty
    Excel.Cells(i,5).Value = IPriceEach
    Excel.Cells(i,6).Value = IPriceTotal 
    Select Case Itype
      Case 0 
       Excel.Cells(i,7).Value = ""
      Case 1 
       Excel.Cells(i,7).Value = "Part"
      Case 2
       Excel.Cells(i,7).Value = "Assembly"
      Case 3
        Excel.Cells(i,7).Value = "Folder"
    End Select
     i = i +1 
  End Sub
sub GetItems(ByVal AItem As PlanSwift.Item)
'Gather all planswift items  
SendToExcel(AItem)
  For ChildIndex = 0 to AItem.Count - 1
    GetItems(AItem.Item(ChildIndex))
  Next
End Sub
 
Private Sub Form1_Load( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles MyBase.Load    

  Dim TabIndex As Integer 
  'Add Planswift tabs to combobox   
  For TabIndex = 0 to pc.Tabs.Count -1 
    If pc.Tabs(TabIndex).TabType = PlanSwift.TabType.ttJob Then
      Tabs_cbx.Items.Add(pc.Tabs(TabIndex).Name)
    End If
  Next
End Sub

Private Sub ok_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles ok_btn.Click 
 If Tabs_cbx.Text = "" Then
      MessageBox.Show("Please Select a Tab","Select a Tab",MessageBoxButtons.OK,MessageBoxIcon.Error)
      Tabs_cbx.Focus
      Exit Sub
    End If
Dim CurrentTab As PlanSwift.Tab
Dim ItemIndex As Integer
Dim ExWb,ExWSheet, ExRng
    'Create Excel Object
    on Error Resume Next
    Excel = GetObject("Excel.Application")
    If Err.Description > vbNullString Then
      Err.Clear
      Excel = CreateObject("Excel.Application")
      If Err.Description > vbNullString Then
        MsgBox("Application Not Found",MsgBoxStyle.Critical,"Error!")
        Me.Close
        Exit Sub  
      End If
    End If
      Excel.Visible = True
      ExWb = Excel.Workbooks.Add
      ExWSheet = Excel.ActiveSheet
   
    'Add Header information
    ExWSheet.Cells(1,1).value = "Tab"
    ExWSheet.Cells(1,2).Value = "Name"
    ExWSheet.Cells(1,3).Value = "Item Number"
    ExWSheet.Cells(1,4).Value = "Qty"
    ExWSheet.Cells(1,5).Value = "Price Each"
    ExWSheet.Cells(1,6).Value = "Price Total"
    ExWSheet.Cells(1,7).Value = "Item Type"
   
   'Add Excel Formating
    With ExWSheet.Range("A1","G1")
      .Font.Bold = True  
    End With

    'Add Planswift items to excel Sheet
    CurrentTab = pc.Tabs.ByName(Tabs_cbx.Text)
    CurrentTab.MakeActive
    For ItemIndex = 0 To CurrentTab.Count - 1
      GetItems(CurrentTab(ItemIndex))
    next
    ExRng = ExWSheet.Range("A1","G" & i)
    ExRng.EntireColumn.Autofit  
    Excel = Nothing
    Exit Sub
    

End Sub
'***********************************END EXPORT TO EXCEL**********************************************

End Class
