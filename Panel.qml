import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    id: rectangle

    Rectangle {

        anchors.fill: parent
        clip: true

        Card {
            id: weather1
            anchors.leftMargin: 20
            anchors.topMargin: 20
            height: 48
            width :48
            img_source: "qrc:/image/weather1"
            Label {
                id: w_label1
                color: "black"
                x: 10
                y: 50
                font.family: "Arial"
                font.pointSize: 10
                text: qsTr("Weather")
            }
        }

        Card {
            id: timer1
            height: 48
            width :48
            anchors.left: weather1.right
            anchors.leftMargin: 30
            anchors.topMargin: 20
            img_source: "qrc:/image/time1"
            Label {
                id: t_label1
                color: "black"
                x: 14
                y: 50
                font.family: "Arial"
                font.pointSize: 10
                text: qsTr("Time")
            }
        }

        Card {
            id: memo1
            height: 48
            width :48
            anchors.left: timer1.right
            anchors.leftMargin: 30
            anchors.topMargin: 20
            img_source: "qrc:/image/memo1"
            Label {
                id: m_label1
                color: "black"
                x: 15
                y: 50
                font.family: "Arial"
                font.pointSize: 10
                text: qsTr("Memo")
            }

        }

    }

    width: 248
    height: 96
    anchors.fill: parent
    color: "#FFFFFF"

}




