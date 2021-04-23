import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: btn
    text: "Button Text"
    width: textInside.width
    height: textInside.height

    contentItem: Text{
        id: textInside
        width: btn.width
        text: btn.text
        anchors.left: btn.left
        anchors.top: btn.top
        anchors.leftMargin: 0
        anchors.topMargin: 0
        font.underline: btn.hovered ? true : false
        font.pointSize: 12
        font.family: "Segoe UI"
        font.weight: Font.Medium
        color: "#ffffff"
    }

    background: Rectangle{
        color: "#00000000"
    }

}

/*##^##
Designer {
    D{i:0;height:20;width:200}
}
##^##*/
