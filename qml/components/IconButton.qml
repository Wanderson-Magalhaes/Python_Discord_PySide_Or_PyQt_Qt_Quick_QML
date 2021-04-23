import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnIcon
    implicitWidth: 20
    implicitHeight: 20
    hoverEnabled: true
    background: Rectangle{
        color: "#00000000"
    }

    // Custom Properties
    property url iconPath: "../../images/svg_icons/close_icon_2.svg"
    property color iconColor: "#8e9297"
    property color iconColorEntered: "#d8d9da"
    property int iconWidth: 16
    property int iconHeight: 16

    QtObject{
        id: internal
        property int iconPressed: if(btnIcon.down) return 1; else return 0
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
        anchors.verticalCenterOffset: internal.iconPressed
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
        onEntered: iconOverlay.color = iconColorEntered
        onExited: iconOverlay.color = iconColor
        onPressed: mouse.accepted = false
    }


}
