namespace GetUseAcademy.Bookstore.Books.RoleCenters;

using Microsoft.Sales.RoleCenters;
using GetUseAcademy.Bookstore.Customer;

profile "BSB Bookstore"
{
    Caption = 'Profile for Bookstore', Comment = 'de-DE=Profil für Bücher';
    RoleCenter = "Order Processor Role Center";
    Customizations = "BSB Customer Card", "BSB Customer List";
}