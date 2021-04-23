import QtQuick 2.15
import QtQuick.Controls 2.15

ToolTip{
    id: control
    x: 78
    y: 10
    visible: parent.hovered
    delay: 100
    timeout: 15000
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

        Rectangle{
            width: 8
            height: 8
            rotation: 45
            color: "#18191c"
            anchors.verticalCenter: bg.verticalCenter
            anchors.left: bg.left
            anchors.leftMargin: -4
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
