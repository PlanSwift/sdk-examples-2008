namespace SDK
{
    partial class TExcel_frm
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
            this.Tabs_cbx = new System.Windows.Forms.ComboBox();
            this.TSend_btn = new System.Windows.Forms.Button();
            this.Label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Tabs_cbx
            // 
            this.Tabs_cbx.FormattingEnabled = true;
            this.Tabs_cbx.Location = new System.Drawing.Point(15, 31);
            this.Tabs_cbx.Name = "Tabs_cbx";
            this.Tabs_cbx.Size = new System.Drawing.Size(174, 21);
            this.Tabs_cbx.TabIndex = 0;
            // 
            // TSend_btn
            // 
            this.TSend_btn.Location = new System.Drawing.Point(195, 31);
            this.TSend_btn.Name = "TSend_btn";
            this.TSend_btn.Size = new System.Drawing.Size(75, 23);
            this.TSend_btn.TabIndex = 1;
            this.TSend_btn.Text = "Send";
            this.TSend_btn.UseVisualStyleBackColor = true;
            this.TSend_btn.Click += new System.EventHandler(this.button1_Click);
            // 
            // Label1
            // 
            this.Label1.AutoSize = true;
            this.Label1.Location = new System.Drawing.Point(15, 15);
            this.Label1.Name = "Label1";
            this.Label1.Size = new System.Drawing.Size(62, 13);
            this.Label1.TabIndex = 2;
            this.Label1.Text = "Select Tab:";
            // 
            // TExcel_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(282, 75);
            this.Controls.Add(this.Label1);
            this.Controls.Add(this.TSend_btn);
            this.Controls.Add(this.Tabs_cbx);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "TExcel_frm";
            this.Text = "Excel Example";
            this.Load += new System.EventHandler(this.TExcel_frm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox Tabs_cbx;
        private System.Windows.Forms.Button TSend_btn;
        private System.Windows.Forms.Label Label1;
    }
}