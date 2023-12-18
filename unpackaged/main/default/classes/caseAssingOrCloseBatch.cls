public class caseAssingOrCloseBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id, Quantum__c, Case_Picklist__c FROM Case WHERE Case_Picklist__c  = \'Benefit\'';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<Case> caseList){
        List<Case> caseToCloseList = new List<Case>();
        for(Case cs :caseList){
            if(cs.Quantum__c){
                cs.Status = 'Closed';
                caseToCloseList.add(cs);
            }else{
                if(integer.valueOf(System.now().date().daysBetween(cs.CreatedDate.date())) > 1){
                    cs.Status = 'Closed';
                    caseToCloseList.add(cs);
                }
            }
        }
        update caseToCloseList;
    }
    
    public void finish(Database.BatchableContext BC){
        
    }
}