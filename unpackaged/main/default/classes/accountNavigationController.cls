public with sharing class accountNavigationController {
    @AuraEnabled
    public static string createAccount(String accountName){
        Account acc = new Account(Name=accountName);
        insert acc;
        return acc.Id;
    }
    
}