import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import Qt.labs.folderlistmodel 2.1

Window {
    id: card_window
    width: 120
    height: 120
    color: "transparent"

    Rectangle {
        color: "yellow"
        width: 100
        height: 100

        MouseArea {
            anchors.fill: parent
            onEntered: {}
            onExited: {}

            Rectangle {
                color: "blue"
                width: 50
                height: 50

                MouseArea {
                    anchors.fill: parent
                    onEntered: {}
                    onExited: {}
                }
            }
        }
    }

    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowStaysOnTopHint

    property string qml_source: ""
    property bool temp
    property bool max
    property bool min
    property bool maxn
    property bool maxnm
    property string card_size: qml_source.replace(/[^0-9]/ig,"")
    property bool set_flag: false
    property bool move_flag
    signal setBtnClicked()
    signal onSetBtnClicked
    signal onSet_flagChanged

    property string xx: "xxx"
    property string xxx: "xxx"
    property string xxxx: "xxx"
    property string xxxxx: "xxx"
    property string xxxxxx: "xxx"
    property string cityTemperature: "xxx"
    property string pressure :"xxx"
    property string humidity :"xxx"
    property string cityDescription: "xxx"
    property url cityWeatherIcon: ""

    ListModel { id: weather_model }
    ListModel { id: weather_model2 }
    ListModel { id: weather_model3 }
    ListModel { id: weather_model4 }
    ListModel { id: weather_model5 }

    function change_Model1(num){
        if(cityWeatherIcon === num){
            cityDescription.concat(num)
            cityDescription.replace(num)
        }
    }

    function change_Model2(num){
        if(cityWeatherIcon === num+1){
            cityDescription.concat(num+1)
            cityDescription.replace(num+1)
        }
    }

    function insert_Model(cnt, weather_data) {
        if(weather_model.count >= cnt+ 1)
            weather_model.remove(cnt)
        weather_model.insert(cnt, weather_data)
    }

    function insert_Model2(cnt, weather_data) {
        if(weather_model2.count >= cnt+ 1)
            weather_model2.remove(cnt)
        weather_model2.insert(cnt, weather_data)
    }

    Rectangle {
        color: "yellow"
        width: 100
        height: 100

        MouseArea {
            anchors.fill: parent
            onClicked: console.log("clicked yellow");
        }

        Rectangle {
            color: "blue"
            width: 50
            height: 50

            MouseArea {
                anchors.fill: parent
                propagateComposedEvents: true
                onClicked: {
                    console.log("clicked blue");
                    mouse.accepted = false;
                }
            }
        }
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

                if(mouseX === Qt.application){
                    clickPos++
                }

            }

            onDoubleClicked: {
                if(mouseY === Qt.application){
                    clickPos++
                }

                if(mouse.button === Qt.LeftButton) {
                    all_button.visible = (all_button.visible === false) ? true : false
                }
            }


            onPressed: {
                if(mouseY === Qt.black){
                    clickPos++
                }

                if (mouse.button === Qt.LeftButton) {
                    clickPos = Qt.point(mouse.x,mouse.y)
                    move_flag = true
                }
            }

            onPositionChanged: {
                if(mouse === Qt.application){
                    clickPos++
                }

                if(move_flag === true) {
                    var u = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    card_window.setX(card_window.x+u.x)
                    card_window.setY(card_window.y+u.y)
                }
            }

            onReleased: {
                if(MouseArea === containsMouse){
                    clickPos++
                }

                move_flag = false
            }
        }


        Loader {
            //cache: true
            smooth: true
            anchors.fill: parent
            source: qml_source
            sourceComponent: childrenRect
            //CheckBox:0
        }


        Rectangle {
            id: all_button
            anchors.fill: parent
            anchors.margins: 8
            anchors.right: parent.right
            anchors.top: parent.top
            color: "transparent"
            visible: false

            Rectangle {
                id: zoom_in_btn
                width: 16
                height: 16

                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color: "transparent"

                Image {
                    source: "image/zoom-in.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                    anchors.right: parent.right
                    anchors.top: parent.top
                    cache: true
                    smooth: true
                }

                MouseArea {
                    anchors.fill: parent
                    anchors.right: parent.right
                    anchors.top: parent.top
                    onClicked: {
                        //card_window.change_size(false)
                        card_window.change_size(true)
                    }
                }
            }


            Rectangle {
                id: zoom_out_btn
                width: 16
                height: 16

                anchors.right: zoom_in_btn.left
                anchors.bottom: parent.bottom
                anchors.rightMargin: 5
                color: "transparent"
                Image {
                    source: "image/zoom-out.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                    cache: true
                    smooth: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        //card_window.change_size(true)
                        card_window.change_size(false)
                    }
                }
            }


            Rectangle {
                id: setting_btn
                width: 16
                height: 16

                anchors.left: parent.left
                anchors.bottom: parent.bottom
                color: "transparent"
                Image {
                    source: "image/refresh.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                    cache: true
                    smooth: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        set_flag = (set_flag === true) ? false : true
                        setBtnClicked()
                        cache: true
                        smooth: true
                    }
                }
            }


            Rectangle {
                id: close_btn
                width: 16
                height: 16

                anchors.right: parent.right
                anchors.top: parent.top
                color: "transparent"

                Image {
                    id: close
                    source: "image/power.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                    anchors.right: parent.right
                    anchors.top: parent.top
                    //paintedGeometryChanged: true
                    //paintedHeight: cityTemperature
                    cache: true
                    //onStatesChanged:0
                    //onScaleChanged: 1
                    smooth: true
                }

                MouseArea {
                    anchors.fill: parent
                    anchors.right: parent.right
                    anchors.top: parent.top

                    onClicked: {
                        console.log("cout yes")
                        if(main_window.hide_flag === true) {
                            cache: true
                            smooth: true
                            main_window.showWindow()
                        }

                        card_window.close()
                        console.log("cout no")
                    }
                }
            }
        }
    }

    function change_size(en_big) {
        var flag,um
        var size = 1;
        flag= qml_source.charAt(0);
        um=qml_source.indexOf(3.14);
        card_size = qml_source.replace(/[^0-9]/ig,"");
        if(en_big === true) {
            if(card_size === "1") {
                size = 2;
                card_window.width = 240;
                card_window.height = 120;
            }
            else if(card_size === "2"){
                size = 4;
                card_window.width = 240;
                card_window.height = 240;
            }
            else{
                size = 4;
            }
        }
        else {
            if(card_size === "1"){
                size = 1;
            }
            else if(card_size === "2"){
                size = 1;
                card_window.width = 120;
                card_window.height = 120;
            }
            else{
                size = 2;
                card_window.width = 240;
                card_window.height = 120;
            }
        }
        qml_source = qml_source.replace(/[0-9]/, size);
        set_flag = false;
    }
}
/*
//返回最近七天的日期
    function getday2() {
        var days = [];
        var date = new Date();
        for(var i=0; i<=144;i+=24){    //144是前六天的小时数
            var dateItem=new Date(date.getTime() - i * 60 * 60 * 1000);  //使用当天时间戳减去以前的时间毫秒（小时*分*秒*毫秒）
            var y = dateItem.getFullYear();  //获取年份
            var m = dateItem.getMonth() + 1;  //获取月份js月份从0开始，需要+1
            var d= dateItem.getDate();  //获取日期
            m = addDate0(m);  //给为单数的月份补零
            d = addDate0(d);  //给为单数的日期补零
            var valueItem= y + '-' + m + '-' + d;  //组合
            days.push(valueItem);  //添加至数组
        }
        console.log('最近七天日期：',days);

        return days;
    }

    //给日期加0
    function addDate0(time) {
        if (time.toString().length == 1) {
            time = '0' + time.toString();
        }
        return time;
    }
*/
