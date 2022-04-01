using MeldewertService as service from '../../srv/meldewertservice-service';
using from '../../srv/meldewertservice-service-ui';


annotate service.ReportedValueObject with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Übersicht',
            Target : '@UI.FieldGroup#Main',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Übersicht Meldepläne',
            ID : 'test',
            Target : 'plans/@UI.LineItem#test',
        },
    ]
);


annotate service.ReportPlan with @(
    UI.LineItem #test : [
        {
            $Type : 'UI.DataField',
            Value : planId,
        },{
            $Type : 'UI.DataField',
            Value : periodStart,
        },{
            $Type : 'UI.DataField',
            Value : periodEnd,
        },{
            $Type : 'UI.DataField',
            Value : settledReportingValue,
        },]
);
