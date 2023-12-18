import { LightningElement } from 'lwc';

export default class FirstComponent extends LightningElement {
    callme(){
        alert("Hi this is exucuted from js file")
    }
}