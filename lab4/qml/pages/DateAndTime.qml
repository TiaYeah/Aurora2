import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: page2
    // создать селектор даты, который будет отображать выбранную дату в консоли
    DatePicker {
        anchors.top : button3.bottom
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
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        id: timePicker1
        onTimeTextChanged: console.log("Выбранное время " + timeText)
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
