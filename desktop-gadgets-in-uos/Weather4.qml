import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "script/my_f.js" as Weather

Rectangle {
    id: card_w4

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
        Weather.setCityName(command.city_name)
        Weather.setrandom(0)
        Weather.parse_JS_1()
        Weather.parse_JS_5()
    }

    Flipable {
        id: flipable

        states: State {
            name: "back"
            PropertyChanges {
                target: rot;
                angle: 180
            }
            when: flipable.flipped
        }

        anchors.fill: parent
        property bool flipped: set_flag

        front:

            Rectangle {
                anchors.fill: parent
                radius: 18
                color: "transparent"
                Image {
                    id: weather_icon
                    height: 19
                    fillMode: Image.PreserveAspectFit
                    source: cityWeatherIcon

                    MouseArea {
                       anchors.fill: parent
                       drag.target: rect
                       drag.axis: Drag.XAxis
                       drag.minimumX: 0
                       drag.maximumX: container.width - rect.width
                    }

                    anchors.bottom: description_text.top
                    anchors.top: parent.top
                    anchors.topMargin: 4
                    anchors.right: parent.right
                    anchors.rightMargin: 16
                    visible: true
                }

                Text {
                color: "white" // 文字颜色为白色
                font.pointSize: 11 // 文字大小为11
                text: qsTr(command.city_name) // 设置文字为城市名称

                id: city_txt // 给这个 Text 组件设置一个 ID，方便其他地方引用
                anchors.left: parent.left // 水平左对齐到父组件左边
                anchors.leftMargin: 14 // 左边距为14个像素
                y: 9// 上下居中对齐
                }

                Text {
                font.pointSize: 27// 文字大小为27
                color: "white" // 文字颜色为白色
                text: qsTr(cityTemperature) // 设置文字为城市温度

                id: temp_text // 给这个 Text 组件设置一个 ID，方便其他地方引用
                anchors.left: city_txt.left // 水平左对齐到城市名称的左边
                y: 17 // 上下居中对齐
                }

                Text {
                id: description_text // 给这个 Text 组件设置一个 ID，方便其他地方引用
                font.pointSize: 11// 文字大小为11
                color: "white" // 文字颜色为白色
                text: qsTr(cityDescription) // 设置文字为城市描述

                anchors.bottom: double_text.top // 底部对齐到 double_text 的顶部
                anchors.right: weather_icon.right // 右边对齐到天气图标的右边
                }

                Text {
                id: double_text // 给这个 Text 组件设置一个 ID，方便其他地方引用
                font.pointSize: 11// 文字大小为11
                color: "white" // 文字颜色为白色
                text: qsTr("气压:" + pressure + "&"+ "相对湿度:" + humidity) // 设置文字为气压和相对湿度

                anchors.bottom: temp_text.bottom // 底部对齐到温度文字的底部
                anchors.right: parent.right // 右边对齐到父组件的右边
                anchors.bottomMargin: 0 // 底部边距为0
                anchors.rightMargin: 10 // 右边距为10个像素
                }

                DropShadow {
                anchors.fill: weather_icon // 阴影大小和天气图标一致
                horizontalOffset: 3 // 阴影水平偏移为3个像素
                verticalOffset: 3 // 阴影垂直偏移为3个像素

                MouseArea { // 鼠标区域
                       anchors.fill: parent // 占满整个父组件
                       drag.target: rect // 拖动的目标为矩形框
                       drag.axis: Drag.XAxis // 只允许水平方向拖动
                       drag.minimumX: 0 // 拖动的最小位置
                       drag.maximumX: container.width - rect.width
                    }

                    spread :0.1
                    radius: 5
                    samples: 30
                    color: "#80000000"
                    source: weather_icon
                }

                Rectangle {
                id :v1 // 第一个矩形的ID为"v1"
                width: parent.width - 28 // 设置矩形的宽度为父级宽度减去28
                height: 1 // 设置矩形的高度为1
                opacity: 0.5 // 设置矩形的不透明度为0.5
                color: "white" // 设置矩形的颜色为白色
                anchors.horizontalCenter: parent.horizontalCenter // 水平居中对齐到父级
                y: 85 // 设置矩形的y坐标为85
                anchors.topMargin: 20 // 定位到上边缘的距离为20
                }

            Rectangle {
                id: choice

                MouseArea { // 添加一个鼠标区域
                anchors.fill: parent // 将鼠标区域的大小设置为与父级相同
                drag.target: rect // 将拖动操作的目标设置为矩形
                drag.axis: Drag.XAxis // 设置仅允许水平拖动
                drag.minimumX: 0 // 设置拖动的最小值为0
                drag.maximumX: container.width - rect.width // 设置拖动的最大值为容器的宽度减去矩形的宽度
                }
                Row { // 添加一个行布局
                Repeater { // 添加一个重复器
                model: weather_model // 将重复器的模型设置为weather_model
                Rectangle { // 在重复器中添加一个矩形
                            Image { // 在矩形中添加一个图片
                            id: icon // 图片的ID为"icon"
                            anchors.top: time_text.bottom // 将图片的上边缘与time_text的下边缘对齐
                            anchors.horizontalCenter: parent.horizontalCenter // 水平居中对齐到父级
                            height: 16 // 设置图片的高度为16
                            cache :true // 开启缓存
                            smooth: true // 开启平滑过渡
                            fillMode: Image.PreserveAspectFit // 设置图片的缩放模式为保持宽高比适应框架
                            source: weather_icon // 设置图片的来源为weather_icon
                            }

                            Text {
                                id: time_text
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.leftMargin: 12
                                anchors.top: parent.top

                                MouseArea {
                                   anchors.fill: parent
                                   drag.target: rect
                                   drag.axis: Drag.XAxis
                                   drag.minimumX: 0
                                   drag.maximumX: container.width - rect.width
                                }

                                font.pointSize: 11
                                color: "white"
                                text: qsTr(time)
                            }

                            Text {

                                font.pointSize: 11
                                color: "white"
                                text: qsTr(temp)

                                anchors.top: icon.bottom
                                anchors.left: parent.left
                                anchors.leftMargin: 14

                            }
                            width: (choice.width - 4 *parent.spacing) / 5
                            height: choice.height
                            color: "transparent"
                            DropShadow {
                                anchors.fill: icon
                                horizontalOffset: 3
                                verticalOffset: 3

                                radius: 5.0
                                spread :0.1
                                samples: 30
                                color: "#80000000"
                                source: icon
                            }
                        }
                    }
                    spacing: 10
                }
                color: "transparent"
                y: 98
                width: parent.width
                height: 46
            }

            Rectangle {
                id : v2
                width: parent.width - 30
                height: 1
                opacity:0.5
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y: 150
            }

            Rectangle {
                id: choice2

                MouseArea {
                   anchors.fill: parent
                   drag.target: rect
                   drag.axis: Drag.XAxis
                   drag.minimumX: 0
                   drag.maximumX: container.width - rect.width
                }
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 11
                anchors.rightMargin: 7
                Row {

                    Repeater {
                        model: weather_model2
                        Rectangle {
                            width: (choice2.width - 4 * parent.spacing) / 5
                            height: choice2.height
                            color: "transparent"
                            Image {
                                id: icon2
                                anchors.top: time_text2.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: 25

                                cache :true
                                smooth: true

                                fillMode: Image.PreserveAspectFit
                                source: weather_icon
                            }

                            Text {
                                id: time_text2

                                font.pointSize: 10
                                text: qsTr(time)

                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top
                                color: "white"
                                //cache :true
                                smooth: true

                            }

                            Text {
                                font.pointSize: 10
                                color: "white"
                                text: qsTr(temp)

                                anchors.top: icon2.bottom
                                anchors.left: parent.left
                                anchors.leftMargin: 14

                            }

                            DropShadow {
                                anchors.fill: icon2
                                horizontalOffset: 3
                                verticalOffset: 3

                                MouseArea {
                                   anchors.fill: parent
                                   drag.target: rect
                                   drag.axis: Drag.XAxis
                                   drag.minimumX: 0
                                   drag.maximumX: container.width - rect.width
                                }

                                radius: 5.0
                                spread :0.1
                                samples: 30
                                color: "#80000000"
                                source: icon2
                            }
                        }
                    }
                    spacing: 10
                }
                color: "transparent"
                anchors.top: v2.bottom
                anchors.topMargin: 11
                width: parent.width
                height: 46
            }
        }

        back:
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: 18

            TextField{
                id: text_new
                height: 27
                width: 42

                text: qsTr(command.city_name)
                font.pointSize: 11
                color: "black"
                focus: true

                MouseArea {
                   anchors.fill: parent
                   drag.target: rect
                   drag.axis: Drag.XAxis
                   drag.minimumX: 0
                   drag.maximumX: container.width - rect.width
                }

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: title_label.bottom
                anchors.topMargin: 5

            }

            Label {
                id: title_label
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y:81
                font.pointSize: 18
                text: qsTr("Please set your city")
            }      
        }

        transform: Rotation {
            id: rot
            origin.x: flipable.width >> 1
            origin.y: flipable.height >> 1
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        Item {
            id:root
            visible : false
            property alias text:label.text
            signal clicked // Declare a custom signal 'clicked'

            // A rectangle element that serves as the button UI
            Rectangle {
            id: button
            x: 12; y: 12
            width: 116; height: 26
            color: "lightsteelblue"
            border.color: "slategrey"

            Text {
            id: label
            anchors.centerIn: parent
            text: "Start"
            }

            // A MouseArea element that handles the button clicks
            MouseArea {
            anchors.fill: parent
            onClicked: {
            root.clicked() // Emit the 'clicked' signal when the button is clicked
            }
            }
            }

            Text {
            visible: false
            id: vv
            anchors.centerIn: parent
            text: "Start"
            }

            // A transitions element that contains various animations
            transitions: Transition {
            NumberAnimation { target: rot; property: "angle"; duration: 1 }
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            ColorAnimation { duration: 1000 }
            }

            // A Timer element that triggers the Weather API calls every second
            Timer {
            interval: 1000
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: {
            Weather.parse_JS_1()
            Weather.parse_JS_5()
            }
            }

            // A Connections element that listens to the 'onSetBtnClicked' signal from 'card_window'
            Connections {
            target: card_window
            onSetBtnClicked: {
            command.city_name = text_new.text
            Weather.setCityName(command.city_name)
            Weather.parse_JS_1()
            Weather.parse_JS_5()
            }
            }

            // A Component.onDestruction handler that logs the content of 'command.memo_all_txt' to the console
            Component.onDestruction: {
            var cnt=0;
            for(var i = 0; i < command.memo_all_txt.length; i++) {
            console.log(command.memo_all_txt[i]);
            }
            console.log("yessssssss!")
            }
        }
    }

    width: 240
    height: 240
}
