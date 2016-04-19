import QtQuick 2.0

Item {
    id: root

    signal nextChanged
    signal backChanged
    signal autoChanged

    property bool isAuto: true

    Rectangle {
        anchors.fill: root
        color: "transparent"
    }

    ButtonObject {
        id: id_next
        anchors {
            bottom: root.bottom
            right: root.right
            margins: 2
        }
        height: root.height
        width: root.height

        mText: ">>"

        onClicked: {
            root.nextChanged()
        }
    }

    ButtonObject {
        id: id_playpause
        anchors {
            bottom: root.bottom
            right: id_next.left
            margins: 2
        }
        height: root.height
        width: root.height

        mText: "O"

        onClicked: {
            if(root.isAuto){ //play->pause
                id_playpause.mText = "P"
            }else{ //pause->play
                id_playpause.mText = "O"
            }
            root.isAuto = !root.isAuto;
            root.autoChanged()
        }
    }

    ButtonObject {
        id: id_back
        anchors {
            bottom: root.bottom
            right: id_playpause.left
            margins: 2
        }
        height: root.height
        width: root.height

        mText: "<<"

        onClicked: {
            root.backChanged()
        }
    }
}
