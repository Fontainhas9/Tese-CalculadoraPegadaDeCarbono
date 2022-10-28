tableextension 50108 RoutingHeaderExt extends "Routing Header"
{
    fields
    {
        field(50101; "CO2 Emission"; Decimal)
        {
            CalcFormula = Sum("Routing Line"."CO2 Emission" WHERE("Routing No." = FIELD("No.")));
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            Editable = false;
            Caption = 'CO2eq Emission (ton)';
        }
    }
    var
        myInt: Integer;
}