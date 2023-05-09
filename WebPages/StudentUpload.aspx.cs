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

public partial class WebPages_StudentUpload : System.Web.UI.Page
{
    DataManager dm = new DataManager();
    SqlConnection objsql = new SqlConnection(ConfigurationManager.AppSettings["ConnStr"].ToString());
    int FlagPhoto = 0;
    int FlagAadhar = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindArt();
            BindUpload();
            divStudentUploadview.Visible = true;
            divStudentUploads.Visible = false;
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
    private void BindArt()
    {
        try
        {

            gvUploadview.DataSource = null;
            gvUploadview.DataBind();
            string count = "";

            if (ddlShowTop.SelectedIndex > 0)
            {
                int top = int.Parse(ddlShowTop.SelectedItem.ToString());
                count += " top(" + top + ") ";
            }

            string Qry = "SELECT   * FROM dbo.tbl_Registration WHERE Reg_ActiveFlag=1";
            if (DdlDepartment.SelectedValue != "--Select--")
                Qry += " AND Reg_Department LIKE '%" + DdlDepartment.SelectedValue + "%'";
            if (txtname.Text != "")
                Qry += " AND Reg_Name LIKE '%" + txtname.Text + "%'";
            if (txtregno.Text != "")
                Qry += " AND Reg_RegNo LIKE '%" + txtregno.Text + "%'";
            if (rblTypes.SelectedIndex != 0)
                Qry += " AND Art_Type LIKE '%" + rblTypes.SelectedIndex + "%'";
            if (txttitle.Text != "")
                Qry += " AND Art_Title LIKE '%" + txttitle.Text + "%'";

            Qry += " order by Reg_MID desc";
            Qry += " Select count(Reg_MID) TotalRecords from tbl_Registration where Reg_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(Qry);
            if (ds != null)
            {
                gvUploadview.DataSource = ds.Tables[0];
                gvUploadview.DataBind();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    void BindUpload()
    {
        try
        {

            gvUploadview.DataSource = null;
            gvUploadview.DataBind();
            string count = "";


            string Qry = "SELECT   * FROM dbo.tbl_Art inner join tbl_Registration on Reg_MID=Art_RegMID WHERE Art_ActiveFlag=1";
            //if (TxtTitle1.Text != "")
            //    Qry += " AND Achievement_Title LIKE '%" + TxtTitle1.Text + "%'";


            Qry += " order by Art_MID desc";
            Qry += " Select count(Art_MID) TotalRecords from tbl_Art where Art_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(Qry);
            if (ds != null)
            {
                gvUploadview.DataSource = ds.Tables[0];
                gvUploadview.DataBind();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }



    private void ClearAll()
    {
        Response.Redirect("../webpages/StudentUpload.aspx");
    }


    protected void btnview2_Click(object sender, EventArgs e)
    {
        Response.Redirect("../webpages/StudentUpload.aspx");
    }
    protected void btnsave1_Click(object sender, EventArgs e)
    {
        try
        {
            string Department = DdlDepartment.Text;
            string RegName = txtname.Text;
            string RegNo = txtregno.Text;
            string Title = txttitle.Text;
            string Types = rblTypes.Text;
            string Photo = "";
            string Description = editor3.Content;
            int Mid = int.Parse(Session["RegMid"].ToString());




            if (btnsave1.Text == "Save")
            {
                if (fupImage.HasFile)
                {
                    UploadImage();
                    if (Session["ImagePath"] != null)
                    {
                        Photo = Session["ImagePath"].ToString();
                    }
                    else
                    {
                        Photo = PreviewImage.Src;
                    }
                }
                string qry = "Insert into tbl_Achievement(Achievement_RegMID,Achievement_Title,Achievement_Description,Achievement_Photo)values('" + Mid + "','" + Title + "','" + Description + "','" + Photo + "')";
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
                if (fupImage.HasFile)
                {
                    UploadImage();
                    if (Session["ImagePath"] != null)
                    {
                        Photo = Session["ImagePath"].ToString();
                    }
                    else
                    {
                        Photo = PreviewImage.Src;
                    }
                }
                string qry1 = "update tbl_Achievement set Achievement_Title='" + Title + "',Achievement_Description='" + Description + "',Achievement_Photo='" + Photo + "'";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry1, objsql);
                int res = cmd.ExecuteNonQuery();
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Submitted Successfully", "StudentMaster.aspx");
                    divStudentUploadview.Visible = false;
                    divStudentUploads.Visible = true;
                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "StudentMaster.aspx");
                    divStudentUploadview.Visible = false;
                    divStudentUploads.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
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
        catch
        {
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
            //Response.Redirect("../oops.aspx");
        }
    }

    protected void btncancel1_Click(object sender, EventArgs e)
    {

    }
    protected void btnsearch2_Click(object sender, EventArgs e)
    {

    }
    protected void btnrefresh2_Click(object sender, EventArgs e)
    {

    }


    protected void rblTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblTypes.SelectedValue == "Sketches")
        {
            DivSketchTypes.Visible = true;
            DivBlog.Visible = false;
            DivBlog1.Visible = false;
            DivPoem.Visible = false;
            DivPoem1.Visible = false;
            DivArticles.Visible = false;
            DivArticles1.Visible = false;
        }
        else if (rblTypes.SelectedValue == "Blog")
        {
            DivSketchTypes.Visible = false;
            DivBlog.Visible = true;
            DivBlog1.Visible = true;
            DivPoem.Visible = false;
            DivPoem1.Visible = false;
            DivArticles.Visible = false;
            DivArticles1.Visible = false;
        }
        else if (rblTypes.SelectedValue == "Poem")
        {
            DivSketchTypes.Visible = false;
            DivBlog.Visible = false;
            DivBlog1.Visible = false;
            DivPoem.Visible = true;
            DivPoem1.Visible = true;
            DivArticles.Visible = false;
            DivArticles1.Visible = false;
        }
        else if (rblTypes.SelectedValue == "Articles")
        {
            DivSketchTypes.Visible = false;
            DivBlog.Visible = false;
            DivBlog1.Visible = false;
            DivPoem.Visible = false;
            DivPoem1.Visible = false;
            DivArticles.Visible = true;
            DivArticles1.Visible = true;
        }
        else
        {
            DivSketchTypes.Visible = false;
            DivBlog.Visible = false;
            DivBlog1.Visible = false;
            DivPoem.Visible = false;
            DivPoem1.Visible = false;
            DivArticles.Visible = false;
            DivArticles1.Visible = false;
        }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {

    }
}