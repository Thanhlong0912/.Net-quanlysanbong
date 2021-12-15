using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace GUI_QuanLySanBong
{
    public partial class InHDKH : Form
    {
        SqlConnection ketnoi = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dtSanBong = new DataTable("KhachHang");
        public InHDKH()
        {
            InitializeComponent();
            ketnoi.ConnectionString = Properties.Settings.Default.QuanLySanBongConnectionString;
            ketnoi.Open();
            cmd.Connection = ketnoi;
        }
        void LoadcboKH()
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select  Ma_KhachHang From KhachHang";
            cmd.Parameters.Clear();
            DataTable dt = new DataTable();
            da.SelectCommand = cmd;
            da.Fill(dt);
            comboBox1.DataSource = dt;
            comboBox1.ValueMember = "Ma_KhachHang";
            comboBox1.DisplayMember = "Ma_KhachHang";
        }
        private void btn_inkh_Click(object sender, EventArgs e)
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spDSKH";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Ma_KhachHang", comboBox1.SelectedValue.ToString());
            DataTable dt = new DataTable();
            da.SelectCommand = cmd;
            da.Fill(dt);
            CrystalReport2 rpt = new CrystalReport2();
            rpt.SetDataSource(dt);

            InHDKH f = new InHDKH();
            f.crystalReportViewer1.ReportSource = rpt;
            f.ShowDialog();
        }

        private void InHDKH_Load(object sender, EventArgs e)
        {
            LoadcboKH();
        }

        private void crystalReportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
