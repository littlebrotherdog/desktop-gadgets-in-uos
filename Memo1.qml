import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Rectangle {
    id: card_memo1
    width: 120
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
        id: list_rec
        width: parent.width
        height: parent.height - memo_title.height

        color: "transparent"

        Rectangle {
            id: list_revxx
            anchors.fill: parent
            anchors.margins: 6
            color: "transparent"

            Connections {
                target: main_window
                onMemoDataChanged: {
                    //onClicked: foo(...)
                    text_mod.clear()
                    for(var i = 0; i < memo_my_birth.length; i++) {
                        text_mod.append(memo_my_birth[i])
                    }
                }
            }

            ListModel {
                //cache :true
                //SmoothedAnimation :true
                id: text_mod
            }


            Component {
                id: text_del

                Rectangle{
                    id: list_item
                    width: ListView.view.width
                    height: (list_revxx.height - livv.spacing) >> 1
                    border.color: "#FF7F50"
                    radius: 8


                    Text {
                        id: txt
                        width: parent.width - 18
                        height: parent.height

                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.topMargin: 4
                        anchors.leftMargin: 10

                        font.pointSize: 8
                        wrapMode: TextEdit.WordWrap
                        text: mText
                    }
                }
            }


            ListView{
                id: livv
                width: parent.width
                height: parent.height
                spacing: 2
                model: text_mod
                delegate: text_del
                clip: true
                //clipChanged: 0
            }

            // 过渡效果，包含旋转、平移和颜色动画
            transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 1 } // 旋转动画
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad } // 平移动画
            ColorAnimation { duration: 1000 } // 颜色动画
            }

            Component.onCompleted: {
                text_mod.clear()
                for(var i = 0; i < memo_my_birth.length; i++) {
                    text_mod.append(memo_my_birth[i])
                }
            }

            Component.onDestruction: {
            var cnt=0; // 计数器初始化
            for(var i = 0; i < command.memo_all_txt.length; i++) { // 循环遍历文本并打印
            console.log(command.memo_all_txt[i]);
            }
            console.log("yessssssss!") // 记录销毁次数
            }
        }

        anchors.top: memo_title.bottom
        anchors.bottom: parent.bottom
    }

    Rectangle {
    id: memo_title
    width: parent.width
    height: 26
    color: "#D2691E" // 橙色
    Label {
    anchors.verticalCenter: parent.verticalCenter // 标签垂直居中
    x:5 // 水平位置
    color: "white" // 字体颜色
    font.pointSize: 15 // 字体大小
    text: qsTr("memo") // 标签文本
    }
    }
}
