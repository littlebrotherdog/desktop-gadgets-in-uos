import QtQuick 2.0

Rectangle {
    id: button
    width: 30
    height: 15
    color: "#8c7963"
    radius: 3

    signal clicked;
    property string label: "";

    Text {
        x: 0
        y: 0
        color: "#fbeee0"
        text: label
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
        font.family: "Verdana"
        font.pixelSize: 8
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: button.clicked();
    }
}
