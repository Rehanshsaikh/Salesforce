({
    startGame: function (component, event, helper) {
        // access combobox
        let gameModeComboBox = component.find("gameMode");

        // access the value of combobox
        let selectedValue = gameModeComboBox.get("v.value");

        // update selectedMode attribute
        component.set("v.selectedMode", selectedValue);
        // console.log("The start new game button is clicked. The game mode is" + selectedValue);

        // console.log("Selected mode attribute value: " + component.get("v.selectedMode"));

        let boardComponent = component.find("board");
        boardComponent.restart();
    },

    reshuffleBoard: function (component, event, helper) {
        let boardComp = component.find("board");
        boardComp.shuffle();
    }
})