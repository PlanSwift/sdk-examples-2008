namespace SDK
{
    partial class Form2
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
            this.Send_btn = new System.Windows.Forms.Button();
            this.Label11 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Tabs_cbx
            // 
            this.Tabs_cbx.FormattingEnabled = true;
            this.Tabs_cbx.Location = new System.Drawing.Point(12, 29);
            this.Tabs_cbx.Name = "Tabs_cbx";
            this.Tabs_cbx.Size = new System.Drawing.Size(174, 21);
            this.Tabs_cbx.TabIndex = 108;
            // 
            // Send_btn
            // 
            this.Send_btn.Location = new System.Drawing.Point(192, 27);
            this.Send_btn.Name = "Send_btn";
            this.Send_btn.Size = new System.Drawing.Size(75, 23);
            this.Send_btn.TabIndex = 106;
            this.Send_btn.Text = "Send";
            this.Send_btn.UseVisualStyleBackColor = true;
            this.Send_btn.Click += new System.EventHandler(this.Send_btn_Click);
            // 
            // Label11
            // 
            this.Label11.AutoSize = true;
            this.Label11.Location = new System.Drawing.Point(9, 13);
            this.Label11.Name = "Label11";
            this.Label11.Size = new System.Drawing.Size(62, 13);
            this.Label11.TabIndex = 107;
            this.Label11.Text = "Select Tab:";
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 74);
            this.Controls.Add(this.Tabs_cbx);
            this.Controls.Add(this.Send_btn);
            this.Controls.Add(this.Label11);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "Form2";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AutoCad Example";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        internal System.Windows.Forms.ComboBox Tabs_cbx;
        internal System.Windows.Forms.Button Send_btn;
        internal System.Windows.Forms.Label Label11;
    }
}