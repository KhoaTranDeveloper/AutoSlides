import QtQuick 2.4
import "./Colors.js" as Data

Rectangle {
    id: root
    anchors.fill: parent

    Component.onCompleted: {
        for(var i=0; i<Data.colorTable.length; i++){
            id_inArea.addItem(i)
        }
        id_inArea.next()
    }

    Timer {
        id: id_timer
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            if(id_ctrArea.isAuto) id_inArea.next()
        }
    }

    ControlArea {
        id: id_ctrArea
        anchors {
            bottom: root.bottom
            right: root.right
        }
        height: root.height / 10
        width: root.width / 2

        onNextChanged: {
            id_inArea.next()
        }

        onBackChanged: {
            id_inArea.previous()
        }
    }

    IndexArea {
        id: id_inArea
        anchors {
            bottom: root.bottom
            left: root.left
        }
        height: root.height / 10
        width: root.width / 2

        onIndexChanged: {
            root.color = Data.colorTable[id_inArea.newIndex]
        }
    }
}
