using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace YooHome_Stocked_Items
{
	public partial class Form1 : Form
	{
        // NOTE: Remember to use correct IP address and password.
		static string conString = @"Server=123.123.123.123\SQL2K14; Database=YooHome; Integrated Security = FALSE; User Id=sa; Password=marioland123";

		public Form1()
		{
			InitializeComponent();
		}

		private void Form1_Load(object sender, EventArgs e)
		{
			GetStockedItems();
			timer1.Enabled = true;
		}

		private void timer1_Tick(object sender, EventArgs e)
		{
			if (tabControl1.SelectedTab == tabPage1)
				GetStockedItems();
		}

		private void GetStockedItems()
		{
			listBox1.Items.Clear();

			using (SqlConnection con = new SqlConnection(conString))
			{
				con.Open();

				SqlCommand sql = new SqlCommand("SELECT name, amountLeft FROM StockItem", con);
				using (SqlDataReader rd = sql.ExecuteReader())
				{
					while (rd.Read())
					{
						string tempStr = String.Format("{0}x {1}", rd.GetValue(1).ToString().PadLeft(4), rd.GetValue(0).ToString());
						listBox1.Items.Add(tempStr);
					}
				}
			}
		}

		private void textBox1_KeyDown(object sender, KeyEventArgs e)
		{
			if (e.KeyCode == Keys.Enter)
			{
				e.Handled = e.SuppressKeyPress = true; // avoid Ding sound!

				string decimalSpecifier = "#.00# Kr";

				listBox2.Items.Clear();

				using (SqlConnection con = new SqlConnection(conString))
				{
					con.Open();

					string tempSql =	"SELECT StockItem.name, StockItem.unitPrice, OrderItem.quantity, (OrderItem.quantity * StockItem.unitPrice) AS [Price] FROM StockItem " +
										"INNER JOIN OrderItem " +
										"ON OrderItem.sid = StockItem.id " +
										"WHERE OrderItem.oid = " + int.Parse((textBox1.Text).Trim()) + "; --Order id";
					SqlCommand sql = new SqlCommand(tempSql, con);
					using (SqlDataReader rd = sql.ExecuteReader())
					{
						decimal decTotalSum = 0.00M;
						while (rd.Read())
						{
							string strName = rd.GetValue(0).ToString().PadRight(32);
							string strUPrice = decimal.Parse(rd.GetValue(1).ToString()).ToString(decimalSpecifier).PadLeft(16);
							string strAmount = rd.GetValue(2).ToString().PadLeft(8);
							string strTPrice = decimal.Parse(rd.GetValue(3).ToString()).ToString(decimalSpecifier).PadLeft(16);

							string tempStr = strName + strUPrice + strAmount + strTPrice;

							listBox2.Items.Add(tempStr);
							decTotalSum += Decimal.Parse(rd.GetValue(3).ToString());
						}
						listBox2.Items.Add(@"".PadRight(72, '-'));
						listBox2.Items.Add("Total Sum: " + decTotalSum.ToString(decimalSpecifier).PadLeft(61));
						listBox2.Items.Add(@"".PadRight(72, '='));
					}
				}

			}
		}
	}
}
