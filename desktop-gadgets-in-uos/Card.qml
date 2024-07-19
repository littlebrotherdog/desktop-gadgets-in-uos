import QtQuick 2.0 // 导入Qt Quick模块，版本2.0
import QtQuick.Controls 2.0 // 导入Qt Quick Controls模块，版本2.0
import QtGraphicalEffects 1.0 // 导入Qt Graphical Effects模块，版本1.0
import QtQuick.Layouts 1.1 // 导入Qt Quick Layouts模块，版本1.1
//import "script/other.js" as ace // 导入其他js文件并将其命名为ace

Rectangle {
    // id: card是一个自定义的组件，包含一张图片和可以拖动的功能
    id: card
    anchors.left: parent.left // 将组件的左边界固定在父组件的左边界上
    anchors.top: parent.top // 将组件的顶部固定在父组件的顶部上
    color: "#000000" // 设置组件的背景色为黑色
    radius: 90 // 设置组件的圆角半径为90

        Image {
            id: img
            source: img_source // 绑定图片的来源为img_source属性
            anchors.fill: parent // 将图片填充整个组件
            cache: true // 启用缓存
            smooth: true // 启用平滑处理
        }

        Drag.active: motion.drag.active // 将拖动动作与motion.drag.active属性绑定，实现拖动操作
        Drag.dragType: Drag.Automatic // 设置拖动类型为自动
        Drag.supportedActions: Qt.CopyAction // 设置支持的拖放操作为复制
        //Drag.proposedAction: enumeration // 枚举拖动操作的预设行为

    MouseArea {
        anchors.fill: parent // 将鼠标区域填充整个组件
    //! [drag]
        //drag.target: blueSquare // 设置拖动操作的目标为blueSquare
        drag.axis: Drag.XAndYAxis // 设置拖动的坐标轴为X和Y轴
        drag.minimumX: 0 // 设置X轴拖动的最小值为0
        drag.maximumX: parent.width - parent.width // 设置X轴拖动的最大值为parent.width - parent.width
        drag.minimumY: 0 // 设置Y轴拖动的最小值为0
        drag.maximumY: parent.height - parent.width // 设置Y轴拖动的最大值为parent.height - parent.width
    //! [drag]
    }

    Drag.mimeData: {
    "img": img_source // 设置拖放的mime数据为img_source
    //cache: true
    //smooth: true
    }

    property string img_source // 设置图片来源的属性为img_source
    property string q_source // 设置q_source属性
    property string w_source // 设置w_source属性
    property string s_source // 设置s_source属性
    property string e_source // 设置e_source属性
    property string r_source // 设置r_source属性
    property string t_source // 设置t_source属性
    property string u_source // 设置u_source属性
    property string y_source // 设置y_source属性

    MouseArea {
    //...
    onPressAndHold: btn.text = 'Press and hold' // 当鼠标按下并且长按时，设置btn的文本为“Press and hold”
    onClicked: btn.text = 'Clicked (wasHeld=' + mouse.wasHeld + ')' // 当鼠标单击时，设置btn的文本为“Clicked (wasHeld=true/false)”
    onDoubleClicked: btn.text ='Double clicked' // 当鼠标双击时，设置btn的文本为“Double clicked”
    //...
    }

    MouseArea {
        id : motion
        anchors.fill: parent
        drag.target: parent
        property int temp
        property int x_os: 233
        property int y_os: 233

        onPressed: parent.grabToImage(function(result) { // 当鼠标在组件上按下时，获取组件的截图，并将截图设置为拖动操作的图像源
        parent.Drag.imageSource = result.url
        parent.Drag.hotSpot.x = mouseX // 将鼠标点击位置设置为拖动操作的热点
        parent.Drag.hotSpot.y = mouseY
            if(move_flag === false) { // 如果移动标志为false，即该组件未被移动过
                var flag =parent.mapFromItem()
                var sum  =parent.mapToItem()
                var p0 = parent.mapToGlobal(0, 0) // 获取组件的左上角在屏幕上的坐标
                var p1 = parent.mapToGlobal(mouseX, mouseY) // 获取鼠标点击位置在屏幕上的坐标
                x_os = p1.x - p0.x // 计算鼠标点击位置在组件内部的横向偏移量
                y_os = p1.y - p0.y // 计算鼠标点击位置在组件内部的纵向偏移量
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
