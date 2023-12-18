import { LightningElement, api } from 'lwc';
import sendEmail from '@salesforce/apex/MyFlowAction.sendEmail'
const  emailBody = `<html>
 <body>
 <p><srong>Hello Test User<strong>,</p>
 <p>At your request, we attempted to cancel your order.</p>
 <p>Unfortunately, we were unable to stop the fulfillment, and the order remains active and will be fulfilled.</p>
 <p><p><strong>Order Details:-</strong></p>
 <p><p><strong>Order Date:</strong></p>
 <p><p><strong>Order Number:</strong> 123456789</p>
 <p><strong>Product Name:</strong> Product 1</p>
 <p><strong>Product Name:</strong> Product 2</p>
 <p>If you have any questions concerning your order, please contact Customer Service at <a href="mailto:googletools@shyftservices.com">googletools@shyftservices.com</a></p>
 <p>For FAQ’s please visit this <a href="FAQ_URL">page</a>.</p>
 <p>View the returns policy and FAQ’s.</p>
 <p>Please don\'t reply to this email, as we are unable to respond from this email address.</p>
 <p>If you have questions about your order, please email Customer Service at <a href="mailto:googletools@shyftservices.com">googletools@shyftservices.com</a>, please reference your order #.</p>
 <p>Pixel Tools and Fixtures are fulfilled by Shyft Global Services Inc.</p>
 <p>Shape</p>
 <p>Digital River Inc. Privacy Policy</p>
 <p>Terms of Sale</p>
 </body>
 </html>`
export default class EditableComponent extends LightningElement {
    
    @api emailBody = emailBody
    renderedCallback(){
        const content = this.template.querySelector('.editable');

        content.addEventListener("input", (event) => {
            // Get the updated innerHTML
            console.log(this.template.querySelector('.editable').innerHTML)
        });
        this.template.querySelector('.editable').innerHTML = emailBody
        
    }

    handleChange(event){

        // this.emailBody = event.target.value;
        // console.log(this.emailBody)
        console.log(event.keyCode)
        console.log(event.key)
        if (event.keyCode === 13) {
            // Prevent the default behavior of Enter (creating a new paragraph)
            event.preventDefault();
    
            // Create a <br> tag
            const br = document.createElement("br");
            const br2 = document.createElement("br");
    
            // Insert the <br> at the current cursor position
            const selection = window.getSelection();
            const range = selection.getRangeAt(0);
            range.insertNode(br);
            range.insertNode(br2);
    
            // Collapse the selection to the end of the <br>
            range.setStartAfter(br);
            range.collapse(true);
            selection.removeAllRanges();
            selection.addRange(range);
            console.log('enter key has been pressed');
        }
        if (event.keyCode === 8) {
            // Get the contentEditable element
            // const contentEditable = this.template.querySelector('.content-editable');

            // Get the current selection
            const selection = window.getSelection();

            if (selection.rangeCount > 0) {
                // Get the current range
                const range = selection.getRangeAt(0);

                // Get the container node of the current selection
                const containerNode = range.startContainer;

                // Check if the container node is the contentEditable element
                if (containerNode.nodeType === Node.ELEMENT_NODE && containerNode.nodeName === 'BR') {
                    containerNode.remove();
                    event.preventDefault();
                }
            }
        }    
        // console.log('The email has been sent')
        // this.emailBody = this.template.querySelector('.editable').innerHTML;
        // console.log(this.emailBody)
    }

    sendEmail(){
        sendEmail({emailBody: this.template.querySelector('.editable').innerHTML})
        console.log('The email has been sent')
    }
}