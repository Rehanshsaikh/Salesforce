import { LightningElement } from 'lwc';
import createAccount from '@salesforce/apex/accountNavigationController.createAccount';
export default class Action extends LightningElement {

    accountName = '';
    recordId;
    navigateToAccount;
    createAccount;
    // Define other input properties here

    handleInputChange(event) {
        // Handle user input and update corresponding property values
        const field = event.target.label;
        const value = event.target.value;
        if (field === 'Account Name') {
            this.accountName = value;
        }
        // Handle other input fields similarly
    }

    async handleSaveAndNavigate() {
        if(!this.createAccount){
            await createAccount({accountName:this.accountName}).then(result =>{
                this.recordId = result;
                console.log('Then Block is executing');
                
            }).catch(error=>{
    
            })
            this.navigateToAccount = 'https://iqra-e-dev-ed.lightning.force.com/lightning/r/Account/' + this.recordId + '/view';
            console.log('Button execution has been finished');
            window.location.href = this.navigateToAccount;
            this.createAccount = true;
        } 
    }

    handleCancel() {
        // Handle the Cancel button action to close the Flow
        // You can use Flow Navigation to close the Flow
    }
}