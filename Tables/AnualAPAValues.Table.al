table 50101 "Anual APA Values"
{
    Caption = 'Anual Values from APA';
    DataCaptionFields = "Year";
    DrillDownPageID = "Anual APA Values";
    LookupPageID = "Anual APA Values";

    fields
    {
        field(1; "Year"; Integer)
        {
            Caption = 'Year';
            NotBlank = true;
        }
        field(2; "Anual APA Values"; Decimal)
        {
            Caption = 'Anual APA Value';
            DecimalPlaces = 0 : 5;
            InitValue = 1;

            trigger OnValidate()
            begin
                if "Anual APA Values" <= 0 then
                    FieldError("Anual APA Values", Text000);
                HumanResSetup.Get();

            end;
        }
    }

    keys
    {
        key(Key1; "Year")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Year", "Anual APA Values")
        {
        }
    }

    var
        Text000: Label 'must be greater than 0';
        HumanResSetup: Record "Human Resources Setup";
}

