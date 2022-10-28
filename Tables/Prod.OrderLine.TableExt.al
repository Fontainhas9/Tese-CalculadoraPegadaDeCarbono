tableextension 50109 "Prod.OrderLineExt" extends "Prod. Order Line"
{
    fields
    {
        field(50100; "CO2 Emission"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Prod. Order Component"."CO2 Emission" WHERE(Status = FIELD(Status), "Prod. Order No." = FIELD("Prod. Order No."), "Prod. Order Line No." = field("Line No.")));
            Caption = 'CO2eq Emission from Raw Materials (ton)';
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        field(50101; "RealValue"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Real Value of CO2eq Emission (ton)';
            Editable = false;
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            begin
                FxRealCo2ProdOrder(rec."Prod. Order No.");
            end;
        }
    }
    procedure FxRealCo2ProdOrder(pDocNo: Code[20]) RealValue: Decimal
    var
        ProdOrder: Record "Production Order";
        ProdOrderLine: Record "Prod. Order Line";
    begin
        ProdOrderLine.Reset();
        ProdOrderLine.SetRange("Prod. Order No.", pDocNo);
        if ProdOrderLine.FindFirst() then begin
            repeat
                RealValue += (ProdOrderLine.RealValue * ProdOrderLine.Quantity);
            until ProdOrderLine.Next() = 0;
        end;
        ProdOrder.Reset();
        ProdOrder.SetRange("No.", pDocNo);
        if ProdOrder.FindFirst() then begin
            ProdOrder."Real Value" := RealValue;
            ProdOrder.Modify();
        end;
    end;
}