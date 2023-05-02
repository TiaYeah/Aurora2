import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1


Page {
    ListModel {
        id: dataModel
        ListElement { color: "white"; textColor: "black"; text: "Белый"; }
        ListElement { color: "black"; textColor: "white"; text: "Черный" }
        ListElement { color: "blue"; textColor: "red"; text: "Синий" }
    }
    SilicaListView {
        anchors.fill: parent
        model: dataModel
        spacing: 10
        delegate: Rectangle {
            width: parent.width
            height: 100
            color: model.color
            Text {
                anchors.centerIn: parent
                text: model.text
                color: model.textColor
            }
        }
    }
}
