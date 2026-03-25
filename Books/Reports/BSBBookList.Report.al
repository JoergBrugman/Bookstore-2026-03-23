namespace GetUseAcademy.Bookstore.Books.Reports;

using GetUseAcademy.Bookstore.Books.Book;

report 50100 "BSB Book - List"
{
    Caption = 'Book List';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Books/Reports/BSBBookList.rdlc';

    dataset
    {
        dataitem("BSB Book"; "BSB Book")
        {
            RequestFilterFields = "No.", Author;
            column(No_BSBBook; "No.") { IncludeCaption = true; }
            column(Description_BSBBook; Description) { IncludeCaption = true; }
            column(Author_BSBBook; Author) { IncludeCaption = true; }
            column(NoofPages_BSBBook; "No. of Pages") { IncludeCaption = true; }
        }
    }

    requestpage
    {
        SaveValues = true;
    }
}