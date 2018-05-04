<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ValidateWithGroups.aspx.vb" Inherits="ValidateWithGroups" %>

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


            <%-- GROUP BASED VALIDATION --%>

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
                    validationgroup="userInfoGroup"
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
                        validationgroup="userInfoGroup"
                        runat="server" 
                        ControlToValidate="emailInput" 
                        text="*"
                        ErrorMessage="Enter your email" >
                    </asp:RequiredFieldValidator>
               </td>
            </tr>

             <tr>

                <td>
                    Eye Color:
                </td>

                <td>
                    <asp:TextBox ID="colorInput" runat="server" ></asp:TextBox>
                </td>

                <td>
                    <asp:RequiredFieldValidator 
                        ID="colorCustomVal" 
                        validationgroup="extraInfoGroup"
                        runat="server" 
                        ControlToValidate="colorInput" 
                        text="*"
                        ErrorMessage="Enter your eye color" > 
                    </asp:RequiredFieldValidator>
               </td>
            </tr>

            <tr>

                <td>
                    Avatar URL:
                </td>

                <td>
                    <asp:TextBox ID="avatarInput" runat="server" ></asp:TextBox>
                </td>

                <td>
                    <asp:RequiredFieldValidator 
                        ID="avatarReqVal" 
                        validationgroup="extraInfoGroup"
                        runat="server" 
                        ControlToValidate="avatarInput" 
                        text="*"
                        ErrorMessage="Enter a url for your avatar" > 
                    </asp:RequiredFieldValidator>
               </td>
            </tr>

            <%-- SUBMIT BTN --%>
          <tr>
             <td align="center" colspan="3">
                <asp:Button 
                    ID="userInfoGroupBtn"
                    validationgroup="userInfoGroup"
                    onclick="btnsubmit_Click"
                    Text="Submit User Info" 
                    runat="server"
                    style="width:140px" />
             </td>
          </tr>

        <tr>
            <td align="center" colspan="3">
            <asp:Button 
                ID="extraInfoGroupBtn"
                validationgroup="extraInfoGroup"
                onclick="btnsubmit_Click"
                Text="Submit Extra Info" 
                runat="server"
                style="width:140px" />
            </td>
        </tr>
      </table>

      <asp:ValidationSummary 
          ID="ValidationSummary" 
          runat="server" 
          validationgroup="userInfoGroup"
          DisplayMode ="BulletList" 
          ShowSummary ="true" 
          HeaderText="Errors:" />

        <asp:ValidationSummary 
          ID="ValidationSummary2" 
          runat="server" 
          validationgroup="extraInfoGroup"
          DisplayMode ="BulletList" 
          ShowSummary ="true" 
          HeaderText="Errors:" />
    </form>
    <script src="Utils/utils.js"></script>
</body>
</html>
