import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../components"

Item {
    id: topLeftBox
    width: 240
    height: 240

    // Image
    Image {
        id: image
        anchors.top: topLeftBox.top
        source: "../../../images/images/image_left_160x90.png"
        anchors.horizontalCenter: topLeftBox.horizontalCenter
        anchors.topMargin: 20
    }

    // Set Text
    Text {
        id: infoText
        width: 220
        color: "#ccd5d9"
        text: qsTr("Server Boosts are here! Rally your community to boost your server.")
        anchors.top: image.bottom
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        font.pointSize: 10
        font.family: "Segoe UI"
        anchors.horizontalCenter: topLeftBox.horizontalCenter
        anchors.topMargin: 15
    }

    CustomButton{
        text: "See Levels & Perks"
        anchors.bottom: topLeftBox.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: topLeftBox.horizontalCenter
        onPressed: console.log("See Levels & Perks clicked")
    }

    Rectangle{
        id: bottomLine
        width: 240
        height: 1
        color: "#36393f"
        anchors.bottom: topLeftBox.bottom
        anchors.bottomMargin: 0
    }
}

/*##^##
Designer {
    D{i:0;height:240;width:240}
}
##^##*/
