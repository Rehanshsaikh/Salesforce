import { LightningElement, api, wire } from 'lwc';
import probability from '@salesforce/apex/fetchContactRelatedOpportunity.probability';

export default class ShowContactAlert extends LightningElement {
    @api recordId;
    


    @wire(probability, {recordId:'$recordId'})
    dataHandler({data, error}){
        if(data){
            let newSum=0;
            console.log(data)
            let increase = 0;
            for(let item of Array.from(data)){
                    newSum += Number(item.Probability); 
                    increase++;      
            }

            newSum = newSum/increase;
            console.log(newSum)
            if(newSum>80){
                this.template.querySelector('h1').style.backgroundColor = 'green'
            }else if(newSum> 50 && newSum< 80){
                this.template.querySelector('h1').style.backgroundColor = 'yellow'
            }else{
                this.template.querySelector('h1').style.backgroundColor = 'red'
            }
            
        }
        if(error){
            console.log(error)
            console.log('rehan from error')
        }
    }



}