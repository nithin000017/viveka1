
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_AdminLogin : System.Web.UI.Page
{
    DataManager dm = new DataManager();
    SqlConnection objsql = new SqlConnection(ConfigurationManager.AppSettings["Connstr"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtemail.Focus();
            generateStopSpamText();
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {

        try
        {
            if (txtStopSpam.Text == ViewState["spam"].ToString())
            {
                string email = txtemail.Text;
                string password = txtPassword.Text;
                string query = "select Reg_MID,Reg_Email,Reg_Password from tbl_Registration where Reg_Email ='" + email + "' and Reg_Password ='" + password + "' and Reg_ActiveFlag=1";
                int res = 0;
                objsql.Open();
                SqlCommand cmd = new SqlCommand(query, objsql);
                SqlDataReader d = cmd.ExecuteReader();
                while (d.Read())
                {
                    res = int.Parse(d["Reg_MID"].ToString());
                }
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("login successfully", "ArtGallery.aspx");
                }
                else
                {
                    ShowMessageAndRedirect("InValid", "AdminLogin.aspx");
                }

            }
            else
            {
                CustomValidator val = new CustomValidator();
                val.ErrorMessage = "InValid Captcha";
                ShowMessage("InValid Captcha");
                txtStopSpam.Focus();
            }
        }

        catch (Exception ex)
        {
            ex.Data.Clear();
        }


    }
    private void generateStopSpamText()
    {
        Random r = new Random();
        int Fno = r.Next(1, 9);
        int Sno = r.Next(1, 9);
        ViewState["spam"] = Fno + Sno;
        lblStopSpam.Text = Fno.ToString() + "+" + Sno.ToString() + " =";
    }
    private void ClearAll()
    {
        txtemail.Text = "";
        txtPassword.Text = "";
        txtStopSpam.Text = "";
    }
    private void ShowMessageAndRedirect(string msg, string url)
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("function Redirect()");
            sb.Append("{");
            sb.Append(" window.location.href='" + url + "'");
            sb.Append("}");
            sb.Append("alert('" + msg + "');");
            sb.Append("setTimeout('Redirect()',1000);");
            Response.Write("<script>" + sb + "</script>");
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    public void ShowMessage(string msg)
    {
        StringBuilder bd = new StringBuilder();
        bd.Append(@"<script type='txt/javascript'>");
        bd.Append("Alert('" + msg + "');");
        bd.Append(@"</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", bd.ToString(), false);
    }

    protected void Linkbutton1_Click(object sender, EventArgs e)
    {
        generateStopSpamText();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
}










