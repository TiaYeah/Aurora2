import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // 1. Создать приложение, отображающее светофор.
    // На экране должно присутствовать 3 разноцветных сигнала, которые загораются и гаснут в том же порядке, что и сигналы светофора.
    // Сделать автоматическую смену состояний.
    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge

        states: [
            State
            {
                name: "Stop"
            },
            State
            {
                name: "Wait"
            },
            State
            {
                name: "Start"
            }
        ]
        state: "Stop"

        property string prevState: "Stop"
        function switchState()
        {
            if (column.state == "Stop")
                column.state = "Wait"
            else if (column.state == "Wait" && prevState == "Stop") {
                column.state = "Start"
                prevState = "Start"
            }
            else if (column.state == "Start")
                column.state = "Wait"
            else if (column.state == "Wait" && prevState == "Start") {
                column.state = "Stop"
                prevState = "Stop"
            }
        }

        Timer
        {
            interval: 3000
            running: true
            repeat: true
            onTriggered:
            {
                column.switchState()
            }
        }

        Rectangle
        {
            id: redLight
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 300
            radius: width / 2
            color: "black"
            states: [
                State
                {
                    name: "On"
                    when: column.state == "Stop"
                    PropertyChanges {
                        target: redLight
                        color: "red"
                    }
                },
                State
                {
                    name: "Off"
                    when: !(column.state == "Stop")
                    PropertyChanges {
                        target: redLight
                        color: "black"
                    }
                }
            ]
        }
        Rectangle
        {
            id: yellowLight
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 300
            radius: width / 2
            color: "black"
            states: [
                State
                {
                    name: "On"
                    when: column.state == "Wait"
                    PropertyChanges {
                        target: yellowLight
                        color: "yellow"
                    }
                },
                State
                {
                    name: "Off"
                    when: !(column.state == "Wait")
                    PropertyChanges {
                        target: yellowLight
                        color: "black"
                    }
                }

            ]
        }
        Rectangle
        {
            id: greenLight
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 300
            radius: width / 2
            color: "black"
            states: [
                State
                {
                    name: "On"
                    when: column.state == "Start"
                    PropertyChanges {
                        target: greenLight
                        color: "green"
                    }
                },
                State
                {
                    name: "Off"
                    when: column.state == "Stop" || column.state == "Wait"
                    PropertyChanges {
                        target: greenLight
                        color: "black"
                    }
                }
            ]
        }

    }
}
