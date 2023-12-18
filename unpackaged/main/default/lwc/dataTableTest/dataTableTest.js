import { LightningElement } from 'lwc';

export default class DataTableTest extends LightningElement {
    get columns (){
        return [
            {label:"Show Name", fieldName:'name', type:"stringj"},
            {label:"Show Phone", fieldName:'phone', type:"phone"}
        ]
    }
    get data (){
        return [
            {name:"rehan", phone:8766469186},
            {name:"rehan", phone:8766469186}
        ]
    } 
}