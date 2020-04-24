controladdin ShowDocument
{
    MaximumHeight = 400;
    RequestedHeight = 400;
    MaximumWidth = 300;
    RequestedWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'JsScripts/Code.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start.js';
    Images = 'Images/NoDocument.png';

    event Ready();
    procedure embedDocument(inDocument: Text;Resize: boolean);
}