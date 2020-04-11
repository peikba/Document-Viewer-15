
function embedDocument(inDocument)
 
{
    var Document = document.getElementById('webPage');  
 
    Document.src = inDocument;
    Document.onclick = function()
    {
        {
            
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('DocumentClicked', []);
        }        
    }
}


