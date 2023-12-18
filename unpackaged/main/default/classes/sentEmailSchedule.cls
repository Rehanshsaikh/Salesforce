public class sentEmailSchedule implements Schedulable {
    public Set<Id> caseIds;
    public sentEmailSchedule(Set<Id> ids){
        System.debug('caseIds: '+ caseIds);
        caseIds = ids;
    }
    
    public void execute(SchedulableContext sc){
        
        
        Datetime weekDay = Date.today();
        //get the number of weekday
        String dayOfWeek = weekDay.format('u');
        System.debug('Day of the week: ' + dayOfWeek);
        
        if(dayOfWeek != '6' && dayOfWeek != '7'){
            
            List<Case> caseList = [SELECT Id, Owner.Email, Time__c FROM Case WHERE Id IN :caseIds AND Time__c >= 24 and Status = 'Working'];
            System.debug('caseList: '+caseList );
            List<Messaging.SingleEmailMessage> mssgList = new List<Messaging.SingleEmailMessage>();
            Set<Id> newCaseIds = new Set<Id>();
            if(caseList.size()>0){
                for(Case cs: caseList){
                    newCaseIds.add(cs.Id);
                    Messaging.SingleEmailMessage mssg = new Messaging.SingleEmailMessage();
                    mssg.setSubject(cs.Id);
                    mssg.setHtmlBody(''+ cs.Time__c);
                    List<String> emailAddressList = new List<String>();
                    emailAddressList.add(cs.Owner.Email);
                    mssg.setToAddresses(emailAddressList);
                    mssgList.add(mssg);
                    System.debug('mssg '+ mssg);
                }
                Messaging.sendEmail(mssgList);
                
                Datetime nextRun = System.now().addHours(24);
                //Datetime nextRun = System.now().addSeconds(30);
                
                //Generating cron expression for next run time
                String year = String.valueOf(nextRun.year());
                String day = String.valueOf(nextRun.day());
                String hour = String.valueOf(nextRun.hour());
                String min = String.valueOf(nextRun.minute());
                String sec = String.valueOf(nextRun.second());
                String cronExp = sec + ' ' + min + ' ' + hour + ' '+day+' '+nextRun.format('MMM').toUpperCase()+' ? '+year;
                
                //Scheduling at the specified time
                sentEmailSchedule sentEmail = new sentEmailSchedule(newCaseIds);
                System.schedule('Tracker Job'+ String.valueOf(Datetime.now()), cronExp, sentEmail);
            }
            
        }
        else if(dayOfWeek == '6' || dayOfWeek == '7')
        {
            	List<Case> caseList = [SELECT Id, Owner.Email, Time__c FROM Case WHERE Id IN :caseIds AND Time__c >= 20 and Status = 'Working'];
            	Set<Id> newCaseIds = new Set<Id>();
                for(Case cs: caseList){
                    newCaseIds.add(cs.Id);
                }
            	System.debug('newCaseIds: '+ newCaseIds);
                date myDate = date.today();
                System.debug('myDate: ' + myDate);
            	//date of the next week
                Datetime nextRun = myDate.toStartofWeek() + 8;
                
                //Datetime nextRun = System.now().addSeconds(30);
                
                //Generating cron expression for next run time
                String year = String.valueOf(nextRun.year());
                String day = String.valueOf(nextRun.day());
                String hour = String.valueOf(nextRun.hour() + 8);
                String min = String.valueOf(nextRun.minute());
                String sec = String.valueOf(nextRun.second());
                String cronExp = sec + ' ' + min + ' ' + hour + ' '+day+' '+nextRun.format('MMM').toUpperCase()+' ? '+year;

                //Scheduling at the specified time
                sentEmailSchedule sentEmail = new sentEmailSchedule(newCaseIds);
                System.schedule('Tracker Job'+ String.valueOf(Datetime.now()), cronExp, sentEmail);
          }
        
	  } 
}