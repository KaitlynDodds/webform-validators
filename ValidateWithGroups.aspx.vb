
Partial Class ValidateWithGroups
    Inherits System.Web.UI.Page

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'Will return true if the validation group on the btn that was clicked returns VALID 
        If Page.IsValid Then
            'if all values related to the validation group return VALID
            lblmsg.Text = "Passed in VB"
        Else
            'if any values related to the validation group return NOT VALID 
            lblmsg.Text = "Failed in VB"
        End If

        'Call Page.Validate() to check ALL validation groups for validity 
        'Page.Validate()
        'If Page.IsValid Then
        '    'Will return 'Passed' if ALL validation groups are VALID 
        '    lblmsg.Text = "Passed in VB"
        'Else
        '    'Will return 'Failed' if ALL validation groups are NOT VALID
        '    lblmsg.Text = "Failed in VB"
        'End If

        'Page.Validate("userInfoGroup")
        'If Page.IsValid Then
        '    'Returns 'Passed' when the userInfoGroup validation group is VALID
        '    lblmsg.Text = "Passed in VB"
        'Else
        '    'Returns 'Failed' when the userInfoGroup validation group is NOT VALID
        '    lblmsg.Text = "Failed in VB"
        'End If

    End Sub

End Class
