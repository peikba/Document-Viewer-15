
function embedDocument(inDocument)
 
{
    var Document = document.getElementById('webPage');  
    window.addEventListener(onclick, DocumentClicked, false);
    Document.src = inDocument;
}

function SetFrame() {
    function fill(frame) {
        if (!frame)
            return;
        frame.style.position = "fixed";
        frame.style.width = "100%";
        frame.style.height = "100%";
        frame.style.margin = "0";
        frame.style.border = "0";
        frame.style.padding = "0";
        frame.ownerDocument.querySelector("div.nav-bar-area-box").style.display = "none";
        frame.ownerDocument.querySelector("div.ms-nav-layout-head").style.display = "none";
    }

    window.top.document.getElementById("product-menu-bar").style.display = "none";
    fill(window.frameElement);
    fill(window.frameElement.ownerDocument && window.frameElement.ownerDocument.defaultView && window.frameElement.ownerDocument.defaultView.frameElement);
}
SetFrame();

