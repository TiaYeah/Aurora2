import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    IconButton {
        width: 100
        height: 100
        anchors.left: parent.left
        anchors.top: parent.top
        icon.width: 100
        icon.height: 100
        icon.source: "../resources/homeIcon.png"
        onClicked: pageStack.pop()
    }
    backNavigation: false
    Text {
        anchors.fill: parent
        anchors.topMargin: parent.height / 2.5
        anchors.leftMargin: parent.width / 4
        text: "В разработке"
        font.pixelSize: 50
    }
}
