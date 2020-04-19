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
                SubPageLink = "Entry No." = field("Entry No.");
            }
        }
    }
}