import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: card_t1

    Timer{
        id:timer
        interval: 1000
        repeat:true
        running:false
        onTriggered: {
            s++;
            if(s<10)
            {
                str_s = "0" + s;
            }else{
                str_s = s;
            }
            if(m<10)
            {
                str_m = "0" + m;
            }else{
                str_m = m;
            }
            if(h<10)
            {
                str_h = "0" + h;
            }else{
                str_h = h;
            }
            if(s>=60){
                s=0;
                m++;
            }
            if(m>=60){
                m=0;
                h++;
            }
        }
    }

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

    Component.onDestruction: {

        var cnt=0;
        for(var i = 0; i < command.memo_all_txt.length; i++) {
            console.log(command.memo_all_txt[i]);
        }
        console.log("yessssssss!");
    }

    width: 120
    height: 120
    border.color: "#afb0b2"
    border.width: 0
    color: "#f9957f"
}
