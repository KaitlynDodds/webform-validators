
# .NET Page Validators 

Validation can occur in two places: the Client-Side and on the Server


## Client-Side: 
			
The user's browser performs validation within the web page. No communication with the server occurs. 
Client-Side validation is nice to have, but not strictly necessary. It is relaitively easy for an attacker
to circumvent client-side validation. You should never rely on Client-Side validation as your sole means
of validating user input. 

See `BasicValidators.aspx` for an example of very basic Client-Side validation. All validation occurs in the
browser. No validation has been written on the server side. `BasicValidators.aspx.vb` does not contain any 
calls to validate. 

See `ValidateWithJavaScript.aspx` for an example of how to trigger Client-Side validaiton in JavaScript. The 
funciton `validateForm()` function in `utils.js` calls `Page_ClientValidate()`. `Page_ClientValidate()` 
performs .net validation in the client's browser. 


## Server Side Validation:

It is imperative that the application is performing server side validaiton. This validation is performed on the
server. If your `*.aspx.vb` file contains any calls to `Page.Validate()` when you submit/save data, you are performing server-side validation. 

In `ValidateWithJavaScript.aspx.vb` you will see a function `btnsubmit_Click`. This function is triggered
when the user clicks submit and the client-side validation completes successfully. Because this example 
includes Client-Side validation, the `btnsubmit_Click` function will only run once the Client-Side validation
returns true (all required fields are valid). In `btnsubmit_Click` further validation is performed with the 
call to `Page.Validate()`. `Page.IsValid` returns true if all required fields pass as valid. This is server side
validation. 

```
Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    Page.Validate()
    If Page.IsValid Then
        lblmsg.Text = "Passed in VB"
    Else
        lblmsg.Text = "Failed in VB"
    End If

End Sub
```

Look at 'ValidateOnClick' for an example of how to prevent Client-Side validation from occuring, but still ask the 
user for permission to submit before sending the data to the server. The JavaScript function 
`preventClientSideAndAskForPermission()` in `utils.js` has been tied to the `onclientclick` property of the 
submit button. This function is triggered in the browser when the user clicks submit. If this function returns 
true, the form will submit and the data will be sent to the server. The `btnsubmit_Click` function will then 
be triggered. If your JavaScript function returns false, the form will not be submitted and no server side validation will occur. 

You can also disable client-side validation by adding the property `EnableClientScript` to your required fields 
and setting the value to 'false'.

```
<asp:RequiredFieldValidator 
    EnableClientScript="false"
    ID="emailReqFieldVal" 
    runat="server" 
    ControlToValidate="emailInput" 
    text="*"
    ErrorMessage="Enter your email" >
</asp:RequiredFieldValidator>
```


## Custom Validation

You can use the `CustomValidator` tag to setup your own validation rules. 

```
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
```

The `CustomValidator` allows you to write your own validation rules to be performed on both the client-side and server. You will need to set the `ClientValidationFunction` property to a JavaScript function that sets the IsValid property of the required field object. The JavaScript function should accept a source and arguments parameter. The source parameter points to the required field on which the function was set. The arguments contains the required field validator object and value.

```
function validateFiveDigits(source, args) {
    const val = args.Value;
    if (val.length !== 5) {
        args.IsValid = false;
    } else {
        args.IsValid = true; 
        for (let i = 0; i < val.length; i++) {
            if (isNaN(parseInt(val[i]))) {
                args.IsValid = false;
                break;
            }
        }
    }
}
```

You will also need to provide an `OnServerValidate` function. This property should be pointed to a function that exists in your server side code. This function operates in essentially the same way as the `ClientValidationFunction` function. The function you set the property `OnServerValidate` to is called when the `ClientValidationFunction` sets the IsValid property of the required field object to true. This function is executed on the server. 

```
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
```

## Validating Tabbed Pages

When attempting to validate tabbed pages, rely on server-side validation to validate all fields at once. Client-Side
validation will fail because not all required fields are rendered in the DOM at once. Thus any attempt to validate 
them will result in undefined errors (how can the page validate the fields if they don't exist yet).

Remove any attempts to perform client-side validation. Do not call `Page_ClientValidate()` in your JavaScript. Instead call `Page.Validate()` in your Visual Basic code. This will validate all required fields associated with the page. 

If you need to perform a save confirmation or any other work before submitting the user input, set the `onclientclick` property to a JavaScript function that returns a boolean value. If this function returns true, the form will submit and be sent to the server. If this function returns false, no form will be submitted. See `ValidateOnClick` for an example of how to do this. 

Check the `ValidatingTabbedPages.md` file for instructions on how to do this. 