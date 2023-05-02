import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    SilicaListView {
        anchors.fill: parent
        model: 20
        delegate: ListItem {
            id: delegate
            Label {
                id: label1
                x: Theme.paddingLarge
                text: "List Item #" + index
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            menu: ContextMenu {
                MenuLabel { text: "Context Menu" }
                MenuItem {
                    id: item1
                    text: "Menu Item 1"
                    onClicked: console.log(item1.text + " Индекс " + label1.text)
                }
                MenuItem {
                    id: item2
                    text: "Menu Item 2"
                    onClicked: console.log(item2.text + " Индекс " + label1.text)
                }
            }
        }
    }

}
