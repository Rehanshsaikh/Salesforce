trigger EmployeeTrigger on Employee__c (before insert, before update) {
    Switch on trigger.operationType{
        WHEN BEFORE_UPDATE{
            EmployeeTriggerHandler.updateHighestSal(trigger.new);
        }
        WHEN BEFORE_INSERT{
            EmployeeTriggerHandler.updateHighestSal(trigger.new);
        }
    }	
}