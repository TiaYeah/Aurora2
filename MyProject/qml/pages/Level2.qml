import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import Nemo.Configuration 1.0

import harbour.Lab8.Matrix 1.0

Page {
    ConfigurationValue {
        id: setting
        key: "/apps/Game/skin"
    }
    id: page
    backNavigation: false
    Image {
        z: -1
        id: background
        anchors.fill: parent
        source: qsTr("../resources/%1/background.png").arg(setting.value)
    }

    IconButton {
        width: 100
        height: 100
        anchors.left: parent.left
        anchors.top: parent.top
        icon.width: 100
        icon.height: 100
        icon.source: "../resources/homeIcon.png"
        onClicked: pageStack.pop()
    }

    Rectangle {
        width: 10
        height: 660
        radius: 5
        y: 275
        x: 20
        Image {
            anchors.fill: parent
            id: wallImageLeft
            source: qsTr("../resources/%1/WallVertical.png").arg(setting.value)
        }
    }
    Rectangle {
        width: 660
        height: 10
        radius: 5
        y: 275
        x: 20
        Image {
            anchors.fill: parent
            id: wallImageTop
            source: qsTr("../resources/%1/WallHorizontal.png").arg(setting.value)
        }
    }
    Rectangle {
        width: 660
        height: 10
        radius: 5
        y: 925
        x: 20
        Image {
            anchors.fill: parent
            id: wallImageBottom
            source: qsTr("../resources/%1/WallHorizontal.png").arg(setting.value)
        }
    }
    Rectangle {
        width: 10
        height: 220
        radius: 5
        y: 275
        x: 670
        Image {
            anchors.fill: parent
            id: wallImageRight1
            source: qsTr("../resources/%1/WallVertical.png").arg(setting.value)
        }
    }
    Rectangle {
        width: 10
        height: 330
        radius: 5
        y: 605
        x: 670
        Image {
            anchors.fill: parent
            id: wallImageRight2
            source: qsTr("../resources/%1/WallVertical.png").arg(setting.value)
        }
    }
    Item {
        id: field
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        property int gap: 150
        property var _fieldModel: []
        property var pole: []
        Matrix {
            id: matrix
        }
        function getFieldModel() {
            var localModel = []
            localModel.push({pos: 2, length: 2, topY: 1, leftX: 1, visible: true, isRed: false})
            setMatrix(2, 2, 1, 1)
            localModel.push({pos: 1, length: 2, topY: 1, leftX: 2, visible: true, isRed: false})
            setMatrix(1, 2, 1, 2)
            localModel = pushInvisibleBlock(localModel, 1)
            localModel.push({pos: 2, length: 2, topY: 1, leftX: 4, visible: true, isRed: false})
            setMatrix(2, 2, 1, 4)
            localModel = pushInvisibleBlock(localModel, 4)
            localModel.push({pos: 2, length: 2, topY: 2, leftX: 3, visible: true, isRed: false})
            setMatrix(2, 2, 2, 3)
            localModel = pushInvisibleBlock(localModel, 1)
            localModel.push({pos: 1, length: 2, topY: 2, leftX: 5, visible: true, isRed: false})
            setMatrix(1, 2, 2, 5)
            localModel = pushInvisibleBlock(localModel, 1)
            localModel.push({pos: 1, length: 2, topY: 3, leftX: 1, visible: true, isRed: true})
            setMatrix(2, 2, 3, 1)
            localModel = pushInvisibleBlock(localModel, 4)
            localModel.push({pos: 2, length: 2, topY: 3, leftX: 6, visible: true, isRed: false})
            setMatrix(2, 2, 3, 6)
            localModel = pushInvisibleBlock(localModel, 1)
            localModel.push({pos: 2, length: 3, topY: 4, leftX: 2, visible: true, isRed: false})
            setMatrix(2, 3, 4, 2)
            localModel.push({pos: 1, length: 3, topY: 4, leftX: 3, visible: true, isRed: false})
            setMatrix(1, 3, 4, 3)
            localModel = pushInvisibleBlock(localModel, 7)
            localModel.push({pos: 1, length: 2, topY: 5, leftX: 5, visible: true, isRed: false})
            setMatrix(1, 2, 5, 5)
            localModel = pushInvisibleBlock(localModel, 3)
            localModel.push({pos: 1, length: 2, topY: 6, leftX: 3, visible: true, isRed: false})
            setMatrix(1, 2, 6, 3)
            localModel = pushInvisibleBlock(localModel, 1)
            localModel.push({pos: 1, length: 2, topY: 6, leftX: 5, visible: true, isRed: false})
            setMatrix(1, 2, 6, 5)
            localModel = pushInvisibleBlock(localModel, 1)
            return localModel
        }
        function pushInvisibleBlock(model, num){
            for(var i = 0; i < num; i++){
                model.push({pos: 0, length: 0, topY: -1, leftX: -1, visible: false, isRed: false})
            }
            return model
        }

        function updateMatrix(_pos, _length, _topY, _leftX, _direction) {
            if(_direction === 1){
                matrix.setEl(_topY - 1, _leftX, 1)
                matrix.setEl(_topY + _length - 1, _leftX, 0)
            } else if(_direction === 2){
                matrix.setEl(_topY, _leftX + _length, 1)
                matrix.setEl(_topY, _leftX, 0)
            } else if(_direction === 3){
                matrix.setEl(_topY + _length, _leftX, 1)
                matrix.setEl(_topY, _leftX, 0)
            } else if(_direction === 4){
                matrix.setEl(_topY, _leftX - 1, 1)
                matrix.setEl(_topY, _leftX  + _length - 1, 0)
            }
        }

        function checkWin() {
            if (matrix.getEl(3,7) === 1){
                text.text = "Вы выиграли!"
            }
        }

        function printMatrix(){
            var str = ""
            for(var i = 0; i < 8; i++) {
                for(var j = 0; j < 8; j++) {
                    str += matrix.getEl(i,j) + " ";
                }
                console.log(str);
                str = ""
            }
        }

        function setMatrix(_pos, _length, _topY, _leftX) {
            for(var i = 0; i < _length; i++) {
                if(_pos === 1){
                    matrix.setEl(_topY, _leftX + i, 1)
                } else if (_pos === 2) {
                    matrix.setEl(_topY + i, _leftX, 1)
                }
            }
        }

        Component.onCompleted: {
            field._fieldModel = getFieldModel();
        }

        SilicaGridView{
            id: view
            y: parent.height / 2 - 350
            x: parent.width / 2 - 325
            width: 700
            height: 700
            cellHeight: 105
            cellWidth: 105
            model: field._fieldModel
            delegate: MyBlock2 {
                visible: modelData.visible
                pos: modelData.pos
                length: modelData.length
                topY: modelData.topY
                leftX: modelData.leftX
                isRed: modelData.isRed
                width: modelData.pos === 1 ? ((100 * modelData.length) +  (modelData.length - 1) * 5) : 100
                height: modelData.pos === 1 ? 100 : ((100 * modelData.length) + (modelData.length - 1) * 5)
                onDragElement: {
                    if(_direction === 1 && matrix.getEl(topY - 1, leftX) !== 1){
                        field.updateMatrix(pos, length, topY, leftX, _direction)
                        //field.printMatrix()
                        topY--
                        y -= 105
                    } else if(_direction === 2 && matrix.getEl(topY, leftX + length) !== 1){
                        field.updateMatrix(pos, length, topY, leftX, _direction)
                        //field.printMatrix()
                        leftX++
                        x += 105
                    } else if(_direction === 3 && matrix.getEl(topY + length, leftX) !== 1){
                        field.updateMatrix(pos, length, topY, leftX, _direction)
                        //field.printMatrix()
                        topY++
                        y += 105
                    } else if(_direction === 4 && matrix.getEl(topY, leftX - 1) !== 1){
                        field.updateMatrix(pos, length, topY, leftX, _direction)
                        //field.printMatrix()
                        leftX--
                        x -= 105
                    }
                    field.checkWin()
                }
            }
        }
    Text {
        anchors.top: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        id: text
        text: ""
        color: "Red"
    }
    }
}
