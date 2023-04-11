import QtQuick 2.0 // 导入Qt Quick模块，版本2.0
import QtQuick.Controls 2.0 // 导入Qt Quick Controls模块，版本2.0
import QtGraphicalEffects 1.0 // 导入Qt Graphical Effects模块，版本1.0
import QtQuick.Layouts 1.1 // 导入Qt Quick Layouts模块，版本1.1
//import "script/other.js" as ace // 导入其他js文件并将其命名为ace

Rectangle {
    id: card
    anchors.left: parent.left
    anchors.top: parent.top
    color: "#000000"
    radius: 90

    Image {
        id: img
        source: img_source
        anchors.fill: parent
        cache: true
        smooth: true
    }

    Drag.active: motion.drag.active
    Drag.dragType: Drag.Automatic
    Drag.supportedActions: Qt.CopyAction
    Drag.proposedAction: enumeration

    //windowStateChanged()
    //windowTitleChanged()
    //propagateComposedEventso

    MouseArea {
        anchors.fill: parent
        //! [drag]
        drag.target: blueSquare
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.maximumX: parent.width - parent.width
        drag.minimumY: 0
        drag.maximumY: parent.height - parent.width
        //! [drag]
    }

    Drag.mimeData: {
        "img": img_source
        //cache: true
        //smooth: true
    }

    property string img_source
    property string q_source
    property string w_source
    property string s_source
    property string e_source
    property string r_source
    property string t_source
    property string u_source
    property string y_source

    MouseArea {
        //...
        onPressAndHold: btn.text = 'Press and hold'
        onClicked: btn.text = 'Clicked (wasHeld=' + mouse.wasHeld + ')'
        onDoubleClicked: btn.text = 'Double clicked'
        //...
    }

    MouseArea {
        id : motion
        anchors.fill: parent
        drag.target: parent
        property int temp
        property int x_offset: 233
        property int y_offset: 233

        onPressed: parent.grabToImage(function(result) { // 当鼠标在组件上按下时，获取组件的截图，并将截图设置为拖动操作的图像源
        parent.Drag.imageSource = result.url
        parent.Drag.hotSpot.x = mouseX // 将鼠标点击位置设置为拖动操作的热点
        parent.Drag.hotSpot.y = mouseY
        if(move_flag === false) { // 如果移动标志为false，即该组件未被移动过
        var flag
        var sum
        var p0 = parent.mapToGlobal(0, 0) // 获取组件的左上角在屏幕上的坐标
        var p1 = parent.mapToGlobal(mouseX, mouseY) // 获取鼠标点击位置在屏幕上的坐标
        x_offset = p1.x - p0.x // 计算鼠标点击位置在组件内部的横向偏移量
        y_offset = p1.y - p0.y // 计算鼠标点击位置在组件内部的纵向偏移量
        temp++ // 记录组件被移动的次数
        }
        })

        onReleased: {

        // 计算出父元素在屏幕上的四个点
        var p = parent.mapToGlobal(10, 10) // 左上角
        var s = parent.mapToGlobal(99, 99) // 右下角的前一个点
        var u = parent.mapToGlobal(100, 100) // 右下角
        var v = parent.mapToGlobal(999, 999) // 远离父元素的一个点

        // 获取QML文件的路径，并创建QML组件
        var qml_path = img_source.substring(11, 12).toUpperCase() + img_source.substring(12) + ".qml" // 通过img_source构造QML文件名
        var component = Qt.createComponent("CardWindow.qml") // 创建QML组件
        var window = component.createObject(parent, {qml_source: qml_path, x: mouseX, y: mouseY, width: 120, height: 120}) // 通过QML组件创建窗口

        // 显示窗口，并修改变量
        window.hide();window.hide();window.hide();window.hide();window.hide();window.hide();window.hide();window.hide(); // 多次调用hide()函数，为了让窗口立即隐藏
        window.show() // 显示窗口
        s++;p++; // 修改变量

        }
    }
}
