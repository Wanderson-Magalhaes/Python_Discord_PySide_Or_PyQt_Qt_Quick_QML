import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../components"
import "../../js/FunctionsJS.js" as FunctionJS
import QtQuick.Layouts 1.15

Item {
    id: messagesPage

    // Function Messages Scroll To End
    function scrollToEnd(){
        messagesFlickable.contentY = messagesFlickable.contentHeight
    }

    // Custom Messages
    property string message_1: "WARNING:
This project was made using the Qt Creator (Community Version),
so commercial use of this project is not allowed!
If you want to use it commercially, purchase a license from
Qt Company: https://www.qt.io/pricing
The purpose of this project is only for studies of Qt Creator
and PySide2, the incorrect use of this project may result in
judicial penalties with the Qt Company and Discord."
    property string message_2: "Press the \"Enter\" key for a new message and the \"Return\" key to continue the conversation."

    // Send Messages
    Timer { running: true; interval: 500;
        onTriggered: sendMessage(message_1, "Discord Official", "../../../images/images/user_1.png", true)
    }
    Timer { running: true; interval: 1500;
        onTriggered: sendMessage(message_2, "Wanderson", "../../../images/images/me.png", true)
    }
    Timer { running: true; interval: 2000;
        onTriggered: sendMessage("Type something...", "Wanderson", "../../../images/images/me.png", false)
    }

    // Create New Message
    function sendMessage(message, userName, url, isNewMessage){
        if(message){
            var component = Qt.createComponent("messageItem.qml")
            var msg = component.createObject(messagesColumn, {
                "messageText" : message,
                "timeText" : FunctionJS.msgTime(),
                "userNameText" : userName,
                "userImage" : url,
                "newMessage" : isNewMessage
            })
            scrollToEnd()
        }
    }

    Flickable {
        id: messagesFlickable
        anchors.fill: messagesPage
        anchors.rightMargin: 4
        anchors.bottomMargin: 70
        contentHeight: messagesColumn.height

        function changeIcon(path){
            myRightUser.statusIcon = path
        }

        Column {
            id: messagesColumn
            bottomPadding: 30
            topPadding: 10
            spacing: 3
        }

        ScrollBar.vertical: ScrollBar {
            id: controlScroll
            orientation: Qt.Vertical
            y: 3
            bottomPadding: 0
            topPadding: 0
            leftPadding: 0
            rightPadding: 0
            contentItem: Rectangle {
                implicitWidth: 8
                implicitHeight: 100
                radius: width / 2
                color: "#202225"
            }
            background: Rectangle{
                radius: width / 2
                color: "#32353b"
                border.width: 0
            }
        }
    }

    // Write Bar
    Rectangle{
        id: writeBar
        height: 62
        color: "#36393f"
        anchors.left: messagesPage.left
        anchors.right: messagesPage.right
        anchors.bottom: messagesPage.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0

        // Text Box
        Rectangle{
            id: rectangle
            height: 44
            color: "#40444b"
            anchors.left: writeBar.left
            anchors.right: writeBar.right
            anchors.bottom: writeBar.bottom
            anchors.rightMargin: 15
            anchors.leftMargin: 15
            anchors.bottomMargin: 25
            radius: 10

            RowLayout{
                anchors.fill: rectangle
                spacing: 2

                IconButton{
                    iconColor: "#b9bbbe"
                    Layout.minimumHeight: 42
                    Layout.leftMargin: 10
                    Layout.minimumWidth: 42
                    iconWidth: 22
                    iconHeight: 22
                    iconPath: "../../../images/svg_icons/icon_create_channel.svg"
                    CenteredTooltip { text: "Send Files" }

                }

                TextFieldMessages{
                    id: textMessages
                    Layout.fillWidth: true
                    Keys.onReturnPressed: {
                        sendMessage(text, "Wanderson", "../../../images/images/me.png", true)
                        text = ""
                    }
                    Keys.onEnterPressed: {
                        sendMessage(text, "Wanderson", "../../../images/images/me.png", false)
                        text = ""
                    }
                    Component.onCompleted: textMessages.forceActiveFocus()
                }

                IconButton{
                    iconColor: "#b9bbbe"
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.minimumHeight: 40
                    Layout.minimumWidth: 40
                    iconWidth: 24
                    iconHeight: 24
                    iconPath: "../../../images/svg_icons/icon_gift.svg"
                    CenteredTooltip { text: "Gifts" }
                }

                IconButton{
                    iconColor: "#b9bbbe"
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.minimumHeight: 40
                    Layout.minimumWidth: 40
                    iconWidth: 26
                    iconHeight: 26
                    iconPath: "../../../images/svg_icons/icon_gif.svg"
                    CenteredTooltip { text: "GIF" }
                }

                IconButton{
                    iconColor: "#b9bbbe"
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.minimumHeight: 40
                    Layout.minimumWidth: 40
                    iconWidth: 24
                    iconHeight: 24
                    iconPath: "../../../images/svg_icons/icon_sticker.svg"
                    CenteredTooltip { text: "Stickers" }
                }

                IconButton{
                    iconColorEntered: "#ffcd03"
                    iconColor: "#b9bbbe"
                    Layout.rightMargin: 5
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.minimumHeight: 40
                    Layout.minimumWidth: 40
                    iconWidth: 22
                    iconHeight: 24
                    iconPath: "../../../images/svg_icons/icon_emoji.svg"
                    CenteredTooltip { text: "Emoji" }
                }
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
