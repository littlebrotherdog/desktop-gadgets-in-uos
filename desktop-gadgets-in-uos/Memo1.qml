import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
Rectangle {
    id: card_memo1
    width: 120
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

    Rectangle {
        id: listview_rect
        width: parent.width
        height: parent.height - memo_title.height
        anchors.top: memo_title.bottom
        anchors.bottom: parent.bottom
        color: "transparent"

        Rectangle {
            id: listview_rect2
            anchors.fill: parent
            anchors.margins: 6
            color: "transparent"

            ListModel {
                id: text_model
            }


            Component {
                id: text_delegate

                Rectangle{
                    id: list_item
                    width: ListView.view.width
                    height: (listview_rect2.height - list_view.spacing) / 2
                    border.color: "#FF7F50"
                    radius: 8

                    //显示的文本
                    Text {
                        id: text1
                        width: parent.width - 20
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.topMargin: 4
                        anchors.leftMargin: 10
                        font.pointSize: 8
                        wrapMode: TextEdit.WrapAnywhere
                        text: mText
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
}
