pageextension 50113 ProdcutionBOMPageExt extends "Production BOM"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field(Campo; Rec."CO2 Emission")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the CO2eq emissions from this product';
            }
        }
    }

    var
        myInt: Integer;
}