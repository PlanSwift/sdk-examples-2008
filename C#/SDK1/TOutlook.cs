using System;
using System.Collections.Generic;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using OutLook = Microsoft.Office.Interop.Outlook;

namespace SDK
{
    public partial class TOutlook_frm : Form
    {
        List<string> FolderArry = new List<string>();
        List<string> AssemblyQArry = new List<string>();
        List<string> PartQArry = new List<string>();
        List<string> AreaQArry = new List<string>();
        List<string> LinearQArry = new List<string>();
        List<string> SegmentQArry = new List<string>();
        List<string> CountQArry = new List<string>(); 
        OutLook.Application OLook;
        OutLook._MailItem OMail;
        PlanSwift.Tab CurrentTab;

        Char chr = (char)34;
        public TOutlook_frm()
        {
            InitializeComponent();
        }
        public string GetSum(List<string> Arr)
        {
            decimal NSum = 0;
            foreach (string ListIndex in Arr)
            {
                decimal RNum = decimal.Parse(ListIndex);
                NSum += RNum;
            }
            string FinalSum = System.Convert.ToString(NSum);
            return FinalSum;
        }

        public void AddHtml(string Name,  string ArryLocation)
        {
            OMail.HTMLBody = OMail.HTMLBody + "<tr><td height=" + chr + "20" + chr + ">" + Name + "</td>";
            OMail.HTMLBody = OMail.HTMLBody + "<td td width=" + chr + "50" + chr + "height=" + chr + "20" + chr + ">" + ArryLocation + "</td></tr>";
        }
        public void SendtoOutlook(PlanSwift.Item AItem)
        {
            // Sub Funciton 
            PlanSwift.ItemType ItemType;
           
            ItemType = AItem.ItemType;
            //ItemDigiType = AItem.DigiType;
            switch (ItemType)
            {
                case PlanSwift.ItemType.itFolder:
                    FolderArry.Add("1");
                    break;
                case PlanSwift.ItemType.itAssembly:
                    string IAssembly = AItem.Properties.ByName("Qty").Value();
                    AssemblyQArry.Add(IAssembly);
                    break;
                case PlanSwift.ItemType.itPart:
                    string IPart = AItem.Properties.ByName("Qty").Value();     
                    PartQArry.Add(IPart);
                    break;
                case PlanSwift.ItemType.itNone:                                
                    switch (AItem.DigiType)
                    {
                        case 3:
                            string ICount = AItem.Properties.ByName("Point Count").Value();
                            CountQArry.Add(ICount);
                            break;
                        case 2:
                            string ISegment = AItem.Properties.ByName("Linear Total").Value();
                            SegmentQArry.Add(ISegment);
                            break;
                        case 1:
                            string ILinear = AItem.Properties.ByName("Linear Total").Value();
                            LinearQArry.Add(ILinear);
                            break;
                        case 0:
                            string IArea = AItem.Properties.ByName("Area").Value();
                            AreaQArry.Add(IArea);
                            break;
                    }
                    break;
            }
        }
        public void GetItems(PlanSwift.Item AItem)
        {
            //Gather all planswift items 
            SendtoOutlook(AItem);
            for (int ChildIndex = 0; ChildIndex <= AItem.Count - 1; ChildIndex++)
            {
                GetItems(AItem[ChildIndex]);
            }
        } 



