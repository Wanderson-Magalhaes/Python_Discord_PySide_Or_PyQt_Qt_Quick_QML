import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "components"
import QtQuick.Timeline 1.0

Window {
    id: splashScreenWindow
    width: 300
    height: 350
    visible: true
    color: "#00000000"
    title: qsTr("STARTING...")

    // Remove Title Bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Properties
    property int timeInterval: 2900

    Timer{
         id: timer
         interval: timeInterval
         running: true
         repeat: false
         onTriggered: {
             var component = Qt.createComponent("main.qml")
             var win = component.createObject()
             win.show()
             visible = false
         }
     }

    Rectangle {
        id: bg
        color: "#282b30"
        radius: 0
        anchors.fill: parent
        anchors.margins: 10
        z: 1

        Image {
            id: logoImage
            width: 90
            height: 90
            opacity: 1
            anchors.top: bg.top
            source: "../images/images/logo_90x90.png"
            rotation: 360
            sourceSize.height: 90
            sourceSize.width: 90
            anchors.topMargin: 100
            anchors.horizontalCenter: bg.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: label
            opacity: 1
            color: "#ffffff"
            text: qsTr("STARTING...")
            anchors.bottom: bg.bottom
            font.italic: true
            anchors.bottomMargin: 100
            font.family: "Segoe UI"
            font.pointSize: 12
            anchors.horizontalCenter: bg.horizontalCenter
        }

    }

    DropShadow{
        anchors.fill: bg
        source: bg
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#40000000"
        z: 0
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 3000
                running: true
                loops: 1
                to: 3000
                from: 0
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 3000


        KeyframeGroup {
            target: logoImage
            property: "rotation"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                easing.bezierCurve: [0.0595,0.00129,0.218,-0.115,0.359,0.0453,0.5,0.206,0.501,0.747,0.64,0.987,0.78,1.23,0.916,1,1,1]
                frame: 1504
                value: 360
            }

            Keyframe {
                frame: 1504
                value: 0
            }

            Keyframe {
                easing.bezierCurve: [0.0595,0.00129,0.218,-0.115,0.359,0.0453,0.5,0.206,0.501,0.747,0.64,0.987,0.78,1.23,0.916,1,1,1]
                frame: 3000
                value: 360
            }
        }
    }
}
