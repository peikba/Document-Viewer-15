controladdin ShowDocumentFull
{
    MaximumHeight = 800;
    RequestedHeight = 600;
    MinimumHeight = 500;
    MaximumWidth = 600;
    RequestedWidth = 500;
    MinimumWidth = 300;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'JsScripts/Code2.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start2.js';

    event Ready2();
    procedure embedDocument2(inDocument2: Text);
}