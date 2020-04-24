controladdin ShowDocumentFull
{
    MaximumHeight = 1200;
    RequestedHeight = 1200;
    MaximumWidth = 600;
    RequestedWidth = 600;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'JsScripts/Code2.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start2.js';

    event Ready2();
    procedure embedDocument2(inDocument2: Text; resize: Boolean);
}