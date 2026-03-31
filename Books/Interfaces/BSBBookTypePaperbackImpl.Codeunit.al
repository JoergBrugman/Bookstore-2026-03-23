namespace GetUseAcademy.Bookstore.Books.Interfaces;

/// <summary>
/// Diese Codeunit bildet den "speziellen" Prozess für ein Taschenbuch ab. 
/// </summary>
codeunit 50102 "BSB Book Type Paperback Impl." implements "BSB Book Type Process V2"
{
    procedure StartDeployBook()
    begin
        Message('Print on Demand');
    end;

    procedure StartDeliverBook()
    begin
        Message('Mit DPD versenden');
    end;

    procedure CheckQuality()
    begin
        Message('Qualität OK');
    end;
}