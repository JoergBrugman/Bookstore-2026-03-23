namespace GetUseAcademy.Bookstore.Permissions;

using GetUseAcademy.Bookstore.Books.Book;
using GetUseAcademy.Bookstore.Json;

permissionset 50100 "BSB BOOKSTORE, EDIT"
{
    Assignable = true;
    Permissions = tabledata "BSB Book" = RIMD,
        table "BSB Book" = X,
        table "BSB AL Issue" = X,
        tabledata "BSB AL Issue" = RIMD;
}