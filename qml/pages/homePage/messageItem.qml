import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../../components"

Row {
    id: row
    spacing: 0

    // Message Properties
    property string messageText: "N/A"
    property string timeText: "N/A"
    property string userNameText: "N/A"
    property url userImage: "../../../images/images/me.png"
    property bool newMessage: true

    // Width
    width: parent.parent.width

    Rectangle{
        id: bg
        width: row.width - 12
        height: column.height
        color: "#00000000"
        anchors.top: row.top
        anchors.topMargin: 3

        Row{
            id: column
            width: bg.width

            MouseArea{
                id: mouseArea
                width: bg.width
                height: rowContent.height
                hoverEnabled: true
                onEntered: {
                    extraButtons.visible = true
                    newMessage ? textTime_1.visible = false : textTime_1.visible = true
                    bg.color = "#32353b"
                }
                onExited: {
                    extraButtons.visible = false
                    newMessage ? textTime_1.visible = false : textTime_1.visible = false
                    bg.color = "#00000000"
                }

                RowLayout{
                    id: rowContent
                    width: bg.width
                    spacing: 0

                    Item{
                        id: itemUserImage
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                        Layout.minimumHeight: newMessage ? 48 : 20
                        Layout.minimumWidth: 74
                        Layout.maximumHeight: 48
                        Layout.maximumWidth: 74

                        TextEdit {
                            id: textTime_1
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignTop
                            color: "#7e7e7e"
                            text: timeText
                            anchors.left: itemUserImage.left
                            anchors.right: itemUserImage.right
                            anchors.top: itemUserImage.top
                            wrapMode: Text.Wrap
                            anchors.topMargin: 0
                            anchors.rightMargin: 0
                            anchors.leftMargin: 0
                            topPadding: 6
                            font.pointSize: 8
                            font.family: "Segoe UI"
                            selectByMouse: true
                            selectByKeyboard: true
                            selectedTextColor: "#ffffff"
                            selectionColor: "#4568e2"
                            visible: false
                            activeFocusOnPress: false
                        }

                        // Set Image BTN
                        Rectangle{
                            id: iconBox
                            width: 40
                            height: 40
                            radius: 20
                            clip: false
                            anchors.verticalCenter: itemUserImage.verticalCenter
                            anchors.left: itemUserImage.left
                            anchors.leftMargin: 16
                            color: "#292b2f"
                            visible: newMessage ? true : false

                            Image {
                                id: image
                                anchors.verticalCenter: iconBox.verticalCenter
                                source: userImage
                                anchors.horizontalCenter: iconBox.horizontalCenter
                                fillMode: Image.PreserveAspectFit
                                sourceSize.height: 40
                                sourceSize.width: 40
                                width: 40
                                height: 40

                                // Enable Layer
                                layer.enabled: true
                                layer.effect: OpacityMask{
                                    maskSource: iconBox
                                }
                            }
                        }

                    }

                    Column{
                        id: column_top
                        clip: true
                        Layout.fillWidth: true
                        Item{
                            id: itemUserBox
                            height: 20
                            width: column_top.width
                            visible: newMessage ? true : false

                            Text{
                                id: textInside
                                height: 20
                                text: userNameText
                                anchors.left: itemUserBox.left
                                anchors.top: itemUserBox.top
                                rightPadding: 10
                                anchors.leftMargin: 0
                                anchors.topMargin: 0
                                font.pointSize: 12
                                font.family: "Segoe UI"
                                font.weight: Font.Medium
                                color: "#ffffff"

                                MouseArea{
                                    anchors.fill: textInside
                                    cursorShape: Qt.PointingHandCursor
                                    hoverEnabled: true
                                    onEntered: textInside.font.underline = true
                                    onExited: textInside.font.underline = false
                                    onPressed: console.log("User name: " + textInside.text)
                                }
                            }


                            TextEdit {
                                id: textTime_2
                                color: "#7e7e7e"
                                text: "Todat at " + timeText
                                anchors.verticalCenter: itemUserBox.verticalCenter
                                anchors.left: textInside.right
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                                anchors.verticalCenterOffset: 2
                                anchors.leftMargin: 0
                                Layout.leftMargin: -5
                                Layout.topMargin: 5
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                                font.pointSize: 8
                                font.family: "Segoe UI"
                                selectByMouse: true
                                selectByKeyboard: true
                                selectedTextColor: "#ffffff"
                                selectionColor: "#4568e2"
                                activeFocusOnPress: false
                            }
                        }

                        TextEdit {
                            width: column_top.width - 120
                            color: "#cccccc"
                            text: messageText
                            wrapMode: Text.Wrap
                            bottomPadding: 3
                            topPadding: 2
                            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                            Layout.fillWidth: true
                            font.pointSize: 11
                            font.family: "Segoe UI"
                            selectByMouse: true
                            selectByKeyboard: true
                            selectedTextColor: "#ffffff"
                            selectionColor: "#4568e2"
                            activeFocusOnPress: false
                        }
                    }
                }

                Rectangle{
                    id: extraButtons
                    width: 90
                    height: 30
                    color: "#36393f"
                    radius: 5
                    border.color: "#2c3136"
                    anchors.right: mouseArea.right
                    anchors.top: mouseArea.top
                    anchors.topMargin: -2
                    anchors.rightMargin: 15
                    visible: false

                    Row{
                        padding: 1
                        IconButtonBg{
                            width: 29
                            height: 28
                            backgroundColor: "#3a3e44"
                            iconWidth: 18
                            iconHeight: 18
                            iconPath: "../../../images/svg_icons/icon_emoji_plus.svg"
                        }
                        IconButtonBg{
                            id: iconButtonBg
                            width: 29
                            height: 28
                            backgroundColor: "#3a3e44"
                            iconPath: "../../../images/svg_icons/icon_edit.svg"
                            iconWidth: 18
                            iconHeight: 18
                        }
                        IconButtonBg{
                            width: 29
                            height: 28
                            backgroundColor: "#3a3e44"
                            iconPath: "../../../images/svg_icons/icon_show_more.svg"
                            iconWidth: 18
                            iconHeight: 18
                        }
                    }
                }
            }
        }
    }

    Item {
        width: 12
    }
}






/*##^##
Designer {
    D{i:0;formeditorColor:"#000000";height:48;width:300}
}
##^##*/
