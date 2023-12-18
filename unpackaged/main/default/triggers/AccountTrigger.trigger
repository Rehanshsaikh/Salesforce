trigger AccountTrigger on Account (before insert, before update, after insert, after update, before delete, after delete, after undelete){
    //System.debug(trigger.operationType);
    
    
    
    Switch on trigger.operationType{
        when BEFORE_INSERT{
            //System.debug('This is an BEFORE_INSERT trigger is executing');
            
        }
        when AFTER_INSERT{
            //System.debug('This is an AFTER_INSERT trigger is executing');
            
            
        }
        when BEFORE_UPDATE{
            System.debug('This is an BEFORE_UPDATE trigger is executing');
        }
        when AFTER_UPDATE{
            System.debug('This is an AFTER_UPDATE trigger is executing');
            
            AccountTriggerHandler.opportunityUdate(trigger.new);
        }
        when BEFORE_DELETE{
            System.debug('This is an BEFORE_INSERT trigger is executing');
        }
        when AFTER_DELETE{
            System.debug('This is an BEFORE_INSERT trigger is executing');
        }
        when AFTER_UNDELETE{
            System.debug('This is an AFTER_UNDELETE trigger is executing');
        }
    }	
}