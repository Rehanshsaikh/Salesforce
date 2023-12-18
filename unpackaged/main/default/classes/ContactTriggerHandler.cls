public class ContactTriggerHandler {
	
    public static void validateContact(List<Contact> newConList){
        
        Set<Id> accIds = new Set<Id>();
        for(Contact con: newConList){
            if(!String.isBlank(con.AccountId)){
                accIds.add(con.AccountId);
            }
        }
        
        List<aggregateResult> conList = [SELECT AccountId, COUNT(id) recordCount FROM Contact WHERE AccountId IN :accIds GROUP BY AccountId];
        Set<Id> accIdsWithMoreCon = new Set<Id>();
        for(aggregateResult result: conList){
            if(Integer.valueOf(result.get('recordCount'))>=4){
                accIdsWithMoreCon.add((Id)result.get('AccountId'));
            }
        }
        
        for(Contact con: newConList){
            if(accIdsWithMoreCon.contains(con.AccountId) && !String.isBlank(con.AccountId)){
                con.addError('You can not create more than 4 contact against same Account');
            }
        }
    }
    
    
    //public static void sendEmail(){
        
    //}
    
    
}