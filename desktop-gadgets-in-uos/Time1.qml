import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: card_t1
    width: 120
    height: 120
    border.color: "#afb0b2"
    border.width: 0
    color: "#f9957f"
    gradient:Gradient {
        GradientStop {position: 0.0; color: "#00BFFF"}
        GradientStop {position: 1.0; color: "#4169E1"}
    }

    Label {
        id: t_label1
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        y:12
        font.family: "Arial"
        font.pointSize: 30
        text: qsTr("11:11")
    }

    Label {
        id: t_label2
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 70
        font.family: "Arial"
        font.pointSize: 10
        text: qsTr("2022年2月22日")
    }

    Label {
        id: t_label3
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        y:88
        font.family: "Arial"
        font.pointSize: 10
        text: qsTr("星期一")
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            var date = Qt.formatDateTime(new Date(), qsTr("hh:mm"))
            t_label1.text = date
            date = Qt.formatDateTime(new Date(), qsTr("yyyy年M月d日"))
            t_label2.text = date
            date = Qt.formatDateTime(new Date(), qsTr("dddd"))
            t_label3.text = date
        }
    }
}
