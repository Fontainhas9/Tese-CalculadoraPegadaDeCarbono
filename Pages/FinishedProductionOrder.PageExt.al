pageextension 50120 FinishedProductionOrderExt extends "Finished Production Order"
{
    layout
    {
        addafter(Description)
        {
            field(Campo2; Rec."Real Value")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the total CO2eq emissions from this product';
            }
        }
    }
}