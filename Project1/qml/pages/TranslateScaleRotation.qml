import QtQuick 2.0
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0

Page {
    objectName: "animSquares"
    SilicaFlickable {
        anchors.fill: parent
        anchors {
            topMargin: 50
        }
        width: Layout.width

        Item {
            id : square;
            property int size: 150
        }

        Column {
            width: parent.width
            id: tmp
            anchors {
                left : parent.left
                leftMargin: 100
            }

            Item {
                id: item1
                height: 300
                anchors {
                    left: parent.left
                    leftMargin: 100
                }

                Rectangle {
                    y : 0
                    x : 0
                    width: square.size
                    height: square.size
                    color: "black"

                    transform: [
                        Translate {x: square.size / 2},
                        Scale { xScale: 0.5},
                        Rotation {angle : 45 }
                    ]
                }
            }

            Item {
                id: item2

                anchors {
                    left: parent.left
                    top : item1.bottom
                }

                Rectangle {
                    id: rect
                    y : 0
                    x : 0
                    width: square.size
                    height: square.size
                    color: "black"

                    transform: Scale {
                        id: st
                        property real scale: 1
                        xScale: scale
                        yScale: scale
                    }

                    ParallelAnimation {
                        running: true
                        SequentialAnimation {
                            running: true
                            loops: Animation.Infinite

                            NumberAnimation {
                                target: rect
                                property: "y"
                                from: 0; to: 400
                                duration: 1000
                            }
                            PauseAnimation { duration: 500 }
                        }

                        SequentialAnimation {
                            running: true
                            loops: Animation.Infinite

                            PropertyAnimation {
                                target: st
                                properties: "scale"
                                from: 1.0
                                to: 3.0
                                duration: 1000
                            }
                            PauseAnimation { duration: 500 }
                        }
                    }
                }
            }
        }
    }
}
