report 50100 CO2Report
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\CO2Report.rdlc';
    Caption = 'CO2 Values';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(ProdOrder; "Production Order")
        {
            column(DateData; "Due Date")
            {
            }
            column(DateFormat; FORMAT("Due Date", 0, '<Day,2>-<Month,2>-<Year>'))
            {
            }
            column(EndingDate_ProdOrder; "Ending Date-Time")
            {
            }
            column(Item; "Routing No.")
            {
            }
            column(Quantity_ProdOrder; Quantity)
            {
            }
            column(StartingDate_ProdOrder; "Starting Date-Time")
            {
            }
            column(ValorCo2; "Real Value")
            {
            }
            column(Descrição; Description)
            {
            }
            column(Statuus; Status)
            {
            }
            column(NO_; "No.")
            { }
        }
    }
}