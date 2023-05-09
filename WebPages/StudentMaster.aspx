<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PrivateMasterPage.master" AutoEventWireup="true" CodeFile="StudentMaster.aspx.cs" Inherits="WebPages_Achievements" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                }
                reader.readAsDataURL(input.files[0]);
                }
            }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <div class="container">

        <div class="row" runat="server" visible="false" id="divAddStudent">
            <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <div class="col-md-12 com-xs-12" style="text-align: center; font-family: -webkit-body;">
                        <asp:Label ID="Label21" runat="server" Text="ADD STUDENT MASTER" Font-Size="25pt" ForeColor="#565029" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-10"></div>
                    <div class="col-md-2 ">
                        <asp:Button ID="btnRegViewStud" CausesValidation="false" runat="server" Text="BACK" OnClick="btnRegViewStud_Click" />
                    </div>

                </div>

                <br />


                <div class="row">

                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label24" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegDepartment" runat="server" Text="Department :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:DropDownList ID="DdlRegDepartment" runat="server" OnSelectedIndexChanged="DdlRegDepartment_SelectedIndexChanged" AutoPostBack="true" Width="81%" Height="38px" CssClass="form-control">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Mechanical</asp:ListItem>
                            <asp:ListItem>Computer Science</asp:ListItem>
                            <asp:ListItem>Civil</asp:ListItem>
                            <asp:ListItem>Electrical</asp:ListItem>
                            <asp:ListItem>Automobile</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Department" ControlToValidate="DdlRegDepartment"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="row">

                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label22" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegno" runat="server" Text="Reg NO. :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtRegNo" runat="server" ReadOnly="true" CssClass="form-control" Width="82%" BackColor="#ffe3ab" Font-Bold="true" ForeColor="#a10000"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Registration Number" ControlToValidate="TxtRegNo"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label23" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegName" runat="server" Text="Name :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtRegName" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Name" ControlToValidate="TxtRegName"></asp:RequiredFieldValidator>

                    </div>


                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label25" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegClass" runat="server" Text="Class :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtRegClass" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Class" ControlToValidate="TxtRegClass"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label26" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegContact" runat="server" Text="Contact Number :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtRegContact" runat="server" CssClass="form-control" Width="82%" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Contact Number" ControlToValidate="TxtRegContact"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label27" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegEmail" runat="server" Text="Email Id :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtRegEmail" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="TxtRegEmail"></asp:RequiredFieldValidator>

                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegRole" runat="server" Text="Role :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtRegRole" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter Role" ControlToValidate="TxtRegRole"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-2 aligntext">
                        <asp:Label ID="Label17" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblRegPassword" runat="server" Text=" Password :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtRegPassword" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Enter Password" ControlToValidate="TxtRegPassword"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="row">

                    <div class="col-md-8"></div>
                    <div class="col-md-4">
                        <asp:Button ID="btnRegSubmit" runat="server" Text="Submit"  OnClick="btnRegSubmit_Click"  />

                        <asp:Button ID="btnRegReset" runat="server" Text="RESET"  OnClick="btnRegReset_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>



        <div class="row" runat="server" visible="true" id="divAchievement">

            <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <asp:Label ID="Label3" runat="server" Text="ADD ACHIEVEMENTS" Font-Size="25pt" ForeColor="#565029" Font-Bold="true" Style="font-size: 40px; padding-left: 38%; font-family: -webkit-body;"></asp:Label>
                </div>
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-8"></div>
                    <div class="col-md-2 ">
                        <asp:Button ID="btnview" CausesValidation="false" runat="server" Text="BACK" OnClick="btnview_Click"  />
                    </div>
                    <div class="col-md-1 "></div>
                </div>

                <br />

                <div class="row">

                    <div class="col-md-3 aligntext">
                        <div class="col-md-3"></div>
                        <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblDepartment" runat="server" Text="Department :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:DropDownList ID="ddlDepartment" runat="server" Width="145px" Height="32px" CssClass="form-control">
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
                        <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text="Student Name :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:TextBox ID="txtName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3 aligntext">
                        <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text="Student Regno :" Font-Bold="true"></asp:Label>


                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:TextBox ID="txtrRegNo" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Registration Number" ControlToValidate="txtrRegNo"></asp:RequiredFieldValidator>
                    </div>


                </div>

                <br />

                <div class="row">
                    <div class="col-md-3 aligntext">
                        <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblTitle" runat="server" Text="Achievement Title :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:TextBox ID="TxtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Title" ControlToValidate="TxtTitle"></asp:RequiredFieldValidator>
                    </div>


                    <div class="col-md-3 aligntext">
                        <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblPhoto" Text="Photo :" runat="server" CssClass="anfrmlbl" Font-Bold="true" />
                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:FileUpload ID="fupImage" runat="server" CssClass="form-control" ForeColor="Black" onchange="ShowImagePreview(this);" />
                        <br />
                        <img id="PreviewImage" runat="server" src="../ASPXImages/noimage1.jpg" style="width: 105px; height: 105px; border: 3px solid" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="fupImage"
                            CssClass="LabelStyleValidation" ErrorMessage="Only gif, jpeg, png,bmp files are allowed!"
                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG|.bmp|.BMP)$">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please upload photo" ControlToValidate="fupImage" CssClass="LabelStyleValidation" ForeColor="red"></asp:RequiredFieldValidator>
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-3 aligntext">

                        <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="LblDescription" runat="server" Text="Achievement Description :" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-8 aligntext1">
                        <cc2:Editor ID="editor3" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Description" ControlToValidate="editor3"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <asp:Button ID="btnsave" runat="server" Text="Save" Width="50%" OnClick="btnsave_Click" CausesValidation="false" />

                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btncancel" runat="server" Text="Cancel" Width="50%" OnClick="btncancel_Click" CausesValidation="false" />
                    </div>

                </div>

            </div>
        </div>


        <br />


        <div class="row" runat="server" visible="false" id="divAchievementview">

            <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <div class="col-md-12 com-xs-12" style="text-align: center; font-family: -webkit-body;">
                        <asp:Label ID="Label6" runat="server" Text="STUDENT MASTER" Font-Size="25pt" ForeColor="#565029" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-5 aligntext1">

                        <asp:Button ID="btnStdMAster" CausesValidation="false" runat="server" Text="ADD STUDENT" OnClick="btnStdMAster_Click" />
                    </div>
                    <div class="col-md-5 aligntext">

                        <asp:Button ID="btnadd" CausesValidation="false" runat="server" Text="VIEW ACHIEVEMENTS" OnClick="btnadd_Click" />
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br />


                <div class="container" style="padding: 10px; width: 1000px; box-shadow: 0px 0px 6px 0px rgb(0 0 0 / 18%)">
                    <div style="">
                        <div class="row">
                            <div class="col-md-1 aligntext">
                                <asp:Label ID="Label4" runat="server" Text="Search by -"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="row">

                            <div class="col-md-2 aligntext">

                                <asp:Label ID="lblsRegNo" runat="server" Text="Reg Number :" Font-Bold="true"></asp:Label>

                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:TextBox ID="TxtSRegNo" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>

                            </div>

                            <div class="col-md-2 aligntext">

                                <asp:Label ID="LblName" runat="server" Text="Name :" Font-Bold="true"></asp:Label>

                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:TextBox ID="TxtsName" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>

                            </div>
                        </div>
                        <br />
                        <div class="row">

                            <div class="col-md-2 aligntext">

                                <asp:Label ID="LblSDepartment" runat="server" Text="Department :" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:DropDownList ID="DdlsDepartment" runat="server" Width="82%" Height="37px" CssClass="form-control">
                                    <asp:ListItem  Selected="True">--Select--</asp:ListItem>
                                    <asp:ListItem>Mechanical</asp:ListItem>
                                    <asp:ListItem>Computer Science</asp:ListItem>
                                    <asp:ListItem>Civil</asp:ListItem>
                                    <asp:ListItem>Electrical</asp:ListItem>
                                    <asp:ListItem>Automobile</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-2 aligntext">

                                <asp:Label ID="LblsClass" runat="server" Text="Class :" Font-Bold="true"></asp:Label>

                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:TextBox ID="TxtSClass" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>

                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="LblContact" runat="server" Text="Contact Number :" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:TextBox ID="TxtContact" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="LblSEmailId" runat="server" Text="Email Id :" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:TextBox ID="TxtsEmailId" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>

                            </div>
                        </div>


                        <br />



                        <div class="row">

                            <div class="col-md-2 aligntext">
                                <asp:Label ID="lblShow" runat="server" Text="Show :" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:DropDownList ID="ddlShowTop" runat="server" Height="27px">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem Selected="true">10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                </asp:DropDownList>
                            </div>


                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4 ">
                                <asp:Button ID="btnsearch" runat="server" Text="SEARCH" OnClick="btnsearch_Click" CausesValidation="false"  />

                                &nbsp;
                        <asp:Button ID="btnrefresh" runat="server" Text="REFRESH" OnClick="btnrefresh_Click" CausesValidation="false" />
                            </div>

                        </div>

                        <br />
                        <br />


                        <div class="row">
                            <div class="col-md-12" style="overflow-x: scroll;">
                                <asp:GridView ID="gvAchievementview" runat="server" AutoGenerateColumns="false" OnRowCommand="gvAchievementview_RowCommand" CssClass="Admingridtable1" EmptyDataText="No Records Found!!!" EnableModelValidation="True">






                                    <Columns>
                                        <asp:TemplateField HeaderText="SL.No">
                                            <ItemTemplate>
                                                <asp:Label ID="slno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="ADD">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lnkedit" CommandArgument='<%#Eval("Reg_MID") %>'
                                                    CommandName="cmdEdit" CausesValidation="false" OnClientClick="return confirm('Are you sure want to Add Achievement?')">
                                            <i class="fa fa-trophy" style="font-size:18px;color:#f15b4e;"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EDIT">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lnkedit1" CommandArgument='<%#Eval("Reg_MID") %>'
                                                    CommandName="cmdEdit1" CausesValidation="false" OnClientClick="return confirm('Are you sure want to Edit Student Details?')">
                                            <i class="fa fa-edit" style="font-size:18px;color:#f15b4e;"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="REG NO">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGTitle" runat="server" Text='<%# Eval("Reg_RegNo") %>' Style="word-break: break-all; word-wrap: break-word"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText=" NAME">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldptName" runat="server" Text='<%#Eval("Reg_Name") %>'></asp:Label>
                                                <asp:Label ID="lblmid" runat="server" Text='<%#Eval("Reg_MID") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>




                                        <asp:TemplateField HeaderText="DEPARTMENT">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGDepartment" runat="server" Text='<%#Eval("Reg_Department") %>'></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>




                                        <asp:TemplateField HeaderText="CLASS">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClass" runat="server" Text='<%#Eval("Reg_Class") %>'></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Contact Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblContact" runat="server" Text='<%#Eval("Reg_Contact") %>'></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="EMAIL-ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Reg_Email") %>'></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="DELETE">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("Reg_MID") %>' OnClientClick="return confirm('Are you sure you want to Delete Student? '); aspnetForm.target ='_self'"><i class="fa fa-trash" style="font-size:18px;color:#f15b4e;"></i></asp:LinkButton></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>


                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row" runat="server" visible="false" id="divAchieventsGrid">
            <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <div class="col-md-12 com-xs-12" style="text-align: center; font-family: -webkit-body;">
                        <asp:Label ID="Label12" runat="server" Text="VIEW ACHIEVEMENTS" Font-Size="25pt" ForeColor="#565029" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-5 aligntext1"></div>
                    <div class="col-md-5 aligntext">
                        <asp:Button ID="btnStdBAck" CausesValidation="false" runat="server" Text="BACK" OnClick="btnStdBAck_Click" />
                    </div>
                </div>
                <br />
                <br />

                <div class="container" style="padding: 10px; width: 1000px; background-color: #fff0d1; box-shadow: 0px 0px 6px 0px rgb(0 0 0 / 18%)">
                    <div style="">
                        <div class="row">

                            <div class="col-md-3 aligntext">

                                <asp:Label ID="Label14" runat="server" Text="Title :" Font-Bold="true"></asp:Label>

                            </div>
                            <div class="col-md-3 aligntext1">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 aligntext">

                                <asp:Label ID="Label16" runat="server" Text="Show :" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="col-md-1aligntext1">
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem Selected="true">10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                </asp:DropDownList>
                            </div>


                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4 ">
                                <asp:Button ID="Button1" runat="server" Text="SEARCH" OnClick="btnsearch_Click" CausesValidation="false"  />

                                &nbsp;
                        <asp:Button ID="Button2" runat="server" Text="REFRESH" OnClick="btnrefresh_Click" CausesValidation="false" />
                            </div>

                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <asp:GridView ID="gvAchieve" runat="server" AutoGenerateColumns="false" OnRowCommand="gvAchieve_RowCommand"
                                    CssClass="Admingridtable1" EmptyDataText="No Records Found" EnableModelValidation="True" Width="100%">

                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl.No">
                                            <ItemTemplate>
                                                <asp:Label ID="slno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                <asp:Label ID="lblStdmid" runat="server" Text='<%#Eval("Reg_MID") %>' Width="150px" Visible="false"></asp:Label>
                                                <asp:Label ID="lblAchmid" runat="server" Text='<%#Eval("Achievement_MID") %>' Width="150px" Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="STUDENT DETAILS">
                                            <ItemTemplate>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="background-color: #fff0d1">DEPARTMENT
                                                        </td>
                                                        <td style="background-color: #fff0d1">CLASS
                                                        </td>
                                                        <td style="background-color: #fff0d1">REG NO.
                                                        </td>
                                                        <td style="background-color: #fff0d1">NAME
                                                        </td>



                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("Reg_Department") %>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Reg_Class")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Reg_RegNo")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Reg_Name")%>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ACHIEVMENT DETAILS">
                                            <ItemTemplate>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="background-color: #fff0d1">DESCRIPTION
                                                        </td>
                                                        <td style="background-color: #fff0d1">TITLE
                                                        </td>
                                                        <td style="background-color: #fff0d1">PHOTO
                                                        </td>




                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("Achievement_Description") %>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Achievement_Title")%>
                                                        </td>
                                                        <td>
                                                            <img id="PreviewImage" runat="server" src='<%# Eval("Achievement_Photo")%>' style="width: 80px; height: 80px;" />

                                                        </td>


                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("Achievement_MID") %>' OnClientClick="return confirm('Are you sure you want to delete? '); aspnetForm.target ='_self'"><i class="fa fa-trash" style="color:red; font-size:1.5em;"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

