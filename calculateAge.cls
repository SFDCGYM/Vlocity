global class calculateAge implements vlocity_cmt.VlocityOpenInterface{
    public boolean invokeMethod(string methodName, Map<String, Object> input, Map <String, Object> outMap, Map< String, Object> options){
        if(methodName =='AgeCalculator')
            AgeCalculator(input, outMap, options);
        else if(methodName =='AgeCalculator2')
            AgeCalculator2(input, outMap);
        return True;
    }
    
    public static void AgeCalculator(Map<String, Object> input ,Map <String, Object> outMap, Map< String, Object> options ){
        System.debug('Abhay---Input---'+JSON.serialize(input));
        integer age;
        string ageCat = '';
        string accountId = (string) input.get('AccountId');
        string dob = (string) input.get('DateOfBirth');
        System.debug('Abhay----dob--'+dob);
        System.debug('Abhay----Account--'+AccountId);
		List<Account> lstAcc = new List<Account> ();
        if(dob !=null){
            Date dt = Date.valueof(dob);
            Date BirthDate = date.newinstance(dt.year(), dt.month(), dt.day());
            lstAcc= [SELECT id, Name, Phone from Account limit 20]; 
            integer days = BirthDate.daysBetween(Date.Today());
            age = integer.valueof(days / 365);
            if(age < 15)
                ageCat = 'UD15';
            else if(age> 15 && age < 18)
                ageCat = 'UD18';
            else 
                ageCat = 'Adult';
            
        }
        outMap.put('Age', age);
        outMap.put('ageCategory', ageCat);
        outMap.put('Account', lstAcc);
        
    }
    
    public static void AgeCalculator2(Map<String, Object> input ,Map <String, Object> outMap){
        System.debug('Abhay---Input---'+JSON.serialize(input));
        integer age;
        string ageCat = '';
        string accountId = (string) input.get('AccountId');
        string dob = (string) input.get('DateOfBirth');
        System.debug('Abhay----dob--'+dob);
        System.debug('Abhay----Account--'+AccountId);
        if(dob !=null){
            Date dt = Date.valueof(dob);
            Date BirthDate = date.newinstance(dt.year(), dt.month(), dt.day());
            integer days = BirthDate.daysBetween(Date.Today());
            age = integer.valueof(days / 365);
            if(age < 15)
                ageCat = 'UD15';
            else if(age> 15 && age < 18)
                ageCat = 'UD18';
            else 
                ageCat = 'Adult';
            
        }
        outMap.put('Age', age);
        outMap.put('ageCategory', ageCat);
    }
}
