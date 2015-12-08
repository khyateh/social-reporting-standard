global with sharing class SRS_Data_Controller
{

/*
Question JSON:
{"Page Name": <Name>,
 "Content": <content>,
 "Sort Order": <sort order>,
 "Section": <section>,
 "Questions": {
                "Name": <name>,
                "Question Text": <question>,
                "Sort Order": <sort order>,
                "Subsection": <subsection>,
                "Answer__c" : <temporary data field>

              }
 };

*/

/*Property holding the SRS_Report__c object*/
    public SRS_Report__c SRSReport
    {
      get{
          if(SRSReport == null)
          {
            SRSReport = new SRS_Report__c();
          }
          return SRSReport;
      }
      set{
        SRSReport = value;
      }
    }

    /*Property holding the Report_Detail__c list*/
    public List<Report_Details__c> ReportDetails
    {
      get; set;
    }

/*Constructor */
    public SRS_Data_Controller()
    {
      string rId = ApexPages.currentPage().getParameters().get('ReportId');


      if(rId != null && rId != '')
      {
        SRSReport = [SELECT Id, Name, Description_of_Report__c FROM SRS_Report__c WHERE Id = :rId];
        if(SRSReport != null && SRSReport.Id != null)
        {
          //Get Report details
          ReportDetails = fetchReportDetails(rId);
          //System.debug(ReportDetails);
        }
      }
      else
      {
        SRSReport = new SRS_Report__c();
      }

    }

    /*
    Get answers saved in Report_Details__c corresponding to each question Subsection.
    There will be a one-to-one mapping between the questions in the subsection and the answers saved.
    */
    private static void GetAnswers(List<Page_Text__c> lstPageText, string sReportId)
    {
      //Get the report that has been saved
      if(sReportId != '' && lstPageText != null)
      {
        //System.debug('Getting Report');
        SRS_Report__c report = [Select Id, Name, Description_of_Report__c, (Select Id,Section__c, Subsection__c, Content__c, Summary__c from Report_Details__r) from SRS_Report__c where Id = :sReportId];
        Map<String, String> mapAnswers = new Map<String, String>();
        Map<String, String> mapSummaries = new Map<String, String>();
        for(Report_Details__c detail : report.Report_Details__r)
        {
          //Fill answer map with answers for each subsection.
          //This answer will be updated into the pageText.Page_Questions__c list
        //  System.debug('Details:: ' + EncodingUtil.urlEncode(detail.Content__c, 'UTF-8'));
          mapAnswers.put(detail.Subsection__c, detail.Content__c);
          mapSummaries.put(detail.Subsection__c, detail.Summary__c);
        }

        for(Page_Text__c pageText : lstPageText)
        {
          if(pageText != null && pageText.Page_Question__r != null)
          {
            for(Page_Question__c question : pageText.Page_Question__r)
            {
              question.Answer__c = mapAnswers.get(question.Subsection__c);
              question.Answer__c = ((question.Answer__c==null)||(question.Answer__c==''))?'-':question.Answer__c;
              question.Summary__c =  mapSummaries.get(question.Subsection__c);
            }
          }
        }
      }
    }


    /*
    Get list of questions along with previously saved answers if any. A new report will contain only
    questions, while an existing report may contain answers to the questions
    */
    @RemoteAction
    global static List<Page_Text__c> getAllQuestions(string reportId)
    {
      //Added khsrs__Summary__c
      List<Page_Text__c> pageText = [SELECT Name,Section__c,Sort_Order__c, Content__c, (Select Name, Subsection__c, Question_Text__c, Answer__c, Summary__c FROM Page_Question__r where version__c = 1 order by sort_order__c) FROM Page_Text__c where version__c = 1 order by Sort_Order__c];
      //Update answers from db
      //System.debug('Getting PageText ');
      GetAnswers(pageText, reportId);

      //string pageTextJson = JSON.serialize(pageText);

      //return pageTextJson;
      return pageText;
    }


    public PageReference CreateSRSReport()
    {
      //Create report and redirect to data collector view
      insert SRSReport;
      //System.debug('New report created : ' + SRSReport.Id);
      PageReference dataCollectionPage = new PageReference('/apex/SRS_Data_Collector?ReportId=' + SRSReport.Id);
      dataCollectionPage.setRedirect(true);
      return  dataCollectionPage;
    }


    /*
    Save answers to the corresponding questions posed. This will build up into the SRS report.
    */
    @RemoteAction
    global static integer saveAnswers(string answers, string reportName, string reportId, string reportDesc)
    {
      SRS_Report__c report = null;
      Report_Details__c reportDetails = null;
      List<Report_Details__c> lstReportDetails = new List<Report_Details__c>();
      Boolean isReportChanged = false;
      Map<String, Report_Details__c> mapReportDetails = new Map<string, Report_Details__c>();
      Page_Question__c question = null;
      List<Page_Question__c> lstAnswers = null;
      ID repId = null;
      Boolean isNewReport = true;

      //Convert Json to object
      //Create new report object if new report
      //Add report items from the answers and save
      try
      {
        //System.debug(answers);
        //System.debug('ReportId :' + reportId);
        if(reportId != null && reportId != '')
        {
          //SOQL injection avoidance
          //ReportId = reportId.replace('\'','') ;
          //Existing report. Fetch report details
          report = [Select Id, Name, Description_of_Report__c from SRS_Report__c where Id = :reportId];

          if (report != null)
          {
            //Added khsrs__Summary__c
            lstReportDetails =  [Select Id, Content__c, Page_Question__c, Section__c, Subsection__c, Summary__c from Report_Details__c where SRS_Report__c = :report.Id];
            isNewReport = false;
            if((lstReportDetails == null) || (lstReportDetails.size()==0))
            {
              isNewReport = true;
            }
            //Add Report_Details to map
            for(Report_Details__c r : lstReportDetails)
            {
              mapReportDetails.put(r.SubSection__c, r);
            }

            //Clear list of report details
            lstReportDetails = new List<Report_Details__c>();
          }

          repId = report.Id;
        }



        Map<String, List<Page_Question__c>> mapQA = tryParse(answers);
        Set<String> setSection = mapQA.KeySet();
        //System.debug('List : ' + lstAnswers);
        //System.debug(setSection);

        //Loop through the page questions list and extract the answers
        //If report already exists, update the answers
        //add to save list
          for(String section : setSection)
          {
            lstAnswers = (List<Page_Question__c>) mapQA.get(section);
          //  System.debug(lstAnswers);

            for(Page_Question__c answer : lstAnswers) //records
            {
              reportDetails = null;
              if(mapReportDetails != null && mapReportDetails.size() > 0)
                reportDetails = mapReportDetails.get(answer.Subsection__c);

              if(reportDetails == null)
              {
                //System.debug('New report details created');
                reportDetails = new Report_Details__c();
              }
              System.debug('Summary : ' + answer.Summary__c);
              reportDetails.Section__c = section;
              reportDetails.Subsection__c = answer.Subsection__c;
              reportDetails.SRS_Report__c = repId;
              reportDetails.Content__c = (answer.Answer__c==null?'.':answer.Answer__c);
              reportDetails.Page_Question__c = answer.Id;
              reportDetails.Content_Type__c = 'RichText';
              reportDetails.Summary__c = answer.Summary__c;

              //System.debug('Adding updated report to list :' + reportDetails);
              //System.debug(lstReportDetails);
              lstReportDetails.add(reportDetails);
            }
          }

          if(isNewReport)
           insert lstReportDetails;
          else
           update lstReportDetails;

        }
        catch(Exception e)
        {
        System.debug(e);
        return 1;
        }

      return 0;
    }

/* Parse incoming JSON containing questions and answers*/
    public static Map<String, List<Page_Question__c>> tryParse(String jsonToParse)
    {
      if(jsonToParse == null)
      {
        return null;
      }

      System.debug('JSOn To Parse : ' + jsonToParse);
      System.JSONParser parser = JSON.createParser(jsonToParse);
      List<Page_Question__c> lstPageQuestions = new List<Page_Question__c>();
      List<Page_Question__c> lstQuestions = new List<Page_Question__c>();
      Map<String, List<Page_Question__c>> mapQA = new Map<String, List<Page_Question__c>>();

      String text = null;
      String temp = null;
      String section = null;
      String prevSection = null;

      while (parser.nextToken() != JSONToken.END_ARRAY)
      {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME)
        {
          text = parser.getText();
          if (parser.nextValue() != JSONToken.VALUE_NULL)
          {
            if(text == 'khsrs__Section__c')
            {
              section = parser.getText();
              //System.debug('Parse successful: ' + section);
              parser.nextValue();
            }
            if (text == 'khsrs__Page_Question__r')
            {
              lstQuestions = (List<Page_Question__c>)parser.readValueAs(List<Page_Question__c>.class);

              //System.debug('Section__c :' + section +' : ' + lstQuestions);

              if(prevSection == '' && section != null && section != '')
                prevSection = section;

              if((section != null) && (section != ''))
              {
                //if there are multiple questions for the same section
                //add to the list of page questions for that section
                if(prevSection == section)
                {
                  for(Page_Question__c q : lstQuestions)
                  {
                      lstPageQuestions.add(q);
                  }
                }
                else
                {
                  //Section change has occurred. Hence save to map and
                  //store the new section questions
                  mapQA.put(prevSection, lstPageQuestions);
                  lstPageQuestions = new List<Page_Question__c>();

                  //store the new section data
                  for(Page_Question__c q : lstQuestions)
                  {
                      lstPageQuestions.add(q);
                  }
                  //Save change of section in prevSection
                  prevSection = section;
                  //section = '';
                }
              }
            }
          }
        }
      }

      if(section != '' && lstPageQuestions.size() >0)
      {
        mapQA.put(prevSection, lstPageQuestions);
      }

      return mapQA;
    }

