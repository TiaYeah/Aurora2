import QtQuick 2.0
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0


Dialog {
    visible: true
    anchors.top: parent

    Column {
        anchors.fill: parent
        width: parent.width
        spacing: 20;
        DialogHeader { }
        Row {
            width: parent.width
            height: parent.height/3
            TextField {
                id : field1
                implicitWidth: parent.width / 2 - 50
            }
            TextField {
                id : field2
                implicitWidth: parent.width / 2 - 50
            }
        }
    }
    onAccepted: console.log(parseInt(field1.text) + parseInt(field2.text))
}
