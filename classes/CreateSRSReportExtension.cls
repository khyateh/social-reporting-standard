public with sharing class CreateSRSReportExtension {
 private final SRS_Report__c report;
 private ApexPages.StandardController controller;
 
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public CreateSRSReportExtension(ApexPages.StandardController stdController) {
        this.report = (SRS_Report__c)stdController.getRecord();
        controller = stdController;
    }  

    public PageReference saveAndEdit() {
        insert report;
        
        PageReference pg = new PageReference('/apex/SRS_Data_Collector?ReportId=' + report.Id +'#/1');
        
        return pg;
    }    
}