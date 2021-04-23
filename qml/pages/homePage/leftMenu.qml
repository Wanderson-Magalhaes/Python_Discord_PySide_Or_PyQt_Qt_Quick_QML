import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../components"
import "../../js/FunctionsJS.js" as FunctionJS
import QtQuick.Layouts 1.15

Flickable {
    id: flickable
    flickableDirection: Flickable.VerticalFlick
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    contentHeight: left_inside_column.height

    clip: true

    Column {
        id: left_inside_column
        spacing: 1

        // Separator
        Item { width: 240; height: 20; Layout.alignment: Qt.AlignLeft | Qt.AlignTop }

        // Channel Rules
        Item {
            id: item
            width: 240
            height: 32
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            LeftMenuChannel{
                id: leftMenu_1
                anchors.verticalCenter: item.verticalCenter
                iconPath: "../../../images/svg_icons/icon_rules.svg"
                btnText: "rules"
                onClicked: console.log("channel pressed")
                hoverEnabled: true
                onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                MouseArea{
                    anchors.fill: leftMenu_1
                    cursorShape: Qt.PointingHandCursor
                    onPressed: mouse.accepted = false
                }

                Row{
                    anchors.verticalCenter: leftMenu_1.verticalCenter
                    anchors.right: leftMenu_1.right
                    anchors.rightMargin: 15
                    visible: false

                    IconButton{
                        iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                        iconColor: "#b9bbbe"
                        onClicked: console.log("Create Invite")
                        hoverEnabled: true
                        CenteredTooltip{ text: "Create Invite"; }
                    }

                    IconButton{
                        iconPath: "../../../images/svg_icons/icon_settings.svg"
                        iconColor: "#b9bbbe"
                        onClicked: console.log("Edit Channel")
                        CenteredTooltip{ text: "Edit Channel"; }
                    }
                }
            }
        }

        // Channel Moderator
        Item {
            id: channel_moderator
            width: 240
            height: 32
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            LeftMenuChannel{
                id: leftMenuModerator
                anchors.verticalCenter: channel_moderator.verticalCenter
                iconPath: "../../../images/svg_icons/icon_channel_lock.svg"
                btnText: "moderator-only"
                onClicked: console.log("channel pressed")
                hoverEnabled: true
                onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                MouseArea{
                    anchors.fill: leftMenuModerator
                    cursorShape: Qt.PointingHandCursor
                    onPressed: mouse.accepted = false
                }

                Row{
                    anchors.verticalCenter: leftMenuModerator.verticalCenter
                    anchors.right: leftMenuModerator.right
                    anchors.rightMargin: 15
                    visible: false

                    IconButton{
                        iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                        iconColor: "#b9bbbe"
                        onClicked: console.log("Create Invite")
                        hoverEnabled: true
                        CenteredTooltip{ text: "Create Invite"; }
                    }

                    IconButton{
                        iconPath: "../../../images/svg_icons/icon_settings.svg"
                        iconColor: "#b9bbbe"
                        onClicked: console.log("Edit Channel")
                        CenteredTooltip{ text: "Edit Channel"; }
                    }
                }
            }
        }

        // Separator
        Item { width: 240; height: 20; Layout.alignment: Qt.AlignLeft | Qt.AlignTop }

        // Text Channels
        AccordionMenu{
            id: textChannels
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            totalSubMenus: FunctionJS.count(this.children[2])

            // Icon Plus
            IconButton{
                iconWidth: 12
                iconHeight: 12
                anchors.right: textChannels.right
                anchors.top: textChannels.top
                iconPath: "../../../images/svg_icons/plus_icon.svg"
                anchors.rightMargin: 15
                anchors.topMargin: 5
                iconColor: "#b9bbbe"
                onClicked: console.log("Create Channel")
                CenteredTooltip{ text: "Create Channel"; }
            }

            // Column Sub-Menus
            Column{
                id: columnTextChannels
                anchors.top: textChannels.top
                spacing: 2
                anchors.topMargin: 32

                // Channel Chat
                Item {
                    id: item_chat
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_2
                        anchors.verticalCenter: item_chat.verticalCenter
                        activedMenu: true
                        iconPath: "../../../images/svg_icons/icon_channel.svg"
                        btnText: "chat"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_2
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_2.verticalCenter
                            anchors.right: leftMenu_2.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }

                // Channel Python
                Item {
                    id: item_2
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_3
                        anchors.verticalCenter: item_2.verticalCenter
                        iconPath: "../../../images/svg_icons/icon_channel.svg"
                        btnText: "python"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_3
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_3.verticalCenter
                            anchors.right: leftMenu_3.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }
                // Channel Qt Quick
                Item {
                    id: item_3
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_4
                        anchors.verticalCenter: item_3.verticalCenter
                        iconPath: "../../../images/svg_icons/icon_channel_lock.svg"
                        btnText: "members"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_4
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_4.verticalCenter
                            anchors.right: leftMenu_4.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }
            }
        }

        // Separator
        Item { width: 240; height: 20; Layout.alignment: Qt.AlignLeft | Qt.AlignTop }

        // Text Channels
        AccordionMenu{
            id: textChannels_2
            textMenu: "MODERN GUI"
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            totalSubMenus: FunctionJS.count(this.children[2])

            // Icon Plus
            IconButton{
                iconWidth: 12
                iconHeight: 12
                anchors.right: textChannels_2.right
                anchors.top: textChannels_2.top
                iconPath: "../../../images/svg_icons/plus_icon.svg"
                anchors.rightMargin: 15
                anchors.topMargin: 5
                iconColor: "#b9bbbe"
                onClicked: console.log("Create Channel")
                CenteredTooltip{ text: "Create Channel"; }
            }

            // Column Sub-Menus
            Column{
                id: columnTextChannels_2
                anchors.top: textChannels_2.top
                spacing: 2
                anchors.topMargin: 32

                // Channel Chat
                Item {
                    id: item_4
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_5
                        anchors.verticalCenter: item_4.verticalCenter
                        iconPath: "../../../images/svg_icons/icon_channel.svg"
                        btnText: "qt-quick"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_5
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_5.verticalCenter
                            anchors.right: leftMenu_5.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }

                // Channel Python
                Item {
                    id: item_5
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_6
                        anchors.verticalCenter: item_5.verticalCenter
                        iconPath: "../../../images/svg_icons/icon_channel.svg"
                        btnText: ".net-maui"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_6
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_6.verticalCenter
                            anchors.right: leftMenu_6.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }
                // Channel Qt Quick
                Item {
                    id: item_6
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_7
                        anchors.verticalCenter: item_6.verticalCenter
                        iconPath: "../../../images/svg_icons/icon_channel_lock.svg"
                        btnText: "flutter"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_7
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_7.verticalCenter
                            anchors.right: leftMenu_7.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }
            }
        }

        // Separator
        Item { width: 240; height: 20; Layout.alignment: Qt.AlignLeft | Qt.AlignTop }

        // Voice Channels
        AccordionMenu{
            id: voiceChannels
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            textMenu: "VOICE CHANNELS"
            totalSubMenus: FunctionJS.count(this.children[2])

            // Icon Plus
            IconButton{
                iconWidth: 12
                iconHeight: 12
                width: 20
                height: 20
                anchors.right: voiceChannels.right
                anchors.top: voiceChannels.top
                iconPath: "../../../images/svg_icons/plus_icon.svg"
                anchors.rightMargin: 15
                anchors.topMargin: 5
                iconColor: "#b9bbbe"
                onClicked: console.log("Create Channel")
                CenteredTooltip{ text: "Create Channel"; }
            }

            // Column Sub-Menus
            Column{
                id: columnVoiceChannels
                anchors.top: voiceChannels.top
                spacing: 2
                anchors.topMargin: 32

                // Channel Chat 1
                Item {
                    id: item_7
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_8
                        anchors.verticalCenter: item_7.verticalCenter
                        isVoiceChat: true
                        iconPath: "../../../images/svg_icons/icon_voice_channel.svg"
                        btnText: "voice-chat-1"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_8
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_8.verticalCenter
                            anchors.right: leftMenu_8.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }

                // Channel Chat 2
                Item {
                    id: item_8
                    width: 240
                    height: 32

                    LeftMenuChannel{
                        id: leftMenu_9
                        anchors.verticalCenter: item_8.verticalCenter
                        isVoiceChat: true
                        iconPath: "../../../images/svg_icons/icon_voice_channel.svg"
                        btnText: "voice-chat-2"
                        onClicked: console.log("channel pressed")
                        hoverEnabled: true
                        totalOnline: "00"
                        onHoveredChanged: this.hovered ? this.children[2].visible = true : this.children[2].visible = false

                        MouseArea{
                            anchors.fill: leftMenu_9
                            cursorShape: Qt.PointingHandCursor
                            onPressed: mouse.accepted = false
                        }

                        Row{
                            anchors.verticalCenter: leftMenu_9.verticalCenter
                            anchors.right: leftMenu_9.right
                            anchors.rightMargin: 15
                            visible: false

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_user_plus.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Create Invite")
                                hoverEnabled: true
                                CenteredTooltip{ text: "Create Invite"; }
                            }

                            IconButton{
                                iconPath: "../../../images/svg_icons/icon_settings.svg"
                                iconColor: "#b9bbbe"
                                onClicked: console.log("Edit Channel")
                                CenteredTooltip{ text: "Edit Channel"; }
                            }
                        }
                    }
                }
            }
        }

        // Separator
        Item { width: 240; height: 20; Layout.alignment: Qt.AlignLeft | Qt.AlignTop }
    }
    ScrollBar.vertical: ScrollBar {
        id: control
        size: 0.3
        position: 0.2
        orientation: Qt.Vertical
        visible: flickable.moving

        contentItem: Rectangle {
            implicitWidth: 4
            implicitHeight: 100
            radius: width / 2
            color: control.pressed ? "#7289da" : "#202225"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
