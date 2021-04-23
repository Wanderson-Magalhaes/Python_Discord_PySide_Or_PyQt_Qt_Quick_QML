import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: textField
    implicitWidth: 145
    implicitHeight: 24
    height: 24

    // Custom Properties
    property color colorDefault: "#282c34"
    property color colorOnFocus: "#202225"
    property color colorMouseOver: "#2B2F38"
    property color colorBorderOnFocus: "#ff007f"

    // Text properties
    placeholderText: qsTr("Search")
    color: "#ffffff"
    font.family: "Segoe UI"
    font.pointSize: 10
    font.weight: Font.Medium
    clip: true
    leftPadding: 10
    rightPadding: 30
    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: "#4568e2"
    placeholderTextColor: "#81848c"

    // Internal Functions
    QtObject{
        id: internal

        // Change BG color when mouse entered and on focus field
        property var dynamicColor: if(textField.focus){
                                       textField.focus? colorOnFocus : colorDefault
                                   }else{
                                       textField.hovered? colorMouseOver : colorDefault
                                   }
    }


    // Create background
    background: Rectangle{
        id: bgColor
        color: internal.dynamicColor
        radius: 5
        border.color: colorDefault
        border.width: 0

        // Create Search Icon
        Image {
            id: iconSearch
            width: 16
            height: 16
            anchors.verticalCenter: bgColor.verticalCenter
            anchors.right: bgColor.right
            source: "../../images/svg_icons/icon_search.svg"
            anchors.rightMargin: 8
            sourceSize.width: 16
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 16
            opacity: 0.5
        }
    }

    // On Focus Events
    onFocusChanged: {
        if(textField.focus){
            textField.implicitWidth = 220
            bgColor.border.color = colorBorderOnFocus
        }else{
            textField.implicitWidth = 145
            textField.text = ""
            bgColor.border.color = colorDefault
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#000000"}
}
##^##*/
