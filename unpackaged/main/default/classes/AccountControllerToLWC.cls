public with sharing class AccountControllerToLWC {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account LIMIT 5];
    }
     @AuraEnabled(cacheable=true)
    public static List<Sobject> getSobjectData(string ObjectName ,String fields, integer Limits){
         string OBJECTList = 'SELECT ' + fields + ' FROM ' + ObjectName + ' LIMIT ' + Limits;
         return database.query(OBJECTList);
    }
}