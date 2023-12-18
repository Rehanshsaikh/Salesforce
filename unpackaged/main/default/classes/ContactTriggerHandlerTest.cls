@isTest
public class ContactTriggerHandlerTest {
    @isTest
    public static void validateContactWhileInsert(){
        Account acc = new Account(Name='Test Account');
        insert acc;
        for(Integer i = 0; i<7; i++){
            Contact con = new Contact(AccountId= acc.Id, lastName='Test Class '+ i);
            try{
                insert con;
            }catch(Exception e){
                System.debug(e);
            }
            
        }
        
        //Contact con1 = new Contact(AccountId= acc.Id, lastName='Test Class 2');
        //insert con1;
    }
    //@isTest
    //public static void validateContactWhileUpdate(){
        
    //}

}