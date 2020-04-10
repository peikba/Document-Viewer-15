controladdin ShowDocument
{
    MaximumHeight = 500;
    RequestedHeight = 500;
    MinimumHeight = 500;
    MaximumWidth = 600;
    RequestedWidth = 300;
    MinimumWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'JsScripts/Demo.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start.js';

    event Ready();
    event DocumentClicked();
    procedure embedDocument(inDocument: Text);


}