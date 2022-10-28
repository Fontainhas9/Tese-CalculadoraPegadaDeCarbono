pageextension 50122 ProductionJournalExt extends "Production Journal"
{
    layout
    {
        addafter(Finished)
        {
            field(Campo2; Rec."CO2 Emission Material")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the CO2eq emissions from this Work Center';
            }
        }
        addafter("Location Code")
        {
            field(Campo3; Rec."CO2 Emission Routing")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the CO2eq emissions from this Work Center';
            }
        }
    }
}