import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import QtQuick.XmlListModel 2.0

Page {
    XmlListModel {
        id: xmlListModel
        query: "/ValCurs/Valute"
        XmlRole { name: "name"; query: "Name/string()" }
        XmlRole { name: "value"; query: "Value/string()" }
    }
    SilicaListView {
        anchors.fill: parent
        header: PageHeader {}
        model: xmlListModel
        delegate: Column {
            x: Theme.horizontalPageMargin
            Label { text: name + " = " + value + "RUB" }
        }
    }
    Component.onCompleted: loadNews()
    function loadNews() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'http://www.cbr.ru/scripts/XML_daily.asp', true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                xmlListModel.xml = xhr.responseText;
            }
        }
        xhr.send();
    }
}


