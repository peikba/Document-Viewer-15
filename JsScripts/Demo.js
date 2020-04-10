
function embedHomePage(HomePage)
 
{
    var webPage = document.getElementById('webPage');  //find our iframe
 
    webPage.src = HomePage ; //modify it’s parameters
    webPage.onclick = function()
    {
        {
 
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('WebPageClicked', [callText]);
     
        }        
    }
    
}
function addButton(buttonName, callText)
 
{
 
    var placeholder = document.getElementById('controlAddIn');
 
    var button = document.createElement('button');
 
    button.textContent = buttonName;
 
    button.onclick = function() 
    {
 
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ButtonPressed', [callText]);
 
    }
 
    placeholder.appendChild(button);
 
}
