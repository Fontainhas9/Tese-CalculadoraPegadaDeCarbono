tableextension 50101 "Production BOM Header Ext" extends "Production BOM Header"
{
    fields
    {
        field(50101; "CO2 Emission"; Decimal)
        {
            CalcFormula = Sum("Production BOM Line"."CO2 Emission" WHERE("Production BOM No." = FIELD("No.")));
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            Editable = false;
            Caption = 'CO2eq Emission (ton)';
        }
    }
    var
        myInt: Text;
}