pageextension 50121 ProductionOrderListExt extends "Production Order List"
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