pageextension 69002 "BAC Incoming Document" extends "Incoming Document"

{
    layout
    {
        addfirst(factboxes)
        {
            part("Show Document FactBox"; "BAC Show Document FactBox")
            {
                ApplicationArea = all;
                Caption = 'Document';
                Visible = ExtensionExist;
                SubPageLink = "Entry No." = field("Entry No.");
            }
        }
    }
    var
        [InDataSet]
        ExtensionExist: Boolean;

    trigger OnOpenPage()
    begin
        ExtensionExist := false;
    end;

    trigger OnAfterGetCurrRecord()
    var
        IncomDocAttach: Record "Incoming Document Attachment";
    begin
        IncomDocAttach.SetRange("Incoming Document Entry No.", "Entry No.");
        ExtensionExist := not IncomDocAttach.IsEmpty;
    end;

    trigger OnAfterGetRecord()
    var
        IncomDocAttach: Record "Incoming Document Attachment";
    begin
        IncomDocAttach.SetRange("Incoming Document Entry No.", "Entry No.");
        ExtensionExist := not IncomDocAttach.IsEmpty;
    end;
}