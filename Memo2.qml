import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.2

Rectangle {
    id: card_memo2
    width: 240
    height: 120
    color: "#FFF5EE"
    radius: 0

    Timer{
        id:timer
        interval: 1000
        repeat:true
        running:false
        onTriggered: {
            s++;
            if(s<10)
            {
                str_s = "0" + s;
            }else{
                str_s = s;
            }
            if(m<10)
            {
                str_m = "0" + m;
            }else{
                str_m = m;
            }
            if(h<10)
            {
                str_h = "0" + h;
            }else{
                str_h = h;
            }
            if(s>=60){
                s=0;
                m++;
            }
            if(m>=60){
                m=0;
                h++;
            }
        }
    }



    Flipable {
        id: flipable

        states: State {
            name: "back"

            PropertyChanges {
                target: rotation;
                angle: 180
            }
            when: flipable.flipped
        }

    front:
    Rectangle {
        id: listview_rect
        anchors.fill :parent

        color: "transparent"

        Rectangle {
        id: listview_rect2 // 为矩形指定一个 ID

        // 定义一个组件来表示列表项和删除按钮
        Component {
        id: text_del
        Rectangle {
        id: list_item // 为每个列表项定义一个矩形

        // 显示文本的文本框
        Text {
        id: text1
        width: parent.width - 40 // 设置文本框的宽度

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 4

        font.pointSize: 10
        wrapMode: TextEdit.WordWrap
        text: mText // 显示文本的数据绑定
        }

        // 删除按钮
        Image {
        id: delete_btn
        source: "qrc:/image/delete.svg"
        width: 18
        height: 18

        // 添加鼠标事件处理程序
        MouseArea {
        anchors.fill: parent
        onClicked: {
        memo_my_birth.splice(index, 1) // 从数据模型中删除该项

        text_mod.clear() // 清空文本修改器
        for(var i = 0; i < memo_my_birth.length; i++) {
        text_mod.append(memo_my_birth[i]) // 更新文本修改器
        }
        }
        }

        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        }

        // 设置矩形的宽度和高度以及边框属性和边框半径
        width: ListView.view.width
        height: listview_rect2.height - list_view.spacing
        border.color: "#FF7F50"
        radius: 8
        }
        }

            ListView {
            id: list_view
            width: parent.width
            height: parent.height
            spacing: 2
            model: text_mod // 指定数据模型
            delegate: text_del // 指定列表项组件
            clip: true
            }

            Component.onCompleted: {
                text_mod.clear()
                for(var i = 0; i < memo_my_birth.length; i++) {
                    text_mod.append(memo_my_birth[i])
                }
            }

            Component.onDestruction: {
                var cnt=0;
                for(var i = 0; i < command.memo_all_txt.length; i++) {
                    console.log(command.memo_all_txt[i]);
                }
                console.log("yessssssss!")
            }

            Connections {
                target: main_window
                onMemoDataChanged: {

                    text_mod.clear()
                    for(var i = 0; i < memo_my_birth.length; i++) {
                        text_mod.append(memo_my_birth[i])
                    }
                }
            }

            anchors.fill: parent
            anchors.margins: 10
            color: "transparent"

            ListModel {
                id: text_mod
            }
        }

    }

    transform: Rotation {
        id: rotation

        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 0; axis.y: 1; axis.z: 0
        angle: 0
    }

    back:
        Rectangle {
        // 创建矩形组件

        ColumnLayout {
        // 创建列布局组件

        anchors.fill: parent
        // 设置布局填充父组件

        spacing: 10
        // 设置列间距

        TextField {
        // 创建文本框组件

        wrapMode: TextEdit.WordWrap
        // 设置文本框的换行方式

        id: input
        // 给文本框组件添加ID

        Layout.preferredHeight: 20
        // 设置文本框组件的首选高度

        Layout.fillWidth: true
        // 设置文本框组件的宽度为父组件的宽度
        }

        ListView {
        // 创建列表组件

        id: list
        // 给列表组件添加ID

        function hightlightText(txt)
        {
        // 定义高亮文本的函数

        var str = input.text;
        // 获取文本框中的文本

        var pos = txt.indexOf(str);
        // 获取文本在列表项中的位置

        if(pos !== (-1))
        {
        return txt.replace(str,"<font color='#FF0000'>" + str + "</font>")
        }
        // 如果文本在列表项中，则将文本高亮显示

        return txt;
        // 否则返回原始文本
        }

        Layout.fillHeight: true
        // 设置列表组件的高度为父组件的高度

        Layout.fillWidth: true
        // 设置列表组件的宽度为父组件的宽度

        model: text_mod
        // 设置列表组件的模型为text_mod

        delegate: Text {
        // 创建文本代理

        wrapMode: TextEdit.WordWrap
        // 设置文本的换行方式

        property string origText: modelData
        // 定义属性origText，保存列表项的原始文本

        text: list.hightlightText(origText)
        // 使用hightlightText()函数将文本高亮显示
        }
        }
}


            anchors.fill: parent
            anchors.margins: 10
            radius: 18
            color: "transparent"
            //wrapMode: TextEdit.WordWrap

}



        RowLayout {
            id: layout
            anchors.fill: parent   //填充到父项
            spacing: 6
            visible :false
            Rectangle {
                color: 'teal'
                Layout.fillWidth: true   //可拉伸
                Layout.minimumWidth: 50
                Layout.preferredWidth: 100
                Layout.maximumWidth: 300
                Layout.minimumHeight: 150
                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
            }
            Rectangle {
                color: 'plum'
                Layout.fillWidth: true
                Layout.minimumWidth: 100
                Layout.preferredWidth: 200
                Layout.preferredHeight: 100
                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
            }
        }



        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 1 }
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            ColorAnimation { duration: 1000 }
        }

        Component.onDestruction: {
            var cnt=0;
            for(var i = 0; i < command.memo_all_txt.length; i++) {
                console.log(command.memo_all_txt[i]);
            }
            console.log("yessssssss!")
        }

        width: parent.width
        height: parent.height - memo_title.height
        anchors.top: memo_title.bottom
        property bool flipped: set_flag

    }

    Rectangle {
        id: memo_title
        width: parent.width
        height: 26
        color: "#D2691E"
        Label {
            anchors.verticalCenter: parent.verticalCenter
            x:5
            color: "white"
            font.pointSize: 15
            text: qsTr("memo")
        }
    }
}
