import QtQuick 2.0

Rectangle {
    id: card
    width: 120
    height: 120
    anchors.left: parent.left
    anchors.top: parent.top
    color: "#fffaf4"
    radius: 16


    Drag.active: dragArea.drag.active
    Drag.dragType: Drag.Automatic
    Drag.supportedActions: Qt.CopyAction
    Drag.mimeData: {
        "pic": img_source
    }

    property string img_source

    Image {
        id: img
        source: img_source
        anchors.fill: parent
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: parent
        property bool move_flag: false
        property int x_offset: 240
        property int y_offset: 80

        onPressed: parent.grabToImage(function(result) {
            parent.Drag.imageSource = result.url
            parent.Drag.hotSpot.x = mouseX
            parent.Drag.hotSpot.y = mouseY
            if(move_flag === false) {
                var p0 = parent.mapToGlobal(0, 0)
                var p1 = parent.mapToGlobal(mouseX, mouseY)
                x_offset = p1.x - p0.x
                y_offset = p1.y - p0.y
                console.log(mouseX, mouseY)
                move_flag = true
            }
        })

        onReleased: {

            var p = parent.mapToGlobal(mouseX, mouseY)
            console.log(p, mouseX, mouseY, x_offset, y_offset, "x:", p.x - x_offset,
                        "y:", p.y - y_offset)
            var qml_path = img_source.substring(11, 12).toUpperCase() + img_source.substring(12) + ".qml"


            var component = Qt.createComponent("CardWindow.qml")


            var window = component.createObject(parent, {qml_source: qml_path, x: mouseX,
                                                y: mouseY, width: 120, height: 120})
            window.show()
            card_count ++
            move_flag = false
        }
    }
}
