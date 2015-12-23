global class PostInstallClass implements InstallHandler {
  global void onInstall(InstallContext context) {
    if(context.previousVersion() == null) {

List<Page_Text__c> lstPageText = new List<Page_Text__c>();
List<Page_Question__c> lstPageQuestion = new List<Page_Question__c>();

//-------------
//Insert Page Text - Introduction
Page_Text__c pgText = new Page_Text__c(name='Introduction',Section__c='Part A -  Overview', Content__c='Introduction', Sort_Order__c=1, Version__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
Page_Question__c question = new Page_Question__c(Subsection__c = '1.1 Vision and approach', Question_Text__c='What is the vision and approach for the impact action?', Answer__c = '', Sort_Order__c = 1, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '1.2 Scope of the report', Question_Text__c='What is the scope of the report? What are the areas covered in the report?', Answer__c = '', Sort_Order__c = 2, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

//-------------

//Insert Page Text - Problem and Solution
pgText = new Page_Text__c(name='Problem and Solution',Section__c='Part B - The Offer',Content__c='The Social Problem and the Solution',Sort_Order__c=2, Version__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new Page_Question__c(Subsection__c = '2.1 The social problem', Question_Text__c='Please describe the problem that is being/was addressed.', Answer__c = '', Sort_Order__c = 3, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '2.1a Problem Causes', Question_Text__c='What are the primary causes for the problem?', Answer__c = '', Sort_Order__c = 4, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '2.1b Consequences', Question_Text__c='What are the consequences arising out of the problem?', Answer__c = '', Sort_Order__c = 4, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '2.1c Target Groups', Question_Text__c='Who are the target group for the desired impact?', Answer__c = '', Sort_Order__c = 4, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);


question = new Page_Question__c(Subsection__c = '2.2 Solution attempts made to date', Question_Text__c='What were the attempts made in order to solve the problem? Do include details of attempts made that were significant.', Answer__c = '', Sort_Order__c = 4, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '2.3 The solution', Question_Text__c='Please describe the solution identified/implemented for the problem.', Answer__c = '', Sort_Order__c = 5, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Res_Work_Results
pgText = new Page_Text__c(name='Res_Work_Results',Section__c='Part B - The Offer',Content__c='Resources, Work performed and Results during the Reporting Period',Sort_Order__c=3, Version__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new Page_Question__c(Subsection__c = '3.1 Resources used (input)', Question_Text__c='What were the Resources used (input) for providing the solution?', Answer__c = '', Sort_Order__c = 6, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '3.2 Work performed (output)', Question_Text__c='Describe the work performed (output) as a part of the solution.', Answer__c = '', Sort_Order__c = 7, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '3.3 Results achieved (outcome/impact)', Question_Text__c='What were the results that were achieved in terms of outcome and impact areas of the solution?', Answer__c = '', Sort_Order__c = 8, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '3.4 Presenting resources, work performed and results during the reporting period', Question_Text__c='Please present the resources utilized, work performed and results during the reporting period', Answer__c = '', Sort_Order__c = 9, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '3.5 Provisions taken for the accompanying evaluation and qualitiy assurance', Question_Text__c='What were the provisions taken for the accompanying evaluation and quality assurance?', Answer__c = '', Sort_Order__c = 10, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '3.6 Previous year comparison: Objectives achieved, learning experience and success', Question_Text__c='Previous year comparison: Objectives achieved, learning experience and success', Answer__c = '', Sort_Order__c = 11, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Plan_Forecast
pgText = new Page_Text__c(name='Plan_Forecast',Section__c='Part B - The Offer',Content__c='Planning and Forecast',Sort_Order__c=4, Version__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new Page_Question__c(Subsection__c = '4.1 Planning and targets', Question_Text__c='Please describe the planning details and the targets that were set for the project(s).', Answer__c = '', Sort_Order__c = 12, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '4.2 Influence factors: chances and risks', Question_Text__c='What were the factors Influencing the action? Do describe the chances and risks involved as a part of the action.', Answer__c = '', Sort_Order__c = 13, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Org_Struct
pgText = new Page_Text__c(name='Org_Struct',Section__c='Part B - The Offer',Content__c='Organisational structure and Team',Sort_Order__c=5, Version__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new Page_Question__c(Subsection__c = '5.1 Organisational structure', Question_Text__c='Describe the structure of the organization', Answer__c = '', Sort_Order__c = 14, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '5.2 Introduction of the participating individuals', Question_Text__c='Please provide the introductions of the participating individuals', Answer__c = '', Sort_Order__c = 15, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '5.3 Partnerships, cooperations and networks', Question_Text__c='Please describe the various partnerships, cooperations and networks that were established or involved in the action', Answer__c = '', Sort_Order__c = 16, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Org_Profile
pgText = new Page_Text__c(name='Org_Profile',Section__c='Part C - The Organization',Content__c='Organisational profile',Sort_Order__c=6, Version__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new Page_Question__c(Subsection__c = '6.1 General information about the organisation', Question_Text__c='Please provide details and general information about the organisation. Do include content for previous years if relevant.', Answer__c = '', Sort_Order__c = 17, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '6.2 Governance of the organisation', Question_Text__c='Please provide the governance model of the organisation', Answer__c = '', Sort_Order__c = 18, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '6.3 Ownership structure, memberships and associated organisations', Question_Text__c='Please describe the ownership structure, memberships and associated organisation details', Answer__c = '', Sort_Order__c = 19, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '6.4 Environmental and social profile', Question_Text__c='Please provide details of the environmental and social profile of the organisation', Answer__c = '', Sort_Order__c = 20, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Finance
pgText = new Page_Text__c(name='Finance',Section__c='Part C - The Organization',Content__c='Finance and Accounting Practices',Sort_Order__c=7, Version__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new Page_Question__c(Subsection__c = '7.1 Bookkeeping and accounting', Question_Text__c='Please provide details of bookkeeping and accounting in the organisation.', Answer__c = '', Sort_Order__c = 21, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '7.2 Asset statement', Question_Text__c='Please provide a detailed asset statement of the organisation', Answer__c = '', Sort_Order__c = 22, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '7.3 Income and expenditure', Question_Text__c='Please provide details of Income and expenditure for the reporting period', Answer__c = '', Sort_Order__c = 23, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

question = new Page_Question__c(Subsection__c = '7.4 Financial situation and planning', Question_Text__c='Please provide an overview of the financial situation and planning', Answer__c = '', Sort_Order__c = 24, Page_Text__r = pgText, Version__c=1);
lstPageQuestion.add(question);

insert lstPageText;

for(Page_Question__c q : lstPageQuestion)
{
  //Update PageTextId from relationship
  q.Page_Text__c = q.Page_Text__r.Id;
}

insert lstPageQuestion;
}
else
{
  Page_Text__c pgText = [Select Id from Page_text__c where name='Problem and Solution'];
  if(pgText != null)
  {
  List<Page_Question__c> lstPageQuestion = new List<Page_Question__c>();
  Page_Question__c question = new Page_Question__c(Subsection__c = '2.1a Problem Causes', Question_Text__c='What are the primary causes for the problem?', Answer__c = '', Sort_Order__c = 4, Page_Text__c = pgText.Id, Version__c=1);
  lstPageQuestion.add(question);

  question = new Page_Question__c(Subsection__c = '2.1b Consequences', Question_Text__c='What are the consequences arising out of the problem?', Answer__c = '', Sort_Order__c = 4, Page_Text__c = pgText.Id, Version__c=1);
  lstPageQuestion.add(question);

  question = new Page_Question__c(Subsection__c = '2.1c Target Groups', Question_Text__c='Who are the target group for the desired impact?', Answer__c = '', Sort_Order__c = 4, Page_Text__c = pgText.Id, Version__c=1);
  lstPageQuestion.add(question);

  insert lstPageQuestion;
  }


}
}
}