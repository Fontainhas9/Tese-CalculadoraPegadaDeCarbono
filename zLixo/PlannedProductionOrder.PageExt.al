/*pageextension 50117 PlannedProductionOrderExt extends "Planned Production Order"
{
    layout
    {
        addafter(Description)
        {
            field(Campo2; Rec."Expectable Value")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Expectable CO2eq emissions from this product';
            }
        }

    }
    trigger OnAfterGetRecord()
    begin
        rec."Expectable Value" := rec.FxCalculateOrderCO2ProdOrder();
    end;
}*/