pageextension 50104 RoutingLinesExt extends "Routing Lines"
{
    layout
    {
        addafter(Description)
        {
            field(Campo; Rec."CO2 Emission")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the CO2eq emissions from this product';
            }
        }
    }
}