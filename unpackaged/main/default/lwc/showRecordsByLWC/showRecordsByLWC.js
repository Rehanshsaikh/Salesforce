import { LightningElement, wire , track} from 'lwc';
import getSobjectData from '@salesforce/apex/AccountControllerToLWC.getSobjectData'
export default class ShowRecordsByLWC extends LightningElement {
     objectname;
     fieldName;
     Limitnumber;
        
    @wire(getSobjectData, { objectname: '$objectname', fieldName: '$fieldName', Limitnumber: '$Limitnumber' })
    propertydata({data,error}){
        if(data){
            console.log(data)
            console.log('this is just test');
        }
        else if(error){
            console.log(error)
            console.log('this is error');
        }
    }

    handleClick(event){
        if(event.target.name === 'Object'){
         this.objectname = event.target.value
        } 
        if(event.target.name === 'Field'){
         this.fieldName = event.target.value
        } 
        if(event.target.name === 'Limit'){
         this.Limitnumber = event.target.value
        }
     }
     HandleRecords(){
          console.log(this.Limitnumber + '   ' + this.objectname + "   " + this.fieldName)
        
     }
}