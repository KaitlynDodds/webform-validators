<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomValidator.aspx.vb" Inherits="CustomValidator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Utils/utils.js"></script>
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

            <%-- CUSTOM VALIDATION --%>

            <tr>
             <td>
                Password:
             </td>

             <td>
                <asp:TextBox ID="passwordInput" runat="server" ></asp:TextBox>
             </td>

             <td>
                <asp:CustomValidator
                    ID="nameCustomVal" 
                    runat="server" 
                    ControlToValidate="passwordInput" 
                    ClientValidationFunction="validateLength"
                    OnServerValidate="validateLengthOnServer"
                    ValidateEmptyText="true"
                    text="*"
                    ErrorMessage="Name must be between 8 and 16 characters." >
                </asp:CustomValidator>
                <br />
             </td>
          </tr>

            <tr>

                <td>
                    ZipCode:
                    </td>

                    <td>
                    <asp:TextBox ID="zipCodeInput" runat="server" ></asp:TextBox>
                </td>

                <td>
                    <asp:CustomValidator 
                        ID="zipCodeCustomVal" 
                        runat="server" 
                        ControlToValidate="zipCodeInput" 
                        ClientValidationFunction="validateFiveDigits"
                        OnServerValidate="validateFiveDigitsOnServer"
                        ValidateEmptyText="true"
                        text="*"
                        ErrorMessage="Zipcode must be 5 digits." >
                    </asp:CustomValidator>
               </td>
            </tr>

            <%-- SUBMIT BTN --%>
          <tr>
             <td align="center" colspan="3">
                <asp:Button 
                    ID="userInfoGroupBtn"
                    onclick="btnsubmit_Click"
                    Text="Submit User Info" 
                    runat="server"
                    style="width:140px" />
             </td>
          </tr>

      </table>

      <asp:ValidationSummary 
          ID="ValidationSummary" 
          runat="server" 
          DisplayMode ="BulletList" 
          ShowSummary ="true" 
          HeaderText="Errors:" />
    </form>
</body>
</html>
