using MeldewertService as service from '../../srv/meldewertservice-service';
using from '../../srv/meldewertservice-service-ui';
annotate service.ReportedValueDocument with @(
    UI.HeaderFacets : [],
    UI.FieldGroup #test : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.ReportedValueDocument with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Übersicht',
            Target : '@UI.FieldGroup#Main',
        },
    ],
    UI.Identification : [
    ]
);
annotate service.ReportedValueDocument with {
    plan @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ReportPlan',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : plan_planId,
                    ValueListProperty : 'planId',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.ReportedValueObject with {
    objectId @Common.Text : client
};
