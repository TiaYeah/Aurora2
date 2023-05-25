import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

import harbour.Dop.TokenGenerator 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    DAO { id: dao }

    TokenGenerator {
        id: generator
    }

    Rectangle {
        anchors.fill: parent
        z: -1
        gradient: Gradient {
            GradientStop {position: 0.0; color: "orange"}
            GradientStop {position: 1.0; color: "yellow"}
        }
    }
    GridLayout {
        anchors.fill: parent
        columns: 2
        rows: 14
        Label {
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 2
            text: "Введите фамилию"
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        TextField {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: surname

            //onActiveFocusChanged: font.pixelSize == 30 ? font.pixelSize = 50 : font.pixelSize = 30
        }
        Label {
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 2
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Введите имя"
        }
        TextField {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 2
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: name
        }
        Label {
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 4
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Введите отчество"
        }
        TextField {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 4
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: patronymic_name
        }
        Label {
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 6
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Введите год рождения"
        }
        TextField {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 6
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: ageField
            validator: RegExpValidator{regExp: /\d+/}
        }
        Label {
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 8
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Выберите пол"
        }
        TextSwitch {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 8
            Layout.rowSpan: 1
            Layout.preferredWidth: 1
            Layout.preferredHeight: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: switch1
            text: "Мужской"
            onClicked: {
                switch2.checked = false;
            }
        }
        TextSwitch {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 9
            Layout.rowSpan: 1
            Layout.preferredWidth: 1
            Layout.preferredHeight: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: switch2
            text: "Женский"
            onClicked: {
                switch1.checked = false;
            }
        }
        Label {
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 10
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Введите рост"
        }
        TextField {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 10
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: heightField
            validator: RegExpValidator{regExp: /\d+/}
        }
        Label {
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 12
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Введите вес"
        }
        TextField {
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 12
            Layout.rowSpan: 2
            Layout.preferredWidth: 1
            Layout.preferredHeight: 2
            Layout.fillHeight: true
            Layout.fillWidth: true

            id: weightField
            validator: RegExpValidator{regExp: /\d+/}
        }

        Button {
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.row: 14
            Layout.rowSpan: 1
            Layout.preferredWidth: 2
            Layout.preferredHeight: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: button1
            text: "Добавить"
            onClicked: {
                if(heightField.acceptableInput && weightField.acceptableInput){
                    dao.insertPatient(surname.text, name.text, patronymic_name.text, ageField.text, switch1.checked ? switch1.text : switch2.text, heightField.text, weightField.text, generator.genToken())
                }
            }
        }
//        Label {
//            text: "Введите отчество"
//        }
//        TextField {
//            id: patronymic_name
//            placeholderText: "Отчество"
//        }
//        Label {
//            text: "Введите год рождения"
//        }
//        TextField {
//            id: ageField
//            placeholderText: "Год рождения"
//            validator: RegExpValidator{regExp: /\d+/}
//        }
//        Label {
//            text: "Выберите пол"
//        }
//        TextSwitch {
//            id: switch1
//            text: "Мужской"
//            onClicked: {
//                switch2.checked = false;
//            }
//        }
//        TextSwitch {
//            id: switch2
//            text: "Женский"
//            onClicked: {
//                switch1.checked = false;
//            }
//        }
//        Label {
//            text: "Введите рост"
//        }
//        TextField {
//            id: heightField
//            placeholderText: "Рост"
//            validator: RegExpValidator{regExp: /\d+/}
//        }
//        Label {
//            text: "Введите вес"
//        }
//        TextField {
//            id: weightField
//            placeholderText: "Вес"
//            validator: RegExpValidator{regExp: /\d+/}
//        }

//        Button {
//            id: button1
//            text: "Добавить"
//            onClicked: {
//                if(heightField.acceptableInput && weightField.acceptableInput){
//                    dao.insertPatient(surname.text, name.text, patronymic_name.text, ageField.text, switch1.checked ? switch1.text : switch2.text, heightField.text, weightField.text, generator.genToken())
//                }
//            }
//        }
    }

    Column {
//        x: 35
//        spacing: 0
//        Label {
//            text: "Введите фамилию"
//        }
//        TextField {
//            id: surname
//            placeholderText: "Фамилия"
//        }
//        Label {
//            text: "Введите имя"
//        }
//        TextField {
//            id: name
//            placeholderText: "Имя"
//        }
//        Label {
//            text: "Введите отчество"
//        }
//        TextField {
//            id: patronymic_name
//            placeholderText: "Отчество"
//        }
//        Label {
//            text: "Введите год рождения"
//        }
//        TextField {
//            id: ageField
//            placeholderText: "Год рождения"
//            validator: RegExpValidator{regExp: /\d+/}
//        }
//        Label {
//            text: "Выберите пол"
//        }
//        TextSwitch {
//            id: switch1
//            text: "Мужской"
//            onClicked: {
//                switch2.checked = false;
//            }
//        }
//        TextSwitch {
//            id: switch2
//            text: "Женский"
//            onClicked: {
//                switch1.checked = false;
//            }
//        }
//        Label {
//            text: "Введите рост"
//        }
//        TextField {
//            id: heightField
//            placeholderText: "Рост"
//            validator: RegExpValidator{regExp: /\d+/}
//        }
//        Label {
//            text: "Введите вес"
//        }
//        TextField {
//            id: weightField
//            placeholderText: "Вес"
//            validator: RegExpValidator{regExp: /\d+/}
//        }

//        Button {
//            id: button1
//            text: "Добавить"
//            onClicked: {
//                if(heightField.acceptableInput && weightField.acceptableInput){
//                    dao.insertPatient(surname.text, name.text, patronymic_name.text, ageField.text, switch1.checked ? switch1.text : switch2.text, heightField.text, weightField.text, generator.genToken())
//                }
//            }
//        }
    }
}
