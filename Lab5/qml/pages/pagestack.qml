import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    allowedOrientations: Orientation.All
    Column {
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        spacing: Theme.paddingMedium
        PageHeader {
            title: "Cтраница"
        }
        Button {
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl("pagestack.qml"))
        }
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
        Label {
            id: label1
            text: depth
        }
    }
}

