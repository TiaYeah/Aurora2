import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1



CoverBackground {
    objectName: "defaultCover"

    CoverPlaceholder {
        Label {
            property int count: 0
            id: coverLabel
            text: count
            anchors.centerIn: parent
        }
        CoverActionList {
            CoverAction {
                iconSource: "image://theme/icon-cover-cancel"
                onTriggered: coverLabel.count--
            }
            CoverAction {
                iconSource: "image://theme/icon-cover-new"
                onTriggered: coverLabel.count++
            }
        }
    }
}
