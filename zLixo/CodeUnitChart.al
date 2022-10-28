/*codeunit 50149 MyCodeUnitChart
{
    procedure fxGetChartFilters(var pBusChartBuf: Record "Finished P"; var pAnswer1: Text[250]; var pAnswer2: Text[250]; var pAnswer3: Text[250]; var pAnswer4: Text[250])
    var
        lPagUtilitiesDialog: Query QueryCO2;
        lText001_Txt: Label 'Filter';
        lText002_Txt: Label 'Year';
        lQuestionType: Option Text,"Code","Integer",Decimal,Date,Time,Bool,Option;
    begin
    end;

    procedure fxUpadateYearSupPendingAmtChart(var pBusChartBuf: Record "Business Chart Buffer"; pYear: Text)
    var
        lMonths: array[12] of Text;
        lRemainingAmounts: array[12] of Decimal;
        lIndex: Integer;
        lText001_Txt: Label 'Amount (Incl. VAT)';
        lText002_Txt: Label 'Month';
    begin
        Clear(lIndex);

        with pBusChartBuf do begin
            Initialize();

            // Y-axis
            AddMeasure(lText001_Txt, 1, "Data Type"::Decimal, "Chart Type"::Column.AsInteger());

            // X-axis
            SetXAxis(lText002_Txt, "Data Type"::String);

            fxGetYearSupPendingAmt(lMonths, lRemainingAmounts, pYear);

            for lIndex := 1 to 12 do begin
                AddColumn(lMonths[lIndex]); // X-axis point
                SetValueByIndex(0, lIndex - 1, lRemainingAmounts[lIndex]);
            end;
        end;
    end;

    local procedure fxGetYearSupPendingAmt(var pMonths: array[12] of Text; var pRemainingAmounts: array[12] of Decimal; pYear: Text)
    var
        lQueCO2: Query QueryCO2;
        lIndex: Integer;
        lYear: Integer;
    begin
        if pYear = '' then
            pYear := Format(DATE2DMY(WorkDate(), 3));

        Evaluate(lYear, pYear);

        // initializes arrays to fill every month
        for lIndex := 1 to 12 do begin
            pMonths[lIndex] := Format(DMY2Date(1, lIndex, lYear), 0, '<Month Text,3>') + ' ' + Format(lYear);
            pRemainingAmounts[lIndex] := 0;
        end;

        // calculates sums by month
        lQueCO2.SetFilter(DataC, '%1..%2', DMY2DATE(1, 1, lYear), DMY2DATE(31, 12, lYear));
        lQueCO2.Open();
        while lQueCO2.Read() do begin
            pRemainingAmounts[lQueCO2.DataM] += lQueCO2.Sum_Remaining_Amount;
        end;
        lQueCO2.Close();
    end;
}*/