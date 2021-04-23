import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "components"
import QtQuick.Layouts 1.15

Window {
    id: mainWindow
    width: 1440
    height: 880
    minimumWidth: 980
    minimumHeight: 550
    visible: true
    color: "#00000000"
    title: qsTr("Discord - Python Version")

    // REMOVE TITLE BAR
    flags: Qt.Window | Qt.FramelessWindowHint

    // PROPERTIES
    property int windowStatus: 0
    property int windowMargin: 10

    // Home Page Content
    property alias homePage: loader_HomePage.item

    // INTERNAL FUNCTIONS
    QtObject{
        id: internal

        // Close Left Top Menu Popup
        function closeLeftPopup(){
            topTitleMenusExited.running = true
            console.log("Closed Popup")
            leftPopupMenu.activeMenu = true
            leftPopupMenu.rotateNormal()
            topTitleMenus.visible = false
        }

        // Show Overlay
        function showOverlay(){
            colorOverlayApp.visible = true
            showOverlayAnimation.running = true
        }
        function closeOverlay(){
            hideOverlayAnimation.running = true
        }

        // Maximize Restore
        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                btnMaximizeRestore.btnIcon = "../images/svg_icons/restore_icon.svg"
            }
            else{
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                btnMaximizeRestore.btnIcon = "../images/svg_icons/maximize_icon.svg"
            }
        }

        // If Maximized Restore
        function ifMaximizedRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                btnMaximizeRestore.btnIcon = "../images/svg_icons/maximize_icon.svg"
            }
        }

        // Restore Margins
        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            btnMaximizeRestore.btnIcon = "../images/svg_icons/maximize_icon.svg"
        }
    }

    Rectangle{
        id: bgApp
        color: "#36393f"
        anchors.fill: parent
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1

        Rectangle {
            id: left_menu_col
            width: 70
            color: "#202225"
            anchors.left: bgApp.left
            anchors.top: bgApp.top
            anchors.bottom: bgApp.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0

            Column {
                id: columnLeftMenu
                anchors.fill: left_menu_col
                spacing: 8
                anchors.topMargin: 22

                LeftMenu{
                    showNotifications: true
                    iconColor: "#dcddde"
                    iconWidth: 38
                    iconHeight: 38
                    bgColorEntered: "#7289da"
                    useImage: false
                    LeftMenuTooltip{
                        text: "Main - Discord"
                    }
                }

                // DIV Menus
                Rectangle{
                    id: rectangle2
                    width: 70
                    height: 2
                    color: "#00000000"

                    Rectangle{
                        width: 30
                        height: 2
                        color: "#2f3136"
                        anchors.horizontalCenter: rectangle2.horizontalCenter
                    }
                }

                LeftMenu{
                    activeMenu: true
                    useImage: true
                    LeftMenuTooltip{
                        text: "Wanderson - Modern GUI"
                    }
                }

                LeftMenu{
                    iconWidth: 18
                    iconHeight: 18
                    iconPath: "../images/svg_icons/plus_icon.svg"
                    useImage: false
                    LeftMenuTooltip{
                        text: "Add a Server"
                    }
                }

                LeftMenu{
                    iconWidth: 20
                    iconHeight: 20
                    iconPath: "../images/svg_icons/bussola_icon.svg"
                    useImage: false
                    LeftMenuTooltip{
                        text: "Explore Public Servers"
                    }
                }
            }
        }

        Rectangle {
            id: top_bar_app
            height: 22
            color: "#202225"
            anchors.left: left_menu_col.right
            anchors.right: bgApp.right
            anchors.top: bgApp.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            DragHandler{
                onActiveChanged: if(active){
                                     mainWindow.startSystemMove()
                                     internal.ifMaximizedRestore()
                                 }
            }

            Rectangle {
                id: rectangle1
                height: 22
                color: "#00000000"
                anchors.left: top_bar_app.left
                anchors.right: top_bar_app.right
                anchors.top: top_bar_app.top
                anchors.topMargin: 0
                anchors.rightMargin: 90
                anchors.leftMargin: 0

                MouseArea{
                    anchors.fill: rectangle1
                    onDoubleClicked: {
                        internal.maximizeRestore()
                    }
                }
            }
        }

        Rectangle {
            id: top_bar_title_and_channel
            height: 48
            color: "#36393f"
            border.color: "#202225"
            anchors.left: left_menu_col.right
            anchors.right: bgApp.right
            anchors.top: top_bar_app.bottom
            clip: true
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0

            Rectangle {
                id: top_bar_infos
                x: 0
                color: "#36393f"
                anchors.left: top_bar_title_and_channel.left
                anchors.right: top_bar_title_and_channel.right
                anchors.top: top_bar_title_and_channel.top
                anchors.bottom: top_bar_title_and_channel.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 1
                anchors.topMargin: 0

                Rectangle {
                    id: top_bar_left
                    width: 240
                    color: "#202225"
                    anchors.left: top_bar_infos.left
                    anchors.top: top_bar_infos.top
                    anchors.bottom: top_bar_infos.bottom
                    clip: true
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0

                    Rectangle {
                        id: left_top_btn
                        color: "#2f3136"
                        radius: 10
                        anchors.fill: top_bar_left
                        anchors.bottomMargin: -10
                        anchors.rightMargin: -10

                        Rectangle {
                            id: left_top_btn_mask
                            anchors.fill: left_top_btn
                            color: "#00000000"

                            // Enable Layer
                            layer.enabled: true
                            layer.effect: OpacityMask{
                                maskSource: left_top_btn_mask
                            }

                            LeftTopButton{
                                id: leftPopupMenu
                                MouseArea{
                                    anchors.fill: leftPopupMenu
                                    cursorShape: Qt.PointingHandCursor
                                    propagateComposedEvents: true
                                    onClicked: {
                                        mouse.accepted = false
                                        if(!leftPopupMenu.activeMenu){
                                            topTitleMenus.visible = true
                                            topTitleMenusClicked.running = true
                                            leftPopupMenu.activeMenu = false
                                        }else{
                                            topTitleMenusExited.running = true
                                            leftPopupMenu.activeMenu = true
                                            topTitleMenus.visible = false
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                // Icon
                RowLayout {
                    anchors.left: top_bar_left.right
                    anchors.right: top_bar_infos.right
                    anchors.top: top_bar_infos.top
                    anchors.bottom: top_bar_infos.bottom
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    anchors.leftMargin: 20
                    anchors.rightMargin: 0

                    Rectangle{
                        id: topIconBox
                        color: "#00000000"
                        Layout.maximumWidth: 22
                        Layout.preferredHeight: 22
                        Layout.preferredWidth: 22

                        Image {
                            id: topIcon
                            width: topIconBox.width
                            height: topIconBox.height
                            source: "../images/svg_icons/icon_channel.svg"
                            sourceSize.height: topIconBox.height
                            sourceSize.width: topIconBox.width
                            fillMode: Image.PreserveAspectFit
                            visible: false
                        }

                        ColorOverlay{
                            anchors.fill: topIcon
                            source: topIcon
                            color: "#72767d"
                            antialiasing: true
                        }
                    }

                    // Channel Name
                    Text {
                        id: textBtn
                        color: "#e2e3e3"
                        text: "chat"
                        leftPadding: 5
                        rightPadding: 10
                        font.bold: true
                        font.pointSize: 12
                        font.family: "Segoe UI"
                    }

                    // DIV
                    Rectangle{
                        id: divTitle
                        width: 1
                        height: 30
                        color: "#42454a"
                    }

                    // Channel Name
                    Text {
                        id: channelInfo
                        height: 22
                        color: "#85898f"
                        text: "Chat about programming topics in general"
                        leftPadding: 10
                        font.weight: Font.Medium
                        Layout.fillWidth: true
                        font.pointSize: 10
                        font.family: "Segoe UI"

                        MouseArea{
                            anchors.fill: channelInfo
                            cursorShape: Qt.PointingHandCursor
                            onPressed: {
                                internal.showOverlay()
                                console.log("Channel Description")
                            }
                        }
                    }

                    IconButton{
                        width: 24
                        height: 24
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Layout.rightMargin: 7
                        Layout.leftMargin: 7
                        iconColor: "#b9bbbe"
                        iconWidth: 22
                        iconHeight: 22
                        iconPath: "../images/svg_icons/icon_notification_settings.svg"
                        CenteredTooltip{ text: "Mute a channel"; inverted: true }
                    }

                    IconButton{
                        width: 24
                        height: 24
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Layout.rightMargin: 7
                        Layout.leftMargin: 7
                        iconColor: "#b9bbbe"
                        iconWidth: 22
                        iconHeight: 22
                        iconPath: "../images/svg_icons/icon_pin.svg"
                        CenteredTooltip{ text: "Pinned Messages"; inverted: true }
                    }

                    IconButton{
                        id: showHideMemberList
                        width: 24
                        height: 24
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Layout.rightMargin: 7
                        Layout.leftMargin: 7
                        iconColor: "#ffffff"
                        iconWidth: 22
                        iconHeight: 22
                        iconPath: "../images/svg_icons/icon_users.svg"
                        CenteredTooltip{ text: "Member List"; inverted: true }
                        onPressed: {
                            if(homePage.showMemberList){
                                homePage.showMemberList = false
                                showHideMemberList.iconColor = "#b9bbbe"
                                console.log("Hide Member List")
                            } else {
                                homePage.showMemberList = true
                                showHideMemberList.iconColor = "#ffffff"
                                console.log("Show Member List")
                            }
                        }
                    }

                    SearchTextField{
                        width: 145
                        bottomPadding: 1
                        topPadding: 0
                        Layout.leftMargin: 7
                        colorMouseOver: "#202225"
                        colorDefault: "#202225"
                        Layout.fillWidth: false
                        transformOrigin: Item.Right
                        Layout.rightMargin: 7
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                    }

                    IconButton{
                        width: 24
                        height: 24
                        iconColor: "#b9bbbe"
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Layout.rightMargin: 7
                        Layout.leftMargin: 7
                        iconWidth: 22
                        iconHeight: 22
                        iconPath: "../images/svg_icons/icon_inbox.svg"
                        CenteredTooltip{ text: "Inbox"; inverted: true }
                    }

                    IconButton{
                        width: 24
                        height: 24
                        iconColor: "#b9bbbe"
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Layout.rightMargin: 16
                        Layout.leftMargin: 7
                        iconWidth: 22
                        iconHeight: 22
                        iconPath: "../images/svg_icons/icon_help.svg"
                        CenteredTooltip{ text: "Help"; inverted: true }
                    }
                }
            }
        }

        Rectangle {
            id: content_area
            color: "#00000000"
            anchors.left: left_menu_col.right
            anchors.right: bgApp.right
            anchors.top: top_bar_title_and_channel.bottom
            anchors.bottom: bgApp.bottom
            clip: true
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            // LOADER APP PAGES
            Loader{
                id: loader_HomePage
                anchors.fill: content_area
                source: Qt.resolvedUrl("pages/homePage.qml")
            }
        }

        Rectangle {
            id: topTitleMenus
            width: 220
            height: 375
            color: "#18191c"
            radius: 5
            anchors.left: left_menu_col.right
            anchors.top: top_bar_title_and_channel.bottom
            clip: true
            scale: 0
            visible: false
            transformOrigin: Item.Top
            anchors.leftMargin: 10
            anchors.topMargin: 7
            z: 40

            Column{
                id: columTopTitles
                anchors.fill: topTitleMenus
                anchors.margins: 8
                spacing: 3

                TopButtonLeftBox{
                    text: "Server Boost"
                    iconPath: "../images/svg_icons/icon_server_boost.svg"
                    onPressed: internal.closeLeftPopup()
                    iconColor: "#ff73fa"
                }

                // DIV
                Rectangle{ width: columTopTitles.width; height: 1; color: "#262729" }

                TopButtonLeftBox{
                    text: "Invite Peopple"
                    iconColor: "#677bc4"
                    textColor: "#677bc4"
                    iconPath: "../images/svg_icons/icon_user_plus.svg"
                    onPressed: internal.closeLeftPopup()
                }

                TopButtonLeftBox{
                    text: "Server Settings"
                    iconPath: "../images/svg_icons/icon_settings.svg"
                    onPressed: internal.closeLeftPopup()
                }

                TopButtonLeftBox{
                    text: "Server Insights"
                    iconWidth: 18
                    iconHeight: 18
                    iconPath: "../images/svg_icons/icon_server_insights.svg"
                    onPressed: internal.closeLeftPopup()
                }

                TopButtonLeftBox{
                    text: "Create Channel"
                    iconWidth: 18
                    iconHeight: 18
                    iconPath: "../images/svg_icons/icon_create_channel.svg"
                    onPressed: internal.closeLeftPopup()
                }

                TopButtonLeftBox{
                    text: "Create Category"
                    iconWidth: 18
                    iconHeight: 18
                    iconPath: "../images/svg_icons/icon_create_category.svg"
                    onPressed: internal.closeLeftPopup()
                }

                // DIV
                Rectangle{ width: columTopTitles.width; height: 1; color: "#262729" }

                TopButtonLeftBox{
                    text: "Notification Settings"
                    iconWidth: 18
                    iconHeight: 18
                    iconPath: "../images/svg_icons/icon_notification_settings.svg"
                    onPressed: internal.closeLeftPopup()
                }

                TopButtonLeftBox{
                    text: "Privacy Settings"
                    iconWidth: 18
                    iconHeight: 18
                    iconPath: "../images/svg_icons/icon_privacy.svg"
                    onPressed: internal.closeLeftPopup()
                }

                // DIV
                Rectangle{ width: columTopTitles.width; height: 1; color: "#262729" }

                TopButtonLeftBox{
                    text: "Change Nickname"
                    iconWidth: 18
                    iconHeight: 18
                    iconPath: "../images/svg_icons/icon_edit.svg"
                    onPressed: internal.closeLeftPopup()
                }

                TopButtonLeftBox{
                    text: "Hide Muted Channels"
                    iconWidth: 16
                    iconHeight: 16
                    iconPath: "../images/svg_icons/icon_hide_channel.svg"
                    onPressed: internal.closeLeftPopup()
                }
            }
        }

        Rectangle {
            id: colorOverlayApp
            opacity: 0
            visible: false
            color: "#000000"
            anchors.fill: bgApp
            z: 50

            MouseArea {
                anchors.fill: colorOverlayApp
                anchors.topMargin: 22
                onPressed: internal.closeOverlay()
            }
        }

        Rectangle {
            id: overlayMessage
            width: 490
            height: 200
            color: "#36393f"
            radius: 6
            anchors.verticalCenter: colorOverlayApp.verticalCenter
            anchors.horizontalCenter: colorOverlayApp.horizontalCenter
            scale: 0
            z: 55

            // Tittle
            Text {
                id: overlayTitle
                color: "#e2e3e3"
                text: "#CHAT"
                anchors.left: overlayMessage.left
                anchors.top: overlayMessage.top
                anchors.leftMargin: 10
                anchors.topMargin: 20
                leftPadding: 5
                rightPadding: 10
                font.bold: true
                font.pointSize: 12
                font.family: "Segoe UI"
            }

            IconButton{
                width: 25
                height: 25
                anchors.right: overlayMessage.right
                anchors.top: overlayMessage.top
                iconWidth: 20
                iconHeight: 20
                anchors.topMargin: 15
                anchors.rightMargin: 15
                onPressed: {
                    hideOverlayAnimation.running = true
                }
            }

            Text {
                id: overlayTitle1
                color: "#e2e3e3"
                text: "Chat about programming topics in general"
                anchors.left: overlayMessage.left
                anchors.right: overlayMessage.right
                anchors.top: overlayMessage.top
                anchors.bottom: overlayMessage.bottom
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 60
                font.bold: false
                anchors.leftMargin: 10
                font.family: "Segoe UI"
                leftPadding: 5
                font.pointSize: 11
                rightPadding: 10
            }
        }

        Image {
            id: topLogo
            anchors.left: bgApp.left
            anchors.top: bgApp.top
            source: "../images/images/top_logo_70x22.png"
            anchors.topMargin: 0
            anchors.leftMargin: 0
            z: 100
            sourceSize.height: 22
            sourceSize.width: 70
        }

        Rectangle {
            id: btnTopContent
            width: 90
            height: 22
            color: "#00000000"
            anchors.right: bgApp.right
            anchors.top: bgApp.top
            z: 100
            anchors.topMargin: 0
            anchors.rightMargin: 0

            Row{
                anchors.fill: btnTopContent
                z: 100

                TopBarButton{
                    id: btnMinimize
                    colorMouseDown: "#2f3136"
                    btnIcon: "../images/svg_icons/minimize_icon.svg"
                    onClicked: {
                        mainWindow.showMinimized()
                        internal.restoreMargins()
                    }
                }

                TopBarButton{
                    id: btnMaximizeRestore
                    colorMouseDown: "#2f3136"
                    btnIcon: "../images/svg_icons/maximize_icon.svg"
                    onClicked: {
                        internal.maximizeRestore()
                    }
                }

                TopBarButton{
                    id: btnClose
                    opacityIcon: 0.8
                    colorMouseDown: "#ab0000"
                    colorMouseOver: "#f04747"
                    btnIcon: "../images/svg_icons/close_icon.svg"
                    onClicked: mainWindow.close()
                }

            }
        }
    }

    MouseArea {
        id: leftResize
        width: 5
        anchors.left: bgApp.left
        anchors.top: bgApp.top
        anchors.bottom: bgApp.bottom
        anchors.leftMargin: -5
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge) }
        }
    }

    MouseArea {
        id: rightResize
        width: 5
        anchors.right: bgApp.right
        anchors.top: bgApp.top
        anchors.bottom: bgApp.bottom
        anchors.rightMargin: -5
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge) }
        }
    }

    MouseArea {
        id: topResize
        height: 5
        anchors.left: bgApp.left
        anchors.right: bgApp.right
        anchors.top: bgApp.top
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: -5
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.TopEdge) }
        }
    }

    MouseArea {
        id: bottomResize
        height: 5
        anchors.left: bgApp.left
        anchors.right: bgApp.right
        anchors.bottom: bgApp.bottom
        anchors.bottomMargin: -5
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.BottomEdge) }
        }
    }

    MouseArea {
        id: topLeftResize
        width: 10
        height: 10
        anchors.left: bgApp.left
        anchors.top: bgApp.top
        anchors.leftMargin: -10
        anchors.topMargin: -10
        cursorShape: Qt.SizeFDiagCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge | Qt.TopEdge) }
        }
    }

    MouseArea {
        id: topRightResize
        width: 10
        height: 10
        anchors.right: bgApp.right
        anchors.top: bgApp.top
        anchors.rightMargin: -10
        anchors.topMargin: -10
        cursorShape: Qt.SizeBDiagCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge | Qt.TopEdge) }
        }
    }

    MouseArea {
        id: bottomLeftResize
        width: 10
        height: 10
        anchors.left: bgApp.left
        anchors.bottom: bgApp.bottom
        anchors.leftMargin: -10
        anchors.bottomMargin: -10
        cursorShape: Qt.SizeBDiagCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge | Qt.BottomEdge) }
        }
    }

    MouseArea {
        id: bottomRightResize
        width: 10
        height: 10
        anchors.right: bgApp.right
        anchors.bottom: bgApp.bottom
        anchors.bottomMargin: -10
        anchors.rightMargin: -10
        cursorShape: Qt.SizeFDiagCursor
        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge) }
        }
    }

    DropShadow{
        anchors.fill: bgApp
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 12
        color: "#80000000"
        source: bgApp
        z: 0
    }

    // Animation Hide Top Left Popup
    PropertyAnimation{
        id: topTitleMenusClicked
        target: topTitleMenus
        properties: "scale"
        to: 1
        duration: 200
        easing.type: Easing.OutQuint
    }
    PropertyAnimation{
        id: topTitleMenusExited
        target: topTitleMenus
        properties: "scale"
        to: 0
        duration: 25
        easing.type: Easing.OutQuint
    }

    // APP Overlay Color
    PropertyAnimation{
        id: showOverlayAnimation
        properties: "opacity"
        target: colorOverlayApp
        to: 0.85
        duration: 350
        onStarted: showOverlayBox.running = true
    }
    PropertyAnimation{
        id: hideOverlayAnimation
        properties: "opacity"
        target: colorOverlayApp
        to: 0
        duration: 350
        onStarted: hideOverlayBox.running = true
        onFinished: colorOverlayApp.visible = false
    }
    PropertyAnimation{
        id: showOverlayBox
        properties: "scale"
        target: overlayMessage
        to: 1
        duration: 350
        easing.type: Easing.OutQuint
    }
    PropertyAnimation{
        id: hideOverlayBox
        properties: "scale"
        target: overlayMessage
        to: 0
        duration: 100
        easing.type: Easing.InQuint
    }

}




