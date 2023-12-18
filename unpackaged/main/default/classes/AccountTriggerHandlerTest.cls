@isTest
public class AccountTriggerHandlerTest {
    @testSetup
    public static void setupTestData() {
        
    }

    
    @isTest
    public static void opportunityUpdateTest(){
        
        Account acc = new Account();
        acc.Name = 'testaccount';
        
        acc.AnnualRevenue = 50000;
        insert acc;

     
        
       
        
        
        acc.AnnualRevenue = 60000;
        update acc;

        List<Account> lstacc = new List<Account>();
        lstacc.add(acc);
        

        List<Opportunity> lstopp = [SELECT Id, StageName, AccountId FROM Opportunity WHERE AccountId = :acc.Id];
        for (Opportunity opp : lstopp) {
         system.assertEquals('Closed Lost', opp.StageName);
        }    
    }
}