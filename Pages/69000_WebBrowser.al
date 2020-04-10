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
                Promoted = true;
                PromotedOnly = true;
                Image = DocInBrowser;

                trigger OnAction()
                begin
                    page.run(page::"BAC Web Browser Full", Rec);
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        Base64Txt: Text;
        IncomDocAttach: Record "Incoming Document Attachment";
        TempBlob: Record TempBlob;
        OutStr: OutStream;
        InStr: InStream;
        cTempBlob: Codeunit "Temp Blob";

    begin
        IncomDocAttach.SetRange("Incoming Document Entry No.", "Entry No.");
        if IncomDocAttach.FindFirst() then begin
            IncomDocAttach.CalcFields(Content);
            TempBlob.Blob.CreateOutStream(OutStr);
            IncomDocAttach.Content.CreateInStream(InStr);
            CopyStream(OutStr, InStr);
            Base64Txt := TempBlob.ToBase64String();
            case IncomDocAttach."File Extension" of
                'pdf':
                    CurrPage.WebBrowser.embedHomePage('data:application/pdf;base64,' + Base64Txt);
                'jpg':
                    CurrPage.WebBrowser.embedHomePage('data:image/jpg;base64,' + Base64Txt);
                'png':
                    CurrPage.WebBrowser.embedHomePage('data:image/png;base64,' + Base64Txt);
            end;
        end;
    end;
}