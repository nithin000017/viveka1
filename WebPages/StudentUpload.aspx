<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PrivateMasterPage.master" AutoEventWireup="true" CodeFile="StudentUpload.aspx.cs" Inherits="WebPages_StudentUpload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function ShowImagePreview1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage.ClientID%>').prop('Src', e.target.result)
                        .width(105)
                        .height(105);
                }
                reader.readAsDataURL(input.files[0]);
                }
            }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <div class="container">
        <div class="row" runat="server" visible="true" id="divStudentUploads">

            <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <asp:Label ID="Label3" runat="server" Text="Student Uploads" Font-Size="25pt" ForeColor="#565029" Font-Bold="true" Style="font-size: 40px; padding-left: 38%; font-family: -webkit-body;"></asp:Label>
                </div>
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-10"></div>
                    <div class="col-md-2 ">
                        <asp:Button ID="btnview2" runat="server" Text="VIEW" OnClick="btnview2_Click" Style="color: #fff; border-radius: 5px; background-color: #4CAF50; box-shadow: 0 9px #999; width: 75px; height: 35px;" />
                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col-md-3 aligntext">
                        <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="Lbldepartment" runat="server" Text="Department :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:DropDownList ID="DdlDepartment" runat="server" Width="96%" Height="37px" CssClass="form-control">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Mechanical</asp:ListItem>
                            <asp:ListItem>Computer Science</asp:ListItem>
                            <asp:ListItem>Civil</asp:ListItem>
                            <asp:ListItem>Electrical</asp:ListItem>
                            <asp:ListItem>Automobile</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-3 aligntext">
                        <asp:Label ID="Label17" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblname" runat="server" Text="Student Name :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:TextBox ID="txtname" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3 aligntext">
                        <asp:Label ID="Label21" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblregno" runat="server" Text="Student Regno :" Font-Bold="true"></asp:Label>


                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:TextBox ID="txtregno" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Registration Number" ControlToValidate="txtregno"></asp:RequiredFieldValidator>
                    </div>


                </div>
                <br />



                <div class="row">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblTypes" runat="server" Text="Types :" Font-Bold="true"></asp:Label>
                    </div>

                    <asp:RadioButtonList ID="rblTypes" AutoPostBack="true" runat="server" OnSelectedIndexChanged="rblTypes_SelectedIndexChanged">
                        <asp:ListItem>Sketches</asp:ListItem>
                        <asp:ListItem>Blog</asp:ListItem>
                        <asp:ListItem>Poem</asp:ListItem>
                        <asp:ListItem>Articles</asp:ListItem>
                    </asp:RadioButtonList>

                </div>
                <br />

                <div class="row" runat="server" id="DivSketchTypes" visible="false">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsketchtypes" runat="server" Text="Sketch Types :" Font-Bold="true"></asp:Label>
                    </div>

                    <%-- radio button will be horizontal--%>
                    <%--RepeatColumns="4"--%>

                    <asp:RadioButtonList ID="rblsketchtypes" runat="server">
                        <asp:ListItem>3d Art</asp:ListItem>
                        <asp:ListItem>Pencil Art</asp:ListItem>
                        <asp:ListItem>Painting</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                    </asp:RadioButtonList>

                </div>
                <br />

                <div class="row" runat="server" id="DivBlog" visible="false">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label18" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblblogtype" runat="server" Text="Blog Types :" Font-Bold="true"></asp:Label>
                    </div>

                    <%-- radio button will be horizontal--%>
                    <%--RepeatColumns="4"--%>

                    <asp:RadioButtonList ID="rblblogtype" runat="server">
                        <asp:ListItem>Kannada Blog</asp:ListItem>
                        <asp:ListItem>English Blog</asp:ListItem>
                        <asp:ListItem>Hindi Blog</asp:ListItem>
                    </asp:RadioButtonList>

                </div>
                <br />

                <div class="row" runat="server" id="DivBlog1" visible="false">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lbldescription1" runat="server" Text="Description :" Font-Bold="true"></asp:Label>
                    </div>

                    <div class="col-md-7 aligntext1">
                        <cc2:Editor ID="editor1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Description" ControlToValidate="editor1"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <br />

                <div class="row" runat="server" id="DivPoem" visible="false">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label22" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblpoemtypes" runat="server" Text="Poem Types :" Font-Bold="true"></asp:Label>
                    </div>

                    <%-- radio button will be horizontal--%>
                    <%--RepeatColumns="4"--%>

                    <asp:RadioButtonList ID="rblpoemtypes" runat="server">
                        <asp:ListItem>Kannada Poem</asp:ListItem>
                        <asp:ListItem>English Poem</asp:ListItem>
                        <asp:ListItem>Hindi Poem</asp:ListItem>
                    </asp:RadioButtonList>

                </div>
                <br />

                <div class="row" runat="server" id="DivPoem1" visible="false">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lbldescription2" runat="server" Text="Description :" Font-Bold="true"></asp:Label>
                    </div>

                    <div class="col-md-7 aligntext1">
                        <cc2:Editor ID="editor2" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Description" ControlToValidate="editor2"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <br />

                <div class="row" runat="server" id="DivArticles" visible="false">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label23" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblarticlestypes" runat="server" Text="Articles Types :" Font-Bold="true"></asp:Label>
                    </div>

                    <%-- radio button will be horizontal--%>
                    <%--RepeatColumns="4"--%>

                    <asp:RadioButtonList ID="rblarticlestypes" runat="server">
                        <asp:ListItem>Kannada Articles</asp:ListItem>
                        <asp:ListItem>English Articles</asp:ListItem>
                        <asp:ListItem>Hindi Articles</asp:ListItem>
                    </asp:RadioButtonList>

                </div>
                <br />

                <div class="row" runat="server" id="DivArticles1" visible="false">

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lbldescription3" runat="server" Text="Description :" Font-Bold="true"></asp:Label>
                    </div>

                    <div class="col-md-7 aligntext1">
                        <cc2:Editor ID="editor3" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Description" ControlToValidate="editor3"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <br />


                <div class="row">
                    <div class="col-md-2 aligntext1">
                        <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblphoto" Text="Photo :" runat="server" CssClass="anfrmlbl" Font-Bold="true" />
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:FileUpload ID="fupImage" runat="server" CssClass="form-control" ForeColor="Black" onchange="readURL(this);" />
                        <br />
                        <img id="PreviewImage" runat="server" src="../ASPXImages/noimage1.jpg" style="width: 105px; height: 105px; border: 3px solid" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="fupImage"
                            CssClass="LabelStyleValidation" ErrorMessage="Only gif, jpeg, png,bmp files are allowed!"
                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG|.bmp|.BMP)$">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please upload photo" ControlToValidate="fupImage" CssClass="LabelStyleValidation" ForeColor="red"></asp:RequiredFieldValidator>
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="col-md-1"></div>

                    <div class="col-md-2 aligntext1 ">
                        <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lbltitle" runat="server" Text="Title :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="txttitle" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Title" ControlToValidate="txttitle"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <br />

                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <asp:Button ID="btnsave1" runat="server" Text="Save" Width="50%" OnClick="btnsave1_Click" CausesValidation="false" />

                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btncancel1" runat="server" Text="Cancel" Width="50%" OnClick="btncancel1_Click" CausesValidation="false" />
                    </div>

                </div>

            </div>
        </div>

        <br />


        <div class="row" runat="server" visible="true" id="divStudentUploadview">

            <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <div class="col-md-12 com-xs-12" style="text-align: center; font-family: -webkit-body;">
                        <asp:Label ID="Label6" runat="server" Text="View Student Uploads" Font-Size="25pt" ForeColor="#565029" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <hr />

                <br />

                <div class="row">
                    <div class="col-md-10"></div>
                    <div class="col-md-2 ">
                        <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" Style="color: #fff; border-radius: 5px; background-color: #4CAF50; box-shadow: 0 9px #999; width: 75px; height: 35px;" />
                    </div>
                </div>

                <br />


                <div class="row">

                    <div class="col-md-2 aligntext1">
                        <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text="Title :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="txtusername1" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Title" ControlToValidate="txtusername1"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-1"></div>

                    <div class="col-md-3 aligntext1">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="Label14" runat="server" Text="Types :" Font-Bold="true"></asp:Label>
                    </div>

                    <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                        <asp:ListItem>Sketches</asp:ListItem>
                        <asp:ListItem>Blog</asp:ListItem>
                        <asp:ListItem>Poem</asp:ListItem>
                        <asp:ListItem>Articles</asp:ListItem>
                    </asp:RadioButtonList>

                </div>

                <br />



                <div class="row">

                    <div class="col-md-3 aligntext1">
                        <asp:Label ID="Label19" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="Label20" runat="server" Text="Show :" Font-Bold="true"></asp:Label>
                    </div>

                    <asp:DropDownList ID="ddlShowTop" runat="server" Width="44px" Height="27px">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem Selected="true">10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                    </asp:DropDownList>

                </div>

                <br />
                <br />

                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2 ">
                        <asp:Button ID="btnsearch2" runat="server" Text="Search" OnClick="btnsearch2_Click" />

                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnrefresh2" runat="server" Text="Refresh" Width="50%" OnClick="btnrefresh2_Click" CausesValidation="false" />
                    </div>

                </div>
            </div>

            <asp:GridView ID="gvUploadview" runat="server" AutoGenerateColumns="true" CssClass="Admingridtable1" EmptyDataText="No Records Found!!!" Width="64%" EnableModelValidation="True">

                <Columns>
                    <asp:TemplateField HeaderText="Sl.No">
                        <ItemTemplate>
                            <asp:Label ID="slno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            <asp:Label ID="lblStdmid" runat="server" Text='<%#Eval("Reg_MID") %>' Width="150px" Visible="false"></asp:Label>
                            <asp:Label ID="lblAchmid" runat="server" Text='<%#Eval("Art_MID") %>' Width="150px" Visible="false"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="60px" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdt" runat="server" CommandName="Edt" CommandArgument='<%# Eval("Art_MID") %>' OnClientClick="return confirm('Are you sure you want to Edit? '); aspnetForm.target ='_self'"><i class="fa fa-edit" style="color:#563a09; font-size:1.5em;Width:15px"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:Label ID="lblGTitle" runat="server" Text='<%# Eval("Art_Title") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Types">
                        <ItemTemplate>
                            <asp:Label ID="lblGTypes" runat="server" Text='<%# Eval("Art_Types") %>' Width="150px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblGStatus" runat="server" Text='<%# Eval("Art_Status") %>' Width="150px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("Art_MId") %>' OnClientClick="return confirm('Are you sure you want to delete? '); aspnetForm.target ='_self'"><i class="fa fa-trash" style="color:red; font-size:1.5em;"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

    </div>


    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#ctl00_ContentPlaceHolder1_PreviewImage').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        };
    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

