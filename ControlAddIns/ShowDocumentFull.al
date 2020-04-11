controladdin ShowDocumentFull
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
    Scripts = 'JsScripts/Code2.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start2.js';

    event Ready();
    procedure embedDocument2(inDocument: Text);
    procedure FullScreen();
}