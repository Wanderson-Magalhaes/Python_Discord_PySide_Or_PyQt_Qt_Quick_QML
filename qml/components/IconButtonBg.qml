import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnIcon
    implicitWidth: 32
    implicitHeight: 32
    hoverEnabled: true

    // Custom Properties
    property url iconPath: "../../images/svg_icons/close_icon_2.svg"
    property color iconColor: "#8e9297"
    property color iconColorEntered: "#d8d9da"
    property color backgroundColor: "#31343a"
    property int iconWidth: 22
    property int iconHeight: 22
    property int bgRadius: 5

    background: Rectangle{
        id: bg
        anchors.fill: btnIcon
        radius: bgRadius
        visible: false
        color: backgroundColor
    }

    Image {
        id: icon
        source: iconPath
        width: iconWidth
        height: iconHeight
        sourceSize.height: iconHeight
        sourceSize.width: iconWidth
        anchors.horizontalCenter: btnIcon.horizontalCenter
        fillMode: Image.PreserveAspectFit
        visible: false
        anchors.verticalCenter: btnIcon.verticalCenter
        anchors.verticalCenterOffset: 0
    }

    // Icon Color
    ColorOverlay{
        id: iconOverlay
        anchors.fill: icon
        source: icon
        color: iconColor
        antialiasing: true
    }

    // Mouse Events
    MouseArea{
        propagateComposedEvents: true // accept events from main mouse area
        anchors.fill: btnIcon
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        // Mouse Events
        onEntered: {
            iconOverlay.color = iconColorEntered
            bg.visible = true
        }
        onExited: {
            iconOverlay.color = iconColor
            bg.visible = false
        }
        onPressed: mouse.accepted = false
        onReleased: {
            iconOverlay.color = iconColor
            bg.visible = false
        }
    }


}
