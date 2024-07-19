import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "script/my_f.js" as Weather

Rectangle {
    id: card_w1


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
        Weather.set_name(command.city_name)
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


        front:

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            Image {
                id: weather_icon

                anchors.left: temp_text.left
                cache :true
                smooth: true
                visible: true

                height: 18
                fillMode: Image.PreserveAspectFit
                source: city_W
                y: 66


            }

            Text {
                id: city_txt
                smooth: true

                font.pointSize: 11
                text: qsTr(command.city_name)

                anchors.left: parent.left
                anchors.leftMargin: 14
                y: 9
                color: "white"

                //cache :true

            }

            Text {
                id: temp_text
                font.pointSize: 28
                color: "white"
                text: qsTr(city_T)

                anchors.left: city_txt.left
                y: 15

            }

            Text {
                id: description_txt
                font.pointSize: 11
                color: "white"
                text: qsTr(city_D)

                y: 85
                anchors.left: weather_icon.left

            }

            Text {
                id:uu_txt
                color: "white"
                text: qsTr("气压:" + pressure + "&"+ "相对湿度:" + humidity)

                y: 94
                anchors.left: description_txt.left
                font.pointSize: 11

            }

            DropShadow {
                spread : 0.1
                radius: 5
                samples: 30
                color: "#80000000"
                source: weather_icon

                anchors.fill: weather_icon
                horizontalOffset: 3
                verticalOffset: 3

            }

        }

        back:

            // 创建一个矩形控件
            Rectangle {
            // 设置矩形控件填充父控件
                anchors.fill: parent
            // 设置矩形控件颜色为透明
                color: "transparent"
            // 设置矩形控件圆角半径为18
                radius: 18

            // 创建一个标签控件
                Label {
            // 设置标签控件的ID
                    id: title_set
            // 设置标签控件文本颜色为白色
                    color: "white"
            // 设置标签控件水平居中于父控件
                    anchors.horizontalCenter: parent.horizontalCenter
            // 设置标签控件垂直偏移量为24
                    y: 24
            // 设置标签控件文本字体大小为14
                    font.pointSize: 14
            // 设置标签控件文本内容
                    text: qsTr("Please set your city")
                }

            // 创建一个文本框控件
                TextField{
            // 设置文本框控件的ID
                    id: text_new
            // 设置文本框控件高度为27
                    height: 27
            // 设置文本框控件宽度为42
                    width: 42
            // 设置文本框控件背景为透明
            // background: transperent
            // 设置文本框控件启用缓存
            // cache :true
            // 设置文本框控件平滑处理
            smooth: true

            // 设置文本框控件水平居中于父控件
                    anchors.horizontalCenter: parent.horizontalCenter
            // 设置文本框控件顶部与标签控件底部对齐
                    anchors.top: title_set.bottom
            // 设置文本框控件与标签控件的垂直距离为5
                    anchors.topMargin: 5
            // 设置文本框控件的默认文本内容为当前城市名称
                    text: qsTr(command.city_name)
            // 设置文本框控件文本字体大小为11
                    font.pointSize: 11
            // 设置文本框控件文本颜色为黑色
                    color: "black"
            // 设置文本框控件获取焦点
                    //focus: true
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

        anchors.fill: parent
        property bool flipped: auto_break

        Text {
            visible: false
            id:vv
            anchors.centerIn: parent
            text: "Start"
        }

        transitions: Transition {
            NumberAnimation { target: rot; property: "angle"; duration: 1 }
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            ColorAnimation { duration: 1000 }
        }

        Timer {
            onTriggered: {
                Weather.set_name(command.city_name);
                Weather.parse_JS_1();
                Weather.parse_JS_5();
            }

            interval: 1000
            repeat: true
            running: true
            triggeredOnStart: true

        }

        Connections {
            target: card_window
            onSetBtnClicked: {
                command.city_name = text_new.text;
                Weather.set_name(command.city_name);
                Weather.parse_JS_1();
                Weather.parse_JS_5();
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

    width: 120
    height: 120
    radius: 0
    border.color: "#afb0b2"
    border.width: 0
}
