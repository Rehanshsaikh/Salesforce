trigger LeadTrigger on Lead (before insert) {
    LeadTriggerHandler.createLead(trigger.new);
}