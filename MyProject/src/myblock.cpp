#include "myblock.h"

MyBlock::MyBlock()  : QObject()
{

}

void MyBlock::setHeight(int _height){
    height = _height;
}

void MyBlock::setWidth(int _width) {
    width = _width;
}

void MyBlock::setType(int _type) {
    type = _type;
}

int MyBlock::getHeight(){
    return height;
}

int MyBlock::getWidth() {
    return width;
}

int MyBlock::getType() {
    return type;
}
