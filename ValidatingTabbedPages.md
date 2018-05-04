## Validating Tabbed Pages Guide 

### Step 0: 

You will need to include two JavaScript files in your tabbed page HTML. You should include the PopUp.js file and the ErrorPopup.js file. The PopUp.js file contains JavaScript functions that will be used to interact with the user. The ErrorPopup.js file creates an alert that highlights every error on the page. Both files must be included in your HTML at the bottom of the page, right before the closing body tag.

```
	<script type="text/javascript" src="PopUp.js"></script>
    <script type="text/javascript" src="ErrorPopup.js"></script>
</body>
```


### Step 1: 

Begin by going through all required field validators (including CustomValidators, RangedValidators, etc). 
Ensure that they are all formatted correctly. You can assign a group name to each validator if you so desire. Ensure all validators have the same group name. 

```
<asp:RequiredFieldValidator 
    ID="colorCustomVal" 
    validationgroup="extraInfoGroup"
    runat="server" 
    ControlToValidate="colorInput" 
    text="*"
    ErrorMessage="Enter your eye color" > 
</asp:RequiredFieldValidator>
```


### Step 2: 

Examine your submit button. Ensure that the property `CausesValidation` is NOT set to False. You should not need
to set a value for the `CausesValidation` property, it is true by default.

On a tabbed page you must disabled Client-Side validation. If you need to perform work on the client-side (e.g. 
asking user for save confirmation) add a `onclientclick` property to the button that points to a function that returns a boolean value. If this function returns true, the form will submit. If you do not need to perform any work before submitting the form, you can add the `EnableClientScript="false"` to the button attributes. This will disable client-side validation. 

```
<asp:Button 
	ID="btnsubmit" 
	onclientclick="return validateTabbedForm()"
	Text="Submit" 
	runat="server"
	style="width:140px" />
```


### Step 3: 

You will need to add a Validation Summary to your html if you do not already have one. The Validation Summary is responsible for presenting errors to the user. In the case of tabbed pages, errors should appear in an alert provided to the user after the save button is clicked. The error alert will only appear if you have followed Step 0 and included the ErrorPopup.js file at the base of your HTML. 

The Validation Summary ID must be `ValidationSummary`.

`ShowSummary` should be set to true. 

`EnableClientScript` must be set to false. 

If you are displaying errors based on validation group, make sure your Validation Summary has a `ValidationGroup` property set. 

You should only have ONE validation summary with the ID of `ValidationSummary`. Only the validation summary with this ID will be presented to the user in the alert. 

```
<div style="display:none">
	<asp:ValidationSummary 
		ID="ValidationSummary"
		runat="server" 
		DisplayMode="BulletList"
		ShowSummary="true" 
		EnableClientScript="false"
		HeaderText="Errors:" />
</div>
```


### Step 4: 

If you need to perform work before submiting the form, you should have set the buttons `onclientclick` property to a JavaScript function that exists in a JavaScript file. This function should return a boolean value after performing
the work. Make sure your JavaScript file has been included in your tabbed pages aspx file. Check to ensure that 
you have no inline JavaScript that could interfere with the work being performed by the JavaScript file code. 
If a function with the same name exists in the aspx inline JavaScript, it will override the function in the JavaScript file. 

Do not attempt to perform any calls to validate in your JavaScript function. Calls to Page_ClientValidate() in your 
JavaScript will attempt to validate the page. On a tabbed page, this will always result in errors. 

Never write inline JavaScript. Always add new JavaScript functions to the PopUp.js file

```
function validateTabbedPages() {
    return confirm('Are you sure you want to save?');
}
```


### Step 5: 

Look at your Visual Basic code for the current tabbed page. You should have a function that responds to your submit 
button click. If the function signature ends with `Handles [btnID].Click` you will not need to do anything. 
If your click function does not end in `Handles [btnID].Click`, add the attribute `onclick` and set it to the name 
of the Visual Basic function you wish to run when the user clicks submit. 

```
<asp:Button 
	ID="btnsubmit" 
	onclientclick="return validateTabbedForm();"
	onclick="btnsubmit_Click" 
	Text="Submit" 
	runat="server"
	style="width:140px" />
```

This VB function will run on the server side. This is where we want to perform validation. Ensure that your VB 
function includes the following code before it attempts to manipulate any user data. Always call `Page.Validate` 
before attempting to check `Page.IsValid`. `Page.IsValid` is only set after running `Page.Validate`.

```
Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
	Page.Validate()
    If Not Page.IsValid Then
        lblmsg.Text = "Failed validation"
		Exit Sub
    End If

End Sub
```


### Finish

Run your code and test the validation. If you experience errors ensure that the proper JavaScript functions are 
running when they should be and that they are not performing any validation checks. Make sure your server side 
validation code is running when it should. 