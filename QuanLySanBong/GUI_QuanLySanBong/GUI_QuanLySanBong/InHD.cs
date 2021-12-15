using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_QuanLySanBong
{
    public partial class InHD : Form
    {
        public InHD()
        {
            InitializeComponent();
        }

        private void InHD_Load(object sender, EventArgs e)
        {

        }

        private void crystalReportViewer1_Load(object sender, EventArgs e)
        {

        }

        private void btnShow_Click(object sender, EventArgs e)
        {
            CrystalReport1 rpt = new CrystalReport1();
            crystalReportViewer1.ReportSource = rpt;

            rpt.SetDatabaseLogon("sa", "123", "THANHLONG\\SQLEXPRESS", "QuanLySanBong");

            crystalReportViewer1.Refresh();
        }
    }
}
