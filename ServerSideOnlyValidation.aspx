<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ServerSideOnlyValidation.aspx.vb" Inherits="ValidateOnClick" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>

            <tr>
             <td colspan="3" align="center">
             <asp:Label ID="lblmsg" 
                Text="User Data Form" 
                runat="server" />
             </td>
          </tr>

            <%-- SERVER SIDE ONLY VALIDATION --%>

            <tr>
             <td>
                User:
             </td>

             <td>
                <asp:TextBox ID="nameInput" runat="server" ></asp:TextBox>
             </td>

             <td>
                <asp:RequiredFieldValidator 
                    ID="nameReqFieldVal" 
                    runat="server" 
                    ControlToValidate="nameInput" 
                    text="*"
                    ErrorMessage="Enter your name" >
                </asp:RequiredFieldValidator>
                <br />
             </td>
          </tr>

            <tr>

                <td>
                    Email:
                 </td>

                 <td>
                    <asp:TextBox ID="emailInput" runat="server" ></asp:TextBox>
                </td>

                <td>
                    <asp:RequiredFieldValidator 
                        ID="emailReqFieldVal" 
                        runat="server" 
                        ControlToValidate="emailInput" 
                        text="*"
                        ErrorMessage="Enter your email" >
                    </asp:RequiredFieldValidator>
                    <br />
                 </td>
            </tr>

            <%-- SUBMIT BTN --%>
          <tr>
             <td align="center" colspan="3">
                <asp:Button 
                    ID="btnsubmit" 
                    runat="server" 
                    onclientclick="return preventClientSideAndAskForPermission()"
                    onclick="btnsubmit_Click"
                    Text="Submit" 
                    style="width:140px" />
             </td>
          </tr>
      </table>

        <%-- Errors will appear in a popup rather than on the page --%>
        <div style="display:none">
          <asp:ValidationSummary 
              ID="ValidationSummary"
              runat="server" 
              DisplayMode="BulletList"
              ShowSummary="true" 
              enableclientscript="false"
              HeaderText="Errors:" />
       </div>
    </form>
    <script src="Utils/utils.js"></script>
</body>
</html>
