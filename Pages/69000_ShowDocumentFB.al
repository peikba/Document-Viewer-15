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
                    ComponentLoaded := true;
                    PopulatePage;
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
    var
        ComponentLoaded: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        PopulatePage();
    end;

    procedure PopulatePage()
    var
        Base64Txt: Text;
        IncomDocAttach: Record "Incoming Document Attachment";
        Convert: Codeunit "Base64 Convert";
        InStr: InStream;

    begin
        if not ComponentLoaded then
            exit;
        IncomDocAttach.SetRange("Incoming Document Entry No.", "Entry No.");
        if IncomDocAttach.FindFirst() then begin
            IncomDocAttach.CalcFields(Content);
            IncomDocAttach.Content.CreateInStream(InStr);
            Base64Txt := Convert.ToBase64(InStr);
            case IncomDocAttach."File Extension" of
                'pdf':
                    CurrPage.ShowDocument.embedDocument('data:application/pdf;base64,' + Base64Txt, false);
                'jpg':
                    CurrPage.ShowDocument.embedDocument('data:image/jpg;base64,' + Base64Txt, true);
                'png':
                    CurrPage.ShowDocument.embedDocument('data:image/png;base64,' + Base64Txt, true);
                'gif':
                    CurrPage.ShowDocument.embedDocument('data:image/gif;base64,' + Base64Txt, true);
                else
                    CurrPage.ShowDocument.embedDocument('data:image/png;./Images/NoDucument.png', false);
            end;
        end else begin
            CurrPage.ShowDocument.embedDocument('', false);
        end;
    end;
}