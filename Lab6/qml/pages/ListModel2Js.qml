import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1


Page {
   property var dataModel: [
        { color: "white", textColor: "black", text: "Белый" },
        { color: "black", textColor: "white", text: "Черный" },
        { color: "blue", textColor: "red", text: "Синий" }
   ]
   SilicaListView {
       anchors.fill: parent
       header: PageHeader { title: "Simple List" }
       model: dataModel
       spacing: 10
       delegate: Rectangle {
           width: parent.width
           height: 100
           color: modelData.color
           Text {
               color: modelData.textColor
               anchors.centerIn: parent
               text: modelData.text
           }
       }
   }
}

