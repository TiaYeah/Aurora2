import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import Nemo.Configuration 1.0


Page {
    PageHeader{
        title: "Выберете скин"
        width: parent.width
    }
    ConfigurationValue {
        id: setting
        key: "/apps/Game/skin"
        defaultValue: "Wood"
    }
    Column {
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        spacing: Theme.paddingMedium
        anchors.topMargin: 150
        IconTextSwitch {
            id: wood
            width: parent.width / 2
            icon.source: "../resources/Wood/2H.png"
            checked: setting.value === "Wood"
            onClicked: {
                setting.value = "Wood"
                neon.checked = false
            }
        }
        IconTextSwitch {
            id: neon
            width: parent.width / 2
            icon.source: "../resources/Neon/2H.png"
            checked: setting.value === "Neon"
            onClicked: {
                setting.value = "Neon"
                wood.checked = false
            }
        }
    }
}
