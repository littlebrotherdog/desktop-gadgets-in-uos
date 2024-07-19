import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import "script/logic.js" as Logic


Window {
    id: main_window
    // 窗口可见
    visible: true
    // 窗口宽度
    width: 248
    // 窗口高度
    height: 96
    // 窗口在屏幕上的x坐标
    x: 240
    // 窗口在屏幕上的y坐标
    y: 120
    // 窗口标题
    title: qsTr("desktop-gadgets-in-uos")
    MouseArea{
         anchors.fill: parent
         onClicked: {
            is_2048.visible=true
        }
    }

    My2048 {
           id :is_2048
           visible: false
           width: 248
           // 窗口高度
           height: 96
           // 窗口在屏幕上的x坐标
           x: 240
           // 窗口在屏幕上的y坐标
           y: 120
           title: qsTr("2048")
    }


    // 定义属性
    // 下面是一些自定义的属性
    // 注意：这些属性需要在窗口中定义，才能在窗口的其它元素中使用
    property int card_hope: 0
    property int card_innocence: 0
    property bool hide_flag: false
    property var memo: []
    property var cold_list_temp: []
    property var list_temp: []
    property var circle_temp: []
    property var memo_my_birth: []
    // 定义信号，用于在属性变化时发出通知
    signal memoDataChanged()
    signal is_2048()

    // 窗口中包含的元素
    Item {
    id: root // Item元素的id
    // 将text属性与label元素的text属性绑定
    property alias text: label.text
    // 定义clicked信号，表示按钮被点击
    signal clicked

    Rectangle {
    // 定义矩形元素
    id: button // 矩形的id
    x: 12 // 矩形的x坐标
    y: 12 // 矩形的y坐标
    width: 116 // 矩形的宽度
    height: 26 // 矩形的高度
    color: "lightsteelblue" // 矩形的颜色
    border.color: "slategrey" // 矩形的边框颜色

    Text {
    // 定义文本元素
    id: label // 文本元素的id
    anchors.centerIn: parent // 文本元素在矩形中居中
    text: "Start" // 文本元素的文本内容
    }

    MouseArea {
    // 定义鼠标事件区域
    anchors.fill: parent // 鼠标事件区域填充整个矩形
    onClicked: {
    root.clicked() // 点击事件触发clicked信号
    }
    }
    }
    }

    Panel {
    // 定义Panel元素
    id: panel // Panel元素的id
    x: 0 // Panel元素的x坐标
    y: 0 // Panel元素的y坐标
    anchors.rightMargin: 0 // Panel元素与右侧边缘的距离
    anchors.bottomMargin: 0 // Panel元素与底部边缘的距离
    anchors.leftMargin: 0 // Panel元素与左侧边缘的距离
    anchors.topMargin: 0 // Panel元素与顶部边缘的距离
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

    // 定义一个 Settings 组件
    Settings {
    id: command // 组件的 ID
    fileName: "./command.ini" // 文件名属性
    property int test1: 110 // 自定义属性1，初始值为110
    property int test2: 110 // 自定义属性2，初始值为110
    property int test3: 110 // 自定义属性3，初始值为110
    property int test4: 110 // 自定义属性4，初始值为110
    property int test5: 110 // 自定义属性5，初始值为110

    // 计时器文字属性，初始值为 "3月21日,OPPO发布FindX6系列手机。"
    property string timer_word: "3月21日,OPPO发布FindX6系列手机。"
    // 计时器提示文字属性，初始值为 "同俄罗斯总统普京举行会谈。"
    property string timer_txt: "同俄罗斯总统普京举行会谈。"
    // 计时器演示文字属性，初始值为 "这些“红尘”暴露在环境中，会对人体健康和周围环境构成威胁。"
    property string timer_demo: "这些“红尘”暴露在环境中，会对人体健康和周围环境构成威胁。"

    // 备忘录内容属性，初始值为包含两个对象的数组，每个对象有一个 mText 属性
    property var memo_all_txt: [{mText: qsTr("人生如弈棋，一步失误，全盘皆输，这是令人悲哀之事；而人生还不如弈棋，不可能再来一局，也不能悔棋。")},
    {mText: qsTr("One day, in retrospect, the years of struggle will strike you as the most beautiful.")}]

    property string city_name: qsTr("北京市") // 城市名称属性，初始值为 "北京市"


    Component.onCompleted: {
        cache: true // 启用缓存
        smooth: true // 启用平滑过渡
        for(var i = 0; i < command.memo_all_txt.length;i++) {
            memo_my_birth.push(command.memo_all_txt[i]); // 将备忘录内容添加到 memo_my_birth 数组中
        }
    }

    Component.onDestruction: {
        cache: true // 启用缓存
        smooth: true // 启用平滑过渡
        var cnt=0;
        for(var i = 0; i < command.memo_all_txt.length; i++) {
            console.log(command.memo_all_txt[i]); // 输出备忘录内容
        }
        console.log("yessssssss!") // 输出确认信息
        }
    }
}
