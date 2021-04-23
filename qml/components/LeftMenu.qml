import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Button{
    id: leftMenu
    width: 60
    height: 50

    // Custom Properties
    property bool activeMenu: false
    property bool useImage: false
    property bool showNotifications: false
    property int notificationsNumbers: 16
    property int iconWidth: 24
    property int iconHeight: 24
    property color iconColor: "#43b581"
    property color iconColorEntered: "#FFFFFF"
    property url iconPath: "../../images/svg_icons/discord_simbol.svg"
    property url imagePath: "../../images/images/me.png"
    property color bgColor: "#36393f"
    property color bgColorEntered: "#43b581"

    // Menu Background
    background: Item {
        id: item1
        clip: true
        width: 70
        height: 50

        // Left Detail
        Rectangle{
            id: leftDetail
            width: activeMenu ? 8 : 4
            height: activeMenu? 40 : 0
            color: "#FFFFFF"
            radius: 4
            anchors.verticalCenter: item1.verticalCenter
            anchors.left: item1.left
            anchors.leftMargin: -4
        }

        // Set Icon Or Image
        Rectangle{
            id: iconImage
            width: 50
            height: 50
            radius: 25
            color: bgColor
            clip: true
            anchors.verticalCenter: item1.verticalCenter
            anchors.horizontalCenter: item1.horizontalCenter

            // Icon
            Image{
                id: icon
                anchors.verticalCenter: iconImage.verticalCenter
                source: iconPath
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: iconImage.horizontalCenter
                sourceSize.height: iconHeight
                sourceSize.width: iconWidth
                width: iconWidth
                height: iconHeight
                visible: false
            }

            ColorOverlay{
                id: iconOverlay
                anchors.fill: icon
                source: icon
                color: iconColor
                antialiasing: true
            }

            Image {
                id: image
                anchors.verticalCenter: iconImage.verticalCenter
                source: imagePath
                anchors.horizontalCenter: iconImage.horizontalCenter
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 50
                sourceSize.width: 50
                visible: useImage

                // Enable Layer
                layer.enabled: true
                layer.effect: OpacityMask{
                    maskSource: iconImage
                }
            }

            Rectangle{
                id: notificationBox
                anchors.bottom: iconImage.bottom
                anchors.right: iconImage.right
                anchors.rightMargin: -4
                anchors.bottomMargin: -4
                width: 32
                height: 26
                color: "#f04747"
                border.width: 4
                border.color: "#202225"
                radius: 13
                visible: showNotifications

                Text {
                    id: notifications
                    text: notificationsNumbers
                    anchors.verticalCenter: notificationBox.verticalCenter
                    anchors.horizontalCenter: notificationBox.horizontalCenter
                    anchors.horizontalCenterOffset: -1
                    color: "#ffffff"
                    font.weight: Font.Bold
                    font.family: "Segoe UI"
                }
            }
        }
    }

    MouseArea{
        anchors.fill: leftMenu
        hoverEnabled: true
        propagateComposedEvents: true
        cursorShape: Qt.PointingHandCursor

        // Mouse Entered
        onEntered: {
            if(!activeMenu){
                bgEntered.running = true
                borderEntered.running = true
                detailEntered.running = true
                detailWidthEntered.running = true
                iconEntered.running = true
            }
        }

        // Mouse Exited
        onExited: {
            if(!activeMenu){
                bgExited.running = true
                borderExited.running = true
                detailExited.running = true
                detailWidthExited.running = true
                iconExited.running = true
            }
        }
    }

    // BG Color
    PropertyAnimation{
        id: bgEntered
        target: iconImage
        properties: "color"
        to: bgColorEntered
        duration: 150
    }
    PropertyAnimation{
        id: bgExited
        target: iconImage
        properties: "color"
        to: bgColor
        duration: 150
    }

    // Icon Overlay
    PropertyAnimation{
        id: iconEntered
        target: iconOverlay
        properties: "color"
        to: iconColorEntered
        duration: 100
    }
    PropertyAnimation{
        id: iconExited
        target: iconOverlay
        properties: "color"
        to: iconColor
        duration: 100
    }

    // BG Borders
    PropertyAnimation{
        id: borderEntered
        target: iconImage
        properties: "radius"
        to: 18
        duration: 150
    }
    PropertyAnimation{
        id: borderExited
        target: iconImage
        properties: "radius"
        to: 25
        duration: 150
    }

    // Left Detail
    PropertyAnimation{
        id: detailEntered
        target: leftDetail
        properties: "height"
        to: 20
        duration: 200
        easing.type: Easing.InOutCubic
    }
    PropertyAnimation{
        id: detailExited
        target: leftDetail
        properties: "height"
        to: 0
        duration: 200
        easing.type: Easing.InOutCubic
    }
    PropertyAnimation{
        id: detailWidthEntered
        target: leftDetail
        properties: "width"
        to: 8
        duration: 200
        easing.type: Easing.InOutCubic
    }
    PropertyAnimation{
        id: detailWidthExited
        target: leftDetail
        properties: "width"
        to: 4
        duration: 200
        easing.type: Easing.InOutCubic
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#4c4e50"}
}
##^##*/
