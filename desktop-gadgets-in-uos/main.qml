import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0

Window {
    id: main_window
    visible: true
    width: 248
    height: 96
    x: settings.window_x
    y: settings.window_y
    title: qsTr("desktop-gadgets-in-uos")

    property int card_count: 0
    property bool hide_flag: false

    property var memo_text_list_temp: []

    signal memoDataChanged()

    Settings {
        id: settings
        fileName: "./settings.ini"
        property int test1: 110
        property int test2: 110
        property int test3: 110
        property int test4: 110
        property int test5: 110
        property int window_x: 120
        property int window_y: 120
        property string timer_word: "你的眼睛疲倦了累了,闭上你的眼睛。"


        property var memo_text_list: [{mText: qsTr("人生如弈棋，一步失误，全盘皆输，这是令人悲哀之事；而人生还不如弈棋，不可能再来一局，也不能悔棋。")},
                                      {mText: qsTr("One day, in retrospect, the years of struggle will strike you as the most beautiful.")}]

        property string city_name: qsTr("北京市")
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

    Component.onCompleted: {
        for(var i = 0; i < settings.memo_text_list.length; i++) {
            memo_text_list_temp.push(settings.memo_text_list[i]);
        }
    }
}
