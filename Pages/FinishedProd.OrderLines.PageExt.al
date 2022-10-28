pageextension 50116 "FinishedProd.OrderLinesExt" extends "Finished Prod. Order Lines"
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
        addafter(Description)
        {
            field(Campo2; Rec.RealValue)
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Expectable CO2eq emissions from this product';
            }
        }
    }
}