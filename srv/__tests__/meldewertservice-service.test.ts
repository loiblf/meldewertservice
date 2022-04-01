import cds from "@sap/cds";
import { AxiosInstance } from "axios";

describe("MeldewertService", () => {
    process.env["CDS_TYPESCRIPT"] = "true";
    const cdsTest = (cds as any).test("serve", "MeldewertService", "--in-memory");
    const axios: AxiosInstance = cdsTest.axios;

    it("read Objects", async () => {
        const resp = await axios.get("/meldewert/ReportedValueObject");
        expect(resp.status).toBe(200);
        expect(resp.data.value).toHaveLength(12);
    });
});
