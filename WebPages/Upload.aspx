<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="WebPages_Upload" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <div class="container">
        <div class="row" runat="server" visible="true" id="divCategory">
            <form id="Form1" runat="server">

                <div class="col-md-4"></div>
                <div class="col-md-6" style="border: 3px solid #565029; border-width: initial; border-radius: 12px; padding: 20px; background-color: #ffffff3b; box-shadow: -16px 15px 19px -6px rgb(0 0 0 / 18%)">

                    <div class="row">
                        <asp:Label ID="Label3" runat="server" Text="Uploads" Font-Size="25pt" ForeColor="#565029" Font-Bold="true" Style="font-size: 40px; padding-left: 46%; font-family: -webkit-body;"></asp:Label>
                    </div>
                    <hr />


                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-4" style="width: 20%">
                            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lblname" runat="server" Text="Category" Font-Bold="true"></asp:Label>
                        </div>

                        <div class="col-md-6">
                            <asp:DropDownList ID="txtcategory" runat="server" placeholder="Select Category" CssClass="form-control" Width="25%"></asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Category" ControlToValidate="txtcategory"></asp:RequiredFieldValidator>
                         </div>
                        </div>
                    </div>
                            </form>
             </div>
    </div>
</body>
    </html>
