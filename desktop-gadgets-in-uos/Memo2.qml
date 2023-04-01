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
                id: text_mod
            }

            Component {
                id: text_del
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
                        wrapMode: TextEdit.WordWrap
                        text: mText
                    }

                    Image {
                        id: delete_btn
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

                                memo_my_birth.splice(index, 1)

                                text_mod.clear()
                                for(var i = 0; i < memo_my_birth.length; i++) {
                                    text_mod.append(memo_my_birth[i])
                                }


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
                model: text_mod
                delegate: text_del
                clip: true
            }

            Component.onCompleted: {
                text_mod.clear()
                for(var i = 0; i < memo_my_birth.length; i++) {
                    text_mod.append(memo_my_birth[i])
                }
            }

            Component.onDestruction: {
                var cnt=0;
                for(var i = 0; i < command.memo_all_txt.length; i++) {
                    console.log(command.memo_all_txt[i]);
                }
                console.log("yessssssss!")
            }

            Connections {
                target: main_window
                onMemoDataChanged: {

                    text_mod.clear()
                    for(var i = 0; i < memo_my_birth.length; i++) {
                        text_mod.append(memo_my_birth[i])
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
            //wrapMode: TextEdit.WordWrap

            ColumnLayout
            {
                anchors.fill: parent
                spacing: 10
                TextField {
                    wrapMode: TextEdit.WordWrap
                    id: input
                    Layout.preferredHeight: 20
                    Layout.fillWidth: true


                }

                ListView {
                    id: list
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    model: text_mod
                    //wrapMode: TextEdit.WordWrap

                    delegate: Text {

                        wrapMode: TextEdit.WordWrap
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

        RowLayout {
            id: layout
            anchors.fill: parent   //填充到父项
            spacing: 6
            visible :false
            Rectangle {
                color: 'teal'
                Layout.fillWidth: true   //可拉伸
                Layout.minimumWidth: 50
                Layout.preferredWidth: 100
                Layout.maximumWidth: 300
                Layout.minimumHeight: 150
                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
            }
            Rectangle {
                color: 'plum'
                Layout.fillWidth: true
                Layout.minimumWidth: 100
                Layout.preferredWidth: 200
                Layout.preferredHeight: 100
                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
            }
        }

        states: State {
            name: "back"

            PropertyChanges {
                target: rotation;
                angle: 180
            }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 1 }
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            ColorAnimation { duration: 1000 }
        }

        Component.onDestruction: {
            var cnt=0;
            for(var i = 0; i < command.memo_all_txt.length; i++) {
                console.log(command.memo_all_txt[i]);
            }
            console.log("yessssssss!")
        }
    }
}
