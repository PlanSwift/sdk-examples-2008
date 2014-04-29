Public Class TAutoCad_frm
  Dim ACad As Autodesk.AutoCAD.Interop.AcadApplication 
  Dim ACadDoc As Autodesk.AutoCAD.Interop.AcadDocument
Sub SendToAutoCad(ByVal AItem As PlanSwift.Item)
    Dim CurrentSection as PlanSwift.ISection
    Dim CurrentNode As PlanSwift.INode
    Dim ItemDigiType, nx, ny, SectionIndex, NodeIndex As Integer
    Dim ScaleX,ScaleY,StartNode,EndNode
    If AItem.DigiType <> 3 then
      ItemDigiType = AItem.DigiType
      Select Case ItemDigiType
        ' IF Digitizer type is "Area" do something
        Case 0
          For SectionIndex = 0 to AItem.sections.count -1
            CurrentSection = AItem.Sections(SectionIndex)
            StartNode = CurrentSection.Nodes(0).Point
            EndNode = CurrentSection.Nodes(CurrentSection.Nodes.Count-1).Point
            Dim SP(0 To ((CurrentSection.Nodes.Count+ 1)*2)-1) As Double
            ScaleX = CurrentSection.Page.ScaleX
            ScaleY = CurrentSection.Page.ScaleY
            'Loop Though all nodes in current section
            For NodeIndex = 0 to CurrentSection.Nodes.Count - 1
              CurrentNode = CurrentSection.Nodes(NodeIndex)  
              nx = CurrentNode.x
              ny = -CurrentNode.y
              SP(NodeIndex* 2) = (nx/ScaleX)*12
              SP(NodeIndex * 2 + 1) = (ny/ScaleY)*12
            Next 
            'Close lines of the area
              SP(SP.Length - 2)  = (CurrentSection.Nodes(0).x/ScaleX)*12
              SP(SP.Length - 1)  = (-CurrentSection.Nodes(0).y/ScaleY)*12
             ACadDoc.ModelSpace.AddLightWeightPolyLine(SP)
          Next
      End Select
    End If
End Sub
  Sub GetItems(ByVal AItem As PlanSwift.item)
    SendToAutoCad(AItem)
  For ChildIndex = 0 to AItem.Count - 1
    GetItems(AItem.Item(ChildIndex))
  Next
  End Sub
Private Sub TAutoCad_frm_Load( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles MyBase.Load
  Dim TabIndex As Integer 
  'Add Planswift tabs to combobox   
  For TabIndex = 0 to pc.Tabs.Count -1 
    If pc.Tabs(TabIndex).TabType = PlanSwift.TabType.ttJob Then
      Tabs_cbx.Items.Add(pc.Tabs(TabIndex).Name)
    End If
  Next
End Sub

Private Sub send_btn_Click( ByVal sender As System.Object,  ByVal e As System.EventArgs) Handles send_btn.Click
    Dim CurrentTab
     If Tabs_cbx.Text = "" Then
      MessageBox.Show("Please Select a Tab","Select a Tab",MessageBoxButtons.OK,MessageBoxIcon.Error)
      Tabs_cbx.Focus
      Exit Sub
    End If
    Cursor = Cursors.WaitCursor
    refresh
    CurrentTab = pc.Tabs.ByName(Tabs_cbx.Text)
    CurrentTab.MakeActive
    on Error Resume Next
    ACad = GetObject(, "AutoCAD.Application.17")
    If Err.Description > vbNullString Then
      Err.Clear
      ACad = CreateObject("AutoCAD.Application.17")
      If Err.Description > vbNullString Then
        MsgBox(Err.Description,MsgBoxStyle.Critical,"Error")
        Exit Sub
      End If
    End If  
    ACad.Visible = True
    ACadDoc = ACad.ActiveDocument
    For ItemIndex = 0 To CurrentTab.Count - 1
      GetItems(CurrentTab(ItemIndex))
    Next
    Cursor = Cursors.Default
    ACad.ZoomAll
    ACad = Nothing
End Sub
End Class