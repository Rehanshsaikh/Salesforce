public class devSession {

    public static void day1(){
        Double simpleInterest, principle=2000, rate=10, period = 1;
        simpleInterest = (principle*rate*period)/100;
        System.debug('Simple Interest of Amoutn 2000 with 10% rate for one year will be '+simpleInterest);
        
        Double n = 50;
        Double sum = n * (n + 1) / 2;
        System.debug('The sum of the first 50 numbers is: ' + sum);
        
        Double F, C=45;
        F = (C * 9/5) + 32;
        System.debug('45 degree celcius is ' + F +' farenhite');
        C = (F - 32) * 5/9;
        System.debug(F+' farenhite is ' + C +' degree celcius');
    }

    public static void day2(){
        OddOrEven(9);
        seasonOfMonth(12);
        greaterNumber(56,23);
        evenAndOddNumbers();
        primeNumber(57);
        tableOfFour();

    }

    public static void OddOrEven(Integer givenNumber){
        
        if(math.mod(givenNumber,2) == 0){
            System.debug(givenNumber + ' Number is even');
        }else {
            System.debug(givenNumber + ' Number is Odd');
        }
    }

    public static void seasonOfMonth(Integer monthNumber){
        
        switch on monthNumber{
            when 1,2,3,4{
                System.debug(monthNumber + ' This month comes in Winter');
                //break;
            }
            when 5,6,7,8{
                System.debug(monthNumber + ' This month comes in Winter');
                //break;
            }
            when 9,10,11,12{
                System.debug(monthNumber + ' This month comes in Winter');
                //break;
            }
            when else{
                System.debug('You have entered Invalid Number. Please enter correct number');
            }
        }
    }

    public static void greaterNumber(Integer num1, Integer num2){
        Integer greaterNumber;
        if(num1 > num2){
            greaterNumber = num1;
        }else if(num2 > num1){
            greaterNumber = num2;
        }else if(num1 == num2){
            System.debug('Both number are same');
        }

        if(greaterNumber!= null){
            System.debug('In '+ num1+ ' and '+ num2 +' the greater number is '+ greaterNumber);
        }

    }

    public static void evenAndOddNumbers(){

        List<Integer> evenNumber = new List<Integer>();
        List<Integer> oddNumber = new List<Integer>();

        for(Integer i = 1; i<=100; i++){
            if(math.mod(i,2) == 0 && i<=50){
                evenNumber.add(i);
            }else if(!(math.mod(i,2) == 0)){
                oddNumber.add(i);
            }
        }

        String even = '';
        String odd = '';
        for(Integer i : evenNumber){
            even += i + ' ';
        }
        for(Integer i : oddNumber){
            odd += i + ' ';
        }
        System.debug('This is an Even number between 1 and 50: '+even+'\n'+
                    'This is an Odd number between 1 and 100: '+ odd);
    }
    public static void primeNumber(Integer prime){
        Boolean notPrime = true;
        Integer i = 2;
        // for(Integer i;(notPrime == True||i <= prime); i++){

        // }

        do{
            if(math.mod(prime,i)==0){
                System.debug(prime + ' is not prime number');
                break;
            }
            i++;
            if(i>prime){
                notprime = false;
                System.debug(prime + ' is prime number');
            }
        }while(notPrime);
    }

    public static void tableOfFour(){
        String table = '';
        for(Integer i = 0; i<=40; i+=4){
            table += i + ' ';
        }
        System.debug('This is the table of four '+table);
    }
}