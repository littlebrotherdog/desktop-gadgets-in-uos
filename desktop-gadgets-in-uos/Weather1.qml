import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "script/weather.js" as Weather

Rectangle {
    id: card_w1
    width: 120
    height: 120
    radius: 0
    border.color: "#afb0b2"
    border.width: 0

    gradient:Gradient {
        GradientStop {position: 0.0; color: "#8A2BE2"}
        GradientStop {position: 1.0; color: "#FF69B4"}
    }

    Component.onCompleted: {
        Weather.setCityName(settings.city_name)
        Weather.parseJSON()
    }

    Flipable {
        id: flipable
        anchors.fill: parent
        property bool flipped: set_flag


        front:

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            Text {
                id: city_name_text
                anchors.left: parent.left
                anchors.leftMargin: 15
                y: 10
                color: "white"
                font.pointSize: 10
                text: qsTr(settings.city_name)
            }

            Text {
                id: temp_text
                anchors.left: city_name_text.left
                y: 16
                font.pointSize: 28
                color: "white"
                text: qsTr(cityTemperature)
            }

            Image {
                id: weather_logo
                height: 16
                fillMode: Image.PreserveAspectFit
                source: cityWeatherIcon
                y: 68
                anchors.left: temp_text.left
                visible: true
            }

            DropShadow {
                anchors.fill: weather_logo
                horizontalOffset: 3
                verticalOffset: 3
                spread : 0.1
                radius: 5
                samples: 30
                color: "#80000000"
                source: weather_logo
            }

            Text {
                id: disciption_text
                y: 85
                anchors.left: weather_logo.left
                font.pointSize: 10
                color: "white"
                text: qsTr(cityDescription)
            }

            Text {
                y: 94
                anchors.left: disciption_text.left
                font.pointSize: 10
                color: "white"
                text: qsTr("气压:" + pressure + "&"+ "相对湿度:" + humidity)
            }
        }

        back:

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: 18

            Label {
                id: title_label
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y:24
                font.pointSize: 14
                text: qsTr("Please set your city")
            }

            TextEdit {
                id: text_edit
                width: contentWidth
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: title_label.bottom
                anchors.topMargin: 5
                text: qsTr(settings.city_name)
                font.pointSize: 10
                color: "white"
                focus: true
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

        Timer {
            interval: 1000
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: {
                Weather.parseJSON()
            }
        }

        Connections {
            target: card_window
            onSetBtnClicked: {
                settings.city_name = text_edit.text
                Weather.setCityName(settings.city_name)
                Weather.parseJSON()
            }
        }
    }
}
