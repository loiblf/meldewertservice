using MeldewertService as service from '../../srv/meldewertservice-service';
using from '../../srv/meldewertservice-service-ui';



annotate service.ReportPlan with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Übersicht',
            Target : '@UI.FieldGroup#Main',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Verbundenes Dokument (WIP)',
            ID : 'Test',
            Target : '@UI.FieldGroup#Test',
        },
    ],
    UI.FieldGroup #Test : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : document.documentId,
            },{
                $Type : 'UI.DataField',
                Value : document.reportedValue,
            },{
                $Type : 'UI.DataField',
                Value : document.reportingDate,
            },],
    }
);
annotate service.ReportPlan with {
    planId @Common.Text : object.client
};
