pageextension 50107 FinishedProductionOdersExt extends "Finished Production Orders"
{
    layout
    {
        addafter(Description)
        {
            field(Campo2; Rec."Real Value")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the total CO2eq emissions from this product';
            }
        }
    }
    actions
    {
        addbefore("Prod. Order - Detail Calc.")
        {
            action(ReportCO2)
            {
                ApplicationArea = All;
                Caption = 'Report CO2';
                Image = Report;
                trigger OnAction()
                var
                    Reportt: Report CO2Report;
                //ProdOrderStat: Record "Production Order";
                begin
                    Reportt.SetTableView(Rec);
                    Reportt.UseRequestPage(false);
                    Reportt.Run();
                end;

            }
        }
    }
}