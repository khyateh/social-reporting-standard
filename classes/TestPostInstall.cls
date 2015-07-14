@IsTest
public class TestPostInstall
{
@isTest
static void testInstallScript() {
  PostInstallClass postinstall = new PostInstallClass();
    Test.testInstall(postinstall, null);
    Test.testInstall(postinstall, new Version(1,0), true);
    List<Page_Text__c> lstPgText = [Select id, name from Page_Text__c];

    List<Page_Question__c> lstPgQuestion = [Select id, Page_Text__c, Subsection__c from Page_Question__c];
    System.debug(lstPgQuestion);

    System.assert((lstPgText.size() > 0) && (lstPgQuestion.size() > 0));
  }
}
