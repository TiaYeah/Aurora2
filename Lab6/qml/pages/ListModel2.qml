import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1


Page {
    ListModel { id: dataModel }
    Column { //...
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Add item"
            onClicked: dataModel.append({ text: "Item #" })
        }
        spacing: 10
        SilicaListView {
            width: parent.width; height: parent.height - addButton.height;
            header: PageHeader { title: "Simple List" }
            model: dataModel
            delegate: Rectangle {
                width: parent.width;
                height: 100;
                color: "white";
                Text {
                    anchors.centerIn: parent
                    text: model.text + model.n
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: dataModel.remove(index)
                }
            }
        }

    }
}
