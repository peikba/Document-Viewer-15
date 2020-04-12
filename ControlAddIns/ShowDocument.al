controladdin ShowDocument
{
    MaximumHeight = 800;
    RequestedHeight = 500;
    MinimumHeight = 300;
    MaximumWidth = 400;
    RequestedWidth = 300;
    MinimumWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'JsScripts/Code.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start.js';

    event Ready();
    event DocumentClicked();
    procedure embedDocument(inDocument: Text);
}