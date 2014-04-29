using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;


namespace SDK
{
    public partial class TMain_frm : Form
    { 
        
        public TMain_frm()
        {
            InitializeComponent();
        }

        private void TExcel_btn_Click(object sender, EventArgs e)
        {
            new TExcel_frm().ShowDialog();
        }

        private void TWord_btn_Click(object sender, EventArgs e)
        {
            new TWord_frm().ShowDialog();
        }

        private void TOutlook_btn_Click(object sender, EventArgs e)
        {
            new TOutlook_frm().ShowDialog();
        }
        private void TAutoCad_btn_Click(object sender, EventArgs e)
        {
            new Form2().ShowDialog();
        }

        private void TMain_frm_Load(object sender, EventArgs e)
        {
         
           TGlobal.pc = new PlanSwift.PlanCenter();
           MessageBox.Show(TGlobal.pc.GetEdition());
           //if (TGlobal.pc.GetEdition != 0 ){
               //if (TGlobal.pc.GetEdition != 0 ){
                  // MessageBox.Show("SDK does not support this Edition of Planswift!", "Unsupported Edition", MessageBoxButtons.OK, MessageBoxIcon.Error);
                  // pc = null;
                  // this.Close();
               // }
           //}
           TGlobal.pc.Visible = true;
           if (TGlobal.pc.JobOpened == false)
           {
               TGlobal.pc.OpenJobEx();
           } 
            Excel_lbl.Text = "Demonstrates exporting basic job" + Environment.NewLine + "information to an Excel spreadsheet.";
            Word_lbl.Text = "Demonstrates exporting basic job" + Environment.NewLine + "information to an MS Word Document.";
            Outlook_lbl.Text = "Demonstrates exporting basic job" + Environment.NewLine + "information to MS Outlook Email.";
            Autocad_lbl.Text = "Demonstrates drawing digitizer objects" + Environment.NewLine + "in AutoCads Modelspace Window.";
        }

        private void TMain_frm_FormClosing(object sender, FormClosingEventArgs e)
        {
            TGlobal.pc = null;
        }

        
    }
    class TGlobal
    {
        public static PlanSwift.IPlanCenter pc;
    }
}
