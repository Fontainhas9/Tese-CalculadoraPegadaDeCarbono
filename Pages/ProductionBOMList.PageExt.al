pageextension 50103 ProducBOMListPageExt extends "Production BOM List"
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