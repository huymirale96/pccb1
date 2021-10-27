namespace QuanLyPhanCongCanBo
{
    partial class BaoCaoPhanCongTheoNgay_
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnBaoCao = new System.Windows.Forms.Button();
            this.mtbNgay = new System.Windows.Forms.MaskedTextBox();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(-1, 2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(612, 259);
            this.dataGridView1.TabIndex = 9;
            // 
            // btnBaoCao
            // 
            this.btnBaoCao.Location = new System.Drawing.Point(237, 286);
            this.btnBaoCao.Name = "btnBaoCao";
            this.btnBaoCao.Size = new System.Drawing.Size(107, 23);
            this.btnBaoCao.TabIndex = 8;
            this.btnBaoCao.Text = "Báo Cáo";
            this.btnBaoCao.UseVisualStyleBackColor = true;
            this.btnBaoCao.Click += new System.EventHandler(this.btnBaoCao_Click);
            // 
            // mtbNgay
            // 
            this.mtbNgay.Location = new System.Drawing.Point(83, 288);
            this.mtbNgay.Mask = "00/00/0000";
            this.mtbNgay.Name = "mtbNgay";
            this.mtbNgay.Size = new System.Drawing.Size(63, 20);
            this.mtbNgay.TabIndex = 7;
            this.mtbNgay.ValidatingType = typeof(System.DateTime);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(42, 291);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Ngày:";
            // 
            // BaoCaoPhanCongTheoNgay_
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(614, 361);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.btnBaoCao);
            this.Controls.Add(this.mtbNgay);
            this.Controls.Add(this.label2);
            this.Name = "BaoCaoPhanCongTheoNgay_";
            this.Text = "BaoCaoPhanCongTheoNgay_";
            this.Load += new System.EventHandler(this.BaoCaoPhanCongTheoNgay__Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnBaoCao;
        private System.Windows.Forms.MaskedTextBox mtbNgay;
        private System.Windows.Forms.Label label2;
    }
}