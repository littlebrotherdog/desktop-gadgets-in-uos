import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Rectangle {
    id: card_memo4
    width: 260
    height: 260
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

        front:

        Rectangle {

            Component { // 声明一个组件
            id: text_delegate // 设置组件的ID

            Rectangle { // 声明一个矩形
            id: list_item // 设置矩形的ID

            Text { // 声明一个文本框
            id: text1 // 设置文本框的ID

            // 设置文本框的宽度和上方的锚点
            width: parent.width - 40
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 4

            wrapMode: TextEdit.WrapAnywhere // 设置文本框的自动换行模式
            text: mText // 绑定文本框的文本内容为变量mText
            font.pointSize: 10 // 设置字体大小
            }

            Image { // 声明一个图片
            id: del // 设置图片的ID
            source: "qrc:/image/delete.svg" // 设置图片的资源路径

            MouseArea { // 声明一个鼠标区域
            anchors.fill: parent // 鼠标区域的大小与图片相同
                onClicked: { // 设置鼠标单击事件
                    console.log("delete") // 打印调试信息
                    memo_my_birth.splice(index, 1) // 从数组中删除当前项
                    text_model.clear() // 清空文本模型
                    for(var i = 0; i < memo_my_birth; i++) { // 遍历数组并添加到文本模型中
                    text_model.append(memo_my_birth[i])
                }
                command.memo_all_txt = memo_my_birth // 更新数据
                memoDataChanged() // 触发数据更新事件
                }
            }

            width: 18 // 设置图片的宽度和高度
            height: 18
            anchors.top: parent.top // 设置图片的上方锚点和距离
            anchors.topMargin: 5
            anchors.right: parent.right // 设置图片的右方锚点和距离
            anchors.rightMargin: 5
            }

            width: ListView.view.width // 设置矩形的宽度与ListView相同
            height: 63 // 设置矩形的高度
            border.color: "#FF7F50" // 设置矩形的边框颜色
            radius: 8 // 设置矩形的圆角半径
            }
            }

            ListView{
                id: list_view
                width: parent.width
                height: parent.height
                spacing: 2
                model: text_model
                delegate: text_delegate
                clip: true
            }

            anchors.fill: parent
            anchors.margins: 10
            radius: 18
            color: "transparent"

            ListModel {
                id: text_model
            }

            Component.onCompleted: {
                text_model.clear()
                for(var i = 0; i < memo_my_birth.length; i++) {
                    text_model.append(memo_my_birth[i])
                }
            }

            Connections {
                target: main_window
                onMemoDataChanged: {
                    console.log("data changed")
                    text_model.clear()
                    for(var i = 0; i < memo_my_birth.length; i++) {
                        text_model.append(memo_my_birth[i])
                    }
                }
            }
        }

        back:

        Rectangle {
            anchors.fill: parent
            anchors.margins: 10
            radius: 18
            color: "transparent"

            Label {
                id: title_lab
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                y:30
                font.family: "Arial"
                font.pointSize: 18
                text: qsTr("Please append your memo")
            }

            Rectangle {
                id: text_rec
                width: 175
                height: 28
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: title_lab.bottom
                anchors.topMargin: 20
                border.color: "#FF7F50"
                radius: 4

                TextInput {
                    id: text_edit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    width: parent.width
                    text: qsTr("")

                    wrapMode: TextEdit.WrapAnywhere
                    font.pointSize: 12
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8

                    color: "black"
                    selectByMouse: true
                    activeFocusOnPress: true
                    //focus: true
                }
            }

            AnimatedImage{
                anchors.horizontalCenter: parent.horizontalCenter
                y:90
                height :100
                width :120
                source: "qrc:/image/13"
                onCurrentFrameChanged: {
                    //info.text = ("%1/%2").arg(animated.currentFrame).arg(animated.frameCount)
                }
            }
        }

        transform: Rotation {
            id: rot
            origin.x: flipable.width >> 1
            origin.y: flipable.height >> 1
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
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

        states: State {
            name: "back"
            PropertyChanges {
                target: rot;
                angle: 180
            }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rot; property: "angle"; duration: 1 }
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
            ColorAnimation { duration: 1000 }
        }

        Connections {
            target: card_window

            onSetBtnClicked: {
                if(auto_break === false && text_edit.text !== "") {
                    memo_my_birth.push({"mText": text_edit.text});
                    text_model.append(memo_my_birth[memo_my_birth.length - 1]);
                    text_edit.text = "";
                    memoDataChanged();
                    command.memo_all_txt = memo_my_birth;
                }
                else command.memo_all_txt = memo_my_birth;
            }
        }

        Component.onDestruction: {
            var cnt=0;
            for(var i = 0; i < command.memo_all_txt.length; i++) {
                console.log(command.memo_all_txt[i]);
            }

            console.log("yessssssss!");
        }

        width: parent.width
        height: parent.height - memo_title.height
        anchors.top: memo_title.bottom
        property bool flipped: auto_break

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
