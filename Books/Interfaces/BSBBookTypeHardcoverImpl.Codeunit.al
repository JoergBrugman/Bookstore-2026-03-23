namespace GetUseAcademy.Bookstore.Books.Interfaces;

/// <summary>
/// Diese Codeunit bildet den "speziellen" Prozess für ein Taschenbuch ab
/// </summary>
codeunit 50103 "BSB Book Type Hardcover Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Aus LAger picken');
    end;

    procedure StartDeliverBook()
    begin
        Message('Mit UPS PREMIUM versenden');
    end;
}