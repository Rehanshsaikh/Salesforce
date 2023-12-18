public class AccountTriggerHandler {
    public static void opportunityUdate(List<Account> newAccList){
        Set<Id> accId = new Set<Id>();
        for(Account acc: newAccList){
            accId.add(acc.Id);
        }
        List<Opportunity> oppoList = [SELECT Id, Name, CreatedDate FROM Opportunity WHERE AccountId IN :accId];
        for(Opportunity oppo: oppoList){
            if(oppo.CreatedDate.date().daysBetween(Date.today()) > 30){
                oppo.StageName = 'Closed Lost';
            }
        }
        update oppoList;
    }
}