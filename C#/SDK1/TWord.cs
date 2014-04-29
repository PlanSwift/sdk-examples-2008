using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Word = Microsoft.Office.Interop.Word;
using System.Reflection;

namespace SDK
{
    public partial class TWord_frm : Form
    {
        Word.Application oWord;
        Word._Document oDocument;
        int ItemNumber = 2;
        public TWord_frm()
        {
            InitializeComponent();
        }
        public void SendtoWord(PlanSwift.Item AItem)
        {
            object IType, ItemProp,ITab;
            String IQty,IName,IPriceEach,IPriceTotal,INumber;
            IType = AItem.ItemType;
            ItemProp = AItem.Properties;
            ITab = TGlobal.pc.Tabs.SelectedTab().Name;
            IName = AItem.Name;
            if (AItem.ItemType != PlanSwift.ItemType.itFolder)
            {
                if (ItemNumber >= 20)
                {
                    object beforeRow = oWord.ActiveDocument.Tables[2].Rows[ItemNumber];
                    oDocument.Tables[2].Rows.Add(ref beforeRow);
                }

                INumber = AItem.Properties.ByName("Item #").Value();
                IQty = AItem.Properties.ByName("Qty").Value();
                IPriceEach = AItem.Properties.ByName("Price Each").Value();
                IPriceTotal = AItem.Properties.ByName("Price Total").Value();
                oDocument.Tables[2].Cell(ItemNumber, 1).Range.Text = IQty;
                oDocument.Tables[2].Cell(ItemNumber, 2).Range.Text = IName;
                oDocument.Tables[2].Cell(ItemNumber, 3).Range.Text = IPriceEach;
                oDocument.Tables[2].Cell(ItemNumber, 4).Range.Text = IPriceTotal;
                ItemNumber++;
            }
        }
        public void GetItems(PlanSwift.Item AItem)
        {
            SendtoWord(AItem);
            for (int ChildIndex = 0; ChildIndex <= AItem.Count - 1; ChildIndex++)
            {
                GetItems(AItem[ChildIndex]);
            }
        }

        

        private void TWord_frm_Load(object sender, EventArgs e)
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
            
            // Start Word and Get Application Object
            oWord = new Word.Application();
            PlanSwift.Tab CurrentTab;
            oWord.Visible = true;
            object FilePath = Environment.CurrentDirectory + @"\Templates\Work Order.dotx";
            object Readonly = false;
            object missing = System.Reflection.Missing.Value;
            object isVisible = true;
            object TStyle = "Medium Shading 1 - Accent 1";
            //Open Template
            oDocument = (Word._Document) oWord.Documents.Open(ref FilePath,ref missing, ref Readonly, ref missing, ref missing,
                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref isVisible,
                ref missing, ref missing, ref missing, ref missing);
            // Apply Table Formating Style
            oDocument.Tables[2].set_Style(ref TStyle);
            oDocument.Tables[2].Columns[3].Width = 40;
            oDocument.Tables[2].Columns[4].Width = 70;

            // Get Planswift Items
            CurrentTab = TGlobal.pc.Tabs.ByName(Tabs_cbx.Text);
            CurrentTab.MakeActive();
            for (int ItemIndex = 0; ItemIndex <= CurrentTab.Count - 1; ItemIndex++)
            {
                GetItems(CurrentTab[ItemIndex]);
            }
            
            //Delete Last unused Row
            oDocument.Tables[2].Rows[ItemNumber].Delete();
            //Free Microsoft Word
            oWord = null;
            oDocument = null;
            this.Close();
        } 
    }
}