/*Fetch the details of SRS reports for the given Report Id */
    @RemoteAction
    global static List<Report_Details__c> fetchReportDetails(string reportId)
    {
      //String reportId = 'a0028000006dgh9';
      //Added khsrs__Summary__c
      List<Report_Details__c> reportDetails = [Select Id, Name, Section__c, Content__c,Subsection__c, Content_type__c, Content_url__c, Page_Question__r.Sort_Order__c, Summary__c from Report_Details__c where SRS_Report__c = :reportId order by Page_Question__r.Sort_Order__c];
      return reportDetails;
    }

/*Fetch the SRS Report by Id */
    @RemoteAction
    global static SRS_Report__c fetchReportById(string reportId)
    {
      SRS_Report__c report = [Select Id, Name, Description_of_report__c from SRS_Report__c where Id = :reportId];
      return report;
    }

/*Search SRS report by name */
    @RemoteAction
    global static List<SRS_Report__c> searchReports(string searchString)
    {
        //System.debug('Search String ' + searchString);
        searchString = '%' + searchString + '%';
        List<SRS_Report__c> reports = [Select Id, Name, Description_of_report__c from SRS_Report__c where Name like :searchString order by CreatedDate desc limit 10];
        return reports;
    }

/*Create new report from an existing report */
    @RemoteAction
    global static ID createFromTemplate(string templateId, string reportName, string reportDesc)
    {
      //Clone and store as template
      SRS_Report__c origReport = fetchReportById(templateId);
      SRS_Report__c newReport = new SRS_Report__c();
      newReport.Name = reportName;
      newReport.Description_Of_Report__c = reportDesc;
      insert newReport;

      List<Report_Details__c> origDetails = fetchReportDetails(templateId);
      List<Report_Details__c> newDetails = new List<Report_Details__c>();

      for(Report_Details__c d : origDetails)
      {
        Report_Details__c newReportDetails = d.Clone(false,true,false,false);
        newReportDetails.SRS_Report__c = newReport.Id;
        newDetails.add(newReportDetails);
      }
      insert newDetails;

      return newReport.Id;
    }

    /*Get summary text*/
    @RemoteAction
    global static Map<string, string[]> getSummary(string reportId)
    {
      Map<string, string[]> summaryMap = new Map<string, string[]>();
      string[] summaries = null;

      List<Report_Details__c> lstReportDetails = [select Id, khsrs__Subsection__c, khsrs__Summary__c from khsrs__Report_Details__c where ID = :reportId order by 	khsrs__Subsection__c];

      if(lstReportDetails != null)
      {
        for(Report_Details__c d : lstReportDetails)
        {
          if(d.Summary__c != null)
          {
            summaries = d.Summary__c.split(';');

            summaryMap.put(d.Subsection__c, summaries);
          }
        }
      }


      return summaryMap;
    }

}