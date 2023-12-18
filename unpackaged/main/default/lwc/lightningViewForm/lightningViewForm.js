import { LightningElement, api } from 'lwc';
import ACCOUNT_OBJECT from "@salesforce/schema/Account"
import NAME from "@salesforce/schema/Account.Name"
import ACCOUNT_SOURCE from "@salesforce/schema/Account.AccountSource"
import ACCOUNT_NUMBER from "@salesforce/schema/Account.AccountNumber"

export default class LightningViewForm extends LightningElement {
    object = ACCOUNT_OBJECT;
    fields = [NAME, ACCOUNT_SOURCE, ACCOUNT_NUMBER];












    // @api recordId
    // clear(){
    //     const newArray = (this.template.querySelectorAll("lightning-card lightning-input-field"));

    //     newArray.forEach((result)=>{ 
                                    
    //                                 result.Object.reset();
    //                             })
    //      console.log(newArray)                                                                   
    // }
}