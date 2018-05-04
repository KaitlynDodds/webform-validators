
Partial Class ValidateWithJavaScript
    Inherits System.Web.UI.Page

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Page.Validate()
        If Page.IsValid Then
            lblmsg.Text = "Passed in VB"
        Else
            lblmsg.Text = "Failed in VB"
        End If

    End Sub

End Class
