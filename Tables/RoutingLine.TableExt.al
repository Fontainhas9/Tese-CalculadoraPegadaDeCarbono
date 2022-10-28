tableextension 50104 RoutingLineExt extends "Routing Line"
{
    fields
    {
        field(50101; "CO2 Emission"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'CO2eq Emission (ton)';
            MinValue = 0;
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        modify("Run Time")
        {
            trigger OnAfterValidate()
            var
                lrecItem1: Record "Machine Center";
            begin
                lrecItem1.get("No.");
                Validate("CO2 Emission", "Run Time" * lrecItem1."CO2 Emission");
                Modify();
            end;
        }
    }
    var
        myInt: Text;
}