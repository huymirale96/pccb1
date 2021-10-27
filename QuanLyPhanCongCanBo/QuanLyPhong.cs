using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace QuanLyPhanCongCanBo
{
    public partial class QuanLyPhong : Form
    {
        public QuanLyPhong()
        {
            InitializeComponent();
        }


        String constr = ConfigurationManager.ConnectionStrings["db_quanLyThi"].ConnectionString;

        private void loadGrid()
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_dsPhongHoc";
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataTable data = new DataTable();
                    dap.Fill(data);
                    dataGridView1.DataSource = data;///
                }
            }
            dataGridView1.Columns["iMaPhongHoc"].Visible = false;
        }


        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if ( txtPhong.Text.Length != 0)
                {
                    using (SqlConnection cnn = new SqlConnection(constr))
                    {

                        using (SqlCommand cmd = cnn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_themPhong";
                            cmd.Parameters.AddWithValue("@ten", txtPhong.Text);
                      
                            cnn.Open();
                            int i_ = cmd.ExecuteNonQuery();
                            if (i_ > 0)
                            {
                                loadGrid();
                                txtPhong.Text = "";
                                MessageBox.Show("Thêm Phòng Thành Công", "Thông Báo");
                            }
                        }
                    }
                }

                else
                {
                    MessageBox.Show("Yêu Cầu Điền Đầy Đủ Thông Tin.", "Thông Báo");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
    }

        private void QuanLyPhong_Load(object sender, EventArgs e)
        {
            loadGrid();
        }
    }
}
