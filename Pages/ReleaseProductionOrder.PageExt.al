pageextension 50119 ReleaseProductionOrderExt extends "Released Production Order"
{
    layout
    {
        addafter(Description)
        {
            field(Campo; Rec."Real Value")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Expectable CO2eq emissions from this product';
            }
        }
    }
}