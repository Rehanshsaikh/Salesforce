public with sharing class CTpersonTriggerHandler {
    public static void beforeInsert(List<Person__c> newRecords){
        for(Person__c person : newRecords){
            person.Health_Status__c = 'Green';
            person.Token__c = CTpersonController.getToken(person.Mobile__c);
        }
    }

    public Static void beforeUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap){
        for(Person__c person : newRecords){
            if(person.Health_Status__c != oldRecordsMap.get(person.Id).Health_Status__c){
                person.Status_Update_Date__c = Date.Today();
            }
        }
    }

    public Static void afterUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap){

        Set<Id> statusChange = new Set<Id>();
        Set<Id> redStatus = new Set<Id>();
        for(Person__c person : newRecords){
            if(person.Health_Status__c != oldRecordsMap.get(person.Id).Health_Status__c){
               statusChange.add(person.Id);
            }
            if(person.Health_Status__c == 'Red' && oldRecordsMap.get(person.Id).Health_Status__c != 'Red'){
               redStatus.add(person.Id);
            }
        }

        Set<Id> alreadyProcessed = new Set<Id>();
        alreadyProcessed.addAll(redStatus);

        Set<Id> orangeStatus = new Set<Id>();
        Set<Id> yellowStatus = new Set<Id>();

        List<Person__c> personToUpdate = new List<Person__c>();

        orangeStatus.addAll(CTpersonController.getCohabitants(redStatus, alreadyProcessed));

        Set<Id> primaryContacts = CTpersonController.getPrimaryContact(redStatus, alreadyProcessed);
        orangeStatus.addAll(primaryContacts);

        yellowStatus.addAll(CTpersonController.getNeighbours(redStatus, alreadyProcessed));
        
        yellowStatus.addAll(CTpersonController.getSecondaryContact(primaryContacts, alreadyProcessed));

        for(Id pid : orangeStatus){
            personToUpdate.add(new Person__c(Id=pid, Health_Status__c='Orange'));
        }

        for(Id pid : yellowStatus){
            personToUpdate.add(new Person__c(Id=pid, Health_Status__c='Yellow'));
        }

        if(personToUpdate.size() > 0){
            update personToUpdate;
        }

        List<Location_Tracing__c> locationTraces = CTLocationTraceController.getLocationByPersonIds(statusChange);
        if(locationTraces != null && locationTraces.size() > 0){
            Set<Id>locationIds = new Set<Id>();
            for(Location_Tracing__c trace : locationTraces){
                locationIds.add(trace.Location__c);
            }
            CTLocationController.updateRedScore(locationIds);
        }
    }
}