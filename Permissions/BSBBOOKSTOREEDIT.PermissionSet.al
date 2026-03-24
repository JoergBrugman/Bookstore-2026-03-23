namespace GetUseAcademy.Bookstore.Permissions;

using GetUseAcademy.Bookstore.Books.Book;

permissionset 50100 "BSB BOOKSTORE, EDIT"
{
    Assignable = true;
    Permissions = tabledata "BSB Book" = RIMD,
        table "BSB Book" = X;
}