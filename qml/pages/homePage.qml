import QtQuick 2.15
import QtQuick.Controls 2.15
import "../components"
import "../js/FunctionsJS.js" as FunctionJS
import QtQuick.Layouts 1.15

Item {
    id: homePageRoot
    width: 1100
    height: 780    

    // Show Right Column / Member List
    property bool showMemberList: true
    property alias changeStatusMemberList: rightMenu.item

    Rectangle {
        id: content
        color: "#36393f"
        anchors.fill: homePageRoot

        Rectangle {
            id: left_home_page
            width: 240
            color: "#2f3136"
            anchors.left: content.left
            anchors.top: content.top
            anchors.bottom: content.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            ColumnLayout {
                id: left_column
                anchors.fill: left_home_page
                spacing: 1
                anchors.bottomMargin: 50

                // Loader Left Top Box
                Item{
                    id: leftModuleHome
                    width: 240
                    height: 240
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                    // Loader Top Left Module
                    Loader{
                        anchors.fill: leftModuleHome
                        source: Qt.resolvedUrl("homePage/leftBoxHome.qml")
                    }

                    // Close Button
                    IconButton{
                        anchors.right: leftModuleHome.right
                        anchors.top: leftModuleHome.top
                        anchors.topMargin: 10
                        anchors.rightMargin: 15
                        onClicked: FunctionJS.deleteComponentAndChilds(leftModuleHome)
                    }
                }

                Loader{
                    id: loaderLeftMenu
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    source: Qt.resolvedUrl("homePage/leftMenu.qml")
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

            Rectangle {
                id: bottomLeftChannel
                height: 50
                color: "#292b2f"
                anchors.left: left_home_page.left
                anchors.right: left_home_page.right
                anchors.bottom: left_home_page.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0

                // Loader Top Left Module
                Loader{
                    anchors.fill: bottomLeftChannel
                    source: Qt.resolvedUrl("homePage/bottomBoxAvatarAndSettings.qml")
                }
            }
        }

        Rectangle {
            id: right_column
            width: showMemberList ? 240 : 0
            color: "#2f3136"
            anchors.right: content.right
            anchors.top: content.top
            anchors.bottom: content.bottom
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 0

            Loader{
                id: rightMenu
                anchors.fill: right_column
                source: Qt.resolvedUrl("homePage/rightMenu.qml")
            }
        }

        Loader{
            id: homeMessagesLoader
            anchors.left: left_home_page.right
            anchors.right: right_column.left
            anchors.top: content.top
            anchors.bottom: content.bottom
            source: Qt.resolvedUrl("homePage/messages.qml")
        }
    }

}



/*##^##
Designer {
    D{i:0;formeditorColor:"#4c4e50"}
}
##^##*/
