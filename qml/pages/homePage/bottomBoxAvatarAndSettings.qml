import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../components"
import "../../js/FunctionsJS.js" as FunctionJS

Item {
    id: bottomBox
    width: 240
    height: 50
    property url imagePath: "../../../images/images/me.png"
    property url statusIcon: "../../../images/svg_icons/icon_idle.svg"
    property bool showPopup: false

    Rectangle {
        id: bottomChannelStatus
        width: 220
        height: 270
        color: "#18191c"
        radius: 5
        anchors.bottom: bottomBox.bottom
        anchors.horizontalCenter: bottomBox.horizontalCenter
        anchors.bottomMargin: 55
        clip: true
        scale: 0
        visible: true
        transformOrigin: Item.Bottom
        z: 40

        Column{
            id: column
            anchors.fill: bottomChannelStatus
            anchors.margins: 8
            spacing: 3

            StatusButton{
                text: "Online"
                onPressed: {
                    icon.source = this.iconPath
                    changeStatusMemberList.changeIcon(this.iconPath)
                    statusExited.running = true
                    showPopup = false
                    console.log("Status Online")
                }
            }

            // DIV
            Rectangle{ width: column.width; height: 1; color: "#262729" }

            StatusButton{
                text: "Idle"
                iconColor: "#faa61a"
                iconPath: "../../../images/svg_icons/icon_idle.svg"
                onPressed: {
                    icon.source = this.iconPath
                    changeStatusMemberList.changeIcon(this.iconPath)
                    statusExited.running = true
                    showPopup = false
                    console.log("Status Idle")
                }
            }

            StatusButton{
                text: "Do Not Disturb"
                iconColor: "#f04747"
                iconPath: "../../../images/svg_icons/icon_busy.svg"
                descriptionText: "You will not receive any desktop notifications."
                btnHeight: 60
                enableDescription: true
                onPressed: {
                    icon.source = this.iconPath
                    changeStatusMemberList.changeIcon(this.iconPath)
                    statusExited.running = true
                    showPopup = false
                    console.log("Status Do Not Disturb")
                }
            }

            StatusButton{
                text: "Invisible"
                iconColor: "#858c95"
                iconPath: "../../../images/svg_icons/icon_invisible.svg"
                descriptionText: "You will not appear online, but will have full access to all of Discord."
                btnHeight: 75
                enableDescription: true
                onPressed: {
                    icon.source = this.iconPath
                    changeStatusMemberList.changeIcon(this.iconPath)
                    statusExited.running = true
                    showPopup = false
                    console.log("Status Invisible")
                }
            }

            // DIV
            Rectangle{ width: column.width; height: 1; color: "#262729" }

            StatusButton{
                text: "Set a custom status"
                onPressed: {
                    icon.source = this.iconPath
                    changeStatusMemberList.changeIcon(this.iconPath)
                    statusExited.running = true
                    showPopup = false
                    console.log("Custom Status")
                }
            }
        }
    }

    // Set Image BTN
    Rectangle{
        id: iconBox
        width: 34
        height: 34
        radius: 17
        clip: false
        anchors.verticalCenter: bottomBox.verticalCenter
        anchors.left: bottomBox.left
        anchors.leftMargin: 8
        color: "#292b2f"

        Image {
            id: image
            anchors.verticalCenter: iconBox.verticalCenter
            source: imagePath
            anchors.horizontalCenter: iconBox.horizontalCenter
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 34
            sourceSize.width: 34
            width: 34
            height: 34

            // Enable Layer
            layer.enabled: true
            layer.effect: OpacityMask{
                maskSource: iconBox
            }
        }

        // Icon Status
        Rectangle {
            id: iconCircle
            anchors.right: iconBox.right
            anchors.bottom: iconBox.bottom
            anchors.rightMargin: -2
            anchors.bottomMargin: -2
            width: 16
            height: 16
            color: "#292b2f"
            radius: 8
            clip: true

            Image{
                id: icon
                source: statusIcon
                anchors.horizontalCenter: iconCircle.horizontalCenter
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 12
                sourceSize.width: 12
                width: 12
                height: 12
                anchors.verticalCenter: iconCircle.verticalCenter

                // Enable Layer
                layer.enabled: true
                layer.effect: OpacityMask{
                    maskSource: iconCircle
                }
            }
        }

        MouseArea{
            anchors.fill: iconBox
            hoverEnabled: true
            onEntered: iconBox.opacity = 0.8
            onExited: iconBox.opacity = 1
            onPressed: {
                if(!showPopup){
                    statusClicked.running = true
                    console.log("Show Popup")
                    showPopup = true
                } else {
                    statusExited.running = true
                    console.log("Hide Popup")
                    showPopup = false
                }
            }
            cursorShape: Qt.PointingHandCursor
        }

        // Animation
        PropertyAnimation{
            id: statusClicked
            target: bottomChannelStatus
            properties: "scale"
            to: 1
            duration: 200
            easing.type: Easing.OutQuint
        }
        PropertyAnimation{
            id: statusExited
            target: bottomChannelStatus
            properties: "scale"
            to: 0
            duration: 25
            easing.type: Easing.OutQuint
        }
    }

    Rectangle {
        id: textBox
        width: 80
        height: 34
        color: "#00000000"
        anchors.verticalCenter: bottomBox.verticalCenter
        anchors.left: iconBox.right
        anchors.leftMargin: 8

        Text{
            width: textBox.width
            text: "Wanderson"
            font.pointSize: 10
            font.family: "Segoe UI"
            font.weight: Font.Bold
            color: "#ffffff"
        }
        Text{
            width: textBox.width
            text: "#0446"
            anchors.bottom: textBox.bottom
            anchors.bottomMargin: 2
            font.pointSize: 10
            font.family: "Segoe UI"
            color: "#b9bbbe"
        }
        MouseArea{
            width: textBox.width
            height: textBox.height
            hoverEnabled: true
            onPressed: console.log("Copied!")
            cursorShape: Qt.PointingHandCursor
        }
    }

    IconButtonBg {
        id: iconSettings
        width: 32
        height: 32
        anchors.verticalCenter: bottomBox.verticalCenter
        anchors.right: bottomBox.right
        iconPath: "../../../images/svg_icons/icon_settings.svg"
        anchors.rightMargin: 8
        hoverEnabled: true
        onPressed: console.log("User Settings")
        CenteredTooltip{ text: "User Settings"; }
    }

    IconButtonBg {
        id: iconHeadphone
        width: 32
        height: 32
        anchors.verticalCenter: bottomBox.verticalCenter
        anchors.right: iconSettings.left
        iconWidth: 20
        iconHeight: 20
        anchors.rightMargin: 0
        iconPath: "../../../images/svg_icons/icon_headphone.svg"
        onPressed: console.log("Deafen")
        CenteredTooltip{ text: "Deafen"; }
    }

    IconButtonBg {
        id: iconMike
        width: 32
        height: 32
        anchors.verticalCenter: bottomBox.verticalCenter
        anchors.right: iconHeadphone.left
        iconHeight: 20
        iconPath: "../../../images/svg_icons/icon_mike.svg"
        anchors.rightMargin: 0
        iconWidth: 20
        onPressed: console.log("Mute")
        CenteredTooltip{ text: "Mute"; }
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#000000"}
}
##^##*/
