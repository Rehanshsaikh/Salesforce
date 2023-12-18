import { LightningElement } from 'lwc';

export default class DivCSS extends LightningElement {
    clickMe() {
        // alert("Hi There!!")
        let value = this.template.querySelector("input").value;
        // let value2 = this.template.getElementsByTagName("input").value;
        alert(value + " " + value2)
    }
}