        private void send_btn_Click(object sender, EventArgs e)
        {
            if (Tabs_cbx.Text == "")
            {
                MessageBox.Show("Please Select a Tab", "Select a Tab", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Tabs_cbx.Focus();
                return;
            }
            OLook = new OutLook.Application();
            
            OMail = (OutLook.MailItem)OLook.CreateItem(Microsoft.Office.Interop.Outlook.OlItemType.olMailItem);
            OMail.Display(OMail);
            OMail.To = to_txt.Text;
            OMail.CC = CC_txt.Text;
            OMail.Subject = Subject_txt.Text;
            CurrentTab = TGlobal.pc.Tabs.ByName(Tabs_cbx.Text);
            CurrentTab.MakeActive();
            for (int ItemIndex = 0; ItemIndex <= CurrentTab.Count - 1; ItemIndex++)
            {
                GetItems(CurrentTab[ItemIndex]);
            } 
            OMail.BodyFormat = Microsoft.Office.Interop.Outlook.OlBodyFormat.olFormatHTML; 
            OMail.HTMLBody = "<HTML><body><b>Job Name: </b>" + TGlobal.pc.JobNumber + 
                "<br><b>Description: </b>" + TGlobal.pc.JobName + "<br><br><i><b>Item Types</b></i><br>";
            OMail.HTMLBody = OMail.HTMLBody + "<Table width=" + chr + "400" +
                chr + "Height=" + chr + "9" + chr + ">";
            for (int HtmLoop = 0; HtmLoop <= 1; HtmLoop++)
            {
                if (HtmLoop > 0)
                {
                    OMail.HTMLBody = OMail.HTMLBody + "</Table><br><i><b>Total Quantity’s</b></i>";
                    OMail.HTMLBody = OMail.HTMLBody + "<Table width=" + chr + "400" + chr + "Height=" + chr + "9" + chr + ">";
                }
                String ArrCount;
                if (Folders_ck.Checked)
                {
                    if (HtmLoop == 0)
                    {
                        ArrCount = System.Convert.ToString(FolderArry.Count);
                        AddHtml("Folders", ArrCount);
                    }
                }
                if (Assem_ck.Checked)
                {
                    if (HtmLoop > 0)
                    {
                        
                        ArrCount = GetSum(AssemblyQArry);
                    }
                    else
                    {
                        ArrCount = System.Convert.ToString(AssemblyQArry.Count);
                    }
                    AddHtml("Assemblies", ArrCount);
                }
                if (Parts_ck.Checked)
                {
                    if (HtmLoop > 0)
                    {
                        ArrCount = GetSum(PartQArry);
                    }
                    else
                    {
                        ArrCount = System.Convert.ToString(PartQArry.Count);
                    }
                    AddHtml("Parts", ArrCount);
                }
                if (Area_ck.Checked)
                {
                    if (HtmLoop > 0)
                    {
                        ArrCount = GetSum(AreaQArry);
                    }
                    else
                    {
                        ArrCount = System.Convert.ToString(AreaQArry.Count);
                    }
                    AddHtml("Areas", ArrCount);
                }
                if (Linear_ck.Checked)
                {
                    if (HtmLoop > 0)
                    {
                        ArrCount = GetSum(LinearQArry);
                    }
                    else
                    {
                        ArrCount = System.Convert.ToString(LinearQArry.Count);
                    }
                    AddHtml("Linears", ArrCount);
                }
                if (Segment_ck.Checked)
                {
                    if (HtmLoop > 0)
                    {
                        ArrCount = GetSum(SegmentQArry);
                    }
                    else
                    {
                        ArrCount = System.Convert.ToString(SegmentQArry.Count);
                    }
                    AddHtml("Segments", ArrCount);
                }
                if (Count_ck.Checked)
                {
                    if (HtmLoop > 0)
                    {
                        ArrCount = GetSum(CountQArry);
                    }
                    else
                    {
                        ArrCount = System.Convert.ToString(CountQArry.Count);
                    }
                    AddHtml("Counts", ArrCount);
                }
            }
            OMail.HTMLBody = OMail.HTMLBody + "</Table></body></HTML>";
            OLook = null;
            OMail = null;
            this.Close(); 
        }

        private void TOutlook_frm_Load(object sender, EventArgs e)
        {
            for (int TabIndex = 0; TabIndex <= TGlobal.pc.Tabs.Count - 1; TabIndex++)
            {
                if (TGlobal.pc.Tabs[TabIndex].TabType == PlanSwift.TabType.ttJob )
                {
                    Tabs_cbx.Items.Add(TGlobal.pc.Tabs[TabIndex].Name);
                }
            } 

        }
    }
}
