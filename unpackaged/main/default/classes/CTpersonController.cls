public with sharing class CTpersonController {

    public static String getToken(String mobileNumber){

        // Blob value = Blob.valueOf(mobileNumber);
        // Blob hash = Crypto.generateDigest(MD5,value);
        // return EncodingUtil.base64Encode(hash);
        return mobileNumber;
    }

    public Static List<Person__c> getRecentHealthChanges(){
        return [SELECT Name, Id, Health_Status__c, Mobile__c,Status_Update_Date__c 
               FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }

    public static List<Person__c> searchPeople(String searchTerm){

        searchTerm = searchTerm + '%';

        return [SELECT Name, Id, Health_Status__c, Mobile__c,Status_Update_Date__c 
                FROM Person__c WHERE Name LIKE :searchTerm 
                OR Mobile__c LIKE :searchTerm 
                OR Token__c LIKE :searchTerm 
                ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];

                
    }

    public static Person__c getPersonId(String personId){

        List<Person__c> people = [SELECT Name, Id, Health_Status__c, Mobile__c,Status_Update_Date__c 
                                FROM Person__c WHERE Id = :personId];

        if(people != null && people.size() > 0){
            return people[0];
        }
        return null;                        


    }

    public static Map<String, Integer> getHealthStatusCount(){

        Map<String, Integer> healthCountMap = new Map<String, Integer>();
        for(AggregateResult ar : [SELECT Health_Status__c, COUnt(Id) total 
                                    FROM Person__c GROUP BY Health_Status__c]){

            String healthStatus = String.valueOf(ar.get('Health_Status__c'));
            Integer count = Integer.valueOf(ar.get('total')); 

            healthCountMap.put(healthStatus, count);
        }
        return healthCountMap;
    }

    public static Set<Id> getCohabitants(Set<Id> personIds, Set<Id> alreadProcessed){
        List<String> healthStatuses = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c 
                                                FROM People_Tracing__c 
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds) 
                                                    AND Contact_Type__c = 'Cohabitant'
                                                    AND (Person_1__r.Health_Status__c IN :healthStatuses OR Person_2__r.Health_Status__c IN :healthStatuses)];
        
        Set<Id> cohabitants = new Set<Id>();
        for(People_Tracing__c pt : peopleTraces){
            if(!alreadProcessed.contains(pt.Person_1__c)){
                cohabitants.add(pt.Person_1__c);
                alreadProcessed.add(pt.Person_1__c);
            }
            if(!alreadProcessed.contains(pt.Person_2__c)){
                cohabitants.add(pt.Person_2__c);
                alreadProcessed.add(pt.Person_2__c);
            }
        } 
        return cohabitants;                                           
    }

    public static Set<Id> getNeighbours(Set<Id> personIds, Set<Id> alreadProcessed){
       
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c 
                                                FROM People_Tracing__c 
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds) 
                                                    AND Contact_Type__c = 'Neighbour'
                                                    AND (Person_1__r.Health_Status__c = 'Green' OR Person_2__r.Health_Status__c = 'Green')];
        
        Set<Id> neighbours = new Set<Id>();
        for(People_Tracing__c pt : peopleTraces){
            if(!alreadProcessed.contains(pt.Person_1__c)){
                neighbours.add(pt.Person_1__c);
                alreadProcessed.add(pt.Person_1__c);
            }
            if(!alreadProcessed.contains(pt.Person_2__c)){
                neighbours.add(pt.Person_2__c);
                alreadProcessed.add(pt.Person_2__c);
            }
        } 
        return neighbours;                                           
    }

    public static Set<Id> getPrimaryContact(Set<Id> personIds, Set<Id> alreadProcessed){
        List<String> healthStatuses = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c 
                                                FROM People_Tracing__c 
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds) 
                                                    AND Contact_Type__c = 'Other'
                                                    AND Contact_Date__c = LAST_N_DAYS:10
                                                    AND (Person_1__r.Health_Status__c IN :healthStatuses OR Person_2__r.Health_Status__c IN :healthStatuses)];
        
        Set<Id> primaryContact = new Set<Id>();
        for(People_Tracing__c pt : peopleTraces){
            if(!alreadProcessed.contains(pt.Person_1__c)){
                primaryContact.add(pt.Person_1__c);
                alreadProcessed.add(pt.Person_1__c);
            }
            if(!alreadProcessed.contains(pt.Person_2__c)){
                primaryContact.add(pt.Person_2__c);
                alreadProcessed.add(pt.Person_2__c);
            }
        } 
        return primaryContact;                                           
    }

    public static Set<Id> getSecondaryContact(Set<Id> primaryContactsIds, Set<Id> alreadProcessed){
       
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c 
                                                FROM People_Tracing__c 
                                                WHERE (Person_1__c IN :primaryContactsIds OR Person_2__c IN :primaryContactsIds) 
                                                    AND Contact_Type__c = 'Other'
                                                    AND Contact_Date__c = LAST_N_DAYS:10
                                                    AND (Person_1__r.Health_Status__c = 'Green' OR Person_2__r.Health_Status__c = 'Green')];
        
        Set<Id> secondaryConacts = new Set<Id>();
        for(People_Tracing__c pt : peopleTraces){
            if(!alreadProcessed.contains(pt.Person_1__c)){
                secondaryConacts.add(pt.Person_1__c);
                alreadProcessed.add(pt.Person_1__c);
            }
            if(!alreadProcessed.contains(pt.Person_2__c)){
                secondaryConacts.add(pt.Person_2__c);
                alreadProcessed.add(pt.Person_2__c);
            }
        } 
        return secondaryConacts;                                           
    }
}