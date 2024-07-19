import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Particles 2.0
import "script/my_f.js" as Weather

Rectangle {
    id: card_w2

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
        GradientStop {position: 0.0; color: "#8A2BE2"}
        GradientStop {position: 1.0; color: "#FF69B4"}
    }

    Component.onCompleted: {
        //MouseArea { id: mouseArea; anchors.fill: parent }
        states: State : {
                name: "brighter";
                when: motion.pressed
                //PropertyChanges { target: rect; color: "yellow" }
            }

        transitions: Transition: {
                //ColorAnimation { duration: 1000 }
            }
        Weather.set_name(command.city_name);
        Weather.setrandom(0);
        Weather.parse_JS_1();
        Weather.parse_JS_5();
    }

    Flipable {
        id: flipable
        transform: Rotation {
            id: rot
            origin.x: flipable.width >> 1
            origin.y: flipable.height >> 1
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }


        front:

        Rectangle {

            Image {
                id: weather_icon //控件的唯一标识符
                height: 21 //控件的高度
                fillMode: Image.PreserveAspectFit //图像的填充模式
                source: city_W //图像文件的路径，从外部变量 city_W 中读取

                MouseArea{ //添加一个鼠标区域
                    cursorShape: Qt.IBeamCursor //设置鼠标形状为I形光标
                    acceptedButtons: Qt.NoButton //禁止鼠标单击
                }

                anchors.bottom: description_text.top //控件的底部与描述文本控件的顶部对齐
                anchors.top: parent.top //控件的顶部与父元素的顶部对齐
                anchors.topMargin: 8 //控件与父元素顶部的边距
                anchors.right: parent.right //控件的右侧与父元素的右侧对齐
                anchors.rightMargin: 15 //控件与父元素右侧的边距
                visible: false //控件不可见
            }

            Text {
            id: city_txt //控件的唯一标识符
            color: "white" //文字颜色为白色
            font.pointSize: 11 //字体大小为11
            text: qsTr(command.city_name) //文本内容从外部变量command.city_name中读取

            anchors.left: parent.left //控件的左侧与父元素的左侧对齐
            anchors.leftMargin: 14 //控件与父元素左侧的边距
            y: 9//控件的y坐标
            }

            Text {
            id: temp_text //控件的唯一标识符
            font.pointSize: 28 //字体大小为28
            color: "white" //文字颜色为白色
            text: qsTr(city_T) //文本内容从外部变量cityTemperature中读取

            anchors.left: city_txt.left //控件的左侧与城市文本控件的左侧对齐
            y: 15//控件的y坐标
            }

            Text {
            id: description_text //控件的唯一标识符
            font.pointSize: 11//字体大小为11
            color: "white" //文字颜色为白色
            text: qsTr(city_D) //文本内容从外部变量cityDescription中读取

            anchors.bottom: new_text.top //控件的底部与新闻文本控件的顶部对齐
            anchors.right: weather_icon.right //控件的右侧与天气图标控件的右侧对齐
            }

            Text {
                id: new_text
                font.pointSize: 11
                color: "white"
                text: qsTr("气压:" + pressure + "&"+ "相对湿度:" + humidity)

                anchors.bottom: temp_text.bottom
                anchors.right: parent.right
                anchors.bottomMargin: 0
                anchors.rightMargin: 10

            }

            DropShadow {
                anchors.fill: weather_icon
                horizontalOffset: 3
                verticalOffset: 3

                MouseArea{
                    cursorShape: Qt.IBeamCursor
                    acceptedButtons: Qt.NoButton
                }

                spread : 0.1
                radius: 5
                samples: 30
                color: "#80000000"
                source: weather_icon
            }

            Rectangle {
                id: row_rect
                color: "transparent"
                y: 65
                width: parent.width
                height: (parent.height /2 ) - 10

                MouseArea{
                    cursorShape: Qt.IBeamCursor
                    acceptedButtons: Qt.NoButton
                }

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 10
                anchors.rightMargin: 8
                Row {
                spacing: 10 // 设置子项之间的间隔为10个像素

                Repeater {
                model: weather_model // 使用名为weather_model的模型循环创建子项

                Rectangle {
                width: (row_rect.width - 4 *parent.spacing) / 5 // 计算子项的宽度，确保5个子项与父项的宽度相等并保持一定的间距

                height: row_rect.height // 设置子项的高度与父项的高度相等

                color: "transparent" // 设置子项的背景色为透明

                Text {
                id: time_txt // 设置子项中的文本控件的ID为time_txt

                anchors.horizontalCenter: parent.horizontalCenter // 设置文本控件水平居中对齐

                anchors.top: parent.top // 设置文本控件的顶部对齐父项的顶部

                font.pointSize: 11 // 设置文本的字体大小为11像素

                color: "white" // 设置文本颜色为白色

                text: qsTr(time) // 使用qsTr函数翻译字符串，并将其设置为文本控件的文本
                }

                Image {
                id: pic // 设置子项中的图像控件的ID为pic

                anchors.top: time_txt.bottom // 设置图像控件的顶部与文本控件的底部对齐

                anchors.horizontalCenter: parent.horizontalCenter // 设置图像控件水平居中对齐

                height: 16 // 设置图像的高度为16像素

                cache :true // 启用图像缓存以提高性能

                smooth: true // 启用平滑缩放以提高图像质量

                visible: true // 设置图像可见

                fillMode: Image.PreserveAspectFit // 设置图像填充模式为保持纵横比适应

                source: weather_icon // 设置图像源为名为weather_icon的属性值
                }

                DropShadow {
                anchors.fill: pic // 设置阴影的范围与图像相同

                horizontalOffset: 3 // 设置阴影的水平偏移量为3像素

                verticalOffset: 3 // 设置阴影的垂直偏移量为3像素

                radius: 5.0 // 设置阴影的半径为5像素

                spread :0.1 // 设置阴影的扩散程度为0.1

                samples: 30 // 设置阴影的样本数为30

                color: "#80000000" // 设置阴影的颜色为带有80透明度的黑色

                source: pic // 设置阴影的源为图像控件pic
                }
                         Text {
                                anchors.top: pic.bottom
                                anchors.left: parent.left
                                anchors.leftMargin: 13
                                font.pointSize: 10
                                color: "white"
                                text: qsTr(temp)

                                //cache :true
                                smooth: true
                                visible: true
                            }
                        }
                    }
                }
            }

            anchors.fill: parent
            radius: 18
            color: "transparent"
        }

        back:

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
                text: qsTr("When life gives you lemons")
            }

            Label {
                id: title_1set
                color: "white"

                anchors.horizontalCenter: parent.horizontalCenter
                y:50
                font.pointSize: 16
                text: qsTr("just make lemonade")
            }
            //粒子发射系统
            ParticleSystem {
                id: particleSystem
            }

            Emitter {
                id: emitter
                //发射范围
                width: 1; height: 1
                x:0; y:100
                system: particleSystem
                emitRate: 3
                lifeSpan: 6400
                //生命周期变化的速度
                lifeSpanVariation: 500
                size: 16

                velocity: PointDirection{
                    x: 100
                    y: 0
                    xVariation: 5
                    yVariation: 0
                }
                //加速度对应的变化
                acceleration: AngleDirection{
                    angle: 90
                    magnitude: 25
                }
            }

            ItemParticle{
                id: particle
                system: particleSystem
                delegate: itemDelegate
            }

            Component{
                id: itemDelegate
                Rectangle{
                    id: container
                    width: 20*Math.ceil(Math.random()*3);height: width
                    color: "transparent"
                    Image {
                        anchors.fill:parent
                        anchors.margins: 4
                        source: "image/like.svg"
                    }
                }
            }
        }

        Item {
            id:root
            visible : false
            property alias text:label.text
            signal clicked

            Rectangle {
                // our inlined button ui
                id: button

                x: 12; y: 12
                width: 116; height: 26
                color: "lightsteelblue"
                border.color: "slategrey"
                Text {

                    id:label
                    anchors.centerIn: parent
                    text: "Start"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.clicked()
                    }
                }
            }
        }

        states: State {
        name: "back" // 定义状态名称
            PropertyChanges {
                target: rot; // 设置动画效果的目标控件为 rot
                angle: 180 // 在状态 "back" 下，将 rot 控件旋转 180 度
            }
            when: flipable.flipped // 当 flipable.flipped 属性为 true 时，切换至 "back" 状态
        }

        Text {
            visible: false // 设置 Text 控件不可见
            id:vv // 设置控件的 id 为 vv
            anchors.centerIn: parent // 将 Text 控件在父控件中居中
            text: "Start" // Text 控件显示的文本为 "Start"
        }
        anchors.fill: parent // 将该组件与其父组件填充

        property bool flipped: auto_break // 定义属性 flipped，并初始化为 auto_break

        transitions: Transition {
            NumberAnimation { target: rot; property: "angle"; duration: 1 } // 设置控件 rot 在翻转时的角度变化动画
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad } // 设置 x 和 y 属性的变化动画，使用 Easing.InOutQuad 缓动函数
            ColorAnimation { duration: 1000 } // 设置颜色变化动画的时长为 1000 毫秒
        }

        Timer {
            interval: 1000 // 设置计时器触发的时间间隔为 1 秒
            repeat: true // 设置计时器是否循环触发
            running: true // 设置计时器是否在开始时自动运行
            triggeredOnStart: true // 设置计时器在启动时是否立即触发 onTriggered 信号
            onTriggered: { // 当计时器触发时，调用以下 JavaScript 代码块
            Weather.set_name(command.city_name)
            Weather.parse_JS_1() // 调用 Weather 对象的 parse_JS_1 方法
            Weather.parse_JS_5() // 调用 Weather 对象的 parse_JS_5 方法
            }
        }

        Connections {
            target: card_window // 设置 Connections 的目标为 card_window
            onSetBtnClicked: { // 当 card_window 发出 onSetBtnClicked 信号时，调用以下 JavaScript 代码块
            Weather.set_name(command.city_name)
            MouseArea:{ // 设置 MouseArea 的属性
                cursorShape: Qt.IBeamCursor // 设置鼠标指针的形状为 IBeamCursor
                acceptedButtons: Qt.NoButton // 禁止鼠标点击操作
            }
            Weather.parse_JS_1() // 调用 Weather 对象的 parse_JS_1 方法
            Weather.parse_JS_5() // 调用 Weather 对象的 parse_JS_5 方法
            }
        }

        Component.onDestruction: {
            var cnt=0;
            for(var i = 0; i < command.memo_all_txt.length; i++) {
                console.log(command.memo_all_txt[i]);
            }
            console.log("yessssssss!");
        }

    }

    width: 240
    height: 120
    radius: 0
    border.color: "#afb0b2"
    border.width: 0
}
