
// Used to perform CLIENT SIDE validation 
function validateForm() {
    // DO: user confirmation 
    // DO: check that user made changes to page 
    if (isDirty() &&
        userSaveConfirmation()) {
        
        // Validate page
        if (Page_ClientValidate()) {
            document.getElementById('lblmsg').textContent = "Passed in JavaScript";
        } else {
            document.getElementById('lblmsg').textContent = "Failed in JavaScript";
        }
    }
}

// return boolean, pop up asking user to confirm save 
function userSaveConfirmation() {
    return confirm("Are you sure you want to save?");
}

// return boolean, pop up asking user to confirm save 
function userConfirmation(msg) {
    return confirm(msg);
}

// check if user has made changes to page 
function isDirty() {
    return true;
}

// No calls to Page_ClientValidate() means no client validation is occuring 
function preventClientSideAndAskForPermission() {
    return userConfirmation('Keep going?');
}


// CUSTOM JAVASCRIPT VALIDATORS

function validateLength(source, args) {
    args.IsValid = (args.Value.length >= 8 && args.Value.length <= 16);
}

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


// DISPLAY ERRORS IN ALERT 
function displayErrors() {
    if (document.querySelectorAll('#ValidationSummary li').length !== 0) {
        const errLis = document.querySelectorAll('#ValidationSummary li');
        let errorMsg = "Errors:\n";
        for (let i = 0; i < errLis.length; i++) {
            errorMsg += "\n- " + errLis[i].textContent;
        }
        alert(errorMsg);
    }
}

window.onload = displayErrors();