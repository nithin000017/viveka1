<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PublicMasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="WebPages_AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <br />
      <div class="container">
          <div class="row" runat="server" visible="true" id="divSignIn">
        <div class="col-md-2"></div>
                <div class="col-md-8" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">
            <div class="row">
                <asp:Label ID="Label3" runat="server" Text="Admin Login" Font-Size="25pt" ForeColor="#565029" Font-Bold="true" Style="font-size: 40px; padding-left: 46%; font-family: -webkit-body;"></asp:Label>
            </div>
            <hr />
            <br />
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4 " style="width: 70%">
                    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                    <asp:Label ID="lblname" runat="server" Text="Email" Font-Bold="true"></asp:Label>

                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtemail" runat="server" placeholder=" Enter Your Email" CssClass="form-control" Width="64%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Email" ControlToValidate="txtemail"></asp:RequiredFieldValidator>

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

        </div>
        <div class="col-md-2"></div>
     </div>
   </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>

