public class LeadTriggerHandler {
	public static Boolean isCreated = true;
    public static void createLead(List<Lead> leadList){
        //Boolean isCreated = True;
        List<Lead> newLeadList = new List<Lead>();
        List<Lead> leads = new List<Lead>();
        for(Lead ld: leadList){
            leads.add(ld);
        }
        if(isCreated){
            isCreated = false;
            for(Lead ld: leads){
                Lead newLead = new Lead(LastName=ld.LastName, Company = ld.Company);
                newLeadList.add(newLead);
            }
            insert newLeadList;
        }
        
    }
       
}