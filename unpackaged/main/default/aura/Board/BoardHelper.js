({
    getWords : function(count) {
        let wordsArray = [
            "expansion",
            "grandfather",
            "nappy",
            "oranges",
            "beds",
            "quack",
            "achiever",
            "yell",
            "hospital",
            "winter",
            "understood",
            "squalid",
            "merciful",
            "reaction",
            "wipe",
            "fearless",
            "tiresome",
            "introduce",
            "planes",
            "drum",
            "muddle",
            "capable",
            "canvas",
            "route",
            "enchanted",
            "quirky",
            "switch",
            "apparatus",
            "loss",
            "agreement",
            "substance",
            "back",
            "oafish",
            "expand",
            "aromatic",
            "quarrelsome",
            "free",
            "useful",
            "raspy",
            "drown",
            "ring",
            "lush",
            "numberless",
            "embarrass",
            "shrill",
            "rice",
            "ice",
            "crow",
            "pumped",
            "sparkle",
            "instruct",
            "girl",
            "glass",
            "frog",
            "murky",
            "impolite",
            "crabby",
            "pin",
            "grade",
            "upbeat",
            "linen",
            "flaky",
            "side",
            "unknown",
            "cactus",
            "round",
            "busy",
            "grab",
            "crush",
            "faithful",
            "mother",
            "clean",
            "unhealthy",
            "event",
            "absent",
            "thoughtless",
            "icy",
            "prefer",
            "charge",
            "confuse",
            "clam",
            "dress",
            "snake",
            "evasive",
            "unit",
            "flow",
            "annoying",
            "gusty",
            "possessive",
            "rhetorical",
            "rule",
            "frantic",
            "farm",
            "poor",
            "possess",
            "men",
            "pleasant",
            "zoom",
            "sidewalk",
            "reply"
        ];
        let newArrayToReturn = []

        while(count > newArrayToReturn.length){
           let index = Math.floor(Math.random()*wordsArray.length);
           let word = wordsArray[index];
           if(!newArrayToReturn.includes(word)){
               newArrayToReturn.push(word);
           }
        }
        newArrayToReturn = newArrayToReturn.map(item=>{
            return {word:item, open:false}
        })

        return newArrayToReturn;
    },

    randonWord : function(arr){
        let word = arr[Math.floor(arr.length*(Math.random()))]
        return word
    },


    randmisedArray: function(arr){
        let newArr = []
        while(arr.length != 0){
            let = index = Math.floor(arr.length*(Math.random()))
            let word = arr[index]
            newArray.push(word)
            delete arr[index]
        }
        return newArray
    },

    // fireResultEvent: function(component,event,resultValue){
    //     const appEvent = $A.get("e.c:ResultApplicationEvent");
    //     appEvent.setParams({result:resultValue })
    //     appEvent.fire()
    // }
})