import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0


Window {
    id: main_window
    visible: true
    width: 248
    height: 96
    x: 240
    y: 120
    title: qsTr("desktop-gadgets-in-uos")

    property int card_hope: 0
    property int card_innocence: 0
    property bool hide_flag: false
    property var memo: []
    property var cold_list_temp: []
    property var list_temp: []
    property var circle_temp: []
    property var memo_my_birth: []
    signal memoDataChanged()

    Item {
        id:root
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

    Panel {
        id: panel
        x: 0
        y: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }

    Text { // text changes when button was clicked
            id: text1
            x: 12;
            y: 76
            width: 116;
            height: 26
            text: ""
            horizontalAlignment: Text.AlignHCenter
    }

    function hideWindow() {
        main_window.width = 0
        main_window.height = 0
        main_window.hide_flag = true
    }

    function showWindow() {
        main_window.width = 320
        main_window.height = 240
        main_window.hide_flag = false
    }

    function clearWindow() {
        main_window.width --
        main_window.height --
    }

    Settings {
    id: command
    fileName: "./command.ini"
    property int test1: 110
    property int test2: 110
    property int test3: 110
    property int test4: 110
    property int test5: 110

    property string timer_word: "3月21日,OPPO发布FindX6系列手机。"
    property string timer_txt: "同俄罗斯总统普京举行会谈。"
    property string timer_demo: "这些“红尘”暴露在环境中，会对人体健康和周围环境构成威胁。"


    property var memo_all_txt: [{mText: qsTr("人生如弈棋，一步失误，全盘皆输，这是令人悲哀之事；而人生还不如弈棋，不可能再来一局，也不能悔棋。")},
                                  {mText: qsTr("One day, in retrospect, the years of struggle will strike you as the most beautiful.")}]

    property string city_name: qsTr("北京市")
}
    Component.onCompleted: {
        cache: true
        smooth: true
        for(var i = 0; i < command.memo_all_txt.length; i++) {
            memo_my_birth.push(command.memo_all_txt[i]);
        }

    }
    Component.onDestruction: {
        cache: true
        smooth: true
        var cnt=0;
        for(var i = 0; i < command.memo_all_txt.length; i++) {
            console.log(command.memo_all_txt[i]);
        }
        console.log("yessssssss!")
    }
}
