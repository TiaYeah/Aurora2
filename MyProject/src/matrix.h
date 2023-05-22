#ifndef MATRIX_H
#define MATRIX_H

#include <QObject>

class Matrix : public QObject
{
    Q_OBJECT
   // Q_PROPERTY(int el READ getEl WRITE setEl);
private:
    int matrix[8][8];
public:
    explicit Matrix(QObject *parent = nullptr);
    Q_INVOKABLE int getEl(int x, int y);
    Q_INVOKABLE void setEl(int x, int y, int value);
signals:

};

#endif // MATRIX_H
