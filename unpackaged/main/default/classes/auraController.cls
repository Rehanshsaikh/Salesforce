public with sharing class auraController {
    @AuraEnabled
    public static void testDebug(String tabId) {
        System.debug('tabId ' + tabId);
    }
}