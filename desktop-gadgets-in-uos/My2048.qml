import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import "script/logic.js" as Logic

Window{

    id: window
    visible: true
    width: 240
    height: 120
    color: "#fbf8ef"


    Settings {//history
        id: settigns;
        property alias columns: board.col;
        property alias rows: board.row;
        property alias bestScore: scoreBoard.bestScore;
        property alias boardSize: optionsWnd.boardSize
    }

    property alias board: board;
    property alias scoreBoard: scoreBoard;
    property alias gameOverWnd: gameOverWnd

ScoreBoard {//to record the score
    id: scoreBoard;

    onOptionsClicked: {
        if (optionsWnd.opacity === 0.0)
            optionsWnd.animShow.start();
        else
            optionsWnd.animHide.start();
    }

    Component.onCompleted: {
        optionsWnd.opacity = 0.0;
    }
}

Board {
    id: board
}

Timer {
    id: movingTimer
    interval: 100; running: false;
    onTriggered: {
        Logic.onAnimEnd();
    }
}

Rectangle{
    Keys.enabled: true
    focus: true
    Keys.onPressed: {
        if(Logic.move(event.key)) {
            console.log("success")
            movingTimer.start();
        }
        event.accepted = true;
    }
}

GameOverWnd {
    id: gameOverWnd;
}

OptionsWnd {
    id: optionsWnd;

    onApply: {
        var value = boardSize + 4;
        board.col = Logic.columns = value
        board.row = Logic.rows = value
        Logic.restart();
    }
}

    Component.onCompleted: {
        Logic.init(board.col,board.row,window);
    }

    Component.onDestruction: {
        scoreBoard.bestScore = Math.max(scoreBoard.bestScore, scoreBoard.score);
    }

}
