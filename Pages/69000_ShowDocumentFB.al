page 69000 "BAC Show Document FactBox"
{
    Caption = 'Document';
    PageType = CardPart;
    SourceTable = "Incoming Document";
    layout
    {
        area(Content)
        {
            usercontrol(ShowDocument; ShowDocument)
            {
                ApplicationArea = all;
                trigger Ready()
                begin
                    PopulatePage
                end;

                trigger DocumentClicked()
                begin
                    message('FullScreen');
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
                Caption = 'Open';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    IncomDoc: Record "Incoming Document";
                begin
                    IncomDoc.Copy(Rec);
                    IncomDoc.SetRecFilter();
                    page.run(page::"BAC Show Document Full", IncomDoc);
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        PopulatePage();
    end;

    procedure PopulatePage()
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
                else
                    CurrPage.ShowDocument.embedDocument('data:image/png;./Images/NoDucument.png');
            end;
        end else begin
            CurrPage.ShowDocument.embedDocument('');
        end;
    end;
}