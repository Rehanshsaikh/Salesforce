public with sharing class MyFlowAction {
    @AuraEnabled
    public static void sendEmail(String emailBody){
        System.debug('code has been executed');
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        // Set the recipient email address
        email.setToAddresses(new String[] { 'rshaikh0530@gmail.com' });

        // Set the email subject
        email.setSubject('Test Email');
        
        // Set the HTML body of the email
        email.setHtmlBody(emailBody);

        // Send the email
        Messaging.SendEmailResult[] result = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        System.debug('code has been executed');
    }
}