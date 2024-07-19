import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import "./DemoQml"

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Demo {
        id: compDemo
        dia.onAccepted: {
            console.log("clicked Ok button.")
        }
    }

    Button {
        anchors.fill: parent
        text: qsTr("显示 Dialog")
        onClicked: {
            compDemo.dia.open()
        }
    }
}
