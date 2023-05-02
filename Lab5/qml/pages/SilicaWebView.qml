import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    SilicaWebView {
        id: webView
        anchors {
            top: parent.top; bottom: urlField.top;
            left: parent.left; right: parent.right;
        }
        //url: "https://jut.su/"
        url: "https://ru.dotabuff.com/players/176557950"
    }
    TextField {
        id: urlField
        anchors {
            left: parent.left; right: parent.right;
            bottom: parent.bottom
        }
        //text: "https://jut.su/"
        text: "https://ru.dotabuff.com/players/176557950"
        label: webView.title
        EnterKey.onClicked: webView.url = text
    }
}
