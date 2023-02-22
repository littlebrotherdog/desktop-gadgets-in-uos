import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.2

Rectangle {
    id: card_memo2
    width: 240
    height: 120
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
        anchors.fill :parent

        color: "transparent"

        Rectangle {
            id: listview_rect2
            anchors.fill: parent
            anchors.margins: 10
            color: "transparent"
            ListModel {
                id: text_model
            }

            Component {
                id: text_delegate
                Rectangle{
                    id: list_item
                    width: ListView.view.width
                    height: listview_rect2.height - list_view.spacing
                    border.color: "#FF7F50"
                    radius: 8

                    Text {
                        id: text1
                        width: parent.width - 40
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 10
                        anchors.topMargin: 4
                        font.pointSize: 10
                        wrapMode: TextEdit.WrapAnywhere
                        text: mText
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

                                settings.setValue("memo_text_list", memo_text_list_temp)
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
    }

    back:
        Rectangle {
            anchors.fill: parent
            anchors.margins: 10
            radius: 18
            color: "transparent"
            ColumnLayout
            {
                anchors.fill: parent
                spacing: 10
                TextField {
                    id: input
                    Layout.preferredHeight: 20
                    Layout.fillWidth: true


                }

                ListView {
                    id: list
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    model: text_model
                    delegate: Text {
                        property string origText: modelData
                        text: list.hightlightText(origText)
                    }

                    function hightlightText(txt)
                    {
                        var str = input.text;
                        var pos = txt.indexOf(str);
                        if(pos !== (-1))
                        {
                            return txt.replace(str,"<font color='#FF0000'>" + str + "</font>")
                        }
                        return txt;
                    }
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
    }
}
