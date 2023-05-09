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

public partial class WebPages_Event : System.Web.UI.Page
{
    DataManager dm = new DataManager();
    SqlConnection objsql = new SqlConnection(ConfigurationManager.AppSettings["ConnStr"].ToString());
    int FlagPhoto = 0;
    int FlagAadhar = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindEvent();
            divEventAdd.Visible = false;
            divViewEvent.Visible = true;

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
    private void BindEvent()
    {
        try
        {

            gvevent.DataSource = null;
            gvevent.DataBind();
            string count = "";

            if (ddlShowTop.SelectedIndex > 0)
            {
                int top = int.Parse(ddlShowTop.SelectedItem.ToString());
                count += " top(" + top + ") ";
            }

            string Qry = "SELECT   *,convert(varchar,Event_Date,103) as date FROM dbo.tbl_Events WHERE Event_ActiveFlag=1";

            if (txttitle1.Text != "")
                Qry += " AND Event_Title LIKE '%" + txttitle1.Text + "%'";
            if (txtDate.Text != "")
                Qry += " AND Event_Date LIKE '%" + txtDate.Text + "%'";
            if (TxtAttch1.Text != "")
                Qry += " AND Event_AttachmentTitle LIKE '%" + TxtAttch1.Text + "%'";
            if (editor3.Content != "")
                Qry += " AND Event_Description LIKE '%" + editor3.Content + "%'";


            Qry += " order by Event_MID desc";
            Qry += " Select count(Event_MID) TotalRecords from tbl_Events where Event_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(Qry);
            if (ds != null)
            {
                gvevent.DataSource = ds.Tables[0];
                gvevent.DataBind();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }


    private void ClearAll()
    {
        Response.Redirect("../webpages/Event.aspx");
    }
    #region Image
    public void UploadImage()
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
            Response.Redirect("../webpages/Event.aspx");
        }
    }
    public void UploadImage1()
    {
        try
        {
            string filename1 = System.IO.Path.GetFileName(fupImage1.PostedFile.FileName);
            Random r = new Random();
            int randomno = r.Next();

            string sImageFileExtension = filename1.Substring(filename1.LastIndexOf(".")).ToLower();
            string flnm = Path.GetFileNameWithoutExtension(filename1);
            if (sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".png")
            {
                string newfilename = randomno + "_" + flnm + sImageFileExtension;
                string strFPath1 = "~/RegPhoto/" + newfilename;
                fupImage1.PostedFile.SaveAs(Server.MapPath(strFPath1));
                Session["ImagePath1"] = strFPath1;
                CompressAndUploadPhoto1(fupImage1);
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../webpages/Event.aspx");
        }
    }
    public void UploadImage2()
    {
        try
        {
            string filename2 = System.IO.Path.GetFileName(fupImage2.PostedFile.FileName);
            Random r = new Random();
            int randomno = r.Next();

            string sImageFileExtension = filename2.Substring(filename2.LastIndexOf(".")).ToLower();
            string flnm = Path.GetFileNameWithoutExtension(filename2);
            if (sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".png")
            {
                string newfilename = randomno + "_" + flnm + sImageFileExtension;
                string strFPath2 = "~/RegPhoto/" + newfilename;
                fupImage2.PostedFile.SaveAs(Server.MapPath(strFPath2));
                Session["ImagePath2"] = strFPath2;
                CompressAndUploadPhoto2(fupImage2);

            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../webpages/Event.aspx");
        }
    }
    public void UploadImage3()
    {
        try
        {
            string filename3 = System.IO.Path.GetFileName(fupImage3.PostedFile.FileName);
            Random r = new Random();
            int randomno = r.Next();

            string sImageFileExtension = filename3.Substring(filename3.LastIndexOf(".")).ToLower();
            string flnm = Path.GetFileNameWithoutExtension(filename3);
            if (sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".png")
            {
                string newfilename = randomno + "_" + flnm + sImageFileExtension;
                string strFPath3 = "~/RegPhoto/" + newfilename;
                fupImage3.PostedFile.SaveAs(Server.MapPath(strFPath3));
                Session["ImagePath3"] = strFPath3;
                CompressAndUploadPhoto3(fupImage3);

            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../webpages/Event.aspx");
        }
    }
    public void UploadImage4()
    {
        try
        {
            string filename4 = System.IO.Path.GetFileName(fupImage4.PostedFile.FileName);
            Random r = new Random();
            int randomno = r.Next();

            string sImageFileExtension = filename4.Substring(filename4.LastIndexOf(".")).ToLower();
            string flnm = Path.GetFileNameWithoutExtension(filename4);
            if (sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".png")
            {
                string newfilename = randomno + "_" + flnm + sImageFileExtension;
                string strFPath4 = "~/RegPhoto/" + newfilename;
                fupImage4.PostedFile.SaveAs(Server.MapPath(strFPath4));
                Session["ImagePath4"] = strFPath4;
                CompressAndUploadPhoto4(fupImage4);

            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../webpages/Event.aspx");
        }
    }

    #region Compress_Image
    protected void CompressAndUploadPhoto(FileUpload FileUploadImg)
    {
        try
        {
            // First we check to see if the user has selected a file
            if (FileUploadImg.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUploadImg.FileName;

                // Specify the upload directory
                string directory = Server.MapPath("~/RegPhoto/");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

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
                string strPath = directory + "Viveka_" + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath = "~/RegPhoto/" + "Viveka_" + randomno + sImageFileExtension;
                Session["ImagePath"] = strFPath;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("~/oops.aspx");
        }
    }

    protected void CompressAndUploadPhoto1(FileUpload FileUploadImg)
    {
        try
        {
            // First we check to see if the user has selected a file
            if (FileUploadImg.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUploadImg.FileName;

                // Specify the upload directory
                string directory = Server.MapPath("~/RegPhoto/");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

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
                string strPath = directory + "Viveka_" + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath1 = "~/RegPhoto/" + "Viveka_" + randomno + sImageFileExtension;
                Session["ImagePath1"] = strFPath1;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../oops.aspx");
        }
    }
    protected void CompressAndUploadPhoto2(FileUpload FileUploadImg)
    {
        try
        {
            // First we check to see if the user has selected a file
            if (FileUploadImg.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUploadImg.FileName;

                // Specify the upload directory
                string directory = Server.MapPath("~/RegPhoto/");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

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
                string strPath = directory + "Viveka_" + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath2 = "~/RegPhoto/" + "Viveka_" + randomno + sImageFileExtension;
                Session["ImagePath2"] = strFPath2;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../oops.aspx");
        }
    }
    protected void CompressAndUploadPhoto3(FileUpload FileUploadImg)
    {
        try
        {
            // First we check to see if the user has selected a file
            if (FileUploadImg.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUploadImg.FileName;

                // Specify the upload directory
                string directory = Server.MapPath("~/RegPhoto/");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

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
                string strPath = directory + "Viveka_" + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath3 = "~/RegPhoto/" + "Viveka_" + randomno + sImageFileExtension;
                Session["ImagePath3"] = strFPath3;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../oops.aspx");
        }
    }
    protected void CompressAndUploadPhoto4(FileUpload FileUploadImg)
    {
        try
        {
            // First we check to see if the user has selected a file
            if (FileUploadImg.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUploadImg.FileName;

                // Specify the upload directory
                string directory = Server.MapPath("~/RegPhoto/");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

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
                string strPath = directory + "Viveka_" + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath4 = "~/RegPhoto/" + "Viveka_" + randomno + sImageFileExtension;
                Session["ImagePath4"] = strFPath4;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../oops.aspx");
        }
    }
    #endregion
    #endregion

    public void UploadFilePDF(FileUpload fu, string path)
    {

        try
        {
            string filename = System.IO.Path.GetFileName(fu.PostedFile.FileName);
            Random r = new Random();
            int randomno = r.Next();

            string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
            string flnm = Path.GetFileNameWithoutExtension(filename);
            if (sImageFileExtension == ".pdf" || sImageFileExtension == ".PDF" || sImageFileExtension == ".doc" || sImageFileExtension == ".DOC")
            {

                string newfilename = randomno + "_" + flnm + sImageFileExtension;
                string strFPath = "~/RegPhoto/" + newfilename;
                fu.PostedFile.SaveAs(Server.MapPath(strFPath));
                Session["filepath"] = strFPath;
            }
            else
            {

            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../webpages/Event.aspx");
        }

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string Title = txttitle.Text;
            string Date = txtDate.Text;
            string AttacmentTitle = TxtAtt1.Text;
            string a1 = "";
            string Photo1 = "";
            string Photo2 = "";
            string Photo3 = "";
            string Photo4 = "";
            string Photo5 = "";
            string Description = editor3.Content;

            //int Mid = int.Parse(Session["Event_MID"].ToString());


            if (btnsave.Text == "Save")
            {
                if (fupAttach1.HasFile)
                {
                    UploadFilePDF(fupAttach1, "");

                    a1 = Session["filepath"].ToString();

                }


                if (fupImage.HasFile)
                {
                    UploadImage();
                    if (Session["ImagePath"] != null)
                    {
                        Photo1 = Session["ImagePath"].ToString();
                    }
                }
                else
                {
                    Photo1 = PreviewImage.Src;
                }

                if (fupImage1.HasFile)
                {
                    UploadImage1();
                    if (Session["ImagePath1"] != null)
                    {
                        Photo2 = Session["ImagePath1"].ToString();
                    }
                }
                else
                {
                    Photo2 = PreviewImage1.Src;
                }

                if (fupImage2.HasFile)
                {
                    UploadImage2();
                    if (Session["ImagePath2"] != null)
                    {
                        Photo3 = Session["ImagePath2"].ToString();
                    }
                }
                else
                {
                    Photo3 = PreviewImage2.Src;
                }

                if (fupImage3.HasFile)
                {
                    UploadImage3();
                    if (Session["ImagePath3"] != null)
                    {
                        Photo4 = Session["ImagePath3"].ToString();
                    }
                }
                else
                {
                    Photo4 = PreviewImage3.Src;
                }

                if (fupImage4.HasFile)
                {
                    UploadImage4();
                    if (Session["ImagePath4"] != null)
                    {
                        Photo5 = Session["ImagePath4"].ToString();
                    }
                }
                else
                {
                    Photo5 = PreviewImage4.Src;
                }



                if (txtDate.Text != "")
                {
                    Date = DateTime.ParseExact(txtDate.Text.Replace("-", "/"), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture).ToString("MM/dd/yyyy");
                }
                string qry = "Insert into tbl_Events(Event_Title,Event_Date,Event_AttachmentTitle,Event_Attachment,Event_Photo1,Event_Photo2,Event_Photo3,Event_Photo4,Event_Photo5,Event_Description)values('" + Title + "','" + Date + "','" + AttacmentTitle + "','" + a1 + "','" + Photo1 + "','" + Photo2 + "','" + Photo3 + "','" + Photo4 + "','" + Photo5 + "','" + Description + "')";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry, objsql);
                int res = cmd.ExecuteNonQuery();
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Submitted Successfully", "Event.aspx");
                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "Event.aspx");
                }
            }
            else
            {
                if (fupAttach1.HasFile)
                {
                    UploadFilePDF(fupAttach1, "");

                    a1 = Session["filepath"].ToString();

                }


                if (fupImage.HasFile)
                {
                    UploadImage();
                    if (Session["ImagePath"] != null)
                    {
                        Photo1 = Session["ImagePath"].ToString();
                    }
                }
                else
                {
                    Photo1 = PreviewImage.Src;
                }

                if (fupImage1.HasFile)
                {
                    UploadImage1();
                    if (Session["ImagePath1"] != null)
                    {
                        Photo2 = Session["ImagePath1"].ToString();
                    }
                }
                else
                {
                    Photo2 = PreviewImage1.Src;
                }

                if (fupImage2.HasFile)
                {
                    UploadImage2();
                    if (Session["ImagePath2"] != null)
                    {
                        Photo3 = Session["ImagePath2"].ToString();
                    }
                }
                else
                {
                    Photo3 = PreviewImage2.Src;
                }

                if (fupImage3.HasFile)
                {
                    UploadImage3();
                    if (Session["ImagePath3"] != null)
                    {
                        Photo4 = Session["ImagePath3"].ToString();
                    }
                }
                else
                {
                    Photo4 = PreviewImage3.Src;
                }

                if (fupImage4.HasFile)
                {
                    UploadImage4();
                    if (Session["ImagePath4"] != null)
                    {
                        Photo5 = Session["ImagePath4"].ToString();
                    }
                }
                else
                {
                    Photo5 = PreviewImage4.Src;
                }

                string qry1 = "update tbl_Events set Event_Title='" + Title + "',Event_Date='" + Date + "',Event_AttachmentTitle='" + AttacmentTitle + "',Event_Attachment='" + a1 + "',Event_Photo1='" + Photo1 + "',Event_Photo2='" + Photo2 + "',Event_Photo3='" + Photo3 + "',Event_Photo4='" + Photo4 + "',Event_Photo5='" + Photo5 + "',Event_Description='" + Description + "'where Event_MID=" + int.Parse(Session["Event_MID"].ToString()) + "";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry1, objsql);
                int res = cmd.ExecuteNonQuery();
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Updated Successfully", "Event.aspx");

                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "Event.aspx");

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
        ClearAll();
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        BindEvent();
    }
    protected void btnrefresh_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        BindEvent();
        divEventAdd.Visible = true;
        divViewEvent.Visible = false;
        gvevent.Visible = false;
    }


    private void GetRegDetails(int Mid)
    {
        string Query = "SELECT   *,convert(varchar,Event_Date,103) as date FROM dbo.tbl_Events WHERE Event_ActiveFlag=1 and Event_MID=" + Mid + "";
        DataSet ds = dm.GetDataSet(Query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtDate.Text = ds.Tables[0].Rows[0]["date"].ToString();
            txttitle.Text = ds.Tables[0].Rows[0]["Event_Title"].ToString();
            TxtAtt1.Text = ds.Tables[0].Rows[0]["Event_AttachmentTitle"].ToString();

            editor3.Content = ds.Tables[0].Rows[0]["Event_Description"].ToString();
            PreviewImage.Src = ds.Tables[0].Rows[0]["Event_Photo1"].ToString().Replace("~", "..");
            PreviewImage1.Src = ds.Tables[0].Rows[0]["Event_Photo2"].ToString().Replace("~", "..");
            PreviewImage2.Src = ds.Tables[0].Rows[0]["Event_Photo3"].ToString().Replace("~", "..");
            PreviewImage3.Src = ds.Tables[0].Rows[0]["Event_Photo4"].ToString().Replace("~", "..");
            PreviewImage4.Src = ds.Tables[0].Rows[0]["Event_Photo5"].ToString().Replace("~", "..");

            if (ds.Tables[0].Rows[0]["Event_Attachment"].ToString() != "")
            {
                aAttach1.Visible = true;
                aAttach1.HRef = ds.Tables[0].Rows[0]["Event_Attachment"].ToString().Replace("~", ".."); 
            }
            btnsave.Text = "Update";
            RequiredFieldValidator5.Enabled = false;
            gvevent.Visible = false;
            divEventAdd.Visible = true;
            divViewEvent.Visible = false;
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        BindEvent();
        divEventAdd.Visible = false;
        divViewEvent.Visible = true;
        gvevent.Visible = true;
    }
    protected void gvevent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdEdit1")
        {
            int RegId = int.Parse(e.CommandArgument.ToString());

            string qry = "select *,convert(varchar,Event_Date,103) as date from dbo.tbl_Events where  Event_ActiveFlag=1  and Event_MID='" + RegId + "'";
            DataSet ds = dm.GetDataSet(qry);
            if (ds != null)
            {
                Session["Event_MID"] = RegId.ToString();


                GetRegDetails(RegId);

                divEventAdd.Visible = true;
                divViewEvent.Visible = false;
            }
        }
        else if (e.CommandName == "Del")
        {
            try
            {

                int RegId = int.Parse(e.CommandArgument.ToString());
                int UserId = 0;// int.Parse(Session["UserId"].ToString());
                int Result = 0;


                string qry1 = "update tbl_Events set Event_ActiveFlag=0 where Event_MID='" + RegId + "'";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry1, objsql);
                int res = cmd.ExecuteNonQuery();
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Deleted Successfully", "Event.aspx");

                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "Event.aspx");

                }
            }
            catch (Exception ex)
            {
                ex.Data.Clear();

            }

        }
    }
}