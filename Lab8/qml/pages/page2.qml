import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import harbour.Lab8.ListString 1.0

Page {
    Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge


            ListString {
                id: listString
            }

            TextField
            {
                id: textField
                width: parent.width
                placeholderText: "Введите слово"
            }

            Button
            {
                width: parent.width
                text: "Добавить слово"
                onClicked: listString.addString(textField.text.toLocaleLowerCase())
            }

            Button
            {
                width: parent.width
                text: "Удалить последнее добавленное слово"
                onClicked: listString.deleteLast()
            }

            TextArea {
                width: parent.width
                height: 700
                anchors.horizontalCenter: parent.horizontalCenter
                color: "black"
                font.pixelSize: 35
                text: listString.text
                readOnly: true
            }

    }
}
