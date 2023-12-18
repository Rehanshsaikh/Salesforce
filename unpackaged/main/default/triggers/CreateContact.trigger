trigger CreateContact on Account (after update, after insert) {
    for(Account acc: trigger.new){
        if(trigger.isUpdate){
            List<Contact> conList = [SELECT AccountId FROM Contact WHERE AccountId=:acc.Id];
            if(conList.size()==0){
            Contact con = new Contact(lastName='Contact '+acc.Name, AccountId=acc.Id);
            insert con;
        }
        }
        
        if(acc.AnnualRevenue>500000 && acc.Industry=='Energy' && trigger.isInsert){
            Opportunity oppo = new Opportunity(AccountId=acc.Id, Name='Opportunity '+acc.Name, CloseDate=Date.today(),stageName='New');
            insert oppo;
        }
    }
}