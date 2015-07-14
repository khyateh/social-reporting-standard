global class PostInstallClass implements InstallHandler {
  global void onInstall(InstallContext context) {
    if(context.previousVersion() == null) {

List<kh_srs__Page_Text__c> lstPageText = new List<kh_srs__Page_Text__c>();
List<kh_srs__Page_Question__c> lstPageQuestion = new List<kh_srs__Page_Question__c>();

//-------------
//Insert Page Text - Introduction
kh_srs__Page_Text__c pgText = new kh_srs__Page_Text__c(name='Introduction',kh_srs__Section__c='Part A -  Overview', kh_srs__Content__c='Introduction', kh_srs__Sort_Order__c=1);
lstPageText.add(pgText);

//Insert related Page_Questions
kh_srs__Page_Question__c question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '1.1 Vision and approach', kh_srs__Question_Text__c='What is the vision and approach for the impact action?', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 1, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '1.2 Scope of the report', kh_srs__Question_Text__c='What is the scope of the report? What are the areas covered in the report?', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 2, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

//-------------

//Insert Page Text - Problem and Solution
pgText = new kh_srs__Page_Text__c(name='Problem and Solution',kh_srs__Section__c='Part B - The Offer',kh_srs__Content__c='The Social Problem and the Solution',kh_srs__Sort_Order__c=2);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '2.1 The social problem', kh_srs__Question_Text__c='Please describe the problem that is being/was addressed.', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 3, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '2.2 Solution attempts made to date', kh_srs__Question_Text__c='What were the attempts made in order to solve the problem? Do include details of attempts made that were significant.', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 4, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '2.3 The solution', kh_srs__Question_Text__c='Please describe the solution identified/implemented for the problem.', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 5, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Res_Work_Results
pgText = new kh_srs__Page_Text__c(name='Res_Work_Results',kh_srs__Section__c='Part B - The Offer',kh_srs__Content__c='Resources, Work performed and Results during the Reporting Period',kh_srs__Sort_Order__c=3);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '3.1 Resources used (input)', kh_srs__Question_Text__c='What were the Resources used (input) for providing the solution?', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 6, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '3.2 Work performed (output)', kh_srs__Question_Text__c='Describe the work performed (output) as a part of the solution.', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 7, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '3.3 Results achieved (outcome/impact)', kh_srs__Question_Text__c='What were the results that were achieved in terms of outcome and impact areas of the solution?', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 8, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '3.4 Presenting resources, work performed and results during the reporting period', kh_srs__Question_Text__c='Please present the resources utilized, work performed and results during the reporting period', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 9, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '3.5 Provisions taken for the accompanying evaluation and qualitiy assurance', kh_srs__Question_Text__c='What were the provisions taken for the accompanying evaluation and quality assurance?', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 10, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '3.6 Previous year comparison: Objectives achieved, learning experience and success', kh_srs__Question_Text__c='Previous year comparison: Objectives achieved, learning experience and success', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 11, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Plan_Forecast
pgText = new kh_srs__Page_Text__c(name='Plan_Forecast',kh_srs__Section__c='Part B - The Offer',kh_srs__Content__c='Planning and Forecast',kh_srs__Sort_Order__c=4);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '4.1 Planning and targets', kh_srs__Question_Text__c='Please describe the planning details and the targets that were set for the project(s).', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 12, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '4.2 Influence factors: chances and risks', kh_srs__Question_Text__c='What were the factors Influencing the action? Do describe the chances and risks involved as a part of the action.', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 13, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Org_Struct
pgText = new kh_srs__Page_Text__c(name='Org_Struct',kh_srs__Section__c='Part B - The Offer',kh_srs__Content__c='Organisational structure and Team',kh_srs__Sort_Order__c=5);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '5.1 Organisational structure', kh_srs__Question_Text__c='Describe the structure of the organization', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 14, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '5.2 Introduction of the participating individuals', kh_srs__Question_Text__c='Please provide the introductions of the participating individuals', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 15, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '5.3 Partnerships, cooperations and networks', kh_srs__Question_Text__c='Please describe the various partnerships, cooperations and networks that were established or involved in the action', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 16, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Org_Profile
pgText = new kh_srs__Page_Text__c(name='Org_Profile',kh_srs__Section__c='Part C - The Organization',kh_srs__Content__c='Organisational profile',kh_srs__Sort_Order__c=6);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '6.1 General information about the organisation', kh_srs__Question_Text__c='Please provide details and general information about the organisation. Do include content for previous years if relevant.', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 17, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '6.2 Governance of the organisation', kh_srs__Question_Text__c='Please provide the governance model of the organisation', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 18, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '6.3 Ownership structure, memberships and associated organisations', kh_srs__Question_Text__c='Please describe the ownership structure, memberships and associated organisation details', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 19, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '6.4 Environmental and social profile', kh_srs__Question_Text__c='Please provide details of the environmental and social profile of the organisation', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 20, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

//-------------
//Insert Page Text - Finance
pgText = new kh_srs__Page_Text__c(name='Finance',kh_srs__Section__c='Part C - The Organization',kh_srs__Content__c='Finance and Accounting Practices',kh_srs__Sort_Order__c=7);
lstPageText.add(pgText);

//Insert related Page_Questions
question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '7.1 Bookkeeping and accounting', kh_srs__Question_Text__c='Please provide details of bookkeeping and accounting in the organisation.', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 21, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '7.2 Asset statement', kh_srs__Question_Text__c='Please provide a detailed asset statement of the organisation', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 22, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '7.3 Income and expenditure', kh_srs__Question_Text__c='Please provide details of Income and expenditure for the reporting period', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 23, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

question = new kh_srs__Page_Question__c(kh_srs__Subsection__c = '7.4 Financial situation and planning', kh_srs__Question_Text__c='Please provide an overview of the financial situation and planning', kh_srs__Answer__c = '', kh_srs__Sort_Order__c = 24, kh_srs__Page_Text__r = pgText);
lstPageQuestion.add(question);

insert lstPageText;

for(kh_srs__Page_Question__c q : lstPageQuestion)
{
  //Update PageTextId from relationship
  q.kh_srs__Page_Text__c = q.kh_srs__Page_Text__r.Id;
}

insert lstPageQuestion;
}
}
}