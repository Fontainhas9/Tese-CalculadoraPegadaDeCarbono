pageextension 50111 MachineCenterCardExt extends "Machine Center Card"
{
    layout
    {
        addafter(Name)
        {
            field(Campo; Rec."CO2 Emission")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the CO2eq emissions from this Machine Center';
            }
        }
        addafter("Search Name")
        {
            field(Campo2; Rec."Power Consumption")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the power consumption from this machine';
                Importance = Promoted;

            }
        }
        addafter("Last Date Modified")
        {
            field(Campo3; Rec."OverHead CO2")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the overhead rate from this machine';

            }
        }
    }
}