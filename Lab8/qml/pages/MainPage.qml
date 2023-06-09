import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Column {
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        spacing: Theme.paddingMedium
        Button {
           y: 200
           x: 100
           id: button1
           text: qsTr("1")
           onClicked: pageStack.push(Qt.resolvedUrl("page1.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           y: 200
           x: 100
           id: button2
           text: qsTr("2")
           onClicked: pageStack.push(Qt.resolvedUrl("page2.qml"))
           backgroundColor: "white"
           color: "black"
        }
    }
}
