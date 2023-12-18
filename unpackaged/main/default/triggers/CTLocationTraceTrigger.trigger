trigger CTLocationTraceTrigger on Location_Tracing__c (before insert) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            CTLocationTraceTriggerHandler.beforeInsert(Trigger.new);
        }
        when else {
            
        }
    }
}