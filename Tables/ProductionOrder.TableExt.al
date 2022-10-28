tableextension 50105 ProductionOrderExt extends "Production Order"
{
    fields
    {
        field(50102; "Real Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Real Value of CO2eq Emission (ton)';
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        field(50103; "Expectable Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Expectable Value of CO2eq Emission (ton)';
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
    }
    var
        myInt: Text;

    procedure FxCalculateOrderCO2ProdOrder() Co2Value: Decimal
    var
        ProdOrdersLines: Record "Prod. Order Line";
        RoutingN: Record "Routing Header";
    begin
        ProdOrdersLines.Reset();
        ProdOrdersLines.SetCurrentKey("Prod. Order No.", "Item No.");
        ProdOrdersLines.SetRange("Prod. Order No.", Rec."No.");
        if ProdOrdersLines.FindSet() then begin
            repeat
                ProdOrdersLines.CalcFields("CO2 Emission");
                Co2Value := Co2Value + (ProdOrdersLines."CO2 Emission") * ProdOrdersLines.Quantity;
            until ProdOrdersLines.Next() = 0;
        end;
        if RoutingN.Get(rec."Routing No.") then begin
            RoutingN.CalcFields("CO2 Emission");
            Co2Value := Co2Value + RoutingN."CO2 Emission";
        end;
    end;
}