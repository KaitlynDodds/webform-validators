
Partial Class ValidateOnClick
    Inherits System.Web.UI.Page

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Page.Validate()
        ValidationSummary.EnableClientScript = False
        If Page.IsValid Then
            lblmsg.Text = "Passed in VB"
        Else
            lblmsg.Text = "Failed in VB"
        End If

    End Sub

End Class
