import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Button {
    id: btn
    width: parent.width
    text: qsTr("Button")
    font.bold: true
    leftPadding: 34
    font.pointSize: 10
    font.family: "Segoe UI"

    // Custom Properties
    property color colorBg: "#00000000"
    property color colorBgEntered: "#5c6fb1"
    property color colorBgPressed: "#5365a1"
    property color iconColor: "#43b581"
    property color iconColorEntered: "#f9f9fc"
    property color textColor: "#b9bbbe"
    property color textColorEntered: "#f9f9fc"
    property url iconPath: "../../images/svg_icons/icon_online.svg"
    property int btnHeight: 32
    property bool enableDescription: false
    property string descriptionText: "Set here a description for this button"

    // Hight
    height: btnHeight

    QtObject{
        id: internal

        property color dynamicBg: if(btn.down){
                                      btn.down ? colorBgPressed : colorBg
                                  } else {
                                      btn.hovered ? colorBgEntered : colorBg
                                  }
        property color dynamicIconColor: if(btn.down){
                                      btn.down ? iconColorEntered : iconColor
                                  } else {
                                      btn.hovered ? iconColorEntered : iconColor
                                  }
        property color dynamicText: if(btn.down){
                                      btn.down ? textColorEntered : textColor
                                  } else {
                                      btn.hovered ? textColorEntered : textColor
                                  }
    }

    contentItem: Item{
        id: item1
        Text{
            id: textBtn
            text: btn.text
            anchors.top: item1.top
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            font.weight: btn.font.weight
            font.family: btn.font.family
            font.pointSize: btn.font.pointSize
            color: internal.dynamicText
        }
        Text{
            id: description
            text: descriptionText
            width: 175
            anchors.top: textBtn.bottom
            wrapMode: Text.Wrap
            rightPadding: 9
            anchors.topMargin: 3
            font.weight: Font.Normal
            font.family: btn.font.family
            font.pointSize: 8
            color: internal.dynamicText
            visible: enableDescription
        }
    }

    background: Rectangle{
        id: bg
        color: internal.dynamicBg
        radius: 3
    }

    Image {
        id: icon
        source: iconPath
        fillMode: Image.PreserveAspectFit
        sourceSize.height: 12
        sourceSize.width: 12
        width: 12
        height: 12
        anchors.left: btn.left
        anchors.top: btn.top
        anchors.leftMargin: 8
        anchors.topMargin: 10
        visible: false
    }

    ColorOverlay{
        id: overlay
        source: icon
        anchors.fill: icon
        color: internal.dynamicIconColor
        antialiasing: true
    }

    MouseArea{
        anchors.fill: btn
        cursorShape: Qt.PointingHandCursor
        onPressed: mouse.accepted = false
    }

}
