page 69001 "BAC Web Browser Full"
{
    PageType = Card;
    SourceTable = "Incoming Document";
    layout
    {
        area(Content)
        {
            usercontrol(ShowDocument; ShowDocument)
            {
                ApplicationArea = all;
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
                    CurrPage.ShowDocument.embedDocument('data:application/pdf;base64,' + Base64Txt);
                'jpg':
                    CurrPage.ShowDocument.embedDocument('data:image/jpg;base64,' + Base64Txt);
                'png':
                    CurrPage.ShowDocument.embedDocument('data:image/png;base64,' + Base64Txt);
            end;
        end else begin
            CurrPage.ShowDocument.embedDocument('./Images/NoDucument.png');
        end;
    end;
}