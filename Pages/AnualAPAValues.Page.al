page 50100 "Anual APA Values"
{
    ApplicationArea = BasicHR;
    Caption = 'Anual APA Values';
    PageType = List;
    SourceTable = "Anual APA Values";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Year"; Rec.Year)
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the year';
                }
                field("Anual APA Values"; Rec."Anual APA Values")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the value from APA';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

