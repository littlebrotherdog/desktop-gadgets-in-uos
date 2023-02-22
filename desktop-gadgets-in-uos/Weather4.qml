import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "script/weather.js" as Weather

Rectangle {
    id: card_w4
    width: 240
    height: 240

    gradient:Gradient {
        GradientStop {position: 0.0; color: "#8A2BE2"}
        GradientStop {position: 1.0; color: "#FF69B4"}
    }

    Component.onCompleted: {
        Weather.setCityName(settings.city_name)
        Weather.parseJSON()
        Weather.parseJSON5Days()
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
                    anchors.bottom: disciption_text.top
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    visible: false
                }

                DropShadow {
                    anchors.fill: weather_logo
                    horizontalOffset: 3
                    verticalOffset: 3
                    spread :0.1
                    radius: 5
                    samples: 30
                    color: "#80000000"
                    source: weather_logo
                }

                Text {
                    id: disciption_text
                    anchors.bottom: high_low_temp_text.top
                    anchors.right: weather_logo.right
                    font.pointSize: 10
                    color: "white"
                    text: qsTr(cityDescription)
                }

                Text {
                    id: high_low_temp_text
                    anchors.bottom: temp_text.bottom
                    anchors.right: parent.right
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 10
                    font.pointSize: 10
                    color: "white"
                    text: qsTr("气压:" + pressure + "&"+ "相对湿度:" + humidity)
                }


            Rectangle {
                id: line1
                width: parent.width - 30
                height: 1
                opacity: 0.5
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y: 85
                anchors.topMargin: 20
            }

            Rectangle {
                id: row_rect
                color: "transparent"
                y: 95
                width: parent.width
                height: 48
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 10
                anchors.rightMargin: 8
                Row {
                    spacing: 10
                    Repeater {
                        model: weather_model
                        Rectangle {
                            width: (row_rect.width - 5*parent.spacing) / 6
                            height: row_rect.height
                            color: "transparent"

                            Text {
                                id: time_text
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top
                                font.pointSize: 10
                                color: "white"
                                text: qsTr(time)
                            }

                            Image {
                                id: icon
                                anchors.top: time_text.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: 16
                                fillMode: Image.PreserveAspectFit
                                source: weather_icon
                            }

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

                            Text {
                                anchors.top: icon.bottom
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                font.pointSize: 10
                                color: "white"
                                text: qsTr(temp)
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: line2
                width: parent.width - 30
                height: 1
                opacity:0.5
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y: 150
            }

            Rectangle {
                id: row_rect2
                color: "transparent"
                anchors.top: line2.bottom
                anchors.topMargin: 10
                width: parent.width
                height: 48
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 10
                anchors.rightMargin: 8
                Row {
                    spacing: 10
                    Repeater {
                        model: weather_model2
                        Rectangle {
                            width: (row_rect2.width - 4*parent.spacing) / 5
                            height: row_rect2.height
                            color: "transparent"

                            Text {
                                id: time_text2
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top
                                color: "white"
                                font.pointSize: 10
                                text: qsTr(time)
                            }

                            Image {
                                id: icon2
                                anchors.top: time_text2.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: 24
                                fillMode: Image.PreserveAspectFit
                                source: weather_icon
                            }

                            DropShadow {
                                anchors.fill: icon2
                                horizontalOffset: 3
                                verticalOffset: 3
                                radius: 5.0
                                spread :0.1
                                samples: 30
                                color: "#80000000"
                                source: icon2
                            }

                            Text {
                                anchors.top: icon2.bottom
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                font.pointSize: 10
                                color: "white"
                                text: qsTr(temp)
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
                id: title_label
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                y:80
                font.pointSize: 18
                text: qsTr("Please set your city")
            }

            TextEdit {
                id: text_edit
                width: contentWidth
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: title_label.bottom
                anchors.topMargin: 10
                text: qsTr(settings.city_name)
                font.pointSize: 14
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
                Weather.parseJSON5Days()
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
