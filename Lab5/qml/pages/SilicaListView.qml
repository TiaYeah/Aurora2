import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    ListModel {
        id: animalsModel
        ListElement { task: "Ничего не делать"; date: "1.05.2023"; }
        ListElement { task: "Сходить в столовую"; date: "2.05.2023"; }
        ListElement { task: "Писать контрольную"; date: "2.05.2023"; }
        ListElement { task: "Сдать лабораторную"; date: "4.05.2023"; }
    }
    SilicaListView {
        anchors.fill: parent
        model: animalsModel
        header: PageHeader { title: "Задачи на неделю" }
        section {
            property: 'date'
            delegate: SectionHeader { text: section }
        }
        delegate: Text { text: task }
    }
}
