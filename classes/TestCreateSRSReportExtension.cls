@isTest
public class TestCreateSRSReportExtension {

    public static testMethod void TestCreateSRSReport()
    {
        SRS_Report__c rep = new SRS_Report__c();
        rep.Name = 'Test Report';
    CreateSRSReportExtension controller = new CreateSRSReportExtension(new ApexPages.StandardController(rep));
        
    PageReference pg = controller.saveAndEdit();    
        System.debug(pg);
    System.assert(pg != null);
    }
}