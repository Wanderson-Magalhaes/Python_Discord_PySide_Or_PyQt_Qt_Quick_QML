import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: button
    width: 240
    height: 32

    // Custom Properties
    property color colorDefault: "#00000000"
    property color colorEntered: "#34373c"
    property color colorPressed: "#393c43"
    property color iconColor: "#72767d"
    property color textColor: "#72767d"
    property color textColorEntered: "#d5d6d7"
    property color textColorActive: "#f5f5f6"
    property string btnText: "channel-name"
    property bool isVoiceChat: false
    property string totalOnline: "03"
    property string totalChat: "10"
    property url iconPath: "../../images/svg_icons/icon_settings.svg"
    property bool activedMenu: false

    QtObject{
        id: internal
        // Custom BG Colors
        property color dynamicBgColor: if(button.down){
                                             if(!activedMenu){
                                                 return button.down ? colorPressed : colorDefault
                                             } else {
                                                 return colorPressed
                                             }
                                         } else {
                                             if(!activedMenu){
                                                 return button.hovered ? colorEntered : colorDefault
                                             } else {
                                                 return colorPressed
                                             }
                                         }
        // Custom Text Colors
        property color dynamicTextColor: if(button.down){
                                                if(!activedMenu){
                                                    return button.down ? textColorActive : textColor
                                                } else {
                                                    return textColorActive
                                                }
                                           } else {
                                                if(!activedMenu){
                                                    return button.hovered ? textColorEntered : textColor
                                                } else {
                                                    return textColorActive
                                                }
                                           }
        // Show Chat
        property bool chatBox: if(isVoiceChat){
                                   return button.hovered ? false : true
                               } else {
                                   return false
                               }

    }

    // Set Background
    background: Rectangle{
        id: bg
        height: 32
        anchors.left: button.left
        anchors.right: button.right
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        radius: 5
        color: internal.dynamicBgColor

        // Set Left Icon
        Image {
            id: icon
            source: iconPath
            fillMode: Image.PreserveAspectFit
            anchors.leftMargin: 10
            width: 18
            height: 18
            sourceSize.height: 18
            sourceSize.width: 18
            anchors.verticalCenter: bg.verticalCenter
            anchors.left: bg.left
            visible: false
        }

        ColorOverlay{
            id: overlay; anchors.fill: icon; source: icon; color: iconColor; antialiasing: true;
        }

        // Create Text
        Text {
            id: textLeft
            text: btnText
            anchors.verticalCenter: bg.verticalCenter
            anchors.left: icon.right
            anchors.verticalCenterOffset: -1
            font.weight: Font.Medium
            font.pointSize: 11
            font.family: "Segoe UI"
            anchors.leftMargin: 10
            color: internal.dynamicTextColor
        }

        // Voice Chat
        Rectangle{
            id: voiceChat
            width: 48
            height: 20
            color: "#202225"
            anchors.verticalCenter: bg.verticalCenter
            anchors.right: bg.right
            anchors.rightMargin: 5
            radius: 10
            clip: true
            visible: internal.chatBox

            Rectangle{
                width: 36
                height: 20
                color: "#36393f"
                rotation: 0
                anchors.left: voiceChat.left
                anchors.leftMargin: -1
                anchors.verticalCenter: voiceChat.verticalCenter
                radius: 10
            }

            Rectangle{
                width: 13
                height: 30
                color: "#202225"
                anchors.verticalCenter: voiceChat.verticalCenter
                anchors.horizontalCenter: voiceChat.horizontalCenter
                anchors.horizontalCenterOffset: 6
                rotation: 25
                antialiasing: true
            }

            Text{
                id: onlineText
                width: 24
                height: 20
                anchors.left: voiceChat.left
                anchors.leftMargin: -7
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.family: "Segoe UI"
                font.pointSize: 9
                text: totalOnline
                color: textColor
            }

            Text{
                id: totalText
                width: 24
                height: 20
                anchors.right: voiceChat.right
                anchors.rightMargin: -2
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Segoe UI"
                font.pointSize: 9
                text: totalChat
                color: textColor
            }
        }
    }

}
