namespace GetUseAcademy.Bookstore.Books.Interfaces;

/// <summary>
/// Diese Codeunit bildet den Prozess für alle Typen, die keinen Prozess haben, ab.
/// </summary>
codeunit 50104 "BSB Book Type None Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Bereistellung nicht implementiert');
    end;

    procedure StartDeliverBook()
    begin
        Message('Lieferung nicht implementiert');
    end;
}