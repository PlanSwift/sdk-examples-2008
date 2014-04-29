namespace SDK
{
    partial class TMain_frm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TMain_frm));
            this.TExcel_btn = new System.Windows.Forms.Button();
            this.TWord_btn = new System.Windows.Forms.Button();
            this.TOutlook_btn = new System.Windows.Forms.Button();
            this.TAutoCad_btn = new System.Windows.Forms.Button();
            this.Excel_lbl = new System.Windows.Forms.Label();
            this.Word_lbl = new System.Windows.Forms.Label();
            this.Outlook_lbl = new System.Windows.Forms.Label();
            this.Autocad_lbl = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // TExcel_btn
            // 
            this.TExcel_btn.Location = new System.Drawing.Point(23, 18);
            this.TExcel_btn.Name = "TExcel_btn";
            this.TExcel_btn.Size = new System.Drawing.Size(131, 25);
            this.TExcel_btn.TabIndex = 0;
            this.TExcel_btn.Text = "Export to Excel";
            this.TExcel_btn.UseVisualStyleBackColor = true;
            this.TExcel_btn.Click += new System.EventHandler(this.TExcel_btn_Click);
            // 
            // TWord_btn
            // 
            this.TWord_btn.Location = new System.Drawing.Point(23, 56);
            this.TWord_btn.Name = "TWord_btn";
            this.TWord_btn.Size = new System.Drawing.Size(131, 25);
            this.TWord_btn.TabIndex = 1;
            this.TWord_btn.Text = "Export to Word";
            this.TWord_btn.UseVisualStyleBackColor = true;
            this.TWord_btn.Click += new System.EventHandler(this.TWord_btn_Click);
            // 
            // TOutlook_btn
            // 
            this.TOutlook_btn.Location = new System.Drawing.Point(23, 96);
            this.TOutlook_btn.Name = "TOutlook_btn";
            this.TOutlook_btn.Size = new System.Drawing.Size(131, 25);
            this.TOutlook_btn.TabIndex = 2;
            this.TOutlook_btn.Text = "Export to Outlook";
            this.TOutlook_btn.UseVisualStyleBackColor = true;
            this.TOutlook_btn.Click += new System.EventHandler(this.TOutlook_btn_Click);
            // 
            // TAutoCad_btn
            // 
            this.TAutoCad_btn.Location = new System.Drawing.Point(23, 136);
            this.TAutoCad_btn.Name = "TAutoCad_btn";
            this.TAutoCad_btn.Size = new System.Drawing.Size(131, 25);
            this.TAutoCad_btn.TabIndex = 3;
            this.TAutoCad_btn.Text = "Export to Autocad";
            this.TAutoCad_btn.UseVisualStyleBackColor = true;
            this.TAutoCad_btn.Click += new System.EventHandler(this.TAutoCad_btn_Click);
            // 
            // Excel_lbl
            // 
            this.Excel_lbl.AutoSize = true;
            this.Excel_lbl.Location = new System.Drawing.Point(160, 18);
            this.Excel_lbl.Name = "Excel_lbl";
            this.Excel_lbl.Size = new System.Drawing.Size(35, 13);
            this.Excel_lbl.TabIndex = 4;
            this.Excel_lbl.Text = "label1";
            // 
            // Word_lbl
            // 
            this.Word_lbl.AutoSize = true;
            this.Word_lbl.Location = new System.Drawing.Point(160, 56);
            this.Word_lbl.Name = "Word_lbl";
            this.Word_lbl.Size = new System.Drawing.Size(35, 13);
            this.Word_lbl.TabIndex = 5;
            this.Word_lbl.Text = "label2";
            // 
            // Outlook_lbl
            // 
            this.Outlook_lbl.AutoSize = true;
            this.Outlook_lbl.Location = new System.Drawing.Point(160, 96);
            this.Outlook_lbl.Name = "Outlook_lbl";
            this.Outlook_lbl.Size = new System.Drawing.Size(35, 13);
            this.Outlook_lbl.TabIndex = 6;
            this.Outlook_lbl.Text = "label3";
            // 
            // Autocad_lbl
            // 
            this.Autocad_lbl.AutoSize = true;
            this.Autocad_lbl.Location = new System.Drawing.Point(160, 136);
            this.Autocad_lbl.Name = "Autocad_lbl";
            this.Autocad_lbl.Size = new System.Drawing.Size(35, 13);
            this.Autocad_lbl.TabIndex = 7;
            this.Autocad_lbl.Text = "label4";
            // 
            // TMain_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(352, 177);
            this.Controls.Add(this.Autocad_lbl);
            this.Controls.Add(this.Outlook_lbl);
            this.Controls.Add(this.Word_lbl);
            this.Controls.Add(this.Excel_lbl);
            this.Controls.Add(this.TAutoCad_btn);
            this.Controls.Add(this.TOutlook_btn);
            this.Controls.Add(this.TWord_btn);
            this.Controls.Add(this.TExcel_btn);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "TMain_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "C# Planswift SDK Demo";
            this.Load += new System.EventHandler(this.TMain_frm_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.TMain_frm_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button TExcel_btn;
        private System.Windows.Forms.Button TWord_btn;
        private System.Windows.Forms.Button TOutlook_btn;
        private System.Windows.Forms.Button TAutoCad_btn;
        private System.Windows.Forms.Label Excel_lbl;
        private System.Windows.Forms.Label Word_lbl;
        private System.Windows.Forms.Label Outlook_lbl;
        private System.Windows.Forms.Label Autocad_lbl;
    }
}

