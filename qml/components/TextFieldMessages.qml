import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: textField
    height: 40
    placeholderText: qsTr("Message #chat")
    placeholderTextColor: "#737373"
    font.weight: Font.Normal
    font.family: "Segoe UI"
    font.pointSize: 11
    color: "#d6d6d6"
    onTextChanged: textField.text ? Font.Medium : Font.Light
    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: "#4568e2"
    background: Rectangle{
        color: "#00000000"
    }
}
