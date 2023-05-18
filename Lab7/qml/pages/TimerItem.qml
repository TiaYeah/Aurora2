import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: clock
    width: label.width
    height: label.height
    property int seconds: 0
    property int minutes: 0
    property int hours: 0
    Timer
    {
        id: timer
        interval: 1
        repeat: true
        onTriggered: {
            seconds++
            minutes = (seconds / 60) % 60
            hours = (minutes / 60) % 24
        }
    }

    function start()
    {
        clock.seconds = 0;
        timer.start();
    }

    function stop()
    {
        timer.stop();
    }


    Label
    {
        id: label
        text: hours + ":" + minutes + ":" + seconds % 60
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
