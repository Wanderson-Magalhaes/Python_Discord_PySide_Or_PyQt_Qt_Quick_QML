import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnTopBar
    property url btnIcon: "../../images/svg_images/maximize_icon.svg"
    property color colorMouseOver: "#2a2c30"
    property color colorMouseDown: "#F00000"
    property real opacityIcon: 1

    QtObject{
        id: internal

        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? colorMouseDown : "#00000000"
                                   }else{
                                       btnTopBar.hovered ? colorMouseOver : "#00000000"
                                   }
    }

    width: 30
    height: 22
    background: Rectangle{
        id: bgBtnTopBar
        color: internal.dynamicColor

        Image {
            id: iconBtnTopBar
            anchors.verticalCenter: bgBtnTopBar.verticalCenter
            source: btnIcon
            anchors.horizontalCenter: bgBtnTopBar.horizontalCenter
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: false
        }

        ColorOverlay{
            anchors.fill: iconBtnTopBar
            source: iconBtnTopBar
            color: "#CCCCCC"
            antialiasing: false
            opacity: opacityIcon
        }
    }
}


