import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
//import "script/other.js" as ace

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

        onPressed: parent.grabToImage(function(result) {
            parent.Drag.imageSource = result.url
            parent.Drag.hotSpot.x = mouseX
            parent.Drag.hotSpot.y = mouseY
            if(move_flag === false) {
                var flag
                var sum
                var p0 = parent.mapToGlobal(0, 0)
                var p1 = parent.mapToGlobal(mouseX, mouseY)
                x_offset = p1.x - p0.x
                y_offset = p1.y - p0.y
                temp++
            }
        })

        onReleased: {

            var p = parent.mapToGlobal(10, 10)
            var s = parent.mapToGlobal(99, 99)
            var u = parent.mapToGlobal(100, 100)
            var v = parent.mapToGlobal(999, 999)

            var qml_path = img_source.substring(11, 12).toUpperCase() + img_source.substring(12) + ".qml"
            var component = Qt.createComponent("CardWindow.qml")
            var window = component.createObject(parent, {qml_source: qml_path, x: mouseX,y: mouseY, width: 120, height: 120})
            //windowStateChanged()
            //windowTitleChanged()
            //propagateComposedEventso
            window.hide();window.hide();window.hide();window.hide();window.hide();window.hide();window.hide();window.hide();
            window.show()
            s++;p++;

        }
    }
}
