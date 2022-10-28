tableextension 50107 MachineCenterExt extends "Machine Center"
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
        field(50102; "Power Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Power Consumption (Mega Watt)';
            MinValue = 0;
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            begin
                Rec.Validate("CO2 Emission", Rec.FxCalculateCO2());
                Rec.Modify();
            end;
        }
        field(50103; "OverHead CO2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'OverHead Rate CO2eq';
            MinValue = 0;
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            begin
                Rec.Validate("CO2 Emission", Rec.FxCalculateCO2());
                Rec.Modify();
            end;
        }
    }
    var
        myInt: Text;

    procedure FxCalculateCO2() Co2Value: Decimal
    var
        recAnualAPAValues: Record "Anual APA Values";

    begin
        recAnualAPAValues.SetCurrentKey(Year);
        if recAnualAPAValues.FindLast() then;
        Co2Value := Rec."Power Consumption" * (1 + Rec."OverHead CO2") * recAnualAPAValues."Anual APA Values";
    end;
}