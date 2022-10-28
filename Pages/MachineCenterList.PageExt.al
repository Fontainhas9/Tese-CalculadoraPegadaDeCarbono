pageextension 50110 MachineCenterListExt extends "Machine Center List"
{
    layout
    {
        addafter(Name)
        {
            field(Campo; Rec."CO2 Emission")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the CO2eq emissions from this Machine Center';
            }
        }
    }
}