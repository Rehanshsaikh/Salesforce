public with sharing class fetchContactRelatedOpportunity {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> probability(Id recordId){
        List<OpportunityContactRole> ocrList = [SELECT OpportunityId, Opportunity.Name, Opportunity.StageName, Contact.Name
                                         FROM OpportunityContactRole
                                         WHERE ContactId = :recordId AND IsPrimary = true];

        List<Id> oppoList = new List<Id>();
        for (OpportunityContactRole oppoCon : ocrList) {
            oppoList.add(oppoCon.OpportunityId);
        }
        // Set<Id> oppoId = new Set<Id>();
        // for (OpportunityContactRole oppoCon : ocrList) {
        //     oppoId.add(oppoCon.OpportunityId);
        // }
        Double devide;
        List<Opportunity> relatedOppo = [SELECT Id, Probability FROM Opportunity WHERE Id IN :oppoList];
        // Double allSum;
        // for(Opportunity prob : relatedOppo){
        //     allSum += Double.valueOf(prob.Probability);
        //     devide++;
        // }
        // Double average = allSum/devide;
        return relatedOppo;
    }
}