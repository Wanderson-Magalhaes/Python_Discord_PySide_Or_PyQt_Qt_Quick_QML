import QtQuick 2.15
import QtQuick.Controls 2.15

ToolTip{
    // Custom Propertie
    property bool inverted: false

    id: control
    x: -(control.width / 2 - parent.width / 2)
    y: inverted ? 30 : -43
    delay: 100
    timeout: 15000
    visible: if(typeof parent.hovered !== 'undefined') return parent.hovered; else false
    text: qsTr("")
    padding: 10
    contentItem: Text{
        text: control.text
        font.bold: true
        font.pointSize: 10
        color: "#d9dce1"
    }

    // Set background
    background: Rectangle{
        id: bg
        color: "#18191c"
        radius: 5

        // Detail Bottom
        Rectangle{
            width: 8
            height: 8
            rotation: 45
            color: "#18191c"
            anchors.bottom: bg.bottom
            anchors.bottomMargin: -4
            anchors.horizontalCenter: bg.horizontalCenter
            visible: inverted ? false : true
        }

        // Detail Top
        Rectangle{
            width: 8
            height: 8
            rotation: 45
            color: "#18191c"
            anchors.top: bg.top
            anchors.topMargin: -4
            anchors.horizontalCenter: bg.horizontalCenter
            visible: inverted ? true : false
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
