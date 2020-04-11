page 69001 "BAC Show Document Full"
{
    PageType = Cardpart;
    SourceTable = "Incoming Document";
    layout
    {
        area(Content)
        {
            usercontrol(ShowDocumentFull; ShowDocumentFull)
            {
                ApplicationArea = all;
                trigger Ready()
                begin
                    //Not working
                    //CurrPage.ShowDocumentFull.FullScreen();
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
            //Message('%1', Base64Txt);
            case IncomDocAttach."File Extension" of
                'pdf':
                    CurrPage.ShowDocumentFull.embedDocument2('data:application/pdf;base64,' + Base64Txt);
                'jpg':
                    CurrPage.ShowDocumentFull.embedDocument2('data:image/jpg;base64,' + Base64Txt);
                'png':
                    CurrPage.ShowDocumentFull.embedDocument2('data:image/png;base64,' + Base64Txt);
            end;
        end else begin
            CurrPage.ShowDocumentFull.embedDocument2('data:image/png;./Images/NoDocument.png');
        end;
    end;
}