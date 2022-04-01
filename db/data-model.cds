namespace sap.ui.meldewertservice;

using {managed} from '@sap/cds/common';


entity ReportedValueObject : managed {
  key objectId                 : UUID @(Core.Computed : true);
  
      insuranceName            : String;
      client                   : String;
      insuranceType            : String; // change to a real type later?
      sumInsured               : Decimal;
      premiumAdvancePercentage : Decimal; // or integer depending on later calculations
      calcualtionBaseType      : String; // could also be a own type at a later stage
      calculationBaseUnit      : String;
      reportingCycle           : Integer;
      startingDate             : Date;
      plans                    : Association to many ReportPlan
                                   on plans.object = $self;
}

type ReportingCycle : managed {
  title      : String;
  monthDelay : Integer;
};

entity ReportPlan : managed {
  key planId                : UUID @(Core.Computed : true);
      periodStart           : Timestamp;
      periodEnd             : Timestamp;
      settledReportingValue : Decimal;
      object                : Association to ReportedValueObject;
      document              : Association to ReportedValueDocument
                                on document.plan = $self;
}

entity ReportedValueDocument : managed {
  key documentId    : UUID @(Core.Computed : true);
      reportedValue : Decimal;
      reportingDate : Timestamp;
      plan          : Association to ReportPlan;
}
