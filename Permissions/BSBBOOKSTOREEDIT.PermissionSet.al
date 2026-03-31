namespace GetUseAcademy.Bookstore.Permissions;

using GetUseAcademy.Bookstore.Books.Book;
using GetUseAcademy.Bookstore.Json;
using GetUseAcademy.Bookstore.InstallUpdate;

permissionset 50100 "BSB BOOKSTORE, EDIT"
{
    Assignable = true;
    Permissions = tabledata "BSB Book" = RIMD,
        table "BSB Book" = X,
        table "BSB AL Issue" = X,
        tabledata "BSB AL Issue" = RIMD,
        tabledata "BSB Internal Log" = RIMD,
        table "BSB Internal Log" = X;
}