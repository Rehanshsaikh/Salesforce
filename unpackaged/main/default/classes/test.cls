public class test {
	public static Double probability(String recordId){
        List<OpportunityContactRole> ocrList = [SELECT OpportunityId, Opportunity.Name, Opportunity.StageName, Contact.Name
                                         FROM OpportunityContactRole
                                         WHERE ContactId = :recordId AND IsPrimary = true];
        Set<Id> oppoId = new Set<Id>();
        for (OpportunityContactRole oppoCon : ocrList) {
            oppoId.add(oppoCon.OpportunityId);
        }
        Double devide;
        List<Opportunity> relatedOppo = [SELECT Probability FROM Opportunity WHERE Id IN :oppoId];
        Double allSum = 0;
        for(Opportunity prob : relatedOppo){
            allSum += prob.Probability;
            devide++;
        }
        allSum = allSum/devide;
        return allSum;
    }
}