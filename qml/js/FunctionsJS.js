function deleteComponentAndChilds(component) {
    for(var item = component.children.length; item > 0; item--){
        // Remove Child
        component.children[item-1].destroy()

        // Remove Component At End
        if(item === 1) component.destroy()
    }
}

function count(component) {
    return component.children.length
}

function msgTime(){
    var time = new Date().toTimeString().replace(/.*(\d{2}:\d{2}:\d{2}).*/, "$1");
    return time.slice(0, -3)
}

