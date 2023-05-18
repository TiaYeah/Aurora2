import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import harbour.Lab8.Counter 1.0

Page {
    Counter {
        id: counter
        value: 50
    }
    Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            Label {
                id: label
                x: Theme.horizontalPageMargin
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
                text: counter.value
            }
            Button
            {
                width: parent.width
                text: "Увеличить"
                onClicked: counter.inc()
            }
            Button
            {
                width: parent.width
                text: "Сбросить"
                onClicked: counter.reset()
            }
    }
}
