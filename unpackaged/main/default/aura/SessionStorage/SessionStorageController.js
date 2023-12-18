({
    doinit : function(component, event, help){
        window.addEventListener('beforeunload', function(event){
            // event.preventDefault();
            event.returnValue = 'You can close the Tab';
            let tabId = sessionStorage.getItem("tabId");
            if(tabId){
                let action = component.get("c.testDebug");
                action.setParams({tabId : tabId});
                action.setCallback(this, function(response){
                    var state = response.getStat();
                })
                $A.enqueueAction(action);
            }

            if(!event.returnValue){
                if(tabId){
                    let action = component.get("c.testDebug");
                    action.setCallback(this, function(response){
                        var state = response.getStat();
                    })
                    $A.enqueueAction(action);
                }
            }  
        })
    },
    changeHandler : function(component, event, helper) {
        let inputValue = event.getParam("value");
        let sessionValue = sessionStorage.getItem("value");
        console.log(inputValue);
        component.set('v.sessionValue', inputValue + " "+ sessionValue);
       
        
    }, 
    clickHandler : function(component, event, helper){

        let tabId = sessionStorage.getItem("tabId");
        console.log("tabId "+tabId);
        

        // If not, generate a new identifier and store it
        if (!tabId) {
            tabId = Date.now() + Math.random().toString(36).substring(7);
            console.log("Date.now() "+Date.now());
            sessionStorage.setItem('tabId', tabId);
            console.log("If Block tabId "+ tabId)
        }
        let sessionValue = component.get('v.sessionValue');
        console.log("sessionValue "+ sessionValue);
        sessionStorage.setItem("value", sessionValue);
    }
})