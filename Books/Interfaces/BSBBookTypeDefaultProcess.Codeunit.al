namespace GetUseAcademy.Bookstore.Books.Interfaces;

/// <summary>
/// Diese Codeunit hat den "alten" Prozess abgebildet, bei dem 
/// jedes Buch auf Lager war und auch durch gleichen Versender 
/// transportiert wurde. 
/// </summary>
codeunit 50101 "BSB Book Type Default Process"
{
    procedure StartDeployBook()
    begin
        Message('Aus Lager entnehmen');
    end;

    procedure StartDeliverBook()
    begin
        Message('Mit UPS versenden');
    end;
}