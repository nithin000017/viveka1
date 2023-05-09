<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PublicMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="WebPages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../ASPX_Styles/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <br />
    <div class="container">
        <div class="row" runat="server" visible="true" id="divSignIn">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
                <div class="row">
                    <asp:Label ID="Label3" runat="server" Text="Login" Font-Size="25pt" ForeColor="#565029" Font-Bold="true" Style="font-size: 40px; padding-left: 46%; font-family: -webkit-body;"></asp:Label>
                </div>
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-4 " style="width: 70%">
                        <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblemail" runat="server" Text="Email-Id" Font-Bold="true"></asp:Label>

                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="txtemail" runat="server" placeholder=" Enter Email" CssClass="form-control" Width="64%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtemail"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 "></div>
                    <div class="col-md-4" style="width: 70%">
                        <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" Width="64%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter user password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7"></div>
                    <div class="col-md-4">
                        <a href="ForgotPassword.aspx">FORGOT PASSWORD?</a>
                    </div>
                </div>

                <br />
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-5 aligntext">
                        <asp:Label ID="Label4" runat="server" Text="*" Font-Bold="true" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text="Enter the sum of two numbers" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-5 aligntext1">
                        <asp:Label ID="lblStopSpam" runat="server" Font-Bold="true" Text=" "></asp:Label>
                        <asp:TextBox ID="txtStopSpam" Style="width: 25%; display: inline" runat="server" CssClass="form-control Textbox"></asp:TextBox>
                        <asp:LinkButton ID="Linkbutton1" runat="server" CausesValidation="false" OnClick="Linkbutton1_Click"><i style="font-size:24px" class="fa">&#xf021;</i></asp:LinkButton>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter the Answer" ControlToValidate="txtStopSpam" CssClass="LabelStyleValidation" InitialValue="" Display="Dynamic" Style="display: inline; color: red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <br />
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-2">
                        <asp:Button ID="btnlogin" runat="server" Text="Login" OnClick="btnlogin_Click" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click" CausesValidation="false" />
                    </div>

                </div>
                <div class="col-md-2"></div>
            </div>
        </div>


    <div class="row" runat="server" visible="false" id="divOtp">
        <div class="col-md-2"></div>
        <div class="col-md-8" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
            <div class="row">
                <div class="col-md-12 com-xs-12" style="text-align: center; font-family: -webkit-body;">
                    <asp:Label ID="Label6" runat="server" Text="CONFIRM YOUR SUBMISSION" Font-Size="25pt" ForeColor="#565029" Font-Bold="true"></asp:Label>

                </div>
            </div>
            <br />
            <br />

            <div class="row">

                <div class="col-md-5 aligntext1">

                    <asp:Label ID="lblOTP" runat="server" ForeColor="Black" CssClass="LabelStyle" Visible="false"></asp:Label>
                    <asp:Label ID="lblConfirm" runat="server" CssClass="LabelStyles" Text="Enter Confirmation Key :"></asp:Label>
                    &nbsp;<asp:TextBox ID="txt_key" runat="server" CssClass="form-control TextBox" MaxLength="10"
                        Width="30%" Style="display: inline"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txt_key"
                        CssClass="LabelStyleValidation" ErrorMessage="Enter OTP" Font-Bold="True" Font-Size="14pt"
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-6 aligntext"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnProceed" runat="server" Text="Proceed" CssClass="btn btn-primary" OnClick="btnProceed_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>

            <br />
            <br />

        </div>
        <div class="col-md-2"></div>
    </div>


    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

