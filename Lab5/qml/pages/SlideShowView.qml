import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1


Page {
    SlideshowView {
        id: view
        anchors.centerIn: parent
        height: width
        itemHeight: width; itemWidth: width;
        model: 4
        delegate: Column {
            property var arr: ["1.05.2023 Ничего не делать", "2.05.2023 Сходить в столовую", "2.05.2023 Писать контрольную", "4.05.2023 Сдать лабораторную"]
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                id: name
                text: arr[index]
            }
            width: view.itemWidth;
            height: view.itemHeight;
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8
                height: width
                source: qsTr("../resources/pic%1.jpg").arg(index)
            }
        }
    }
}
