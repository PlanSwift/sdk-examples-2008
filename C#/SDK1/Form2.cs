using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using AuCad = Autodesk.AutoCAD.Interop.AcadApplication;

namespace SDK
{
    public partial class Form2 : Form
    {
        Autodesk.AutoCAD.Interop.AcadApplication AuCad;
        Autodesk.AutoCAD.Interop.AcadDocument AuDocument;
        public Form2()
        {
            InitializeComponent();
        }
        public void SendtoAutoCAD(PlanSwift.Item AItem)
        {
            PlanSwift.ISection CurrentSection; 
            PlanSwift.INode CurrentNode;
            int ItemDigiType, SectionIndex, NodeIndex;
            double Xscale, Yscale;
            float nx, ny;
            object StartNode, EndNode;
    
            if (AItem.DigiType != 3) 
            { 
                ItemDigiType = AItem.DigiType; 
                switch (ItemDigiType) 
                { 
                    // IF Digitizer type is "Area" do something 
                    case 0: 
                        for (SectionIndex = 0; SectionIndex <= AItem.Sections.Count - 1; SectionIndex++) 
                        { 
                            CurrentSection = AItem.Sections[SectionIndex]; 
                            StartNode = CurrentSection.Nodes[0].Point; 
                            EndNode = CurrentSection.Nodes[CurrentSection.Nodes.Count - 1].Point; 
                            double[] SP = new double[((CurrentSection.Nodes.Count + 1) * 2)]; 
                            Xscale = CurrentSection.Page().ScaleX; 
                            Yscale = CurrentSection.Page().ScaleY; 
                            //Loop Though all nodes in current section 
                            for (NodeIndex = 0; NodeIndex <= CurrentSection.Nodes.Count - 1; NodeIndex++) 
                            { 
                                CurrentNode = CurrentSection.Nodes[NodeIndex]; 
                                nx = CurrentNode.x; 
                                ny = -CurrentNode.y; 
                                SP[NodeIndex * 2] = (nx / Xscale) * 12; 
                                SP[NodeIndex * 2 + 1] = (ny / Yscale) * 12; 
                            }    
                            //Close lines of the area 
                            SP[SP.Length - 2] = (CurrentSection.Nodes[0].x / Xscale) * 12; 
                            SP[SP.Length - 1] = (-CurrentSection.Nodes[0].y / Yscale) * 12; 
                            AuDocument.ModelSpace.AddLightWeightPolyline(SP); 
                        } 
                        break; 
                  } 
            } 
        }
        public void GetItems(PlanSwift.Item AItem)
        {
            SendtoAutoCAD(AItem);
            for (int ChildIndex = 0; ChildIndex <= AItem.Count - 1; ChildIndex++)
            {
                GetItems(AItem[ChildIndex]);
            }
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            for (int TabIndex = 0; TabIndex <= TGlobal.pc.Tabs.Count - 1; TabIndex++)
            {
                if (TGlobal.pc.Tabs[TabIndex].TabType == PlanSwift.TabType.ttJob)
                {
                    Tabs_cbx.Items.Add(TGlobal.pc.Tabs[TabIndex].Name);
                }
            }
        }

        private void Send_btn_Click(object sender, EventArgs e)
        {
            if (Tabs_cbx.Text == "")
            {
                MessageBox.Show("Please Select a Tab", "Select a Tab", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Tabs_cbx.Focus();
                return;
            }
            PlanSwift.Tab CurrentTab;
            CurrentTab = TGlobal.pc.Tabs.ByName(Tabs_cbx.Text);
            CurrentTab.MakeActive();
            AuCad = new Autodesk.AutoCAD.Interop.AcadApplication();
            AuCad.Visible = true;
            AuDocument = AuCad.ActiveDocument;
            
            for (int ItemIndex = 0; ItemIndex <= CurrentTab.Count - 1; ItemIndex++)
            {
                GetItems(CurrentTab[ItemIndex]);
            }
            
            AuCad.ZoomAll();
            AuCad = null;
            AuDocument = null;
            this.Close();
                 
            
            

        }

    }
}
