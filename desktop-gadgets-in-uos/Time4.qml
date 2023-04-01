import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: card_t4
    width: 240
    height: 240
    border.color: "#afb0b2"
    border.width: 0
    radius: 0

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

    Flipable {
        id: flipable
        anchors.fill: parent
        property bool flipped: set_flag

        front:

        Rectangle {
            id: card_front
            anchors.fill: parent
            border.color: "#afb0b2"
            border.width: 0
            gradient:Gradient {
                GradientStop {position: 0.0; color: "#00BFFF"}
                GradientStop {position: 1.0; color: "#4169E1"}
            }
            Label {
                id: t_label1
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y:34
                font.family: "Arial"
                font.pointSize: 22
                text: qsTr("2022年2月22日")
            }

            Label {
                id: t_label2
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: t_label1.bottom
                font.family: "Arial"
                anchors.topMargin: 8
                font.pointSize: 52
                text: qsTr("11:11")
            }

            Label {
                id: t_label3
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: t_label2.bottom
                anchors.topMargin: 8
                font.family: "Arial"
                font.pointSize: 14
                text: qsTr(command.timer_word)
            }

            Timer {
                interval: 1000
                repeat: true
                running: true
                triggeredOnStart: true
                /*MouseArea {
                         anchors.fill: parent
                         drag.target: rect
                         drag.axis: Drag.XAxis
                         drag.minimumX: 0
                         drag.maximumX: container.width - rect.width
                         drag.filterChildren:false
                         Rectangle{
                            id:childrenRectangle
                            color: "blue"
                            width: 30; height: 30
                            anchors.bottom: rect.bottom
                            anchors.right: rect.right
                            MouseArea {
                               anchors.fill: parent
                               onPressed: console.log("123");
                         }
                     }
                 }*/
                onTriggered: {
                    var date = Qt.formatDateTime(new Date(), "yyyy年M月d日 dddd")
                    t_label1.text = date
                    date = Qt.formatDateTime(new Date(), "h:m")
                    t_label2.text = date
                }
            }
        }

        back:

        Rectangle {
            id: card_back
            anchors.fill: parent
            border.color: "#afb0b2"
            border.width: 0
            gradient:Gradient {
                GradientStop {position: 0.0; color: "#00BFFF"}
                GradientStop {position: 1.0; color: "#4169E1"}
            }
            Label {
                id: title_label
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y:80
                font.family: "Arial"
                font.pointSize: 18
                text: qsTr("Please set your slogan")
            }

            TextEdit {
                id: text_edit
                width: contentWidth
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: title_label.bottom
                anchors.topMargin: 20
                text: qsTr(command.timer_word)
                font.family: "Arial"
                font.pointSize: 14
                color: "white"
                focus: true
                activeFocusOnPress: true
                cursorVisible: true
            }
        }

        transform: Rotation {
            id: rot
            origin.x: flipable.width >> 1
            origin.y: flipable.height >> 1
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states: State {
            name: "back"
            PropertyChanges {
                target: rot;
                angle: 180
            }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rot; property: "angle"; duration: 1 }
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            ColorAnimation { duration: 1000 }
        }

        Connections {
            target: card_window
            //target: area function()
            //onClicked(mouse) { foo(mouse) }
            onSetBtnClicked: {
                command.timer_word = text_edit.text
            }
        }
    }

    Component.onDestruction: {
        var cnt=0;
        for(var i = 0; i < command.memo_all_txt.length; i++) {
            console.log(command.memo_all_txt[i]);
        }
        console.log("yessssssss!")
    }
}
