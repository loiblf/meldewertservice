using MeldewertService from './meldewertservice-service';

annotate MeldewertService.ReportedValueObject with {
    objectId                 @title : 'ObjectId';
    insuranceName            @title : 'Versicherung';
    client                   @title : 'Klient';
    insuranceType            @title : 'Versicherungs Typ';
    sumInsured               @title : 'Versicherte Summe';
    premiumAdvancePercentage @title : 'Vorauszahlung (%)';
    calcualtionBaseType      @title : 'Kalkulationsbasis Typ';
    calculationBaseUnit      @title : 'Kalkulationsbasis Einheit';
    startingDate             @title : 'Startdatum';
    reportingCycle           @title : 'Meldezyklus';
}

annotate MeldewertService.ReportPlan with {
    planId                @title : 'PlanId';
    object                @title : 'ObjectID';
    periodStart           @title : 'Start';
    periodEnd             @title : 'Ende';
    settledReportingValue @title : 'Festgelegter Meldewert';
    document              @title : 'Dokument';
}

annotate MeldewertService.ReportedValueDocument with {
    documentId    @title : 'BelegId';
    reportedValue @title : 'Gemeldeter Wert';
    reportingDate @title : 'Meldedatum';
    plan          @title : 'PlanId';
}


annotate MeldewertService.ReportedValueObject with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Meldewertobjekt',
        TypeNamePlural : 'Meldewertobjekte',
        Title          : {
            $Type : 'UI.DataField',
            Value : insuranceName
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : client
        }
    },
    SelectionFields  : [
        insuranceName,
        client,
        insuranceType,
        startingDate
    ],
    LineItem         : [
        {Value : insuranceName},
        {Value : client},
        {Value : sumInsured},
        {Value : reportingCycle},
        {Value : startingDate}
    ],
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Übersicht',
        Target : '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main : {Data : [
        {Value : objectId},
        {Value : insuranceName},
        {Value : client},
        {Value : sumInsured},
        {Value : premiumAdvancePercentage},
        {Value : reportingCycle},
        {Value : startingDate}
    ]

    },
});


annotate MeldewertService.ReportPlan with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Meldeplan',
        TypeNamePlural : 'Meldepläne',
        Title          : {
            $Type : 'UI.DataField',
            Value : planId
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : settledReportingValue
        }
    },
    SelectionFields  : [
        planId,
        object_objectId
    ],
    LineItem         : [
        {Value : object_objectId},
        {Value : planId},
        {Value : periodStart},
        {Value : periodEnd},
        {Value : settledReportingValue}
    ],
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Übersicht',
        Target : '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main : {Data : [
        {Value : object_objectId},
        {Value : planId},
        {Value : periodStart},
        {Value : periodEnd},
        {Value : settledReportingValue},
        {Value : document_documentId}
    ]},
});

annotate MeldewertService.ReportedValueDocument with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Meldewertbeleg',
        TypeNamePlural : 'Meldewertbelege',
        Title          : {
            $Type : 'UI.DataField',
            Value : documentId
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : reportingDate
        }
    },
    SelectionFields  : [
        documentId,
        plan_planId
    ],
    LineItem         : [
        {Value : documentId},
        {Value : plan_planId},
        {Value : reportingDate},
        {Value : reportedValue}
    ],
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Übersicht',
        Target : '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main : {Data : [
        {Value : documentId},
        {Value : plan_planId},
        {Value : reportingDate},
        {Value : reportedValue}
    ]},
});


//annotate MeldewertService.ReportedValueObject with {
//    plans @(Common : {ValueList : {
//        Label          : 'Plans',
//        CollectionPath : 'ReportPlan',
//        Parameters     : [{
//            $Type             : 'Common.ValueListParameterInOut',
//            LocalDataProperty : objectId,
//            ValueListProperty : 'object_objectId',
//        }, ]
//    }, }, )
//}
//
//annotate MeldewertService.ReportPlan with {
//    document @Common : { ValueList : {
//        Label: 'Document',
//        CollectionPath : 'ReportedValueDocument',
//        Parameters:[{
//            $Type: 'Common.ValueListParameterInOut',
//            LocalDataProperty: planId,
//            ValueListProperty: 'plan_planId',
//        }]
//    }, }
//}
//