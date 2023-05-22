import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Column {
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        anchors.topMargin: parent.width / 1.5
        spacing: Theme.paddingMedium
        Button {
           id: button1
           anchors.horizontalCenter: parent.horizontalCenter
           width: parent.width / 1.5
           text: qsTr("Играть")
           onClicked: pageStack.push(Qt.resolvedUrl("Levels.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button2
           anchors.horizontalCenter: parent.horizontalCenter
           width: parent.width / 1.5
           text: qsTr("Выбор скина")
           onClicked: pageStack.push(Qt.resolvedUrl("SkinChoose.qml"))
           backgroundColor: "white"
           color: "black"
        }
    }
}
