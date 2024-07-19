import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import "script/logic.js" as Logic

Rectangle {
    id: card_t2

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

                 gradient:Gradient {
                        GradientStop {position: 0.0; color: "#00BFFF"}
                        GradientStop {position: 1.0; color: "#4169E1"}
                 }


                anchors.fill: parent
                id: card_front
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
                // 创建Clock_rect组件

                    id:clock// 给Clock_rect组件添加ID
                    y:18// 设置Clock_rect组件的垂直位置
                    anchors.horizontalCenter: parent.horizontalCenter// 设置Clock_rect组件的水平位置为父组件的水平位置
                }

                Rectangle{
                // 创建矩形组件
                    id: id_front
                    color: "transparent"
                // 设置矩形组件的颜色为透明

                    anchors.fill: parent
                // 设置矩形组件填充父组件

                    Button{
                // 创建按钮组件

                        id:btn // 给按钮组件添加ID
                        text:"开 始"
                        anchors.horizontalCenterOffset: 0
                // 设置按钮的水平偏移量为0

                        highlighted: false
                // 取消按钮高亮显示

                        autoRepeat: true
                // 启用按钮自动重复

                        flat: true
                // 设置按钮为扁平样式

                        visible: true
                // 设置按钮可见

                        clip: true
                // 启用按钮裁剪

                        font.pointSize: 15
                // 设置按钮文本的字体大小

                        font.bold:true
                // 设置按钮文本的粗细

                        y:90
                // 设置按钮的垂直位置

                        height :25
                // 设置按钮的高度

                        width: 48
                // 设置按钮的宽度

                        anchors.horizontalCenter: parent.horizontalCenter
                // 设置按钮的水平位置为父组件的水平位置

                    onClicked: {
                        console.log("time")
                    // 当按钮被点击时执行以下代码

                        if(text=="开 始"){
                    // 如果按钮文本为“开 始”

                        clock.timer.start()
                    // 开始计时器

                        text="暂 停"
                    // 修改按钮文本为“暂 停”
                        }
                        else{
                        // 如果按钮文本为“暂 停”

                            clock.timer.stop()
                        // 停止计时器

                            text="开 始"// 修改按钮文本为“开 始”
                        }
                    }
                }
            }
        }

        back :

            Rectangle {
                anchors.fill: parent
                color: "transparent"
                radius: 18

                Label {
                    id: title_set
                    color: "white"

                    anchors.horizontalCenter: parent.horizontalCenter
                    y:30
                    font.pointSize: 16
                    text: qsTr("点击任意空白处开始游戏")
                }
                Label {
                    id: title_1set
                    color: "white"

                    anchors.horizontalCenter: parent.horizontalCenter
                    y:50
                    font.pointSize: 16
                    text: qsTr("游戏名：2048")
                }
        }

    transform: Rotation { // 动画
        id: rot
        origin.x: flipable.width >> 1 // 旋转中心x坐标为组件宽度的一半
        origin.y: flipable.height >> 1 // 旋转中心y坐标为组件高度的一半
        axis.x: 0; axis.y: 1; axis.z: 0 // 绕y轴
        angle: 0 // 初始角度为0度
    }

    states: State { // 状态
        name: "back"
        PropertyChanges {
        target: rot;
        angle: 180 // 角度为180度
        }
        when: flipable.flipped // 激活状态
    }

    transitions: Transition { // 动画的过渡效果
        NumberAnimation { target: rot; property: "angle"; duration: 1 } // 旋转动画
        NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad } // 平移动画
        ColorAnimation { duration: 1000 } // 颜色动画
    }

        anchors.fill: parent
        property bool flipped: auto_break
    }

    Component.onDestruction: {
        // 当组件被销毁时执行以下代码

        var cnt=0;
        // 定义计数器cnt并初始化为0

        for(var i = 0; i < command.memo_all_txt.length; i++) {
            // 遍历command.memo_all_txt数组

            console.log(command.memo_all_txt[i]);
            // 输出数组元素
            cnt++;// 计数器加1
        }
        console.log("yessssssss!")
        // 输出字符串“yessssssss!”到控制台
    }

    width: 240
    // 设置组件的宽度

    height: 120
    // 设置组件的高度
}
