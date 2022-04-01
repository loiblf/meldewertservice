import cds from "@sap/cds";

//module.exports = cds.service.impl(function () {
//    const { ReportedValueObject, ReportPlan, ReportedValueDocument } = this.entities;
//    this.after(["CREATE", "UPDATE"], ReportedValueObject, rvo => {
//        console.log("TEST");
//        if (rvo.data.reportingCycle != null) (rvo.data.reportingCycle = 90);
//    })
//})

module.exports = cds.service.impl(function () {
    const { ReportedValueObjects, ReportPlans, ReportedValueDocuments } = this.entities;
    /*
    this.after(['READ'], ReportedValueObjects, objects => {
        //console.log(objects);
        if (objects && Array.isArray(objects)) {
            objects.forEach(async (object) => {
                if (object.reportingCycle) {
                    let plans: Array<Object> = await this.run(SELECT.from("ReportPlan").where("object_objectId=", object.objectId));
                    //console.log(plans.length);
                    if (plans.length == 0) {
                        console.log(object.objectId + " | Keine Pläne hinterlegt");
                    } else {
                        console.log(object.objectId + " | " + plans.length + " Pläne hinterlegt");
                    }
                    //object.reportingCycle = -1;
                }
            })
        }
    })

    */
    this.after(['CREATE'], ReportedValueObjects, async object => {
        if (!object.reportingCycle) {
            return;
        }
        // using only the Year of the reportingCycle for now (easier)
        let startingDate: Date = new Date(object.startingDate);
        let startingYear: number = startingDate.getFullYear();

        let cycle: number = object.reportingCycle;
        let plans = [];
        for (let i = cycle; i <= 12; i += cycle) {
            let startReportDate: Date = new Date(startingYear, i-1, 1);
            let endReportDate: Date = new Date(startingYear, i-1 + cycle, 1);
            endReportDate.setDate(endReportDate.getDate() - 1);

            plans.push(
                {
                    periodStart: startReportDate,
                    periodEnd: endReportDate,
                    // wrong calcualtion?
                    settledReportingValue: object.sumInsured * object.premiumAdvancePercentage / 100,
                    object_objectId: object.objectId
                }
            );
        }
        await this.run(INSERT.into("ReportPlan").entries(plans));

    })

    this.after('UPDATE', ReportedValueObjects, objects => {
        console.log("UPDATED");
    })
})