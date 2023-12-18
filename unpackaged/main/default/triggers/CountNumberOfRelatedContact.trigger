trigger CountNumberOfRelatedContact on Contact (after insert, after update) {
    for(Contact con: trigger.new){
        if(con.accountid!=null && trigger.isInsert){
            
            /*List<aggregateResult> newConList = [SELECT COUNT(Id) recCount, AccountId FROM Contact WHERE AccountId =: con.AccountId GROUP BY AccountId];
            for(aggregateResult con: newConList){
                Account acc = [select Id from Account where id=:con.accountid];
                acc.Number_of_Related_Contact__c = acc.con.get('recCount');
                update acc;
            }*/
            
            Account acc = [select Id from Account where id=:con.accountid];
            List<Contact> conList = [SELECT Id, accountid FROM Contact WHERE AccountId=:con.accountid];
            acc.Number_of_Related_Contact__c = conList.size();
            update acc;
        }else if(trigger.isUpdate && trigger.oldMap.get(con.Id).accountid != con.accountid){
            List<Account> acc = [select Id from account where id IN (:con.accountid, :trigger.oldMap.get(con.id).accountid)];
            for(Account ac:acc){
                List<Contact> conList = [select id from Contact where AccountId=:ac.id];
                ac.Number_of_Related_Contact__c = conList.size();
            }
            update acc;
        }
    }
}