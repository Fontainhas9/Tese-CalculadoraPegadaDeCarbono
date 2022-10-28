/*page 50101 GraphPage
{
    Caption = 'This is a graph attempt';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Business Chart Buffer";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                ApplicationArea = All;

                trigger AddInReady()
                begin
                    gIsChartAddInReady := true;
                    InitializeSelectedChart();
                end;

                trigger Refresh()
                begin
                    if gIsChartAddInReady then
                        InitializeSelectedChart();
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Month)
            {
                ApplicationArea = All;
                Caption = 'Month';

                trigger OnAction()
                begin
                    gCduChartMgtHUHYD.fxGetChartFilters(Rec, gYear, gDummyText, gDummyText, gDummyText);
                end;
            }
        }
    }

    var
        gCduChartMgtHUHYD: Codeunit MyCodeUnitChart;
        gIsChartAddInReady: Boolean;
        gYear: Text[250];
        gDummyText: Text[250];

    local procedure InitializeSelectedChart()
    begin
        if not gIsChartAddInReady then
            exit;

        gCduChartMgtHUHYD.fxUpadateYearSupPendingAmtChart(Rec, gYear);
        UpdateChart();
    end;

    local procedure UpdateChart()
    begin
        Update(CurrPage.Chart);
    end;

}*/