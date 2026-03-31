namespace GetUseAcademy.Bookstore.Saasification.Notification;
using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;
using System.Environment.Configuration;

codeunit 50107 "BSB Notif. Subscriber Store"
{
    var
        MyNotifications: Record "My Notifications";
        CredLimitNotif: Notification;
        CredLimitNofifDescTxt: Label 'Balance of customer is lager than the credit limit.', Comment = 'de-DE=Der aldo des Debitors ist größer als das Kreditlimit.';
        CredLimitNotifActionTxt: Label 'Edit Customer', Comment = 'de-DE=Debitor bearbeiten';
        CredLimitNotifIDTxt: Label 'cb4b1b52-8194-4963-adc2-9b9288942537', Locked = true;
        CredLimitNotifMsg: Label '%1 %2 %3 %4 %5 is lager than %6', Comment = 'de-DE=%1 %2 %3 %4 %5 ist größer als %6';
        CredLimitNotifTxt: Label 'Customer balance exceeds credit limt', Comment = 'de-DE=Debitor Kreditlimitüberschreitung';

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterGetCurrRecordEvent, '', true, true)]
    local procedure SalesOrder_OnAfterGetCurrRecordEvent(var Rec: Record "Sales Header")
    begin
        if Rec."Bill-to Customer No." = '' then
            exit;
        CustCheckCreditLimit(Rec."Bill-to Customer No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Bill-to Customer No.", true, true)]
    local procedure Cust_OnAfterValidateEvent_BillToCustNo(var Rec: Record "Sales Header")
    begin
        CustCheckCreditLimit(Rec."Bill-to Customer No.");
    end;

    local procedure CustCheckCreditLimit(CustNo: Code[20])
    var
        Customer: Record Customer;
    begin
        if CustNo = '' then
            exit;

        CredLimitNotif.Id := CredLimitNotifIDTxt;
        CredLimitNotif.Recall();

        Customer.SetAutoCalcFields("Balance (LCY)");
        Customer.Get(CustNo);
        if Customer."Credit Limit (LCY)" = 0 then
            exit;
        if (Customer."Balance (LCY)" > Customer."Credit Limit (LCY)") and
            MyNotifications.IsEnabledForRecord(CredLimitNotifIDTxt, Customer)
        then begin
            CredLimitNotif.Id := CredLimitNotifIDTxt;
            CredLimitNotif.Scope := NotificationScope::LocalScope;
            CredLimitNotif.Message := StrSubstNo(CredLimitNotifMsg,
                Customer.FieldCaption("Balance (LCY)"),
                Customer."Balance (LCY)",
                Customer.TableCaption,
                Customer."No.",
                Customer.Name,
                Customer."Credit Limit (LCY)");
            CredLimitNotif.SetData('CustNo', Customer."No.");
            CredLimitNotif.AddAction(CredLimitNotifActionTxt, Codeunit::"BSB Notif. Subscriber Store", 'OpenCustomerCard');
            CredLimitNotif.Send();
        end
    end;

    procedure OpenCustomerCard(Notification: Notification)
    var
        Customer: Record Customer;
    begin
        Customer.Get(Notification.GetData('CustNo'));
        Page.Run(Page::"Customer Card", Customer);
    end;

    [EventSubscriber(ObjectType::Page, Page::"My Notifications", OnInitializingNotificationWithDefaultState, '', false, false)]
    local procedure "My Notifications_OnAfterInitializingNotificationWithDefaultState"()
    begin
        MyNotifications.InsertDefaultWithTableNum(CredLimitNotifIDTxt, CredLimitNotifTxt, CredLimitNofifDescTxt, Database::Customer);
    end;

}