import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    SilicaListView {
        PushUpMenu {
            MenuLabel { text: qsTr("Menu Label") }
            MenuItem {
                text: "Menu Item 1"
                onClicked: textField.text = "PushUpMenu Item 1 is clicked"
            }
            MenuItem {
                text: "Menu Item 2"
                onClicked: textField.text = "PushUpMenu Item 2 is clicked"
            }
        }
        PullDownMenu {
            MenuItem {
                text: "Menu Item 2"
                onClicked: textField.text = "PullDownMenu Item 2 is clicked"
            }
            MenuItem {
                text: "Menu Item 1"
                onClicked: textField.text = "PullDownMenu Item 1 is clicked"
            }
            MenuLabel { text: qsTr("Menu Label") }
        }

        anchors.fill: parent
        header: PageHeader { title: "Simple List" }
        TextField {
            anchors.centerIn: parent
            id: textField
            text: ""
        }
    }
}
