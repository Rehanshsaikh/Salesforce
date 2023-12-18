trigger CaseTrigger on Case (before update) {
    Switch on trigger.operationType{
        WHEN BEFORE_UPDATE{
            caseTriggerHandler.sendEmailNotification(trigger.new, trigger.oldMap);
        }
    }
}