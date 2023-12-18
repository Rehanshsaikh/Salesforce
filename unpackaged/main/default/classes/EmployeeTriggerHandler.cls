public class EmployeeTriggerHandler {
    public static void updateHighestSal(List<Employee__c> empList){
        Set<Id> companyIds = new Set<Id>();
        for(Employee__c emp: empList){
            companyIds.add(emp.Company__c);
        }
        
        List<Company__c> cmpListToupdate = [SELECT Id, Highest_Salary__c, (SELECT Id, Salary__c, Name FROM Employees__r ORDER BY Salary__C DESC LIMIT 2) FROM Company__c WHERE Id IN : companyIds];
        
        for(Company__c cmp : cmpListToUpdate){
            cmp.Highest_Salary__c = '';
            for(Employee__c emp: cmp.Employees__r){
                cmp.Highest_Salary__c += emp.Salary__c + ' ' + emp.Name + '\n';
            }
        }
        
        update cmpListToUpdate;
    }
}