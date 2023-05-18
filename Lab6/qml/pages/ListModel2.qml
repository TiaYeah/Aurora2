import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1


Page {
    ListModel { id: dataModel }
    Column {
            width: page.width

            Button {
                id: addButton
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Добавить"

                property int counter: 1
                onClicked: dataModel.append({ text: "Элемент " + counter++ })
            }
            SilicaListView {
                VerticalScrollDecorator{}
                spacing: 10
                width: parent.width;
                height: 800
                header: PageHeader { title: "Список" }
                model: dataModel
                delegate: Rectangle {
                    width: parent.width; height: 100; color: "white";
                    Text {
                        anchors.centerIn: parent
                        text: model.text
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: dataModel.remove(model.index)
                    }

                }
            }
        }
}
