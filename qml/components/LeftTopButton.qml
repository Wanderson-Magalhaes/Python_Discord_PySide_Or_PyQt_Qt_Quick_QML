import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: topLeftMenu
    width: 240
    height: 47

    // CUSTOM PROPERTIES
    property color bgColor: "#2f3136"
    property color bgColorEntered: "#34373c"
    property bool activeMenu: false
    property string textMenu: "Wanderson - Modern GUI"

    function rotateNormal(){
        rotateExited.running = true
        barVerticalExited.running = true
        barHorizontalExited.running = true
        topPositionExited.running = true
        bg.color = bgColor
        activeMenu = false
    }
    function rotateClose() {
        rotateClicked.running = true
        barVerticalClicked.running = true
        barHorizontalClicked.running = true
        topPositionClicked.running = true
        bg.color = bgColorEntered
        activeMenu = true
    }


    // BG MENU
    Rectangle{
        id: bg
        anchors.fill: topLeftMenu
        color: bgColor

        // Text Menu
        Text {
            id: textBtn
            color: "#e2e3e3"
            text: textMenu
            anchors.verticalCenter: bg.verticalCenter
            anchors.left: bg.left
            font.bold: true
            font.pointSize: 11
            font.family: "Segoe UI"
            anchors.leftMargin: 15
        }

        // Icon Animated
        Rectangle{
            id: iconAnimated
            width: 16
            height: 16
            color: "#00000000"
            rotation: 45
            anchors.verticalCenter: bg.verticalCenter
            anchors.right: bg.right
            anchors.verticalCenterOffset: 4
            anchors.rightMargin: 15
            clip: true

            // Vertical Line
            Rectangle{
                id: verticalLine
                width: 2
                height: 9
                color: "#e2e3e3"
                anchors.horizontalCenter: iconAnimated.horizontalCenter
                antialiasing: true
            }

            // Horizontal Line
            Rectangle{
                id: horizontalLine
                width: 9
                height: 2
                color: "#e2e3e3"
                anchors.verticalCenter: iconAnimated.verticalCenter
                anchors.verticalCenterOffset: 0
                antialiasing: true
            }
        }
    }

    // Mouse Area Events
    MouseArea{
        anchors.fill: topLeftMenu
        hoverEnabled: true
        onClicked: {
            if(!activeMenu){
                rotateClose()
            }else{
                rotateNormal()
            }
        }
        onEntered: {
            if(!activeMenu){
                bg.color = bgColorEntered
            }
        }
        onExited: {
            if(!activeMenu){
                bg.color = bgColor
            }
        }
    }

    // SET Animations

    // Rotate
    PropertyAnimation{
        id: rotateClicked
        properties: "rotation"
        target: iconAnimated
        to: -45
        duration: 150
    }
    PropertyAnimation{
        id: rotateExited
        properties: "rotation"
        target: iconAnimated
        to: 45
        duration: 150
    }

    // Animated Line Bar
    PropertyAnimation{
        id: barVerticalClicked
        properties: "height"
        target: verticalLine
        to: 16
        duration: 150
    }
    PropertyAnimation{
        id: barVerticalExited
        properties: "height"
        target: verticalLine
        to: 9
        duration: 150
    }
    PropertyAnimation{
        id: barHorizontalClicked
        properties: "width"
        target: horizontalLine
        to: 16
        duration: 150
    }
    PropertyAnimation{
        id: barHorizontalExited
        properties: "width"
        target: horizontalLine
        to: 9
        duration: 150
    }

    // Adjust Position
    PropertyAnimation{
        id: topPositionClicked
        properties: "anchors.verticalCenterOffset"
        target: iconAnimated
        to: 0
        duration: 150
    }
    PropertyAnimation{
        id: topPositionExited
        properties: "anchors.verticalCenterOffset"
        target: iconAnimated
        to: 4
        duration: 150
    }
}


