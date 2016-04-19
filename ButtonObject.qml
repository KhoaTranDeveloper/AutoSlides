import QtQuick 2.0

Item {
    id: root

    signal clicked
    property int mIndex: -1 //Used by IndexArea.qml
    property string mText

    Rectangle {
        anchors.fill: root
        color: "transparent"
        border.color: "#000000"
        border.width: 2
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.clicked()
            }
        }

        Text {
            id: id_name
            text: mText
            color: "black"
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            Component.onCompleted: id_name.font.pixelSize = id_name.height*2
        }
    }

    function toEnable(){
        id_name.color = "white"
    }

    function toDisable(){
        id_name.color = "black"
    }
}
