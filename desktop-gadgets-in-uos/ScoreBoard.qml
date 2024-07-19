import QtQuick 2.0
import "script/logic.js" as Logic

Rectangle {
    id: scoreBoard
    width: 50
    height: 50
    color: "#fbfaef"

    property int score: 0;
    property int bestScore: 0

    signal optionsClicked;



    Rectangle {
        x: 170
        y: 1
        width: 70
        height: 35
        color: "#bcada0"
        radius: 3


        Text {
            id: text1
            x: 0
            y: 0
            color: "#f2e7d9"
            text: qsTr("SCORE")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 2
            font.pixelSize: 12
        }

        Text {
            id: text
            x: 20
            color: "#ffffff"
            text: score
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 18
            font.family: "Verdana"
            font.bold: true
            font.pixelSize: 10
        }
    }

    Rectangle {
        x: 170
        y: 40.5
        width: 70
        height: 35
        color: "#bbada0"
        radius: 3
        //anchors.verticalCenter: name.verticalCenter

        Text {
            id: text3
            x: 0
            y: 0
            color: "#f2e7d9"
            text: qsTr("BEST")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 2
            font.pixelSize: 10
        }

        Text {
            id: bestScoreText
            x: 20
            color: "#ffffff"
            text: bestScore
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 18
            font.family: "Verdana"
            font.bold: true
            font.pixelSize: 10
        }
    }

    CustomBtn {
        id: btnNewGame
        visible: true
        x: 170
        y: 80
        width: 35
        height: 15
        label: qsTr("New")

        onClicked: {
            bestScore = Math.max(bestScore, score);
            Logic.restart();
        }
    }

    CustomBtn {
        id: btnOptions
        x: 205
        y: 80
        width: 35
        height:15
        label: qsTr("Options");


        onClicked: scoreBoard.optionsClicked();
    }
}
