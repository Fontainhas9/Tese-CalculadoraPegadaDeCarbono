/*page 50101 ReportCO2
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    trigger OnOpenPage();
    begin
        report.Run(Report::CO2Report);
    end;
}
*/