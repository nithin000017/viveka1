using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class WebPages_Achievements : System.Web.UI.Page
{
    DataManager dm = new DataManager();
    SqlConnection objsql = new SqlConnection(ConfigurationManager.AppSettings["ConnStr"].ToString());
    int FlagPhoto = 0;
    int FlagAadhar = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindReg();
            BindAchievments();
            divAchievementview.Visible = true;
            divAchievement.Visible = false;
            divAchieventsGrid.Visible = false;
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
            //Response.Redirect("oops.aspx");
        }
    }
    private void BindReg()
    {
        try
        {

            gvAchievementview.DataSource = null;
            gvAchievementview.DataBind();
            string count = "";

            if (ddlShowTop.SelectedIndex > 0)
            {
                int top = int.Parse(ddlShowTop.SelectedItem.ToString());
                count += " top(" + top + ") ";
            }

            string Qry = "SELECT   * FROM dbo.tbl_Registration WHERE Reg_ActiveFlag=1";
            if (TxtSRegNo.Text != "")
                Qry += " AND Reg_RegNo LIKE '%" + TxtSRegNo.Text + "%'";
            if (TxtsName.Text != "")
                Qry += " AND Reg_Name LIKE '%" + TxtsName.Text + "%'";
            if (TxtSClass.Text != "")
                Qry += " AND Reg_Class LIKE '%" + TxtSClass.Text + "%'";
            if (TxtContact.Text != "")
                Qry += " AND Reg_Contact LIKE '%" + TxtContact.Text + "%'";
            if (TxtsEmailId.Text != "")
                Qry += " AND Reg_Email LIKE '%" + TxtsEmailId.Text + "%'";
            if (DdlsDepartment.SelectedValue != "--Select--")
                Qry += " AND Reg_Department LIKE '%" + DdlsDepartment.SelectedValue + "%'";

            Qry += " order by Reg_MID desc";
            Qry += " Select count(Reg_MID) TotalRecords from tbl_Registration where Reg_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(Qry);
            if (ds != null)
            {
                gvAchievementview.DataSource = ds.Tables[0];
                gvAchievementview.DataBind();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    void BindAchievments()
    {
        try
        {

            gvAchieve.DataSource = null;
            gvAchieve.DataBind();
            string count = "";


            string Qry = "SELECT   * FROM dbo.tbl_Achievement inner join tbl_Registration on Reg_MID=Achievement_RegMID WHERE Achievement_ActiveFlag=1";
            //if (TxtTitle1.Text != "")
            //    Qry += " AND Achievement_Title LIKE '%" + TxtTitle1.Text + "%'";


            Qry += " order by Achievement_MID desc";
            Qry += " Select count(Achievement_MID) TotalRecords from tbl_Achievement where Achievement_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(Qry);
            if (ds != null)
            {
                gvAchieve.DataSource = ds.Tables[0];
                gvAchieve.DataBind();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }



    private void ClearAll()
    {
        Response.Redirect("../webpages/studentmaster.aspx");
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        Response.Redirect("../webpages/studentmaster.aspx");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
         {
             string Department = ddlDepartment.Text;
             string RegNo = txtrRegNo.Text;
             string Title = TxtTitle.Text;
             string Photo = "";
            string Description=editor3.Content;
            int Mid=int.Parse(Session["RegMid"].ToString());




            if (btnsave.Text == "Save")
             {
                 if(fupImage.HasFile)
                 {
                     UploadImage();
                     if(Session["ImagePath"]!=null)
                     {
                         Photo=Session["ImagePath"].ToString();
                     }
                     else
                     {
                         Photo=PreviewImage.Src;
                     }
                 }
                 string qry = "Insert into tbl_Achievement(Achievement_RegMID,Achievement_Title,Achievement_Description,Achievement_Photo)values('" + Mid + "','" + Title + "','" + Description + "','" + Photo +  "')";
                 objsql.Open();
                 SqlCommand cmd = new SqlCommand(qry, objsql);
                 int res = cmd.ExecuteNonQuery();
                 objsql.Close();
                 if (res > 0)
                 {
                     ShowMessageAndRedirect("Submitted Successfully", "StudentMaster.aspx");
                 }
                 else
                 {
                     ShowMessageAndRedirect("Sorry Try Again!", "StudentMaster.aspx");
                 }
             }
             else
             {
                 string qry1 = "update tbl_Achievement set Achievement_Title='" + Title + "',Achievement_Description='" + Description + "',Achievement_Photo='" + Photo +  "'";
                 objsql.Open();
                 SqlCommand cmd = new SqlCommand(qry1, objsql);
                 int res = cmd.ExecuteNonQuery();
                 objsql.Close();
                 if (res > 0)
                 {
                     ShowMessageAndRedirect("Submitted Successfully", "StudentMaster.aspx");
                     divAddStudent.Visible = false;
                     divAchievement.Visible = true;
                 }
                 else
                 {
                     ShowMessageAndRedirect("Sorry Try Again!", "StudentMaster.aspx");
                     divAddStudent.Visible = false;
                     divAchievement.Visible = true;
                 }
             }
         }
         catch (Exception ex)
         {
             ex.Data.Clear();
         } 

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {

        BindReg();
        divAchievementview.Visible = false;
        divAchievement.Visible = false;
        divAchieventsGrid.Visible = true;
        divAddStudent.Visible = false;
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        BindReg();
    }
    protected void btnrefresh_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void gvAchievementview_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdEdit")
        {
            int RegId = int.Parse(e.CommandArgument.ToString());

            string qry = "select * from dbo.tbl_Registration where  Reg_ActiveFlag=1  and Reg_MID='" + RegId + "'";
            DataSet ds = dm.GetDataSet(qry);
            if (ds != null)
            {
                Session["Reg_MID"] = RegId.ToString();


                GetAchivementDetails(RegId);

                divAchieventsGrid.Visible = false;
                divAchievement.Visible = true;
                divAchievementview.Visible = false;
                divAddStudent.Visible = false;



            }
        }
        else if (e.CommandName == "cmdEdit1")
        {
            int RegId = int.Parse(e.CommandArgument.ToString());

            string qry1 = "select * from dbo.tbl_Registration where  Reg_ActiveFlag=1  and Reg_MID='" + RegId + "'";
       

    
            DataSet ds = dm.GetDataSet(qry1);
            {
                Session["Reg_MID"] = RegId.ToString();


                GetRegDetails(RegId);

                divAchieventsGrid.Visible = false;
                divAchievement.Visible = false;
                divAchievementview.Visible = false;
                divAddStudent.Visible = true;






            }

        }
        else if (e.CommandName == "Del")
        {
            try
            {

                int RegId = int.Parse(e.CommandArgument.ToString());
                int UserId = 0;// int.Parse(Session["UserId"].ToString());
                int Result = 0;


                string qry1 = "update tbl_Registration set Reg_ActiveFlag=0 where Reg_MID='" + RegId + "'";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry1, objsql);
                int res = cmd.ExecuteNonQuery();
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Submitted Successfully", "StudentMaster.aspx");
                    ClearAll();
                    divAchievement.Visible = false;
                    divAchievementview.Visible = true;
                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "StudentMaster.aspx");
                    divAchievement.Visible = false;
                    divAchievementview.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
              
            }

        }


    }

    private void GetAchivementDetails(int Mid)
    {
        string Query = "SELECT   * FROM dbo.tbl_Registration WHERE Reg_ActiveFlag=1 and Reg_MID=" + Mid + "";
        DataSet ds = dm.GetDataSet(Query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlDepartment.SelectedValue = ds.Tables[0].Rows[0]["Reg_Department"].ToString();
            ddlDepartment.Enabled = true;
            txtName.Text = ds.Tables[0].Rows[0]["Reg_Name"].ToString();
            txtrRegNo.Text = ds.Tables[0].Rows[0]["Reg_RegNo"].ToString();
 


            //editor3.Content = ds.Tables[0].Rows[0]["Achievement_Description"].ToString();
            //PreviewImage.Src = ds.Tables[0].Rows[0]["Achievement_Photo"].ToString().Replace("~", "..");





        }
    }

    private void GetRegDetails(int Mid)
    {
        string Query = "SELECT   * FROM dbo.tbl_Registration WHERE Reg_ActiveFlag=1 and Reg_MID=" + Mid + "";
        DataSet ds = dm.GetDataSet(Query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DdlRegDepartment.SelectedValue = ds.Tables[0].Rows[0]["Reg_Department"].ToString();
            DdlRegDepartment.Enabled = false;
            TxtRegName.Text = ds.Tables[0].Rows[0]["Reg_Name"].ToString();
            TxtRegNo.Text = ds.Tables[0].Rows[0]["Reg_RegNo"].ToString();
            TxtRegClass.Text = ds.Tables[0].Rows[0]["Reg_Class"].ToString();
            TxtRegContact.Text = ds.Tables[0].Rows[0]["Reg_Contact"].ToString();
            TxtRegEmail.Text = ds.Tables[0].Rows[0]["Reg_Email"].ToString();
            TxtRegRole.Text = ds.Tables[0].Rows[0]["Reg_Role"].ToString();
            TxtRegPassword.Text = ds.Tables[0].Rows[0]["Reg_Password"].ToString();


            //editor3.Content = ds.Tables[0].Rows[0]["Achievement_Description"].ToString();
            //PreviewImage.Src = ds.Tables[0].Rows[0]["Achievement_Photo"].ToString().Replace("~", "..");




        
        }
    }

    private void UploadImage()
    {
        try
        {
            string filename = System.IO.Path.GetFileName(fupImage.PostedFile.FileName);
            Random r = new Random();
            int randomno = r.Next();

            string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
            string flnm = Path.GetFileNameWithoutExtension(filename);
            if (sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".png")
            {
                string newfilename = randomno + "_" + flnm + sImageFileExtension;
                string strFPath = "~/RegPhoto/" + newfilename;
                fupImage.PostedFile.SaveAs(Server.MapPath(strFPath));
                Session["ImagePath"] = strFPath;
                CompressAndUploadPhoto(fupImage);
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("~/StudentMaster.aspx");
        }
    }
    private void CompressAndUploadPhoto(FileUpload fupImage)
    {
        try
        {
            // First we check to see if the user has selected a file
            if (fupImage.HasFile)
            {
                // Find the fileUpload control
                string filename = fupImage.FileName;

                // Specify the upload directory
                string directory = Server.MapPath("~/RegPhoto/");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(fupImage.FileContent);

                int newWidth = 150;
                int newHeight = newWidth;

                double actualHeight = originalBMP.Height;
                double actualWidth = originalBMP.Width;
                double maxHeight = 600.0;
                double maxWidth = 800.0;
                double imgRatio = actualWidth / actualHeight;
                double maxRatio = maxWidth / maxHeight;
                double compressionQuality = 0.5;//50 percent compression
                if (actualHeight > maxHeight || actualWidth > maxWidth)
                {
                    if (imgRatio < maxRatio)
                    {
                        //adjust width according to maxHeight
                        imgRatio = maxHeight / actualHeight;
                        actualWidth = imgRatio * actualWidth;
                        actualHeight = maxHeight;
                    }
                    else if (imgRatio > maxRatio)
                    {
                        //adjust height according to maxWidth
                        imgRatio = maxWidth / actualWidth;
                        actualHeight = imgRatio * actualHeight;
                        actualWidth = maxWidth;
                    }
                    else
                    {
                        actualHeight = maxHeight;
                        actualWidth = maxWidth;
                    }
                }

                newWidth = Convert.ToInt16(actualWidth);
                newHeight = Convert.ToInt16(actualHeight);
                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                // Create a graphic based on the new bitmap
                Graphics oGraphics = Graphics.FromImage(newBMP);

                // Set the properties for the new graphic file
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                // Draw the new graphic based on the resized bitmap
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

                // Save the new graphic file to the server              
                Random rm = new Random();
                string randomno = rm.Next(11111, 99999).ToString();
                string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
                string newfilename = randomno + sImageFileExtension;
                string strPath = directory + "kss_" + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath = "~/RegPhoto/" + "kss_" + randomno + sImageFileExtension;
                Session["MYPHOTO_Reg"] = strFPath;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("~/StudentMaster.aspx");
        }

    }
    protected void gvAchieve_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void btnStdBAck_Click(object sender, EventArgs e)
    {
        BindReg();
        BindAchievments();
        divAchievementview.Visible = true;
        divAchievement.Visible = false;
        divAchieventsGrid.Visible = false;
    }
    protected void btnRegSubmit_Click(object sender, EventArgs e)
    {
       try
         {
             string RegDepartment = DdlRegDepartment.Text;
             string RegNo = TxtRegNo.Text;
             string RegName = TxtRegName.Text;
             string RegClass = TxtRegClass.Text;
             string RegEmail = TxtRegEmail.Text;
             string RegRole = TxtRegRole.Text;
           string  RegPassword=TxtRegPassword.Text;
           string Contact = TxtRegContact.Text;
       

           if (btnRegSubmit.Text == "Submit")
             {
                 string qry = "Insert into tbl_Registration(Reg_RegNo,Reg_Name,Reg_Contact,Reg_Department,Reg_Class,Reg_Role,Reg_Password,Reg_Email,Reg_Extra1)values('" + RegNo + "','" + RegName + "','" + Contact + "','" + RegDepartment + "','" + RegClass + "','" + RegRole + "', '" + RegPassword + "','" + RegEmail + "','" + Session["Num"].ToString() + "')";
                 objsql.Open();
                 SqlCommand cmd = new SqlCommand(qry, objsql);
                 int res = cmd.ExecuteNonQuery();
                 objsql.Close();
                 if (res > 0)
                 {
                     ShowMessageAndRedirect("Submitted Successfully", "StudentMaster.aspx");
                 }
                 else
                 {
                     ShowMessageAndRedirect("Sorry Try Again!", "StudentMaster.aspx");
                 }
             }
             else
             {
                 string qry1 = "update tbl_Registration set Reg_Regno='" + RegNo + "',Reg_Name='" + RegName + "',Reg_Contact='" + Contact + "',Reg_Department='" + RegDepartment + "',Reg_Class='" + RegClass + "',Reg_Role='" + RegRole + "',RegPassword='" +RegPassword+"',RegEmail='"+RegEmail+"'";
                 objsql.Open();
                 SqlCommand cmd = new SqlCommand(qry1, objsql);
                 int res = cmd.ExecuteNonQuery();
                 objsql.Close();
                 if (res > 0)
                 {
                     ShowMessageAndRedirect("Submitted Successfully", "StudentMaster.aspx");
                     divAddStudent.Visible = false;
                     divAchievement.Visible = true;
                 }
                 else
                 {
                     ShowMessageAndRedirect("Sorry Try Again!", "StudentMaster.aspx");
                     divAddStudent.Visible = false;
                     divAchievement.Visible = true;
                 }
             }
         }
         catch (Exception ex)
         {
             ex.Data.Clear();
         }
    

    }
    protected void btnRegReset_Click(object sender, EventArgs e)
    {

        ddlDepartment.SelectedValue= "";
        TxtRegNo.Text = "";
        TxtRegName.Text = "";
        TxtRegClass.Text = "";
        TxtRegEmail.Text = "";
        TxtRegRole.Text="";
        TxtRegPassword.Text="";
        TxtRegContact.Text="";
   
    }
    protected void btnRegViewStud_Click(object sender, EventArgs e)
    {
        Response.Redirect("../webpages/studentmaster.aspx");
    }
    protected void btnStdMAster_Click(object sender, EventArgs e)
    {
        divAchievementview.Visible = false;
        divAchievement.Visible = false;
        divAchieventsGrid.Visible = false;
        divAddStudent.Visible = true;
    }
    protected void DdlRegDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        string num1 = "";

        if (DdlRegDepartment.SelectedValue == "Mechanical")
        {
            string qry = "select  top(1)* from dbo.tbl_Registration where Reg_ActiveFlag=1 and Reg_Extra1<>'' and Reg_Department='" + DdlRegDepartment.SelectedValue + "'  order by Reg_MID desc";
            DataSet ds = new DataSet();
            ds = dm.GetDataSet(qry);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int Num = int.Parse(ds.Tables[0].Rows[0]["Reg_Extra1"].ToString());
                    Num = Num + 1;
                    num1 = Num.ToString();
                    if (num1.Length == 1)
                    {
                        num1 = "000" + Num;
                    }
                    else if (num1.Length == 2)
                    {
                        num1 = "0" + Num;
                    }
                    TxtRegNo.Text = "391ME2" + num1;
                }
                else
                {
                    TxtRegNo.Text = "391ME20001";
                }
            }
        }
        else if (DdlRegDepartment.SelectedValue == "Computer Science")
        {
            string qry1 = "select  top(1)* from dbo.tbl_Registration where Reg_ActiveFlag=1 and Reg_Extra1<>''and Reg_Department='" + DdlRegDepartment.SelectedValue + "'   order by Reg_MID desc";
            DataSet ds1 = new DataSet();
            ds1 = dm.GetDataSet(qry1);
            if (ds1 != null)
            {
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    int Num = int.Parse(ds1.Tables[0].Rows[0]["Reg_Extra1"].ToString());
                    Num = Num + 1;
                    num1 = Num.ToString();
                    if (num1.Length == 1)
                    {
                        num1 = "000" + Num;
                    }
                    else if (num1.Length == 2)
                    {
                        num1 = "0" + Num;
                    }
                    TxtRegNo.Text = "391CS2" + num1;
                }
                else
                {
                    TxtRegNo.Text = "391CS20001";
                }
            }
        }
        else if (DdlRegDepartment.SelectedValue == "Civil")
        {
            string qry2 = "select  top(1)* from dbo.tbl_Registration where Reg_ActiveFlag=1 and Reg_Extra1<>'' and Reg_Department='" + DdlRegDepartment.SelectedValue + "'   order by Reg_MID desc";
            DataSet ds2 = new DataSet();
            ds2 = dm.GetDataSet(qry2);
            if (ds2 != null)
            {
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    int Num = int.Parse(ds2.Tables[0].Rows[0]["Reg_Extra1"].ToString());
                    Num = Num + 1;
                    num1 = Num.ToString();
                    if (num1.Length == 1)
                    {
                        num1 = "000" + Num;
                    }
                    else if (num1.Length == 2)
                    {
                        num1 = "0" + Num;
                    }
                    TxtRegNo.Text = "391CE2" + num1;
                }
                else
                {
                    TxtRegNo.Text = "391CE20001";
                }
            }
        }
        else if (DdlRegDepartment.SelectedValue == "Electrical")
        {
            string qry3 = "select  top(1)* from dbo.tbl_Registration where Reg_ActiveFlag=1 and Reg_Extra1<>'' and Reg_Department='" + DdlRegDepartment.SelectedValue + "'   order by Reg_MID desc";
            DataSet ds3 = new DataSet();
            ds3 = dm.GetDataSet(qry3);
            if (ds3 != null)
            {
                if (ds3.Tables[0].Rows.Count > 0)
                {
                    int Num = int.Parse(ds3.Tables[0].Rows[0]["Reg_Extra1"].ToString());
                    Num = Num + 1;
                    num1 = Num.ToString();
                    if (num1.Length == 1)
                    {
                        num1 = "000" + Num;
                    }
                    else if (num1.Length == 2)
                    {
                        num1 = "0" + Num;
                    }
                    TxtRegNo.Text = "391EC2" + num1;
                }
                else
                {
                    TxtRegNo.Text = "391EC20001";
                }
            }
        }
        else
        {
            string qry4 = "select  top(1)* from dbo.tbl_Registration where Reg_ActiveFlag=1 and Reg_Extra1<>'' and Reg_Department='" + DdlRegDepartment.SelectedValue + "'   order by Reg_MID desc";
            DataSet ds4 = new DataSet();
            ds4 = dm.GetDataSet(qry4);
            if (ds4 != null)
            {
                if (ds4.Tables[0].Rows.Count > 0)
                {
                    int Num = int.Parse(ds4.Tables[0].Rows[0]["Reg_Extra1"].ToString());
                    Num = Num + 1;
                    num1 = Num.ToString();
                    if (num1.Length == 1)
                    {
                        num1 = "000" + Num;
                    }
                    else if (num1.Length == 2)
                    {
                        num1 = "0" + Num;
                    }
                    TxtRegNo.Text = "391AT2" + num1;
                }
                else
                {
                    TxtRegNo.Text = "391AT20001";
                }

            }
        }
        Session["Num"] = num1.ToString();
    }
}