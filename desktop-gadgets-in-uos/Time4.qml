import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: card_t4
    width: 240
    height: 240
    border.color: "#afb0b2"
    border.width: 0
    radius: 0
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
                text: qsTr(settings.timer_word)
            }

            Timer {
                interval: 1000
                repeat: true
                running: true
                triggeredOnStart: true
                onTriggered: {
                    var date = Qt.formatDateTime(new Date(), "yyyy年M月d日 dddd")
                    t_label1.text = date
                    date = Qt.formatDateTime(new Date(), "hh:mm")
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
                text: qsTr(settings.timer_word)
                font.family: "Arial"
                font.pointSize: 14
                color: "white"
                focus: true
                activeFocusOnPress: true
                cursorVisible: true
            }
        }

        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2
            origin.y: flipable.height/2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 1 }
        }

        Connections {
            target: card_window

            onSetBtnClicked: {
                settings.timer_word = text_edit.text
            }
        }
    }
}
