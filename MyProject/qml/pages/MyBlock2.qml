import QtQuick 2.0
import Nemo.Configuration 1.0

Rectangle {
    ConfigurationValue {
        id: setting
        key: "/apps/Game/skin"
    }
    radius: 30
    width: 100
    height: 100
    property int leftX: 0
    property int topY: 0
    property int pos: 0
    property int length: 0
    id: rect
    property bool isRed: true

    signal dragElement(var _direction)

//    Component.onCompleted: setPosAndLength()
//    function setPosAndLength() {
//        if(length == 2) {
//            width = rect.width * 2
//        } else {
//            width = rect.width * 3
//        }
//        if(pos == 2) {
//            var tmp = rect.width;
//            rect.width = height;
//            rect.height = tmp;
//        }
//    }

    Image {
        id: image
        anchors.fill: parent
        Component.onCompleted: calculateSource(rect.pos, rect.length, rect.isRed)
        function calculateSource(_pos, _length, _color){
            if(_color === true) {
                image.source = qsTr("../resources/%1/Red.png").arg(setting.value)
            } else {
                if(_pos === 2) {
                    if (_length === 3) {
                        image.source = qsTr("../resources/%1/3V.png").arg(setting.value)
                    } else if (_length === 2) {
                        image.source = qsTr("../resources/%1/2V.png").arg(setting.value)
                    }
                } else if (_pos === 1){
                    if (_length === 3) {
                        image.source = qsTr("../resources/%1/3H.png").arg(setting.value)
                    } else if (_length === 2) {
                        image.source = qsTr("../resources/%1/2H.png").arg(setting.value)
                    }
                }
            }
        }
    }

    Behavior on x {
        NumberAnimation { duration: 50 }
    }
    Behavior on y {
        NumberAnimation { duration: 50 }
    }

    MouseArea {
        anchors.fill: parent
        property int prevX: 0
        property int prevY: 0
        property int directrion: 0

        onPressed: {
            prevX: mouseX
            prevY: mouseY
            directrion: 0
            console.debug("onPressed mouseX:" + rect.pos);
        }
        onPositionChanged: {
//            console.debug("onPressed mouseX:" + mouseX);
//            console.debug("prevX:" + prevX);
            if (rect.pos == 1) {
                if(prevX > mouseX){
                    direction = 4;
                }
                else if(prevX < mouseX){
                    direction = 2;
                }
            } else if (rect.pos == 2) {
                if(prevY > mouseY){
                    direction = 1;
                }
                else if(prevY < mouseY){
                    direction = 3;
                }
            }
            prevY = mouseY
            prevX = mouseX;
        }
        onReleased: {
            rect.dragElement(direction)
        }
    }
}
