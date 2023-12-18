import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    tittle = "Test"
    dataToShow = "this is test data";
    changeHandler(event){
        this.dataToShow = event.target.value;
        this.tittle = "New Test";
    }
}