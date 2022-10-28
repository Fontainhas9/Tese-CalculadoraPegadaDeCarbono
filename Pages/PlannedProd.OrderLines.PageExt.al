pageextension 50114 "PlannedProd.OrderLinesExt" extends "Planned Prod. Order Lines"
{
    layout
    {
        addafter(Description)
        {
            field(Campo; Rec."CO2 Emission")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the total CO2eq emissions from this product';
            }
        }
    }
}