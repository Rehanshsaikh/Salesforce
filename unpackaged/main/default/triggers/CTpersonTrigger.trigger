trigger CTpersonTrigger on Person__c (before insert, after insert, before update, after update, before delete, after delete, after undelete){
    switch on Trigger.operationType {
        when BEFORE_INSERT{
            CTpersonTriggerHandler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            CTpersonTriggerHandler.beforeUpdate(Trigger.new , Trigger.oldMap);
        }
        when AFTER_UPDATE{
            CTpersonTriggerHandler.afterUpdate(Trigger.new , Trigger.oldMap);
        }
    }
}