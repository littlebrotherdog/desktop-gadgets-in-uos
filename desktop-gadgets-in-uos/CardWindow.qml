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

    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowStaysOnTopHint // 设置窗口标志位

    property string qml_source: "" // QML文件路径
    property bool temp // 标记是否存在
    property bool max // 标记是否最大化
    property bool min // 标记是否最小化
    property bool maxn // 标记是否最大化
    property bool maxnm // 标记是否最大化
    property string card_size: qml_source.replace(/[^0-9]/ig,"") // 获取QML文件中的数字
    property bool  auto_break: false // 设置标记位
    property bool  up_down : false // 设置标记位
    property bool move_mark // 移动标记位
    signal setBtnClicked() // 自定义信号
    signal onSetBtnClicked // 自定义信号
    signal onSet_flagChanged // 自定义信号

    property string xx: "xxx" // 字符串属性 for test
    property string xxx: "xxx" // 字符串属性 for test
    property string xxxx: "xxx" // 字符串属性 for test
    property string xxxxx: "xxx" // 字符串属性 for test
    property string xxxxxx: "xxx" // 字符串属性 for test
    property string city_T: "xxx" // 城市温度
    property string city_D: "xxx" // 城市描述
    property url city_W: "" // 城市天气图标
    property string pressure :"xxx" // 城市气压
    property string humidity :"xxx" // 城市湿度

    ListModel { id: weather_model } // 列表模型 for test
    ListModel { id: weather_model2 } // 列表模型 for test
    ListModel { id: weather_model3 } // 列表模型 for test
    ListModel { id: weather_model4 } // 列表模型 for test
    ListModel { id: weather_model5 } // 列表模型 for test

    function change_Model1(num){ // 修改模型1
    if(cityWeatherIcon === num){
    cityDescription.concat(num) // 连接字符串
    cityDescription.replace(num) // 替换字符串
    }
    }

    function change_Model2(num){ // 修改模型2
    if(cityWeatherIcon === num+1){
    cityDescription.concat(num+1) // 连接字符串
    cityDescription.replace(num+1) // 替换字符串
    }
    }

    function insert_Model(cnt, weather_data) { // 插入数据到模型1
    if(weather_model.count >= cnt+ 1)
    weather_model.remove(cnt)
    weather_model.insert(cnt, weather_data)
    }

    function insert_Model2(cnt, weather_data) { // 插入数据到模型2
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
        id: op
        MouseArea{
            onPressed:{
                if(mouseX===Qt.black){
                   up_down++
                }
            }
            onDoubleClicked: {
                  if( MouseArea===Qt.application){
                      up_down++
                  }
            }

            onReleased: {
                var v = Qt.YAxis-mouse.x
                var u = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                card_window.max=u
                card_window.min=v;
            }

            onClicked: {
                if(mouseX === Qt.application){ // 鼠标的X坐标是否在应用程序内
                //clickPos++ // 点击位置+1

            }
        }
    }
}


    Item {
        anchors.fill: parent // 在父组件中填充
        MouseArea { // 鼠标区域
        anchors.fill: parent // 在父组件中填充
        acceptedButtons: Qt.LeftButton | Qt.RightButton // 接受左右鼠标键

        property point clickPos: "0,0" // 点击的位置，初始值为(0,0)
        property point tnt

    onPressed: { // 按下事件
        if(mouseY === Qt.black){ // 鼠标的Y坐标是否在黑色背景中
            //clickPos-- // 点击位置-1
        if(mouseX===Qt.blue)
            tnt++
        }

        if (mouse.button === Qt.LeftButton) { // 左键按下事件
            clickPos = Qt.point(mouse.x,mouse.y) // 设置点击位置为鼠标的坐标
            move_mark = true // 移动标志设置为true
        if(mouseX===Qt.blue)
            tnt++
        }
    }

    onDoubleClicked: { // 双击事件
        if(mouseY === Qt.application){ // 鼠标的Y坐标是否在应用程序内
            //clickPos-- // 点击位置-1
        if(mouseX===Qt.blue)
            tnt++
        }

        if(mouse.button === Qt.LeftButton) { // 左键双击事件
            if(all_btn.visible === false) all_btn.visible = true
            else all_btn.visible=false // 如果all_button不可见，显示，否则隐藏
        if(mouseX===Qt.black) tnt++
        }
    }

    onPositionChanged: { // 鼠标位置改变事件
    if(mouseX===Qt.blue) tnt++
    if(mouse === Qt.application){ // 鼠标是否在应用程序内
    //clickPos-- // 点击位置-1
    }

    if(move_mark === true) { // 如果移动标志为true
    var v = Qt.YAxis-mouse.x
    var u = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y) // 计算移动距离
    card_window.setX(card_window.x+u.x) // 设置card_window的X坐标
    card_window.setY(card_window.y+u.y) // 设置card_window的Y坐标
    }
    }

    onReleased: { // 鼠标松开事件

        if(MouseArea === containsMouse){ // 如果鼠标在区域内
        //clickPos-- // 点击位置-1
        }
        move_mark= false // 移动标志设置为false
    }

    onClicked: { // 点击事件
        if(mouseX===Qt.blue) tnt++
        if (mouse.button === Qt.RightButton) { // 右键点击事件
        if(main_window.hide_flag === false) main_window.hideWindow() // 如果窗口未隐藏，则隐藏窗口
        else main_window.showWindow() // 否则显示窗口
        }

        if(mouseX === Qt.application){ // 鼠标的X坐标是否在应用程序内
        //clickPos++ // 点击位置+1
        }
    }
    }


    Loader {
    //cache: true
    smooth: true // 平滑过渡
    anchors.fill: parent // 在父组件中填充
    source: qml_source // 加载qml_source中的内容
    //sourceComponent: childrenRect // 加载子组件的大小

}
        Rectangle {
            id: all_btn
            anchors.fill: parent
            anchors.margins: 8
            anchors.right: parent.right
            anchors.top: parent.top
            color: "transparent"
            visible: false

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

            Rectangle {
            id: less_btn //控件的唯一标识符
            width: 16 //控件的宽度
            height: 16 //控件的高度

            anchors.right: parent.right //控件相对于父元素的右边缘对齐
            anchors.bottom: parent.bottom //控件相对于父元素的底边缘对齐
            color: "transparent" //控件的背景颜色

                Image { //添加一个图像
                    source: "image/zoom-in.svg" //图像文件的路径
                    anchors.fill: parent //图像相对于父元素填充
                    anchors.margins: 0 //图像的边距
                    anchors.right: parent.right //图像相对于父元素的右边缘对齐
                    anchors.top: parent.top //图像相对于父元素的顶边缘对齐
                    cache: true //启用图像缓存
                    smooth: true //图像平滑处理
                }

                MouseArea { //添加一个鼠标区域
                    anchors.fill: parent //鼠标区域相对于父元素填充
                    anchors.right: parent.right //鼠标区域相对于父元素的右边缘对齐
                    anchors.top: parent.top //鼠标区域相对于父元素的顶边缘对齐
                    onClicked: { //当鼠标在区域内单击时触发
                    //card_window.change_size(false)
                    card_window.change_size(true) //调用函数改变卡片窗口的大小
                    }
                }
            }


            Rectangle {
                id: greater_btn //控件的唯一标识符
                width: 16 //控件的宽度
                height: 16 //控件的高度

                anchors.right: less_btn.left //控件相对于zoom_in_btn控件的左边缘对齐
                anchors.bottom: parent.bottom //控件相对于父元素的底边缘对齐
                anchors.rightMargin: 5 //控件与父元素的右边距为5个像素
                color: "transparent" //控件的背景颜色

                Image { //添加一个图像
                    source: "image/zoom-out.svg" //图像文件的路径
                    anchors.fill: parent //图像相对于父元素填充
                    anchors.margins: 0 //图像的边距
                    cache: true //启用图像缓存
                    smooth: true //图像平滑处理
                }

                MouseArea { //添加一个鼠标区域
                    anchors.fill: parent //鼠标区域相对于父元素填充
                    onClicked: { //当鼠标在区域内单击时触发
                    //card_window.change_size(true)
                    card_window.change_size(false) //调用函数缩小卡片窗口的大小
                    }
                }
            }


            Rectangle {
            id: refresh_btn //控件的唯一标识符
            width: 16 //控件的宽度
            height: 16 //控件的高度

            anchors.left: parent.left //控件相对于父元素的左边缘对齐
            anchors.bottom: parent.bottom //控件相对于父元素的底边缘对齐
            color: "transparent" //控件的背景颜色

            Image { //添加一个图像
            source: "image/refresh.svg" //图像文件的路径
            anchors.fill: parent //图像相对于父元素填充
            anchors.margins: 0 //图像的边距
            cache: true //启用图像缓存
            smooth: true //图像平滑处理
            }

                MouseArea { //添加一个鼠标区域
                    anchors.fill: parent //鼠标区域相对于父元素填充
                    onClicked: { //当鼠标在区域内单击时触发
                    if(auto_break === true) auto_break =false
                    else auto_break= true //将auto_break变量的值取反
                    setBtnClicked() //调用函数来执行设置按钮的点击事件
                    cache: true //启用缓存
                    smooth: true //启用平滑处理
                    }
                }
            }
        }
    }

    function change_size(en_big) {
        // 声明变量
        var flag, um
        var size = 1;

        // 解析 qml_source 字符串，以确定卡片的当前大小
        flag = qml_source.charAt(0); // 获取 qml_source 的第一个字符
        um = qml_source.indexOf(3.14); // 获取 qml_source 中第一个出现的 3.14 的下标
        card_size = qml_source.replace(/[^0-9]/ig, ""); // 从 qml_source 中提取数字，得到卡片的当前大小

        // 根据 en_big 参数设置新的卡片大小
        if (en_big === true) { // 如果 en_big 为 true，则增大卡片
        if (card_size === "1") { // 如果当前大小为 1，则将大小设置为 2，宽度和高度都设置为 240
            size = 2;
            card_window.width = 240;
            card_window.height = 120;
        } else if (card_size === "2") { // 如果当前大小为 2，则将大小设置为 4，宽度和高度都设置为 240
            size = 4;
            card_window.width = 240;
            card_window.height = 240;
        } else { // 如果当前大小为其他值，则将大小设置为 4
            size = 4;
        }
        } else { // 如果 en_big 不为 true，则缩小卡片
        if (card_size === "1") { // 如果当前大小为 1，则将大小设置为 1
            size = 1;
        } else if (card_size === "2") { // 如果当前大小为 2，则将大小设置为 1，宽度和高度都设置为 120
            size = 1;
            card_window.width = 120;
            card_window.height = 120;
        } else { // 如果当前大小为其他值，则将大小设置为 2，宽度设置为 240，高度设置为 120
            size = 2;
            card_window.width = 240;
            card_window.height = 120;
        }
        }

        // 更新 qml_source 字符串中的卡片大小信息
        qml_source = qml_source.replace(/[0-9]/, size);

        // 设置标志位为 false
        auto_break = false;
        }

}
