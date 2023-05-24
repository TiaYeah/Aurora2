import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: page
    property var _fieldModel: [{id: 1}, {id: 2}, {id: 3}]
    PageHeader{
        id: header
        title: "Выберите уровень"
        width: parent.width
    }
    SilicaGridView{
        anchors.top: header.bottom
        anchors.margins: Theme.paddingMedium
        x: 25
        cellHeight: 160
        cellWidth: 160
        width: parent.width - 50
        height: parent.height
        model: page._fieldModel
        delegate: Button {
            width: 150
            height: 150
            text: modelData.id
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Level%1.qml").arg(modelData.id)))
            backgroundColor: "lightblue"
        }
    }
}
