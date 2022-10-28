tableextension 50110 "Prod.OrderComponentExt" extends "Prod. Order Component"
{
    fields
    {
        field(50100; "CO2 Emission"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
            Caption = 'CO2eq Emission (ton)';
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        modify("Location Code")
        {
            trigger OnAfterValidate()
            var
                lrecItem: Record Item;
            begin
                lrecItem.get("Item No.");
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
    var
        myInt: Integer;
}