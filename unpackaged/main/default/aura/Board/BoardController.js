({
    doInit : function(component, event, helper) {
        
        let mode = component.get("v.mode")
        
        let modes = {
            easy:3,
            medium:4,
            hard:6
        }

        let modeNumber = modes[mode];
        let blockSize = 12/modeNumber
        component.set("v.blockSize", blockSize)
        let arr = helper.getWords(modeNumber*modeNumber)
        component.set("v.words", arr)
        
        let word = helper.randonWord(arr)
        component.set("v.winWord", word)

        component.set("v.result", false)
        component.set("v.clickCount", 0)
        component.set("v.status", "")

        // $A.get('e.force:refreshView').fire();

        

        // console.log("This is the array "+ arr + " and this is it's random Word "+ word)
    },

    blockClickHandler: function(component, event, helper){
        // console.log("this is the custom handler");
        // alert("This is Rehan who is checking the code for his understandting")
        let clickCount = component.get("v.clickCount")
        clickCount++;
        component.set("v.clickCount", clickCount);
        let newValue = event.getParam("value");
        let winword = component.get("v.winWord");
        if(newValue == winword ){
            component.set("v.status", "YOU HAVE WON")
            component.set("v.result", true)
        }else if(clickCount == 3 ){
            component.set("v.status", "YOU HAVE LOSE")
            component.set("v.result", true)
        }
        console.log(newValue);

    },

    // callRandomiseArray:function(component,event,helper){
    //     let words = component.get("v.words")
    //     let newWords = helper.randmisedArray(words);
    //     component.set("v.words", newWords)
    // }
})