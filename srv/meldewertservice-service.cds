using sap.ui.meldewertservice as my from '../db/data-model';

service MeldewertService {
    entity ReportedValueObject   as projection on my.ReportedValueObject;
    annotate ReportedValueObject with @odata.draft.enabled;
    entity ReportPlan            as projection on my.ReportPlan;
    annotate ReportPlan with @odata.draft.enabled;
    entity ReportedValueDocument as projection on my.ReportedValueDocument;
    annotate ReportedValueDocument with @odata.draft.enabled;

}
