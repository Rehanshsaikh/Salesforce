public class caseTriggerHandler {
    public static void sendEmailNotification(List<Case> caseList, Map<Id, Case> caseOldMap){
        Set<Id> caseIds = new Set<Id>();
        for(Case caseRec: caseList){
            if(caseRec.Status != caseOldMap.get(caseRec.Id).Status){
                caseIds.add(caseRec.Id);
            }
        }
        if(!caseIds.isempty()){
            
            Datetime nextRun = System.now().addHours(24);
            //Datetime nextRun = System.now().addSeconds(24);
            
            //Generating cron expression for to schedule
            String year = String.valueOf(nextRun.year());
            String day = String.valueOf(nextRun.day());
            String hour = String.valueOf(nextRun.hour());
            String min = String.valueOf(nextRun.minute());
            String sec = String.valueOf(nextRun.second());
            String cronExp = sec + ' ' + min + ' ' + hour + ' '+day+' '+nextRun.format('MMM').toUpperCase()+' ? '+year;
            
            //Scheduling at the specified time
            sentEmailSchedule sentEmail = new sentEmailSchedule(caseIds);
            System.schedule('Tracker Job'+ String.valueOf(Datetime.now()), cronExp, sentEmail);
        }
        
    }
}