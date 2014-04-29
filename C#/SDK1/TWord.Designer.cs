namespace SDK
{
    partial class TWord_frm
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
            this.Send_btn = new System.Windows.Forms.Button();
            this.Tabs_cbx = new System.Windows.Forms.ComboBox();
            this.Label11 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Send_btn
            // 
            this.Send_btn.Location = new System.Drawing.Point(193, 23);
            this.Send_btn.Name = "Send_btn";
            this.Send_btn.Size = new System.Drawing.Size(75, 23);
            this.Send_btn.TabIndex = 7;
            this.Send_btn.Text = "Send";
            this.Send_btn.UseVisualStyleBackColor = true;
            this.Send_btn.Click += new System.EventHandler(this.Send_btn_Click);
            // 
            // Tabs_cbx
            // 
            this.Tabs_cbx.FormattingEnabled = true;
            this.Tabs_cbx.Location = new System.Drawing.Point(13, 25);
            this.Tabs_cbx.Name = "Tabs_cbx";
            this.Tabs_cbx.Size = new System.Drawing.Size(174, 21);
            this.Tabs_cbx.TabIndex = 105;
            // 
            // Label11
            // 
            this.Label11.AutoSize = true;
            this.Label11.Location = new System.Drawing.Point(10, 9);
            this.Label11.Name = "Label11";
            this.Label11.Size = new System.Drawing.Size(62, 13);
            this.Label11.TabIndex = 104;
            this.Label11.Text = "Select Tab:";
            // 
            // TWord_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(285, 73);
            this.Controls.Add(this.Tabs_cbx);
            this.Controls.Add(this.Send_btn);
            this.Controls.Add(this.Label11);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "TWord_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Microsoft Word Example";
            this.Load += new System.EventHandler(this.TWord_frm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        internal System.Windows.Forms.Button Send_btn;
        internal System.Windows.Forms.ComboBox Tabs_cbx;
        internal System.Windows.Forms.Label Label11;
    }
}