import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class apexImperativeMethod extends LightningElement {
    contacts;
    error;

    async handleLoad() {
        try {
            this.contacts = await getContactList();
            this.error = undefined;
            console.log(this.contacts)
        } catch (error) {
            this.contacts = undefined;
            this.error = error;
        }
    }
}