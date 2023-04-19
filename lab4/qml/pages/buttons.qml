import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: page

            // The effective value will be restricted by ApplicationWindow.allowedOrientations
            allowedOrientations: Orientation.All

            SilicaFlickable {
                anchors.fill: parent

                anchors.leftMargin: 100
                // создать текстовое поле для ввода числа с заголовком и подсказкой
                TextField {
                    y: 20
                    id: textField1
                    width: parent.width

                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    label: "Number"
                    placeholderText: label
                }

                // создать кнопку, которая будет сохранять визуально нажатое состояние, после того, как пользователь нажал на неё один раз
                Button {
                    anchors.top : textField1.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    highlightColor: "Blue"
                    color: "yellow"
                    highlightBackgroundColor: "red"
                    text: "Нажми меня"
                    id: button1
                    down: false
                    onClicked: down = true // понятия не имею, как это делать. всё, что смогла придумать
                }
                // создать кнопку и поле с текстом. Поле c текстом должно отображать нажата ли кнопка или нет выводом текста “Нажата” или “Отпущена”
                Button {
                    anchors.top : button1.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: button2
                    text: "Нажми меня"
                    onClicked: {
                        button2.down = !button2.down
                        if(button2.down){
                            label1.text = "Нажата"
                        } else {
                            label1.text = "Отпущена"
                        }
                    }
                }
                Label {
                    id: label1
                    anchors.top: button2.bottom
                    anchors.horizontalCenter: button2.horizontalCenter
                    text: "Отпущена"
                }


                // создать кнопку со значением, которая будет отображать количество нажатий на неё
                ValueButton {
                    anchors.top : label1.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: button3
                    property int count: 0
                    label: "Счётчик"
                    description: "Считает количество нажатий"
                    value: count
                    onClicked: count++
                }





            // создать поле с выпадающим списком, позволяющее выбрать строку из списка. Результат выбора отобразить в консоли
            ComboBox {
                anchors.top : button3.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                id: comboBox1
                label: "Выпадающий список"
                description: "Описание выпадающего списка"
                menu: ContextMenu {
                    MenuItem { text: "первый" }
                    MenuItem { text: "второй" }
                    MenuItem { text: "третий" }
                }
                onCurrentIndexChanged: console.log(currentIndex + " " + currentItem.text)
            }

            // создать переключатель с текстом, в тексте отобразить состояние переключателя “Включен” или “Выключен”
            TextSwitch {
                anchors.top : comboBox1.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                id: textSwitch1
                text: "Выключен"
                onClicked: { if(checked) text = "Включён"
                                     else text = "Выключен" }
            }

            // создать ползунок и поле с текстом. Поле с текстом должно отображать текущее значение ползунка
            Item {
                id: item1
                width: parent.width
                anchors.top : textSwitch1.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                Slider {
                    anchors.top : textSwitch1.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: slider1
                    width: parent.width
                    label: "Ползунок"
                    maximumValue: 40
                    minimumValue: -10
                    value: 10
                    stepSize: 0.1
                    onValueChanged: slider1TextField1.text = "Текущее значение ползунка: " + value
                }
                TextField {
                    anchors.top : slider1.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: slider1TextField1
                    width: parent.width
                    text: "Текущее значение ползунка: " + slider1.value
                }
            }

            }
}
