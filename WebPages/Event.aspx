<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PrivateMasterPage.master" AutoEventWireup="true" CodeFile="Event.aspx.cs" Inherits="WebPages_Event" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
    <script type="text/javascript">
        function ShowImagePreview1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage1.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }

    </script>
    <script type="text/javascript">
        function ShowImagePreview2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage2.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }

    </script>
    <script type="text/javascript">
        function ShowImagePreview3(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage3.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }


    </script>
    <script type="text/javascript">
        function ShowImagePreview4(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage4.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                };
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
        <div class="row" runat="server" visible="false" id="divEventAdd">

            <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <asp:Label ID="lblEventAdd" runat="server" Text="Event Add" Font-Size="25pt" ForeColor="#565029" Font-Bold="true" Style="font-size: 40px; padding-left: 42%; font-family: -webkit-body;"></asp:Label>
                </div>
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-10"></div>
                    <div class="col-md-2 ">
                        <asp:Button ID="btnview" runat="server" Text="VIEW" OnClick="btnview_Click" CausesValidation="false" />
                    </div>
                </div>

                <br />

              
                

                <div class="row">

                    <div class="col-md-3 aligntext1">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lbltitle" runat="server" Text="Event Title :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="txttitle" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Event Title" ControlToValidate="txttitle"></asp:RequiredFieldValidator>
                    </div>


                    <div class="col-md-2 aligntext1">
                        <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="Label55" runat="server" Font-Bold="true" CssClass="anfrmlbl" Text="Date Description: " />
                        
                    </div>
                    <div class="col-md-2 aligntext1">
                        <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" Style="Width: 121%;" />
                        <cc1:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="txtDate" Format="dd/MM/yyyy" PopupButtonID="imgDate">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ErrorMessage="Enter Date" ControlToValidate="txtDate" ForeColor="Red"></asp:RequiredFieldValidator>


                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDate"
                            CssClass="LabelStyleValidation" Display="Dynamic" ErrorMessage="Select Valid Date(dd/MM/yyyy)"
                            SetFocusOnError="True" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[-/](0[1-9]|1[012])[-/]\d{4}"></asp:RegularExpressionValidator>
                        
                    </div>

                    <div class="col-md-1 aligntext1" style="top: 0px; right: 0%; z-index: 99999999999">
                        <asp:ImageButton ID="imgDate" runat="server" CausesValidation="False" Height="35px"
                            ImageUrl="../ASPX_Images/schedule.png" OnClientClick="return false;" Width="35px" />
                    </div>
                </div>


                <br />


                <div class="row">
                    <div class="col-md-3 aligntext1">
                        <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label11" Text="Attachment  Title : " Font-Bold="true" runat="server" CssClass="anfrmlbl" />
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtAtt1" CssClass="form-control" runat="server" Width="82%" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Attachment Title" ControlToValidate="TxtAtt1" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>

                    <div class="col-md-2 aligntext1">
                        <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>

                        <asp:Label ID="Label2" Text="Attachment :" runat="server" Font-Bold="true" CssClass="anfrmlbl" />
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:FileUpload ID="fupAttach1" runat="server" ForeColor="Black" CssClass="form-control" Style="Width: 75%;" />

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="fupAttach1"
                            CssClass="LabelStyleValidation" ErrorMessage="Only pdf files are allowed!" ForeColor="Red"
                            SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Attachment " ControlToValidate="fupAttach1" ForeColor="Red"></asp:RequiredFieldValidator>


                        <a id="aAttach1" runat="server" style="text-decoration: underline" visible="false" target="_blank">
                            <asp:Label ID="lblAttachment1" runat="server" Font-Bold="true" Text="Attachment"></asp:Label>
                        </a>

                    </div>
                </div>


                <br />

                <div class="row">

                    <div class="col-md-2 aligntext1">
                        <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblphoto" runat="server" Text="Photo :" Font-Bold="true"></asp:Label>

                    </div>

                    <div class="col-md-2">
                        <asp:FileUpload ID="fupImage" runat="server" CssClass="form-control" ForeColor="Black" onchange="ShowImagePreview(this);" />
                        <br />
                        <img id="PreviewImage" runat="server" src="../ASPX_Images/noimage.jpg" style="width: 105px; height: 105px; border: 3px solid" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fupImage"
                            CssClass="LabelStyleValidation" ErrorMessage="Only gif, jpeg, png,bmp files are allowed!"
                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG|.bmp|.BMP)$">
                                   
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="col-md-2">
                        <asp:FileUpload ID="fupImage1" runat="server" CssClass="form-control" ForeColor="Black" onchange="ShowImagePreview1(this);" />
                        <br />
                        <img id="PreviewImage1" runat="server" src="../ASPX_Images/noimage.jpg" style="width: 105px; height: 105px; border: 3px solid" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="fupImage1"
                            CssClass="LabelStyleValidation" ErrorMessage="Only gif, jpeg, png,bmp files are allowed!"
                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG|.bmp|.BMP)$">
                        </asp:RegularExpressionValidator>

                    </div>

                    <div class="col-md-2">
                        <asp:FileUpload ID="fupImage2" runat="server" CssClass="form-control" ForeColor="Black" onchange="ShowImagePreview2(this);" />
                        <br />
                        <img id="PreviewImage2" runat="server" src="../ASPX_Images/noimage.jpg" style="width: 105px; height: 105px; border: 3px solid" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="fupImage2"
                            CssClass="LabelStyleValidation" ErrorMessage="Only gif, jpeg, png,bmp files are allowed!"
                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG|.bmp|.BMP)$">

                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-2">
                        <asp:FileUpload ID="fupImage3" runat="server" CssClass="form-control" ForeColor="Black" onchange="ShowImagePreview3(this);" />
                        <br />
                        <img id="PreviewImage3" runat="server" src="../ASPX_Images/noimage.jpg" style="width: 105px; height: 105px; border: 3px solid" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="fupImage3"
                            CssClass="LabelStyleValidation" ErrorMessage="Only gif, jpeg, png,bmp files are allowed!"
                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG|.bmp|.BMP)$">

                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="col-md-2">
                        <asp:FileUpload ID="fupImage4" runat="server" CssClass="form-control" ForeColor="Black" onchange="ShowImagePreview4(this);" />
                        <br />
                        <img id="PreviewImage4" runat="server" src="../ASPX_Images/noimage.jpg" style="width: 105px; height: 105px; border: 3px solid" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="fupImage4"
                            CssClass="LabelStyleValidation" ErrorMessage="Only gif, jpeg, png,bmp files are allowed!"
                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG|.bmp|.BMP)$">
                        </asp:RegularExpressionValidator>

                    </div>
                </div>

                <br />
                <br />

                <div class="row">

                    <div class="col-md-3 aligntext1">
                        <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lbldescription" runat="server" Text="Description :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-7 aligntext1">
                        <cc2:Editor ID="editor3" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Description" ControlToValidate="editor3"></asp:RequiredFieldValidator>
                    </div>

                </div>

                <br />

                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <asp:Button ID="btnsave" runat="server" Text="Save" Width="50%" OnClick="btnsave_Click" />

                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btncancel" runat="server" Text="Cancel" Width="50%" OnClick="btncancel_Click" CausesValidation="false" />
                    </div>

                </div>

            </div>
        </div>
    </div>

    <br />


    <div class="row" runat="server" visible="true" id="divViewEvent">

        <div class="col-md-12" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
            <div class="row">
                <div class="col-md-12 com-xs-12" style="text-align: center; font-family: -webkit-body;">
                    <asp:Label ID="lblEventView" runat="server" Text="View Event" Font-Size="25pt" ForeColor="#565029" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <hr />
            <br />

            <div class="row">
                <div class="col-md-10"></div>
                <div class="col-md-2 ">
                    <asp:Button ID="btnadd" runat="server" Text="ADD" OnClick="btnadd_Click" CausesValidation="false" />
                </div>
            </div>
            <br />

            <div class="container" style="padding: 10px; width: 1000px; box-shadow: 0px 0px 6px 0px rgb(0 0 0 / 18%)">

                <div class="row">

                    <div class="col-md-3 aligntext1">
                        <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblsearch" runat="server" Text="Title :" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="txttitle1" runat="server" CssClass="form-control" Width="82%"></asp:TextBox>
                    </div>

                     <div class="col-md-3 aligntext1">
                        <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label7" Text="Attachment  Title : " Font-Bold="true" runat="server" CssClass="anfrmlbl" />
                    </div>
                    <div class="col-md-3 aligntext1">
                        <asp:TextBox ID="TxtAttch1" CssClass="form-control" runat="server" Width="82%" />
                        
                    </div>
                    </div>
                <br />
                <br />

                    
                    <div class="row">
                    <div class="col-md-3 aligntext1">
                        <asp:Label ID="Label19" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblshow" runat="server" Text="Show :" Font-Bold="true"></asp:Label>
                    </div>

                    <asp:DropDownList ID="ddlShowTop" runat="server" CssClass="form-control" Width="70px" Height="30px">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem Selected="true">10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                    </asp:DropDownList>

                    <p style="padding-left: 20px;">Records</p>

                </div>

                <br />

                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2 ">
                        <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" CausesValidation="false" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnrefresh" runat="server" Text="Refresh" Width="50%" OnClick="btnrefresh_Click" CausesValidation="false" />
                    </div>

                </div>


                <br />

                <div class="col-md-12" style="overflow-x: scroll;">

                    <asp:GridView ID="gvevent" runat="server" AutoGenerateColumns="false" CssClass="Admingridtable1" EmptyDataText="No Records Found!!!" EnableModelValidation="True" Width="100%" OnRowCommand="gvevent_RowCommand">

                        <Columns>
                            <asp:TemplateField HeaderText="Sl.No">
                                <ItemTemplate>
                                    <asp:Label ID="slno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lnkedit1" CommandArgument='<%#Eval("Event_MID") %>'
                                        CommandName="cmdEdit1" CausesValidation="false" OnClientClick="return confirm('Are you sure want to Edit Event Details?')">
                                            <i class="fa fa-edit" style="font-size:18px;color:#f15b4e;"></i></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="lblGtitle" runat="server" Text='<%# Eval("Event_Title") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Attachment Title">
                                <ItemTemplate>
                                    <asp:Label ID="lblGAttach" runat="server" Text='<%# Eval("Event_AttachmentTitle") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo-1">
                                <ItemTemplate>
                                    <img id="PreviewImage" runat="server" src='<%# Eval("Event_Photo1")%>' style="width: 80px; height: 80px;" />
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Photo-2">
                                <ItemTemplate>
                                    <img id="PreviewImage1" runat="server" src='<%# Eval("Event_Photo2")%>' style="width: 80px; height: 80px;" />
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Photo-3">
                                <ItemTemplate>
                                    <img id="PreviewImage2" runat="server" src='<%# Eval("Event_Photo3")%>' style="width: 80px; height: 80px;" />
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Photo-4">
                                <ItemTemplate>
                                    <img id="PreviewImage3" runat="server" src='<%# Eval("Event_Photo4")%>' style="width: 80px; height: 80px;" />
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Photo-5">
                                <ItemTemplate>
                                    <img id="PreviewImage4" runat="server" src='<%# Eval("Event_Photo5")%>' style="width: 80px; height: 80px;" />
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblGDate" runat="server" Text='<%# Eval("date") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblGDescription" runat="server" Text='<%# Eval("Event_Description") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Attachment">
                                <ItemTemplate>
                                    <a id="aAttach1" runat="server" HRef='<%# Eval("Event_Attachment") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px" />                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("Event_MID") %>' OnClientClick="return confirm('Are you sure you want to delete? '); aspnetForm.target ='_self'"><i class="fa fa-trash" style="color:red; font-size:1.5em;"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>
        </div>

    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

