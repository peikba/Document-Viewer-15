page 69000 "BAC Web Browser FactBox"
{
    PageType = CardPart;
    SourceTable = "Incoming Document";
    layout
    {
        area(Content)
        {
            usercontrol(WebBrowser; WebBrowserDemo)
            {
                ApplicationArea = all;
                trigger Ready()
                begin
                    message('%1', GetURL());
                    //CurrPage.WebBrowser.embedHomePage(Rec.GetURL());
                    CurrPage.WebBrowser.embedHomePage('https://simplanova.com/blog/');

                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Hyperlink(Rec.GetURL());
                end;
            }
        }
    }
}