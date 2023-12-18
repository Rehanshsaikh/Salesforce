({  

    doInit : function(component, event, helper){
        alert("This init method")    
    },
    
    doRender: function(component, event, helper){
        alert("This init Render")    

    },

    clickMe : function(component, event, helper) {
        // alert("This is me That is called by you. What help can i assist you ?")
        // alert("This is The Rehan Shaikh")
        var variable = component.find("box");
        var selectedValue = variable.get("v.value")
       
        component.set("v.test", selectedValue)
        let sel = component.find("select")
        // var selectedValue = sel.get("v.value")
        var selectedValue = component.find('select').getElement().id
        alert(selectedValue);
    }

    
})