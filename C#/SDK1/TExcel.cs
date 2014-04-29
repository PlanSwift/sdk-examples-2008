using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;
using System.Reflection;


namespace SDK
{
    public partial class TExcel_frm : Form
    {
        Excel.Application oExcel;
        Excel._Workbook oWBook;
        Excel._Worksheet oSheet;
        PlanSwift.Tab CurrentTab;
        int i = 2;
        public TExcel_frm()
        {
            InitializeComponent();
        }
        
        public void SendToExcel(PlanSwift.Item AItem)
        {
            PlanSwift.ItemType IType;
            object ItemProp, IName, IQty, ITab, INumber, IPriceEach, IPriceTotal;
            IType = AItem.ItemType;
            ItemProp = AItem.Properties;
            ITab = TGlobal.pc.Tabs.SelectedTab().Name;
            IName = AItem.Name;
            if (AItem.ItemType == PlanSwift.ItemType.itFolder)
            {
                INumber = "";
                IQty = "";
                IPriceEach = "";
                IPriceTotal = "";
            }
            else
            {
                INumber = AItem.Properties.ByName("Item #").Value();
                IQty = AItem.Properties.ByName("Qty").Value();
                IPriceEach = AItem.Properties.ByName("Price Each").Value();
                IPriceTotal = AItem.Properties.ByName("Price Total").Value();    
            }
            oSheet.Cells[i, 1] = ITab;
            oSheet.Cells[i, 2] = IName;
            oSheet.Cells[i, 3] = INumber;
            oSheet.Cells[i, 4] = IQty;
            oSheet.Cells[i, 5] = IPriceEach;
            oSheet.Cells[i, 6] = IPriceTotal;
            switch (IType)
            {
                case PlanSwift.ItemType.itNone:
                    oSheet.Cells[i, 7] = "";
                    break;
                case PlanSwift.ItemType.itPart:
                    oSheet.Cells[i, 7] = "Part";
                    break;
                case PlanSwift.ItemType.itAssembly:
                    oSheet.Cells[i, 7] = "Assembly";
                    break;
                case PlanSwift.ItemType.itFolder:
                    oSheet.Cells[i, 7] = "Folder";
                    break;
            }
            i++;
        }
        public void GetItems(PlanSwift.Item AItem)
        {
            SendToExcel(AItem);
            for (int ChildIndex = 0; ChildIndex <= AItem.Count - 1; ChildIndex++ )
            {
                GetItems(AItem[ChildIndex]);
            }
        }
        private void TExcel_frm_Load(object sender, EventArgs e)
        {
            for (int TabIndex = 0; TabIndex <= TGlobal.pc.Tabs.Count -1; TabIndex++)
            {
                if (TGlobal.pc.Tabs[TabIndex].TabType == PlanSwift.TabType.ttJob)
                {
                    Tabs_cbx.Items.Add(TGlobal.pc.Tabs[TabIndex].Name);
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Tabs_cbx.Text == "")
            {
                MessageBox.Show("Please Select a Tab", "Select a Tab", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Tabs_cbx.Focus();
                return; 
            }
            //Excel.Application oExcel;
            //Excel._Workbook oWBook;
            //Excel._Worksheet oSheet;
            //PlanSwift.Tab CurrentTab;
            int i = 0;
            // Start Excel and get Application object
            oExcel = new Excel.Application();
            
            // Create new Workbook
            oWBook = (Excel._Workbook)(oExcel.Workbooks.Add(Missing.Value));
            oSheet = (Excel._Worksheet)oWBook.ActiveSheet;
            // Add Header Information
            oSheet.Cells[1, 1] = "Tab";
            oSheet.Cells[1, 2] = "Name";
            oSheet.Cells[1, 3] = "Item Number";
            oSheet.Cells[1, 4] = "Qty";
            oSheet.Cells[1, 5] = "Price Each";
            oSheet.Cells[1, 6] = "Price Total";
            oSheet.Cells[1, 7] = "Item Type";
            // Apply Header Formating
            oSheet.get_Range("A1", "G1").Font.Bold = true;
            oSheet.get_Range("A1", "G1").VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;

            //Get Selected Planswift Tab
            CurrentTab = TGlobal.pc.Tabs.ByName(Tabs_cbx.Text);
            CurrentTab.MakeActive();
            for (int ItemIndex = 0; ItemIndex <= CurrentTab.Count - 1; ItemIndex++)
            {
                GetItems(CurrentTab[ItemIndex]);
                i = ItemIndex;
            }
            oSheet.get_Range("A1", "G1").EntireColumn.AutoFit();
            oExcel.Visible = true;
            oExcel = null;
            oWBook = null;
            oSheet = null;
        }
    }
}
