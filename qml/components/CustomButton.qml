import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: button
    implicitWidth: 140
    implicitHeight: 38
    hoverEnabled: true
    font.bold: true
    font.pointSize: 10
    font.family: "Segoe UI"
    text: qsTr("Button")

    contentItem: Item{
        id: item
        Text {
            id: textInside
            color: "#ffffff"
            text: button.text
            font: button.font
            anchors.verticalCenter: item.verticalCenter
            anchors.horizontalCenter: item.horizontalCenter
        }
    }

    // Custom Properties
    property color colorDefault: "#7289da"
    property color colorMouseOver: "#677bc4"
    property color colorPressed: "#5f72b7"

    // Background Colors
    background: Rectangle{
        id: bgBtn
        color: colorDefault
        radius: 4
    }

    // Background Animations
    onDownChanged: button.down ? bgDown.running = true : bgExited.running = true
    onHoveredChanged: button.hovered ? bgEntered.running = true : bgExited.running = true

    MouseArea {
        id: mouseArea
        anchors.fill: button
        onPressed:  mouse.accepted = false
        cursorShape: Qt.PointingHandCursor
    }

    PropertyAnimation{
        id: bgEntered
        target: bgBtn
        properties: "color"
        to: colorMouseOver
        duration: 150
    }
    PropertyAnimation{
        id: bgExited
        target: bgBtn
        properties: "color"
        to: colorDefault
        duration: 150
    }
    PropertyAnimation{
        id: bgDown
        target: bgBtn
        properties: "color"
        to: colorPressed
        duration: 150
    }

}

/*##^##
Designer {
    D{i:0;height:38;width:140}
}
##^##*/
