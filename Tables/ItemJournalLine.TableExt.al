tableextension 50111 ItemJournalLineExt extends "Item Journal Line"
{
    fields
    {
        field(50102; "CO2 Emission Material"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'CO2eq Emission from Material (ton)';
            MinValue = 0;
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        field(50103; "CO2 Emission Routing"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'CO2eq Emission from Routing (ton)';
            MinValue = 0;
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                lrecItem: Record Item;
            begin
                lrecItem.get("Item No.");
                if lrecItem."CO2 Emission" <> 0 then
                    Validate("CO2 Emission Material", "Quantity" * lrecItem."CO2 Emission")
                else begin
                    Validate("CO2 Emission Material", "Quantity" * lrecItem."CO2 Expectable Emission");
                end;
            end;
        }
        modify("Run Time")
        {
            trigger OnAfterValidate()
            var
                lrecItem1: Record "Machine Center";
            begin
                lrecItem1.get("No.");
                Validate("CO2 Emission Routing", "Run Time" * lrecItem1."CO2 Emission");
            end;
        }
    }
    trigger OnAfterModify()
    begin
        FxRealCo2(rec."Document No.", rec."Source No.");
    end;

    procedure FxRealCo2(pDocNo: Code[20]; pSourceNo: Code[20]) RealValue: Decimal
    var
        ItemJournalLine: Record "Item Journal Line";
        ProdOrder: Record "Production Order";
        ProdOrderLine: Record "Prod. Order Line";
    begin
        //deteta linhas produção
        ProdOrderLine.Reset();
        ProdOrderLine.SetRange("Prod. Order No.", pDocNo);
        ProdOrderLine.SetRange("Item No.", pSourceNo);
        if ProdOrderLine.FindFirst() then begin
            //calcula emissões linhas artigos
            ItemJournalLine.Reset();
            ItemJournalLine.SetRange("Document No.", pDocNo);
            ItemJournalLine.SetRange("Source No.", pSourceNo);
            if ItemJournalLine.FindFirst() then begin
                repeat
                    RealValue += (ItemJournalLine."CO2 Emission Material" + ItemJournalLine."CO2 Emission Routing") / ProdOrderLine.Quantity;
                until ItemJournalLine.Next() = 0;
            end;
            ProdOrderLine.Validate(RealValue, RealValue);
            ProdOrderLine.Modify();
        end;
    end;
}