trigger EmailRequired on Contact (before insert) {
    for(Contact con: trigger.new){
        if(String.isBlank(con.Email)){
            con.Email.addError('Please add email');
        }
    }
}