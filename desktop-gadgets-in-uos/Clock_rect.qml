import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {

    width: 240
    height:120

    property alias timer: timer

    property string str_s: "00"
    property string str_m: "00"
    property string str_h: "00"

    property int s: 0
    property int m: 0
    property int h: 0

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

    Rectangle{
        anchors.fill:parent
        color: "transparent"
        opacity:0.6
        radius:5
        Text{
            id:txt
            text:str_h+":"+str_m+":"+str_s
            font.family:"微软雅黑"
            color: "#ffffff"
            font.bold:true
            font.pointSize: 30
            anchors.centerIn: parent
        }
    }

    Rectangle{
        anchors.fill:parent
        color: "transparent"
        height :0
        width :0
        opacity:0
        radius:0
        Text{
            id:y
            text:str_h+":"+str_m+":"+str_s
            font.family:"微软雅黑"
            color: "#ffffff"
            font.bold:true
            font.pointSize: 30
            anchors.centerIn: parent
        }
    }

    Rectangle{
        anchors.fill:parent
        color: "transparent"
        height :0
        width :0
        opacity:0
        radius:0
        Text{
            id:x
            text:str_h+":"+str_m+":"+str_s
            font.family:"微软雅黑"
            color: "#ffffff"
            font.bold:true
            font.pointSize: 30
            anchors.centerIn: parent
        }
    }

    Rectangle{
        anchors.fill:parent
        color: "transparent"
        height :0
        width :0
        opacity:0
        radius:0
        Text{
            id:xx
            text:str_h+":"+str_m+":"+str_s
            font.family:"微软雅黑"
            color: "#ffffff"
            font.bold:true
            font.pointSize: 30
            anchors.centerIn: parent
        }
    }

    Rectangle{
    // 定义一个矩形
    anchors.fill: parent // 矩形填充父元素
    color: "transparent" // 矩形颜色为透明
    height: 0 // 矩形高度为0
    width: 0 // 矩形宽度为0
    opacity: 0 // 矩形透明度为0
    radius: 0 // 矩形圆角半径为0

    Text {
        id: xxx // 文本元素的id
        text: str_h + ":" + str_m + ":" + str_s // 显示时间的文本
        font.family: "微软雅黑" // 字体为微软雅黑
        color: "#ffffff" // 文本颜色为白色
        font.bold: true // 文本加粗
        font.pointSize: 30 // 字体大小为30
        anchors.centerIn: parent // 文本元素居中在矩形中
        }
    }

    // 以下两个矩形的代码结构与上面类似，不再赘述
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        height: 0
        width: 0
        opacity: 0
        radius: 0

    Text {
        id: xxxx
        text: str_h + ":" + str_m + ":" + str_s
        font.family: "微软雅黑"
        color: "#ffffff"
        font.bold: true
        font.pointSize: 30
        anchors.centerIn: parent
        }
    }

    Rectangle{
        anchors.fill: parent
        color: "transparent"
        height: 0
        width: 0
        opacity: 0
        radius: 0

    Text {
        id: xxxxx
        text: str_h + ":" + str_m + ":" + str_s
        font.family: "微软雅黑"
        color: "#ffffff"
        font.bold: true
        font.pointSize: 30
        anchors.centerIn: parent
        }
    }
}

