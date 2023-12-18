public class UpdateOppoContactRoleWithProdFieldBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id FROM OpportunityContactRole WHERE (Opportunity.isWon != True) OR (Opportunity.ClaseDate = Last_N_Days:5 and Opportunity.isWon = true)';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<OpportunityContactRole> oppoConRoleList){
        
        Map<Id, List<OpportunityContactRole>> oppoId_OppoConRoleMap = new Map<Id, List<OpportunityContactRole>>();
        for(OpportunityContactRole OppoConRole: oppoConRoleList){
            if(!oppoId_OppoConRoleMap.keySet().contains(OppoConRole.OpportunityId)){
                oppoId_OppoConRoleMap.put(OppoConRole.OpportunityId, new List<OpportunityContactRole>());
            }
            oppoId_OppoConRoleMap.get(OppoConRole.OpportunityId).add(OppoConRole);
        }
        
        Set<Id> oppoIds = oppoId_OppoConRoleMap.keySet();
        List<OpportunityLineItem> oppoLineItemList = [SELECT Id FROM OpportunityLineItem WHERE OpportunityId IN :oppoIds];
        Map<Id, List<OpportunityLineItem>> oppoId_OppoLineItemMap = new Map<Id, List<OpportunityLineItem>>();
        
        for(OpportunityLineItem oppoLineItem: oppoLineItemList){
            if(!oppoId_OppoLineItemMap.keySet().contains(oppoLineItem.OpportunityId)){
                oppoId_OppoLineItemMap.put(oppoLineItem.OpportunityId, new List<OpportunityLineItem>());
            }
            oppoId_OppoLineItemMap.get(oppoLineItem.OpportunityId).add(oppoLineItem);
        }
        
        List<OpportunityContactRole> oppoConRoleToUpdateList = new List<OpportunityContactRole>();
        for(Id oppoId: OppoIds){
            Set<String> multiSelectValueSet = new Set<String>();
            for(OpportunityLineItem oppoLine :oppoId_OppoLineItemMap.get(oppoId)){
                //will get the picklist value from product of oppoLineItem and will create multiselect pricklist value
                multiSelectValueSet.add(oppoLine.Product2.Family);
            }
            
            String uniqueMultiSelectPicklistValue = String.join(new List<String>(multiSelectValueSet), ';');
            
            for(OpportunityContactRole oppoConRole :oppoId_OppoConRoleMap.get(oppoId)){
                //will update the picklist field with created multiselect value in above loop
                //oppoConRole.MultiSelect__c = uniqueMultiSelectPicklistValue;
                
                oppoConRoleToUpdateList.add(oppoConRole);
            }
        }
        
        if(!oppoConRoleToUpdateList.isEmpty()){
            update oppoConRoleToUpdateList;
        }
        
    }
    
    public void finish(Database.BatchableContext BC){
        
    }
}