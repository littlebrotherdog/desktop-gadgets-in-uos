import QtQuick 2.0
import "script/logic.js" as Logic

Rectangle {
    id: gameOverRect
    width: 240
    height: 120
    radius: 3;
    visible: true
    opacity: 0.0
    color: "#bbada0"

    property alias animateOpacity: animateOpacity

    anchors {
        right: parent.right; rightMargin: 1
        left: parent.left; leftMargin: 1
        bottom: parent.bottom; bottomMargin: 1
        top: parent.top; topMargin: 1
    }

    Text {
        id: text1
        x: 90
        y: 10
        width: 60
        height: 30
        color: "#766d65"
        text: qsTr("Game Over!")
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        font.pixelSize: 24
    }

    Rectangle {
        id: rectangle2
        x: 95
        y: 70
        width: 50
        height: 20
        color: "#8c7963"
        radius: 3
        clip: false

        Text {
            x: 0
            y: 0
            color: "#e2e1d6"
            text: qsTr("Try again")
            font.bold: true
            font.family: "Verdana"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 8
        }
        MouseArea {
            anchors.fill: parent;
            onClicked: Logic.restart();
        }
    }

    NumberAnimation {
        id: animateOpacity
        target: gameOverRect
        properties: "opacity"
        from: 0.00
        to: 0.80
        duration: 1000
   }
}
