@isTest
public class LeadTriggerHandlerTest {
	@isTest
    public static void createLeadTest(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0; i<10; i++){
            Lead testLead = new Lead(LastName='test company', Company='new Test company');
            leadList.add(testLead);
        }
        insert leadList;
        
        List<Lead> newLeadList = [SELECT Id FROM Lead];
        System.assertEquals(20, newLeadList.size(),'This is not correct');
    }
}