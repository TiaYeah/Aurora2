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
            Item {
                id: square
                property int size: 150

            }

            Column {
                Item {
                    id: item1
                    height: square.size * 2
                    Rectangle{
                        x: 50
                        y: 50
                        width: square.size
                        height: square.size
                        color: "red"
                    }

                    Rectangle{
                        x: 50 + square.size
                        y: 50 + square.size / 2
                        width: square.size
                        height: square.size
                        color: "lightgreen"
                    }
                    Rectangle{
                        Text{
                            text: "Квадрат"
                            color: "white"
                            anchors.centerIn: parent
                        }

                        x: 50 + square.size * 1.5
                        y: 50
                        width: square.size
                        height: square.size
                        color: "blue"
                    }
                }
                Item {
                    id: item2
                    height: square.size * 3
                    anchors.top: item1.bottom
                    Column {
                        spacing: 50
                        Row{
                            spacing: 50
                            Rectangle{
                                x: 50
                                y: 50
                                width: square.size
                                height: square.size
                                color: "red"
                            }

                            Rectangle{
                                x: 50
                                y: 50
                                width: square.size
                                height: square.size
                                color: "lightgreen"
                            }
                            Rectangle{
                                x: 50
                                y: 50
                                width: square.size
                                height: square.size
                                color: "blue"
                            }
                        }
                        Row {
                            spacing: 50
                            Rectangle{
                                x: 50
                                y: 50
                                width: square.size
                                height: square.size
                                color: "pink"
                            }
                            Rectangle{
                                x: 50
                                y: 50
                                width: square.size
                                height: square.size
                                opacity: 0
                            }

                            Rectangle{
                                x: 50
                                y: 50
                                width: square.size
                                height: square.size
                                color: "black"
                            }
                        }
                    }
                }
                Item {
                    id: item3
                    anchors.top: item2.bottom
                    Grid{
                        rows: 2
                        columns: 3
                        spacing: 50

                        Rectangle{
                            width: square.size
                            height: square.size
                            color: "red"
                            Text{
                                id: text1
                                text: "Квадрат"
                                color: "white"
                                anchors.centerIn: parent

                                transform: Rotation {
                                    id: rotation1
                                    origin.x: text1.width / 2
                                    origin.y: text1.height / 2
                                }

                                SequentialAnimation {
                                    running: true
                                    loops: Animation.Infinite

                                    RotationAnimation {
                                        target: rotation1
                                        from: 0
                                        to: 360
                                    }
                                }
                            }


                        }

                        Rectangle{
                            width: square.size
                            height: square.size
                            color: "lightgreen"
                            Text{
                                id: text2
                                text: "Квадрат"
                                color: "white"
                                anchors.centerIn: parent

                                transform: Rotation {
                                    id: rotation2
                                    origin.x: text2.width / 2
                                    origin.y: text2.height / 2
                                }

                                SequentialAnimation {
                                    running: true
                                    loops: Animation.Infinite

                                    RotationAnimation {
                                        target: rotation2
                                        from: 0
                                        to: 360
                                    }
                                }
                            }
                        }
                        Rectangle{
                            width: square.size
                            height: square.size
                            color: "blue"
                            Text{
                                id: text3
                                text: "Квадрат"
                                color: "white"
                                anchors.centerIn: parent

                                transform: Rotation {
                                    id: rotation3
                                    origin.x: text3.width / 2
                                    origin.y: text3.height / 2
                                }

                                SequentialAnimation {
                                    running: true
                                    loops: Animation.Infinite

                                    RotationAnimation {
                                        target: rotation3
                                        from: 0
                                        to: 360
                                    }
                                }
                            }
                        }

                        Rectangle{
                            width: square.size
                            height: square.size
                            color: "pink"
                            Text{
                                id: text4
                                text: "Квадрат"
                                color: "white"
                                anchors.centerIn: parent

                                transform: Rotation {
                                    id: rotation4
                                    origin.x: text4.width / 2
                                    origin.y: text4.height / 2
                                }

                                SequentialAnimation {
                                    running: true
                                    loops: Animation.Infinite

                                    RotationAnimation {
                                        target: rotation4
                                        from: 0
                                        to: 360
                                    }
                                }
                            }
                        }

                        Rectangle{
                            opacity: 0
                            width: square.size
                            height: square.size
                        }


                        Rectangle{
                            width: square.size
                            height: square.size
                            color: "black"
                            Text{
                                id: text5
                                text: "Квадрат"
                                color: "white"
                                anchors.centerIn: parent

                                transform: Rotation {
                                    id: rotation5
                                    origin.x: text5.width / 2
                                    origin.y: text5.height / 2
                                }

                                SequentialAnimation {
                                    running: true
                                    loops: Animation.Infinite

                                    RotationAnimation {
                                        target: rotation5
                                        from: 0
                                        to: 360
                                    }
                                }
                            }
                        }
                    }
                }
                }

            }
            VerticalScrollDecorator {}
        }
