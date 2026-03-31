namespace GetUseAcademy.Bookstore.Books.Book;

using GetUseAcademy.Bookstore.Books.Tools;
using GetUseAcademy.Bookstore.Books.Interfaces;
using GetUseAcademy.Bookstore.Books;

page 50101 "BSB Book List"
{
    Caption = 'Books';
    PageType = List;
    SourceTable = "BSB Book";
    Editable = false;
    CardPageId = "BSB Book Card";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Books)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBN field.';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Pages field.';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateBooks)
            {
                Caption = 'Create Books';
                Image = CreateDocuments;
                ApplicationArea = All;
                ToolTip = 'Executes the Create Books action.';
                RunObject = codeunit "BSB Create Books";
            }
            action(SalesProcessCommon)
            {
                Caption = 'Sales Process Common';
                Image = Process;
                ApplicationArea = All;
                ToolTip = 'Executes the Sales Process Common action.';
                trigger OnAction()
                var
                    BSBBookTypeDefaultProcess: Codeunit "BSB Book Type Default Process";
                begin
                    BSBBookTypeDefaultProcess.StartDeployBook();
                    BSBBookTypeDefaultProcess.StartDeliverBook();
                end;
            }
            action(SalesProcessWithCodeunit)
            {
                Caption = 'Sales Process with Codeunit';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Sales Process with Codeunit action.';

                trigger OnAction()
                var
                    BSBBookTypeHardcoverImpl: Codeunit "BSB Book Type Hardcover Impl.";
                    BSBBookTypePaperbackImpl: Codeunit "BSB Book Type Paperback Impl.";
                    IsHandled: Boolean;
                begin
                    OnBeforeHandleBookTypeProcess(Rec, IsHandled);
                    if IsHandled then
                        exit;

                    case Rec.Type of
                        "BSB Book Type"::Paperback:
                            begin
                                BSBBookTypePaperbackImpl.StartDeployBook();
                                BSBBookTypePaperbackImpl.StartDeliverBook();
                            end;
                        "BSB Book Type"::Hardcover:
                            begin
                                BSBBookTypeHardcoverImpl.StartDeployBook();
                                BSBBookTypeHardcoverImpl.StartDeliverBook();
                            end;
                    end;
                end;
            }
            action(SalesProcessWithInterface)
            {
                Caption = 'Sales Process with Interface';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Sales Process with Interface action.';
                trigger OnAction()
                var
                    BSBBookTypeHardcoverImpl: Codeunit "BSB Book Type Hardcover Impl.";
                    BSBBookTypeNoneImpl: Codeunit "BSB Book Type None Impl.";
                    BSBBookTypePaperbackImpl: Codeunit "BSB Book Type Paperback Impl.";
                    IsHandled: Boolean;
                    BSBBookType: Interface "BSB Book Type Process";
                begin
                    OnBeforeHandleBookTypeProcess(Rec, IsHandled);
                    if IsHandled then
                        exit;

                    case Rec.Type of
                        "BSB Book Type"::" ":
                            BSBBookType := BSBBookTypeNoneImpl;
                        "BSB Book Type"::Hardcover:
                            BSBBookType := BSBBookTypeHardcoverImpl;
                        "BSB Book Type"::Paperback:
                            BSBBookType := BSBBookTypePaperbackImpl;
                    end;
                    BSBBookType.StartDeployBook();
                    BSBBookType.StartDeliverBook();
                end;
            }
            action(SalesProcessWithInterfaceAndEnum)
            {
                Caption = 'Sales Process with Interface and Enum';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Sales Process with Interface and Enum action.';
                trigger OnAction()
                var
                    BSBBookTypeProcess: Interface "BSB Book Type Process";
                begin
                    BSBBookTypeProcess := Rec.Type;
                    BSBBookTypeProcess.StartDeployBook();
                    if BSBBookTypeProcess is "BSB Book Type Process V2" then
                        (BSBBookTypeProcess as "BSB Book Type Process V2").CheckQuality();
                    BSBBookTypeProcess.StartDeliverBook();
                end;
            }
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnBeforeHandleBookTypeProcess(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    begin
    end;
}