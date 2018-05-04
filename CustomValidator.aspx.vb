
Partial Class CustomValidator
    Inherits System.Web.UI.Page

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If Page.IsValid Then
            lblmsg.Text = "Passed in VB"
        Else
            lblmsg.Text = "Failed in VB"
        End If

    End Sub

    Protected Sub validateLengthOnServer(source, arguments)
        arguments.IsValid = arguments.Value.length >= 8 And arguments.Value.length <= 16
    End Sub

    Protected Sub validateFiveDigitsOnServer(source, arguments)
        arguments.IsValid = arguments.Value.length = 5
        If arguments.IsValid Then
            For Each c As Char In arguments.Value
                arguments.IsValid = Char.IsNumber(c)
                If Not arguments.IsValid Then
                    Exit For
                End If
            Next
        End If
    End Sub

End Class
