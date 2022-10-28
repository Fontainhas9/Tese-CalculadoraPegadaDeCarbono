tableextension 50100 ItemExt extends Item
{
    fields
    {
        field(50100; "CO2 Emission"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
            Caption = 'CO2eq Emission from Raw Material (ton)';
        }
        field(50101; "CO2 Average"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average("Production Order"."Real Value" WHERE("Source No." = FIELD("No."), "Real Value" = filter(<> 0), Status = filter(= Finished)));
            Caption = 'Average value of CO2eq Emission from the production phase (ton)';
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        field(50102; "CO2 Expectable Emission"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Expectable value of CO2eq Emission from the production phase (ton)';
            MinValue = 0;
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
    }
}
