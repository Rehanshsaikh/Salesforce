trigger AddPrefixToName on Account (before insert) {
    for(Account acc: trigger.new){
        acc.name = 'Account '+ acc.name;
    }
}