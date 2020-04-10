
function embedDocument(inDocument)
 
{
    var Document = document.getElementById('Document');  //find our iframe
 
    Document.src = inDocument ; //modify it’s parameters

    Document.onclick = function()
    {
        {
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('DocumentClicked', [callText]);
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
