import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: card_memo4
    width: 260
    height: 260
    color: "#FFF5EE"
    radius: 0
    Rectangle {
        id: memo_title
        width: parent.width
        height: 26
        color: "#D2691E"
        Label {
            anchors.verticalCenter: parent.verticalCenter
            x:5
            color: "white"
            font.pointSize: 15
            text: qsTr("memo")
        }
    }

    Flipable {
        id: flipable
        width: parent.width
        height: parent.height - memo_title.height
        anchors.top: memo_title.bottom
        property bool flipped: set_flag

        front:

        Rectangle {
            id: listview_rect
            anchors.fill: parent
            anchors.margins: 10
            radius: 18
            color: "transparent"

            ListModel {
                id: text_model
            }

            Component {
                id: text_delegate

                Rectangle{
                    id: list_item
                    width: ListView.view.width
                    height: 63
                    border.color: "#FF7F50"
                    radius: 8

                    Text {
                        id: text1
                        width: parent.width - 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 10
                        anchors.topMargin: 4
                        wrapMode: TextEdit.WrapAnywhere
                        text: mText
                        font.pointSize: 10
                    }

                    Image {
                        id: delete_brn
                        source: "qrc:/image/delete.svg"
                        width: 18
                        height: 18
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("delete")
                                memo_text_list_temp.splice(index, 1)
                                text_model.clear()
                                for(var i = 0; i < memo_text_list_temp.length; i++) {
                                    text_model.append(memo_text_list_temp[i])
                                }
                                settings.memo_text_list = memo_text_list_temp
                                memoDataChanged()
                            }
                        }
                    }
                }
            }

            ListView{
                id: list_view
                width: parent.width
                height: parent.height
                spacing: 2
                model: text_model
                delegate: text_delegate
                clip: true
            }

            Component.onCompleted: {
                text_model.clear()
                for(var i = 0; i < memo_text_list_temp.length; i++) {
                    text_model.append(memo_text_list_temp[i])
                }
            }

            Connections {
                target: main_window
                onMemoDataChanged: {
                    console.log("data changed")
                    text_model.clear()
                    for(var i = 0; i < memo_text_list_temp.length; i++) {
                        text_model.append(memo_text_list_temp[i])
                    }
                }
            }
        }

        back:

        Rectangle {
            anchors.fill: parent
            anchors.margins: 10
            radius: 18
            color: "transparent"

            Label {
                id: title_label
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                y:30
                font.family: "Arial"
                font.pointSize: 18
                text: qsTr("Please append your memo")
            }

            Rectangle {
                id: text_rect
                width: 175
                height: 28
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: title_label.bottom
                anchors.topMargin: 20
                border.color: "#FF7F50"
                radius: 4

                TextInput {
                    id: text_edit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    width: parent.width
                    text: qsTr("")
                    font.pointSize: 12
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8
                    color: "black"
                    selectByMouse: true
                    activeFocusOnPress: true
                    focus: true
                }
            }

            AnimatedImage{
                anchors.horizontalCenter: parent.horizontalCenter
                y:90
                height :100
                width :120
                source: "qrc:/image/13"
                onCurrentFrameChanged: {
                    //info.text = ("%1/%2").arg(animated.currentFrame).arg(animated.frameCount)
                }
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
                if(set_flag === false && text_edit.text !== "") {
                    console.log("append")
                    memo_text_list_temp.push({"mText": text_edit.text})

                    text_model.append(memo_text_list_temp[memo_text_list_temp.length - 1])
                    text_edit.text = ""
                    memoDataChanged()
                    settings.memo_text_list = memo_text_list_temp
                }
            }
        }
    }
}
