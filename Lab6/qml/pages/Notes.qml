import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    DAO { id: dao }
    Column {
        spacing: 10
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        TextField{
            anchors.horizontalCenter: parent.horizontalCenter
            id: textField1
            placeholderText: "Введите заметку"
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            id: button1
            text: "Добавить"
            onClicked: {
                dao.insertNote(textField1.text)
                selectNotes()
            }
        }
        SilicaListView {
             width: parent.width;
             x: 150
             y: 200
             model: ListModel { id: notesListModel }
             delegate: ListItem {
                 Label {
                     text: note + " " + id
                     MouseArea {
                         anchors.fill: parent
                         onClicked: notesListModel.remove(id)
                     }
                 }
             }
        }
    }
    function selectNotes() {
        notesListModel.clear();
        dao.getNotes(function(notes) {
            for (var i = 0; i < notes.length; i++) {
                var note = notes.item(i);
                notesListModel.append({id: note.id, note: note.note});
            }
        });
    }
    Component.onCompleted: selectNotes()
}
