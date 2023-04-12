import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: card_t4

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

        front:

        Rectangle {
            id: card_front

            gradient:Gradient {
                GradientStop {position: 0.0; color: "#00BFFF"}
                GradientStop {position: 1.0; color: "#4169E1"}
            }
            Label {
                id: t_label1
                color: "white"

                font.family: "Arial"
                font.pointSize: 22
                text: qsTr("2022年2月22日")

                anchors.horizontalCenter: parent.horizontalCenter
                y:34

            }

            Label {
                id: t_label2
                color: "white"


                font.family: "Arial"
                anchors.topMargin: 8
                font.pointSize: 52
                text: qsTr("11:11")

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: t_label1.bottom

            }

            Label {
                id: t_label3
                color: "white"


                font.family: "Arial"
                font.pointSize: 14
                text: qsTr(command.timer_word)

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: t_label2.bottom
                anchors.topMargin: 8

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
                    date = Qt.formatDateTime(new Date(), "hh:mm")
                    t_label2.text = date
                }
            }
            anchors.fill: parent
            border.color: "#afb0b2"
            border.width: 0
        }

        back:

            Rectangle {
            id: card_back
            anchors.fill: parent // 矩形填充整个父组件
            border.color: "#afb0b2" // 边框颜色
            border.width: 0 // 边框宽度
            gradient: Gradient { // 背景渐变
            GradientStop {position: 0.0; color: "#00BFFF"}
            GradientStop {position: 1.0; color: "#4169E1"}
            }
            Label { // 标题标签
            id: title_label
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 80 // 距离父组件上边界80像素
            font.family: "Arial"
            font.pointSize: 18
            text: qsTr("Please set your slogan")
            }

            TextEdit { // 文本编辑框
            id: text_edit
            width: contentWidth // 宽度为父组件的宽度
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: title_label.bottom
            anchors.topMargin: 20 // 距离标题标签下边界20像素
            text: qsTr(command.timer_word) // 显示计时器文本
            font.family: "Arial"
            font.pointSize: 14
            color: "white"
            focus: true
            activeFocusOnPress: true
            cursorVisible: true
            }
            }

            transform: Rotation { // 翻转动画
            id: rot
            origin.x: flipable.width >> 1 // 旋转中心x坐标为翻转组件宽度的一半
            origin.y: flipable.height >> 1 // 旋转中心y坐标为翻转组件高度的一半
            axis.x: 0; axis.y: 1; axis.z: 0 // 绕y轴翻转
            angle: 0 // 初始角度为0度
            }

            states: State { // 状态
            name: "back"
            PropertyChanges {
            target: rot;
            angle: 180 // 翻转后角度为180度
            }
            when: flipable.flipped // 翻转组件翻转时激活状态
            }

            transitions: Transition { // 翻转动画的过渡效果
            NumberAnimation { target: rot; property: "angle"; duration: 1 } // 旋转动画
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad } // 平移动画
            ColorAnimation { duration: 1000 } // 颜色动画
            }

        Connections {
            target: card_window
            //target: area function()
            //onClicked(mouse) { foo(mouse) }
            onSetBtnClicked: {
                command.timer_word = text_edit.text
            }
        }

        anchors.fill: parent
        property bool flipped: set_flag

    }

    Component.onDestruction: {
        var cnt=0;
        for(var i = 0; i < command.memo_all_txt.length; i++) {
            console.log(command.memo_all_txt[i]);
        }
        console.log("yessssssss!")
    }

    width: 240
    height: 240
    border.color: "#afb0b2"
    border.width: 0
    radius: 0
}
