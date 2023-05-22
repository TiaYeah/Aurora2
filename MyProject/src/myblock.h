#ifndef MYBLOCK_H
#define MYBLOCK_H

#include <QObject>

class MyBlock : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int height READ getHeight WRITE setHeight)
    Q_PROPERTY(int width READ getWidth WRITE setWidth)
    Q_PROPERTY(int type READ getType WRITE setType)
private:
    int height;
    int width;
    int type;
public:
    MyBlock();
    Q_INVOKABLE void setHeight(int _height);
    Q_INVOKABLE void setWidth(int _width);
    Q_INVOKABLE void setType(int _type);
    Q_INVOKABLE int getHeight();
    Q_INVOKABLE int getWidth();
    Q_INVOKABLE int getType();
};

#endif // MYBLOCK_H
