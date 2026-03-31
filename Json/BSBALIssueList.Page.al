namespace GetUseAcademy.Bookstore.Json;

page 50104 "BSB AL Issue List"
{
    PageType = List;
    SourceTable = "BSB AL Issue";
    Caption = 'AL Issues';
    Editable = false;
    SourceTableView = order(descending);
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Number; Rec.Number) { ToolTip = 'Specifies the value of the Number field'; }
                field(Title; Rec.Title) { ToolTip = 'Specifies the value of the Title field'; }
                field(CreatedAt; Rec."Created at") { ToolTip = 'Specifies the value of the Created at field'; }
                field(User; Rec.User) { ToolTip = 'Specifies the value of the User field'; }
                field(State; Rec.State) { ToolTip = 'Specifies the value of the State field'; }
                field(Website; Rec.Website) { ToolTip = 'Specifies the value of the Website field'; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshALIssueList)
            {
                Caption = 'Refresh Issues';
                Promoted = true;
                PromotedCategory = Process;
                Image = RefreshLines;
                ApplicationArea = All;
                ToolTip = 'Executes the Refresh Issues action';

                trigger OnAction();
                begin
                    Rec.RefreshIssues();
                    CurrPage.Update();
                    if Rec.FindFirst() then;
                end;
            }
        }
    }

}