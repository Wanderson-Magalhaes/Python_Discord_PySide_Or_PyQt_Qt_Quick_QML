import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"
import "../js/FunctionsJS.js" as FunctionJS

Button {
    id: btn
    width: 240
    height: 42
    hoverEnabled: true
    property url imagePath: "../../images/images/me.png"
    property url statusIcon: "../../images/svg_icons/icon_idle.svg"
    property bool showPopup: false
    property color bgColor: "#00000000"
    property color bgColorHovered: "#34373c"
    property color userColor: "#8e9297"
    property color userColorHovered: "#dcddde"
    property color userDescriptionColor: "#8e9297"
    property string textDescription: "Creating GUI"
    property bool showDescription: false
    property bool connectedUser: false


    QtObject{
        id: internal
        property color dynamicBg: if(btn.down){
                                      return btn.down ? bgColorHovered : bgColor
                                  } else {
                                      return btn.hovered ? bgColorHovered : bgColor
                                  }
        property color dynamicText: if(btn.down){
                                      return btn.down ? userColorHovered : userColor
                                  } else {
                                      return btn.hovered ? userColorHovered : userColor
                                  }
    }

    background: Rectangle{
        id: bg
        color: internal.dynamicBg
        anchors.left: btn.left
        anchors.right: btn.right
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        radius: 5
    }

    contentItem: Item{
        id: content
        anchors.fill: btn
        // Set Image BTN
        Rectangle{
            id: iconBox
            width: 32
            height: 32
            radius: 16
            anchors.verticalCenter: content.verticalCenter
            anchors.left: content.left
            anchors.leftMargin: 20
            color: "#292b2f"
            opacity: btn.hovered ? 1 : connectedUser? 1 : 0.4

            Image {
                id: image
                anchors.verticalCenter: iconBox.verticalCenter
                source: imagePath
                anchors.horizontalCenter: iconBox.horizontalCenter
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 32
                sourceSize.width: 32
                width: 32
                height: 32

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
                anchors.bottomMargin: -3
                width: 16
                height: 16
                color: "#292b2f"
                radius: 8
                clip: true
                visible: connectedUser

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
                        maskSource: iconBox
                    }
                }
            }
        }

        Rectangle {
            id: textBox
            height: 34
            color: "#00000000"
            anchors.verticalCenter: content.verticalCenter
            anchors.left: iconBox.right
            anchors.right: content.right
            clip: true
            anchors.rightMargin: 20
            anchors.leftMargin: 8

            Text{
                width: content.width
                text: btn.text
                anchors.verticalCenter: textBox.verticalCenter
                anchors.verticalCenterOffset: connectedUser ? showDescription ? -6 : 0 : 0
                font.pointSize: 10
                font.family: "Segoe UI"
                font.weight: Font.Bold
                color: internal.dynamicText
                opacity: btn.hovered ? 1 : connectedUser? 1 : 0.4
            }
            Text{
                width: textBox.width
                text: textDescription
                anchors.bottom: textBox.bottom
                anchors.bottomMargin: 2
                font.pointSize: 9
                font.family: "Segoe UI"
                color: userDescriptionColor
                visible: connectedUser ? showDescription : false
            }
        }
    }
    MouseArea{
        anchors.fill: btn
        cursorShape: Qt.PointingHandCursor
        onPressed: mouse.accepted = false
    }
}


