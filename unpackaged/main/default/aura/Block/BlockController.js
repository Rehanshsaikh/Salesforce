({
    change : function(component, event, helper) {
        let open = component.get("v.open");
        if(!open){
            component.set("v.open",true);

            // console.log("This above of labelVaue from BoardController file in change method")
            let labelValue = component.get("v.label");
            // console.log(labelValue);

            let compEvent = component.getEvent("customEvent");
            compEvent.setParams({value:labelValue});
            compEvent.fire();
            // alert("this is from fire event")
        }
        
    },

    // changeOpen:function(component,event,helper){
    //     component.set("v.open",false)

    //     console.log("Rehan")
    // }
})