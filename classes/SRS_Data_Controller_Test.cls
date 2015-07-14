@IsTest(SeeAllData = true)
public class SRS_Data_Controller_Test{

@IsTest
public static void TestCreateSearchReports()
{
	//Test CreateSRSReport
	SRS_Data_Controller c = new SRS_Data_Controller();
	SRS_Report__c report =  c.SRSReport;
	report.Name = 'Test Report';
	report.Description_Of_Report__c = 'Test Description';
	PageReference ref = c.CreateSRSReport();
	report =  c.SRSReport;

	System.debug(ref);
	System.assert(ref != null);

	List<SRS_Report__c> lstSearchResults = SRS_Data_Controller.searchReports('Test'	);
	System.assert(lstSearchResults != null);

	Report_Details__c detail = new Report_Details__c();
	detail.SRS_Report__c = report.Id;
	detail.Content__c = 'Test';
	insert detail;

	//Test getAllQuestions with reportId
	List<Page_Text__c> lstQuestions = SRS_Data_Controller.getAllQuestions(report.Id);
	System.assert(lstQuestions  != null);
}

@IsTest(seealldata=true)
public static void TestGetQuestionsSaveAnswers()
{
	string reportId = '';

	SRS_Report__c report =  new SRS_Report__C();
	report.Name = 'Test Report';
	report.Description_Of_Report__c = 'Test Description';
	insert report;
	reportId = report.Id;

	Report_Details__c detail = new Report_Details__c();
	detail.SRS_Report__c = report.Id;
	detail.Content__c = 'Test';
	insert detail;

	//Test getAllQuestions with null reportId
	List<Page_Text__c> lstQuestions = SRS_Data_Controller.getAllQuestions(reportId);
	System.assert(lstQuestions  != null);


	//Test saveAsnwers
	string answers = '[{"Name":"Introduction","khsrs__Section__c":"Part A - Overview","khsrs__Sort_Order__c":1,"khsrs__Content__c":"Introduction","Id":"a02280000015c3BAAQ","khsrs__Page_Question__r":[{"khsrs__Page_Text__c":"a02280000015c3BAAQ","Id":"a0328000000rjBMAAY","Name":"0011","khsrs__Subsection__c":"1.1 Vision and approach","khsrs__Question_Text__c":"What is the vision and approach for the impact action?","khsrs__Answer__c":"<h1>Test again.. work</h1><div><p><b>TEST BOLD</b></p></div>"},{"khsrs__Page_Text__c":"a02280000015c3BAAQ","Id":"a0328000000rjBRAAY","Name":"0012","khsrs__Subsection__c":"1.2 Scope of the report","khsrs__Question_Text__c":"What is the scope of the report? What are the areas covered in the report?","khsrs__Answer__c":"Fixed! Maybe now"}]},{"Name":"Problem and Solution","khsrs__Section__c":"Part B - The Offer","khsrs__Sort_Order__c":2,"khsrs__Content__c":"The Social Problem and the Solution","Id":"a02280000015c2WAAQ","khsrs__Page_Question__r":[{"khsrs__Page_Text__c":"a02280000015c2WAAQ","Id":"a0328000000rjBWAAY","Name":"0013","khsrs__Subsection__c":"2.1 The social problem","khsrs__Question_Text__c":"Please describe the problem that is being/was addressed.","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c2WAAQ","Id":"a0328000000rjBbAAI","Name":"0014","khsrs__Subsection__c":"2.2 Solution attempts made to date","khsrs__Question_Text__c":"What were the attempts made in order to solve the problem? Do include details of attempts made that were significant.","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c2WAAQ","Id":"a0328000000rjBgAAI","Name":"0015","khsrs__Subsection__c":"2.3 The solution","khsrs__Question_Text__c":"Please describe the solution identified/implemented for the problem.","khsrs__Answer__c":"-"}]},{"Name":"Res_Work_Results","khsrs__Section__c":"Part B - The Offer","khsrs__Sort_Order__c":3,"khsrs__Content__c":"Resources, Work performed and Results during the Reporting Period","Id":"a02280000015c36AAA","khsrs__Page_Question__r":[{"khsrs__Page_Text__c":"a02280000015c36AAA","Id":"a0328000000rjD8AAI","Name":"0035","khsrs__Subsection__c":"3.1 Resources used (input)","khsrs__Question_Text__c":"What were the Resources used (input) for providing the solution?","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c36AAA","Id":"a0328000000rjBqAAI","Name":"0017","khsrs__Subsection__c":"3.2 Work performed (output)","khsrs__Question_Text__c":"Describe the work performed (output) as a part of the solution.","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c36AAA","Id":"a0328000000rjBvAAI","Name":"0018","khsrs__Subsection__c":"3.3 Results achieved (outcome/impact)","khsrs__Question_Text__c":"What were the results that were achieved in terms of outcome and impact areas of the solution?","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c36AAA","Id":"a0328000000rjC0AAI","Name":"0019","khsrs__Subsection__c":"3.4 Presenting resources, work performed and results during the reporting period","khsrs__Question_Text__c":"Please present the resources utilized, work performed and results during the reporting period","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c36AAA","Id":"a0328000000rjC5AAI","Name":"0020","khsrs__Subsection__c":"3.5 Provisions taken for the accompanying evaluation and qualitiy assurance","khsrs__Question_Text__c":"What were the provisions taken for the accompanying evaluation and quality assurance?","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c36AAA","Id":"a0328000000rjCAAAY","Name":"0021","khsrs__Subsection__c":"3.6 Previous year comparison: Objectives achieved, learning experience and success","khsrs__Question_Text__c":"Previous year comparison: Objectives achieved, learning experience and success","khsrs__Answer__c":"-"}]},{"Name":"Plan_Forecast","khsrs__Section__c":"Part B - The Offer","khsrs__Sort_Order__c":4,"khsrs__Content__c":"Planning and Forecast","Id":"a02280000015c3GAAQ","khsrs__Page_Question__r":[{"khsrs__Page_Text__c":"a02280000015c3GAAQ","Id":"a0328000000rjCFAAY","Name":"0022","khsrs__Subsection__c":"4.1 Planning and targets","khsrs__Question_Text__c":"Please describe the planning details and the targets that were set for the project(s).","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3GAAQ","Id":"a0328000000rjCKAAY","Name":"0023","khsrs__Subsection__c":"4.2 Influence factors: chances and risks","khsrs__Question_Text__c":"What were the factors Influencing the action? Do describe the chances and risks involved as a part of the action.","khsrs__Answer__c":"-"}]},{"Name":"Org_Struct","khsrs__Section__c":"Part B - The Offer","khsrs__Sort_Order__c":5,"khsrs__Content__c":"Organisational structure and Team","Id":"a02280000015c3LAAQ","khsrs__Page_Question__r":[{"khsrs__Page_Text__c":"a02280000015c3LAAQ","Id":"a0328000000rjCPAAY","Name":"0024","khsrs__Subsection__c":"5.1 Organisational structure","khsrs__Question_Text__c":"Describe the structure of the organization","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3LAAQ","Id":"a0328000000rjCUAAY","Name":"0025","khsrs__Subsection__c":"5.2 Introduction of the participating individuals","khsrs__Question_Text__c":"Please provide the introductions of the participating individuals","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3LAAQ","Id":"a0328000000rjCZAAY","Name":"0026","khsrs__Subsection__c":"5.3 Partnerships, cooperations and networks","khsrs__Question_Text__c":"Please describe the various partnerships, cooperations and networks that were established or involved in the action","khsrs__Answer__c":"-"}]},{"Name":"Org_Profile","khsrs__Section__c":"Part C - The Organization","khsrs__Sort_Order__c":6,"khsrs__Content__c":"Organisational profile","Id":"a02280000015c3QAAQ","khsrs__Page_Question__r":[{"khsrs__Page_Text__c":"a02280000015c3QAAQ","Id":"a0328000000rjCeAAI","Name":"0027","khsrs__Subsection__c":"6.1 General information about the organisation","khsrs__Question_Text__c":"Please provide details and general information about the organisation. Do include content for previous years if relevant.","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3QAAQ","Id":"a0328000000rjCBAAY","Name":"0028","khsrs__Subsection__c":"6.2 Governance of the organisation","khsrs__Question_Text__c":"Please provide the governance model of the organisation","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3QAAQ","Id":"a0328000000rjCjAAI","Name":"0029","khsrs__Subsection__c":"6.3 Ownership structure, memberships and associated organisations","khsrs__Question_Text__c":"Please describe the ownership structure, memberships and associated organisation details","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3QAAQ","Id":"a0328000000rjCoAAI","Name":"0030","khsrs__Subsection__c":"6.4 Environmental and social profile","khsrs__Question_Text__c":"Please provide details of the environmental and social profile of the organisation","khsrs__Answer__c":"-"}]},{"Name":"Finance","khsrs__Section__c":"Part C - The Organization","khsrs__Sort_Order__c":7,"khsrs__Content__c":"Finance and Accounting Practices","Id":"a02280000015c3VAAQ","khsrs__Page_Question__r":[{"khsrs__Page_Text__c":"a02280000015c3VAAQ","Id":"a0328000000rjCtAAI","Name":"0031","khsrs__Subsection__c":"7.1 Bookkeeping and accounting","khsrs__Question_Text__c":"Please provide details of bookkeeping and accounting in the organisation.","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3VAAQ","Id":"a0328000000rjCyAAI","Name":"0032","khsrs__Subsection__c":"7.2 Asset statement","khsrs__Question_Text__c":"Please provide a detailed asset statement of the organisation","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3VAAQ","Id":"a0328000000rjD3AAI","Name":"0033","khsrs__Subsection__c":"7.3 Income and expenditure","khsrs__Question_Text__c":"Please provide details of  Income and expenditure for the reporting period","khsrs__Answer__c":"-"},{"khsrs__Page_Text__c":"a02280000015c3VAAQ","Id":"a0328000000rjBcAAI","Name":"0034","khsrs__Subsection__c":"7.4 Financial situation and planning","khsrs__Question_Text__c":"Please provide an overview of the financial situation and planning","khsrs__Answer__c":"-"}]}]';

	integer res = SRS_Data_Controller.saveAnswers(answers, 'Test Report', reportId , 'Test Desc');
	System.assert(res == 1);

	//Test FetchReportById
	report = SRS_Data_Controller.fetchReportById(reportId);
	System.assert(report != null);

	//Test fetchReportDetails
	List<Report_Details__c> lstReportDetails = SRS_Data_Controller.fetchReportDetails(reportId);
	System.assert(lstReportDetails != null);

	//Test createFromTemplate
	ID newId =  SRS_Data_Controller.createFromTemplate(reportId, 'New Report', 'NewReportDesc');
	System.assert(newID != null);
}

}
