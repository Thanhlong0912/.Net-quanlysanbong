using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Imaging;
using System.Windows.Forms;
using System.IO;

namespace GUI_QuanLySanBong.Model
{
    class KetNoi

    {
        public SqlConnection conDB()
        {
            SqlConnection con = new SqlConnection(@"Data Source=THANHLONG\SQLEXPRESS;Initial Catalog=QuanLySanBong;Persist Security Info=True;User ID=sa;Password=123");
            return con;
        }
    }
}
        