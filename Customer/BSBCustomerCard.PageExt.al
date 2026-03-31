namespace GetUseAcademy.Bookstore.Customer;

using Microsoft.Sales.Customer;
using GetUseAcademy.Bookstore.Books.Book;
using GetUseAcademy.Bookstore.BingMapsControl;

pageextension 50100 "BSB Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("BSB Bookstore")
            {
                Caption = 'Bookstore';

                field("BSB Favorite Book No."; Rec."BSB Favorite Book No.")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("BSB Favorite Book Description"; Rec."BSB Favorite Book Description") { ApplicationArea = All; }
            }
        }
        addafter(Control149)
        {
            part(BSBBookFactBox; "BSB Book FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("BSB Favorite Book No.");
            }
            part(BingMapsCardPart; "BSB BingMapsCardPart")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }
}