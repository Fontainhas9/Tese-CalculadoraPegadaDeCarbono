pageextension 50118 "Prod.OrderComponentsExt" extends "Prod. Order Components"
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