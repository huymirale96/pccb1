using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;

namespace QuanLyPhanCongCanBo
{
    public partial class BaoCaoPhanCongTheoNgay_ : Form
    {
        public BaoCaoPhanCongTheoNgay_()
        {
            InitializeComponent();
        }

        String constr = ConfigurationManager.ConnectionStrings["db_quanLyThi"].ConnectionString;

        private void BaoCaoPhanCongTheoNgay__Load(object sender, EventArgs e)
        {
            mtbNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        private void btnBaoCao_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {
                        cnn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_danhSachPhanCongCanBoTheoNgay";
                        cmd.Parameters.AddWithValue("@ngay", DateTime.Parse(mtbNgay.Text));
                        // cmd.Parameters.AddWithValue("@ngayKetThuc", DateTime.Parse(txtNgayKetThuc.Text));
                        SqlDataAdapter dap = new SqlDataAdapter(cmd);
                        DataTable data = new DataTable();
                        dap.Fill(data);
                        dataGridView1.DataSource = data;
                        dataGridView1.Columns["iMaPhanCong"].Visible = false;
                        //BCphanCongTheoNgay report = new BCphanCongTheoNgay();
                        //report.SetDataSource(data);
                        //crystalReportViewer1.ReportSource = report;

                    }
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine(exx.Message);
            }
        }
    }
}
