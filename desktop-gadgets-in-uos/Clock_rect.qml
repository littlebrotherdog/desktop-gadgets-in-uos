import QtQuick 2.0

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
}

