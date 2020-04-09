pageextension 69002 "BAC Incoming Document" extends "Incoming Document"

{
    layout
    {
        addfirst(factboxes)
        {
            part("Web Browser FactBox"; "BAC Web Browser FactBox")
            {
                ApplicationArea = all;
                Caption = 'Web Page';
                SubPageLink = "Entry No." = field("Entry No.");
            }
        }
    }
}