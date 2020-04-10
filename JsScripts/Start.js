Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Ready', null);
function createIframe()
 
{
 
    var placeholder = document.getElementById('controlAddIn'); //find a place
 
    var webPage = document.createElement('iframe');  //create object
 
    webPage.id = 'webPage';  //set its parameters
 
    webPage.height = '100%'; //set its parameters
 
    webPage.width = '100%'; //set its parameters
    
 
    placeholder.appendChild(webPage); //add object to place
 
}

createIframe();

