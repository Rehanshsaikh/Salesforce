trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
	Switch on trigger.operationType{
        when BEFORE_INSERT{
            //System.debug('This is an BEFORE_INSERT trigger is executing');
            ContactTriggerHandler.validateContact(trigger.new);
            //for(Contact con: trigger.new){
                
            //}
        }
        when AFTER_INSERT{
            //System.debug('This is an AFTER_INSERT trigger is executing');
            
            
        }
        when BEFORE_UPDATE{
            //System.debug('This is an BEFORE_UPDATE trigger is executing');
    
            ContactTriggerHandler.validateContact(trigger.new);
        }
        when AFTER_UPDATE{
            //System.debug('This is an AFTER_UPDATE trigger is executing');
        }
        when BEFORE_DELETE{
            //System.debug('This is an BEFORE_INSERT trigger is executing');
            
            
            for(Contact con: trigger.old){
                if(!String.isBlank(con.AccountId)){
                    System.debug('this is the error');
                    con.addError('you con not delete Contact because it is an active contact');
                }
            }    
        }
        when AFTER_DELETE{
            //System.debug('This is an BEFORE_INSERT trigger is executing');
        }
        when AFTER_UNDELETE{
            //System.debug('This is an AFTER_UNDELETE trigger is executing');
            
            ContactTriggerHandler.validateContact(trigger.new);
        }
    }
}