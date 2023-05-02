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
           onClicked: pageStack.push(Qt.resolvedUrl("pagestack.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button2
           text: qsTr("2")
           onClicked: pageStack.push(Qt.resolvedUrl("SecondTask.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button3
           text: qsTr("Ввод текста")
           onClicked: {
               var dialog = pageStack.push(textDialogComponent)
                dialog.accepted.connect(function() {
                    console.log(parseInt(dialog.firstTextFieldValue) + parseInt(dialog.secondTextFieldValue))
                })
            }
           Component {
               id: textDialogComponent
               Dialog {
                   property alias firstTextFieldValue: firstTextField.text
                   property alias secondTextFieldValue: secondTextField.text
                   Column {
                       width: parent.width
                       spacing: Theme.paddingMedium
                       DialogHeader { }
                       TextField {
                          id: firstTextField
                          width: parent.width
                       }
                       TextField {
                          id: secondTextField
                          width: parent.width
                       }
                   }

                }
           }
           backgroundColor: "white"
           color: "black"
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Выбор даты"
            id: button4
            down: false
            onClicked: {
            var dialog = pageStack.push(pickerComponent, {
                         date: new Date(2023, 03, 19, 12, 0, 0)
                     })
                     dialog.accepted.connect(function() {
                         console.log("Выбранная дата " + dialog.dateText)
                     })
                 }
            Component {
                id: pickerComponent
                DatePickerDialog {}
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Выбор времени"
            id: button5
            down: false
            onClicked: {
            var dialog = pageStack.push(timePickerComponent)
                     dialog.accepted.connect(function() {
                         console.log("Выбранное время " + dialog.timeText)
                     })
                 }
            Component {
                id: timePickerComponent
                TimePickerDialog {}
            }
        }
        Button {
           id: button6
           text: qsTr("SilicaListView")
           onClicked: pageStack.push(Qt.resolvedUrl("SilicaListView.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button7
           text: qsTr("SilicaWebView")
           onClicked: pageStack.push(Qt.resolvedUrl("SilicaWebView.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button8
           text: qsTr("SlideShowView")
           onClicked: pageStack.push(Qt.resolvedUrl("SlideShowView.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button9
           text: qsTr("Menu")
           onClicked: pageStack.push(Qt.resolvedUrl("Menu.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button10
           text: qsTr("ContextMenu")
           onClicked: pageStack.push(Qt.resolvedUrl("ContextMenu.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           id: button11
           text: qsTr("Cover")
           onClicked: pageStack.push(Qt.resolvedUrl("Cover.qml"))
           backgroundColor: "white"
           color: "black"
        }
    }

}
