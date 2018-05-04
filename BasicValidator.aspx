<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BasicValidator.aspx.vb" Inherits="BasicValidator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <table>
            <%-- BASIC VALIDATION --%>
            <tr>
             <td>
                Name:
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
                    Text="Submit" 
                    style="width:140px" />
             </td>
          </tr>
      </table>

        <script type="text/html">

        </script>
      <asp:ValidationSummary 
          ID="ValidationSummary" 
          runat="server" 
          DisplayMode ="BulletList" 
          showsummary="true"
          HeaderText="Errors:" />

    </form>
    <script type="text/javascript" src="PopUp.js"></script>
    <script type="text/javascript" src="ErrorPopup.js"></script>
</body>
</html>
