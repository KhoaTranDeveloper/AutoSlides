import QtQuick 2.0

Item {
    id: root
    signal indexChanged
    property int newIndex: -1

    Rectangle {
        anchors.fill: root
        color: "transparent"
    }

    ListModel {
        id: id_indexlist
    }

    Component {
        id: id_component

        Item {
            property int updateIndex: root.newIndex
            width: root.height
            height: root.height

            ButtonObject {
                id: id_index
                anchors.fill: parent
                anchors.margins: 2
                mIndex: INDEX
                mText: (mIndex+1).toString()

                onClicked: {
                    root.newIndex = id_index.mIndex
                    root.indexChanged()
                }
            }
            onUpdateIndexChanged: {
                if(id_index.mIndex == root.newIndex){
                    id_index.toEnable()
                }else{
                    id_index.toDisable()
                }
            }
        }
    }

    Flickable {
        anchors.fill: root
        contentHeight: root.height
        clip: true

        Row {
            id: layout
            anchors.fill: parent
            Repeater {
                model: id_indexlist
                delegate: id_component
            }
        }
    }

    function addItem(index) {
        id_indexlist.append({"INDEX": index})
    }

    function next() {
        root.newIndex = (root.newIndex + 1) % id_indexlist.count
        root.indexChanged()
    }

    function previous() {
        if(root.newIndex == 0){
            root.newIndex = id_indexlist.count -1
        }else{
            root.newIndex = root.newIndex - 1
        }
        root.indexChanged()
    }
}
