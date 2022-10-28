tableextension 50102 "Production BOM Line Ext" extends "Production BOM Line"
{
    fields
    {
        field(50102; "CO2 Emission"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'CO2eq Emission (ton)';
            MinValue = 0;
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        modify("Quantity per")
        {
            trigger OnAfterValidate()
            var
                lrecItem: Record Item;
            begin
                lrecItem.get("No.");
                if lrecItem."CO2 Emission" <> 0 then
                    Validate("CO2 Emission", "Quantity per" * lrecItem."CO2 Emission")
                else begin
                    lrecItem.CalcFields("CO2 Average");
                    Validate("CO2 Emission", "Quantity per" * lrecItem."CO2 Average");
                end;
                Modify();
            end;
        }
    }
}