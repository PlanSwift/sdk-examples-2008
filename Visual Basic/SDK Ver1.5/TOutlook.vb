Public Class TOutlook
  Dim oLook As Microsoft.Office.Interop.Outlook.Application
  Dim oMail As Microsoft.Office.Interop.Outlook.MailItem
  Dim FolderArry as New ArrayList
  Dim AssemblyQArry As New ArrayList
  Dim PartQArry As New ArrayList
  Dim AreaQArry As New ArrayList
  Dim LinearQArry As New ArrayList
  Dim SegmentQArry As New ArrayList
  Dim CountQArry As New ArrayList
  Function GetSum(ByVal Arr As ArrayList)
  Dim NSum As Decimal
  For ArrayIndex = 0 to Arr.count -1
    NSum+=Arr(ArrayIndex)
  Next
    GetSum = NSum
  End Function
  Sub AddHtml(ByVal Name As String, ByVal ArryLocation As String)
    oMail.HTMLBody = oMail.HTMLBody + "<tr><td height=" & Chr(34) & "20"  & Chr(34) & ">" & Name & "</td>"
    oMail.HTMLBody = oMail.HTMLBody + "<td td width=" & Chr(34) & "50" & Chr(34) & "height=" & Chr(34) & "20"  & Chr(34) & ">" & ArryLocation & "</td></tr>"
  End Sub
  Sub SendToOutlook(ByVal AItem As PlanSwift.Item)' Sub Funciton
    Dim ItemType, ItemDigiType As Integer
    ItemType = AItem.DigiType
    Select Case ItemType
      Case 3
        FolderArry.add(AItem.Name)
      Case 2
        AssemblyQArry.Add(AItem.Properties.ByName("Qty").value)
      Case 1
        PartQArry.Add(AItem.Properties.ByName("Qty").value)
      Case 0
        ItemDigiType = AItem.DigiType
        Select Case ItemDigiType
          Case 3
            CountQArry.Add(AItem.Properties.ByName("Point Count").Value)
          Case 2 
            SegmentQArry.Add(AItem.Properties.ByName("Linear Total").Value)
          Case 1
            LinearQArry.Add(AItem.Properties.ByName("Linear Total").Value)
          Case 0 
            AreaQArry.Add(AItem.Properties.ByName("Area").Value)
        End Select
    End Select 
  End Sub
  sub GetItems(ByVal AItem As PlanSwift.Item)
    'Gather all planswift items  
    SendToOutlook(AItem)
    For ChildIndex = 0 to AItem.Count - 1
      GetItems(AItem.Item(ChildIndex))
    Next
  End Sub
  Private Sub TOutlook_Load( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles MyBase.Load
    Dim TabIndex As Integer 
    'Add Planswift tabs to combobox   
    For TabIndex = 0 to pc.Tabs.Count -1 
      If pc.Tabs(TabIndex).TabType = PlanSwift.TabType.ttJob Then
        Tab_cbx.Items.Add(pc.Tabs(TabIndex).Name)
      End If
    Next
  End Sub
  Private Sub send_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles send_btn.Click
    Dim CurrentTab
    If Tab_cbx.Text = "" Then
      MessageBox.Show("Please Select a Tab","Select a Tab",MessageBoxButtons.OK,MessageBoxIcon.Error)
      Tab_cbx.Focus
      Exit Sub
    End If
    OLook = CreateObject("Outlook.Application")
    oMail = OLook.CreateItem(Microsoft.Office.Interop.Outlook.OlItemType.olMailItem)
    oMail.display
    oMail.To = to_txt.Text
    oMail.CC = cc_txt.Text
    oMail.Subject = Subject_txt.Text  
    CurrentTab = pc.Tabs.ByName(Tab_cbx.Text)
    CurrentTab.MakeActive 
    For ItemIndex = 0 To CurrentTab.Count - 1
      GetItems(CurrentTab(ItemIndex))
    Next 
    oMail.BodyFormat = Microsoft.Office.Interop.Outlook.OlBodyFormat.olFormatHTML
    oMail.HTMLbody = "<HTML><body><b>Job Name: </b>" & pc.JobNumber.ToString & "<br><b>Description: </b>" & pc.JobName & "<br><br><i><b>Item Types</b></i><br>"
    oMail.HTMLBody = oMail.HTMLBody + "<Table width=" & Chr(34) & "400" & Chr(34) & "Height=" & Chr(34) & "9" & Chr(34) & ">"
    For HtmLoop = 0 To 1
      If HtmLoop >0 Then
        oMail.HTMLBody = oMail.HTMLBody + "</Table><br><i><b>Total Quantity’s</b></i>"
        oMail.HTMLBody = oMail.HTMLBody + "<Table width=" & Chr(34) & "400" & Chr(34) & "Height=" & Chr(34) & "9" & Chr(34) & ">" 
      End If
    Dim ArrCount As String
    if Folders_ck.checked Then
      If HtmLoop = 0 Then
        ArrCount = FolderArry.Count
        AddHtml("Folders",ArrCount)
      End If
    End If
    If Assem_ck.Checked Then
      If HtmLoop > 0 Then
        ArrCount = GetSum(AssemblyQArry)
      Else
        ArrCount = AssemblyQArry.Count
      End If
      AddHtml("Assemblies",ArrCount)
    End IF
    If parts_ck.Checked Then
      If HtmLoop > 0 Then
        ArrCount = GetSum(PartQArry) 
      Else
        ArrCount = PartQArry.Count
      End If
      AddHtml("Parts",ArrCount)
    End IF
    If Area_ck.Checked Then
      If HtmLoop > 0 Then
        ArrCount = GetSum(AreaQArry) 
      Else
        ArrCount = AreaQArry.Count
      End If
      AddHtml("Areas",ArrCount)
    End IF
    If Linear_ck.Checked Then
      If HtmLoop > 0 Then
        ArrCount = GetSum(LinearQArry) 
      Else
        ArrCount = LinearQArry.Count
      End If
      AddHtml("Linears",ArrCount)
    End IF
    If Segment_ck.Checked Then
      If HtmLoop > 0 Then
        ArrCount = GetSum(SegmentQArry) 
      Else
        ArrCount = SegmentQArry.Count
      End If
      AddHtml("Segments",ArrCount)
    End IF
    If Count_ck.Checked Then
      If HtmLoop > 0 Then
        ArrCount = GetSum(CountQArry) 
      Else
        ArrCount = CountQArry.Count
      End If
      AddHtml("Counts",ArrCount)
    End IF     
  Next
  oMail.HTMLBody = oMail.HTMLBody + "</Table></body></HTML>"
  oLook = Nothing
  oMail = Nothing
  Me.Close
  End Sub
End Class