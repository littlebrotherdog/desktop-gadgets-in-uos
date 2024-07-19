import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Connections {
    target: whomSentTheSignal

    function onSignal0(arg) {
        console.log(arg)
    }

    function onSignal1(arg) {
        console.log(arg)
    }
    // ...
}
