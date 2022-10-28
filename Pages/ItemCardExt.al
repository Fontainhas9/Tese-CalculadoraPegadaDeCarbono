pageextension 50101 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field(Campo; Rec."CO2 Emission")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the CO2eq emissions from this Raw Material';
            }
            field(Campo2; Rec."CO2 Average")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the average value of CO2eq emissions from the production of this product';
            }
            field(Campo3; Rec."CO2 Expectable Emission")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the expectable value of CO2eq emissions from the production of this product';
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        lRecRout: Record "Routing Header";
        lRecProdBOM: Record "Production BOM Header";

    begin
        if (rec."Routing No." <> '') then lRecRout.get(rec."Routing No.");
        if (rec."Production BOM No." <> '') then lRecProdBOM.get(rec."Production BOM No.");
        lRecRout.CALCFIELDS("CO2 Emission");
        lRecProdBOM.CALCFIELDS("CO2 Emission");
        Rec.Validate(rec."CO2 Expectable Emission", lRecRout."CO2 Emission" + lRecProdBOM."CO2 Emission");
    end;
}
