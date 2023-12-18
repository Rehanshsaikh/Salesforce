({
    clickHandler : function(component, event, helper) {
        let num1 = parseInt(component.get("v.number1"));
        let num2 = parseInt(component.get("v.number2"));
        let operation = component.get("v.option");
        
        var result;
        if(operation === "addition"){
            result = num1 + num2;
        }else if(operation === "subtraction"){
            result = num1 - num2;
        }else if(operation === "division"){
            result = num1 / num2;
        }else if(operation == "multiplication"){
            result = num1 * num2;
        }

        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message":  result ? `The ${operation} of ${num1} and ${num2} is ${result}` : "please select the operion type"
        });
        toastEvent.fire();
    }
})