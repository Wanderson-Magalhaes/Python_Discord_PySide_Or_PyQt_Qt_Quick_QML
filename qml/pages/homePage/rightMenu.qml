import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../components"
import "../../js/FunctionsJS.js" as FunctionJS


Flickable {
    id: rightFlickable
    flickableDirection: Flickable.VerticalFlick
    contentHeight: column.height
    clip: true

    function changeIcon(path){
        myRightUser.statusIcon = path
    }

    Column {
        id: column
        spacing: 3

        // Separator
        Item { width: 240; height: 20; }

        // TEXT Separator
        Text{
            text: "PATREON-15 ― 1"
            font.weight: Font.Medium
            font.family: "Segoe UI"
            font.pointSize: 9
            color: "#8e9297"
            leftPadding: 15
        }

        // User
        UserRightBar{
            text: "Discord Official"
            imagePath: "../../../images/images/user_1.png"
            connectedUser: true
            statusIcon: "../../../images/svg_icons/icon_busy.svg"
            textDescription: "Got my eyes on you"
            userColor: "#ffd501"
            showDescription: true
        }

        // Separator
        Item { width: 240; height: 20; }

        // TEXT Separator
        Text{
            text: "MODERATOR ― 1"
            font.weight: Font.Medium
            font.family: "Segoe UI"
            font.pointSize: 9
            color: "#8e9297"
            leftPadding: 15
        }

        // User
        UserRightBar{
            id: myRightUser
            text: "Wanderson"
            connectedUser: true
            userColor: "#55ff7f"
            showDescription: true
        }

        // Separator
        Item { width: 240; height: 20; }

        // TEXT Separator
        Text{
            text: "ONLINE ― 5"
            font.weight: Font.Medium
            font.family: "Segoe UI"
            font.pointSize: 9
            color: "#8e9297"
            leftPadding: 15
        }

        // User
        UserRightBar{
            text: "I_Forgot_The_Password"
            imagePath: "../../../images/images/user_2.png"
            connectedUser: true
            statusIcon: "../../../images/svg_icons/icon_online.svg"
            textDescription: "hacked my own account"
            showDescription: true
        }

        // User
        UserRightBar{
            text: "BlindNinja"
            imagePath: "../../../images/images/user_5.png"
            connectedUser: true
            textDescription: "Running at 300km/h"
            showDescription: true
        }

        // User
        UserRightBar{
            text: "Stalker"
            imagePath: "../../../images/images/user_4.png"
            connectedUser: true
            statusIcon: "../../../images/svg_icons/icon_busy.svg"
        }

        // User
        UserRightBar{
            text: "Discord"
            imagePath: "../../../images/images/user_3.png"
            connectedUser: true
            statusIcon: "../../../images/svg_icons/icon_busy.svg"
            textDescription: "Don't sue me! It's a study"
            showDescription: true
        }

        // User
        UserRightBar{
            text: "Discord Team"
            imagePath: "../../../images/images/user_1.png"
            connectedUser: true
            statusIcon: "../../../images/svg_icons/icon_online.svg"
            showDescription: true
            textDescription: "I love you! Hire me! haha"
        }

        // Separator
        Item { width: 240; height: 20; }

        // TEXT Separator
        Text{
            text: "OFFLINE ― 12"
            font.weight: Font.Medium
            font.family: "Segoe UI"
            font.pointSize: 9
            color: "#8e9297"
            leftPadding: 15
        }

        // User
        UserRightBar{
            text: "Hello"
        }

        // User
        UserRightBar{
            text: "Discord"
        }

        // User
        UserRightBar{
            text: "This"
        }

        // User
        UserRightBar{
            text: "Is"
        }

        // User
        UserRightBar{
            text: "Just"
        }

        // User
        UserRightBar{
            text: "A"
        }

        // User
        UserRightBar{
            text: "Study"
        }

        // User
        UserRightBar{
            text: "Dont"
        }

        // User
        UserRightBar{
            text: "Sue"
        }

        // User
        UserRightBar{
            text: "Me"
        }

        // User
        UserRightBar{
            text: "Love"
        }

        // User
        UserRightBar{
            text: "You"
        }

        // Separator
        Item { width: 240; height: 20; }
    }
    ScrollBar.vertical: ScrollBar {
        id: controlScroll
        size: 0.3
        position: 0.2
        orientation: Qt.Vertical
        visible: rightFlickable.moving
        contentItem: Rectangle {
            implicitWidth: 4
            implicitHeight: 100
            radius: width / 2
            color: controlScroll.pressed ? "#7289da" : "#202225"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:1200;width:240}
}
##^##*/
