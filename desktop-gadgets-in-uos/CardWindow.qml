import QtQuick 2.11
import QtQuick.Window 2.11

Window {
    id: card_window
    width: 120
    height: 120
    color: "transparent"


    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowStaysOnTopHint

    property string qml_source: "Weather1.qml"
    property bool move_flag: false
    property string card_size: qml_source.replace(/[^0-9]/ig,"")
    property bool set_flag: false
    signal setBtnClicked()


    property string cityTemperature: "N/A"
    property string pressure :"N/A"
    property string humidity :"N/A"
    property string cityDescription: "-------"
    property url cityWeatherIcon: ""
    ListModel { id: weather_model }
    ListModel { id: weather_model2 }
    function insertWeatherModel(index, weather_data) {
        if(weather_model.count >= index + 1)
            weather_model.remove(index)
        weather_model.insert(index, weather_data)
    }
    function insertWeatherModel2(index, weather_data) {
        if(weather_model2.count >= index + 1)
            weather_model2.remove(index)
        weather_model2.insert(index, weather_data)
    }
    Item {
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            property point clickPos: "0,0"
            onClicked: {
                if (mouse.button === Qt.RightButton) {
                    if(main_window.hide_flag === false) main_window.hideWindow()
                    else  main_window.showWindow()
                }
            }

            onDoubleClicked: {
                if(mouse.button === Qt.LeftButton) {
                    size_button.visible = (size_button.visible === false) ? true : false
                }
            }


            onPressed: {
                if (mouse.button === Qt.LeftButton) {
                    clickPos = Qt.point(mouse.x,mouse.y)
                    move_flag = true
                }
            }

            onPositionChanged: {
                if(move_flag === true) {

                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    card_window.setX(card_window.x+delta.x)
                    card_window.setY(card_window.y+delta.y)
                }
            }

            onReleased: {
                move_flag = false
            }
        }


        Loader {
            anchors.fill: parent
            source: qml_source
            z: 0
        }


        Rectangle {
            id: size_button
            anchors.fill: parent
            anchors.margins: 8
            color: "transparent"
            visible: false
            z: 1


            Rectangle {
                id: zoom_in_btn
                width: 16
                height: width
                radius: width/2
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color: "transparent"
                Image {
                    source: "image/zoom-in.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        card_window.changeCardSize(true)
                    }
                }
            }


            Rectangle {
                id: zoom_out_btn
                width: 16
                height: width
                radius: width/2
                anchors.right: zoom_in_btn.left
                anchors.bottom: parent.bottom
                anchors.rightMargin: 5
                color: "transparent"
                Image {
                    source: "image/zoom-out.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("rec click")
                        card_window.changeCardSize(false)
                    }
                }
            }


            Rectangle {
                id: setting_btn
                width: 16
                height: width
                radius: width/2
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                color: "transparent"
                Image {
                    source: "image/refresh.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        set_flag = (set_flag === true) ? false : true
                        setBtnClicked()
                        console.log("setting click", set_flag)
                    }
                }
            }


            Rectangle {
                id: close_btn
                width: 16
                height: width
                radius: width/2
                anchors.right: parent.right
                anchors.top: parent.top
                color: "transparent"
                Image {
                    id: close
                    source: "image/power.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("close click", card_count)
                        if(card_count === 1 && main_window.hide_flag === true) {
                            main_window.showWindow()
                        }
                        card_count --
                        console.log("cc:", card_count)
                        card_window.close()
                    }
                }
            }
        }
    }
    function changeCardSize(zoom_in) {
        var next_size = 1;

        card_size = qml_source.replace(/[^0-9]/ig,"");
        if(zoom_in === true) {

            switch(card_size) {
            case "1":
                next_size = 2;
                card_window.width = 240;
                card_window.height = 120;
                break;
            case "2":
                next_size = 4;
                card_window.width = 240;
                card_window.height = 240;
                break;
            case "4": next_size = 4; break;
            default: break;
            }
        } else {
            switch(card_size) {
            case "1":
                next_size = 1;
                break;
            case "2":
                next_size = 1;
                card_window.width = 120;
                card_window.height = 120;
                break;
            case "4":
                next_size = 2;
                card_window.width = 240;
                card_window.height = 120;
                break;
            default: break;
            }
        }

        qml_source = qml_source.replace(/[0-9]/, next_size);
        set_flag = false;
    }
}
