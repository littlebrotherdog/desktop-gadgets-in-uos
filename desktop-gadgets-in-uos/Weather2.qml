import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "script/my_f.js" as Weather

Rectangle {
    id: card_w2
    width: 240
    height: 120
    radius: 0
    border.color: "#afb0b2"
    border.width: 0

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
        anchors.fill: parent
        property bool flipped: set_flag

        front:

        Rectangle {
            anchors.fill: parent
            radius: 18
            color: "transparent"
            Text {
                id: city_txt
                anchors.left: parent.left
                anchors.leftMargin: 15
                y: 10
                color: "white"
                font.pointSize: 10
                text: qsTr(command.city_name)
            }

            Text {
                id: temp_text
                anchors.left: city_txt.left
                y: 16
                font.pointSize: 28
                color: "white"
                text: qsTr(cityTemperature)
            }

            Image {
                id: weather_icon
                height: 16
                fillMode: Image.PreserveAspectFit
                source: cityWeatherIcon

                MouseArea{
                    cursorShape: Qt.IBeamCursor
                    acceptedButtons: Qt.NoButton
                }

                anchors.bottom: description_text.top
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 15
                visible: false
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

            Text {
                id: description_text
                anchors.bottom: new_text.top
                anchors.right: weather_icon.right
                font.pointSize: 10
                color: "white"
                text: qsTr(cityDescription)
            }

            Text {
                id: new_text
                anchors.bottom: temp_text.bottom
                anchors.right: parent.right
                anchors.bottomMargin: 0
                anchors.rightMargin: 10
                font.pointSize: 10
                color: "white"
                text: qsTr("气压:" + pressure + "&"+ "相对湿度:" + humidity)
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
                    spacing: 10
                    Repeater {
                        model: weather_model
                        Rectangle {
                            width: (row_rect.width - 4 *parent.spacing) / 5
                            height: row_rect.height
                            color: "transparent"

                            Text {
                                id: time_txt
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top
                                font.pointSize: 10
                                color: "white"
                                text: qsTr(time)
                            }

                            Image {
                                id: pic
                                anchors.top: time_txt.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: 16

                                cache :true
                                smooth: true
                                visible: true

                                fillMode: Image.PreserveAspectFit
                                source: weather_icon
                            }

                            DropShadow {
                                anchors.fill: pic
                                horizontalOffset: 3
                                verticalOffset: 3
                                radius: 5.0
                                spread :0.1
                                samples: 30
                                color: "#80000000"
                                source: pic
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
                y:24
                font.pointSize: 14
                text: qsTr("Please set your city")
            }

            TextField{
                id: text_new
                height: 27
                width: 42
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter:parent.verticalCenter

                MouseArea{
                    cursorShape: Qt.IBeamCursor
                    acceptedButtons: Qt.NoButton
                }

                anchors.top: title_set.bottom
                anchors.topMargin: 5
                text: qsTr(command.city_name)
                font.pointSize: 10

                // cache :true
                smooth: true
                visible: true

                color: "black"
                focus: true
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

        states: State {
            name: "back"
            PropertyChanges {
                target: rot;
                angle: 180
            }
            when: flipable.flipped
        }

        Text {
            visible: false
            id:vv
            anchors.centerIn: parent
            text: "Start"
        }

        transitions: Transition {
            /*MouseArea{
                cursorShape: Qt.IBeamCursor
                acceptedButtons: Qt.NoButton
            }*/
            NumberAnimation { target: rot; property: "angle"; duration: 1 }
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            ColorAnimation { duration: 1000 }
        }

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

        Connections {
            target: card_window
            onSetBtnClicked: {
                command.city_name = text_new.text
                MouseArea:{
                    cursorShape: Qt.IBeamCursor
                    acceptedButtons: Qt.NoButton
                }
                Weather.setCityName(command.city_name)
                Weather.parse_JS_1()
                Weather.parse_JS_5()
            }
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
