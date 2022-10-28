/*pageextension 50106 ReleaseProductionOrdersExt extends "Released Production Orders"
{
    layout
    {
        addafter(Description)
        {
            field(Campo2; Rec."Expectable Value")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the expectable CO2eq emissions from this product';
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        rec."Expectable Value" := rec.FxCalculateOrderCO2ProdOrder();
    end;
}*/