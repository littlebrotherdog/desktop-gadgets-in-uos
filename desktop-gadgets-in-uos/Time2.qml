import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0

Rectangle {
    id: card_t2
    width: 240
    height: 120

    gradient:Gradient {
        GradientStop {position: 0.0; color: "#00BFFF"}
        GradientStop {position: 1.0; color: "#4169E1"}
    }
    Label {
        id: t_label1
        anchors.horizontalCenter: parent.horizontalCenter
        y:2
        font.family: "Arial"
        font.pointSize: 5
        color : "transparent"
        text: qsTr("11:11")
    }

    Label {
        id: t_label2
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 10
        font.family: "Arial"
        font.pointSize: 20
        text: qsTr("2022年2月22日")
    }

    Label {
        id: t_label3
        color: "white"
        y: 30
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Arial"
        font.pointSize: 12
        text: qsTr("星期三")
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

    Clock_rect{
            id:clock
            y:18
            anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle{
        color: "transparent"
        anchors.fill: parent
        Button{
                id:btn
                text:"开 始"
                anchors.horizontalCenterOffset: 0
                highlighted: false
                autoRepeat: true
                flat: true
                visible: true
                clip: true
                font.pointSize: 15
                font.bold:true

                y:90
                height :25
                width: 48
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked:
                {
                    if(text=="开 始"){
                        clock.timer.start()
                        text="暂 停"
                    }else{
                        clock.timer.stop()
                        text="开 始"
                    }
                }
        }

    }
}
