({
    // handleShowModal: function(component, evt, helper) {
    //     console.log('This is the code that is executed')
    //     // component.find('overlayLib').showCustomModal({
    //     //     header: "Modal header section",
    //     //     body: "Content of Modal window",
    //     //     showCloseButton: true
    //     // })

    //     $A.createComponent("c:ltngFlowComponent", {},
    //             function(content, status) {
    //                 if (status === "SUCCESS") {
    //                 component.find('overlayLib').showCustomModal({
    //                 header: "Flow Window",
    //                 body: content,
    //                 showCloseButton: true
    //             })
    //         }
    //     });
    // },

    togglePanel: function (component, event, helper) {
        var panelContainer = component.find("panel").getElement();
        var overlay = component.find("overlay").getElement();
        
        if (panelContainer.style.width === "50%") {
            panelContainer.style.width = "0";
            overlay.style.background = "rgba(0, 0, 0, 0)"; // No blur when panel is closed
        } else {
            panelContainer.style.width = "50%";
            overlay.style.background = "rgba(0, 0, 0, 0.5)"; // Apply blur when panel is open
        }
    }
})