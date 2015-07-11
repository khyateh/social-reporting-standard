@IsTest
public class TestPostInstall
{
@isTest
static void testInstallScript() {
  PostInstallClass postinstall = new PostInstallClass();
    Test.testInstall(postinstall, null);
    Test.testInstall(postinstall, new Version(1,0), true);
    List<kh_srs__Page_Text__c> lstPgText = [Select id, name from kh_srs__Page_Text__c];
    
    List<kh_srs__Page_Question__c> lstPgQuestion = [Select id, kh_srs__Page_Text__c, kh_srs__Subsection__c from kh_srs__Page_Question__c];
    System.debug(lstPgQuestion);

    System.assert((lstPgText.size() > 0) && (lstPgQuestion.size() > 0));
  }
}