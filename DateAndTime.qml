import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: page2
    // создать селектор даты, который будет отображать выбранную дату в консоли
    DatePicker {
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        id: datePicker1
        date: new Date(2023, 04, 19, 12, 0, 0)
        daysVisible: true
        weeksVisible: true
        onDateTextChanged: console.log("Выбранная дата " + dateText)
    }

//                Button {
//                    anchors.top : button3.bottom
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    text: "Нажми меня"
//                    id: button4
//                    down: false
//                    onClicked: {


//                    var dialog = pageStack.push(pickerComponent, {
//                                 date: new Date(2023, 03, 19, 12, 0, 0)
//                             })
//                             dialog.accepted.connect(function() {
//                                 console.log("Выбранная дата " + dialog.dateText)
//                             })
//                         }
//                    Component {
//                        id: pickerComponent
//                        DatePickerDialog {}
//                    }
//                }


// создать селектор времени, который будет отображать выбранное время в консоли
    TimePicker {
        anchors.top : datePicker1.bottom
        anchors.topMargin: 165
        z: 1
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        id: timePicker2

        onTimeTextChanged: console.log("Выбранное время " + timePicker2.timeText + ":" + timePicker1.minute)
    }
    TimePicker {
        id: timePicker1
        width: parent.width
        _mode: 1

        anchors.centerIn: timePicker2
        onTimeTextChanged: console.log("Выбранное время " + timePicker2.timeText + ":" + timePicker1.minute)
    }


//            Button {
//                anchors.top : button4.bottom
//                anchors.horizontalCenter: parent.horizontalCenter
//                text: "Нажми меня"
//                id: button5
//                down: false
//                onClicked: {


//                var dialog = pageStack.push(timePickerComponent)
//                         dialog.accepted.connect(function() {
//                             console.log("Выбранное время " + dialog.timeText)
//                         })
//                     }
//                Component {
//                    id: timePickerComponent
//                    TimePickerDialog {}
//                }
//            }
}
