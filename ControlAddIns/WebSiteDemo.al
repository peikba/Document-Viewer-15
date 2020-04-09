controladdin WebBrowserDemo
{
    MaximumHeight = 500;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'JsScripts/Demo.js';
    StyleSheets = 'StyleSheets/StyleSheet.css';
    StartupScript = 'JsScripts/Start.js';

    event Ready();

    procedure embedHomePage(HomePage : Text);
}