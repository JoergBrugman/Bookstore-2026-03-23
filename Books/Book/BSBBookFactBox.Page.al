namespace GetUseAcademy.Bookstore.Books.Book;

page 50102 "BSB Book FactBox"
{
    Caption = 'Book Details';
    PageType = CardPart;
    SourceTable = "BSB Book";
    Editable = false;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                Caption = 'Book No.', Comment = 'de-DE=Buchnr.';

                trigger OnDrillDown()
                begin
                    ShowDatail();
                end;
            }
            field(Description; Rec.Description) { Caption = 'Bok Description', Comment = 'de-DE=Buchbeschreibung'; }
            field("Date of Publishing"; Rec."Date of Publishing") { }
            field("No. of Pages"; Rec."No. of Pages") { }
            field(Author; Rec.Author) { }
        }
    }

    local procedure ShowDatail()
    begin
        Rec.ShowCard();
    end;
}