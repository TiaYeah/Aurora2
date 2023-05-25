import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1


Page {

    Rectangle {
        anchors.fill: parent
        z: -1
        gradient: Gradient {
            GradientStop {position: 0.0; color: "orange"}
            GradientStop {position: 1.0; color: "yellow"}
        }
    }
    Column {
            anchors.fill: parent
            anchors.margins: Theme.paddingMedium
            anchors.topMargin: parent.width / 1.5
            spacing: Theme.paddingMedium
            Button {
               id: button1
               anchors.horizontalCenter: parent.horizontalCenter
               width: parent.width / 1.5
               text: qsTr("Добавить пациента")
               onClicked: pageStack.push(Qt.resolvedUrl("AddPatient.qml"))
               backgroundColor: "white"
               color: "black"
            }
            Button {
               id: button2
               anchors.horizontalCenter: parent.horizontalCenter
               width: parent.width / 1.5
               text: qsTr("Просмотр пациентов")
               onClicked: pageStack.push(Qt.resolvedUrl("ShowPatients.qml"))
               backgroundColor: "white"
               color: "black"
            }
        }
}
