#ifndef LISTSTRING_H
#define LISTSTRING_H

#include <QObject>

class ListString : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString text READ getAllStrings NOTIFY textChanged)
private:
    QList<QString> list;
public:
    ListString();
    Q_INVOKABLE QString getAllStrings() const;
    Q_INVOKABLE void addString(QString string);
    Q_INVOKABLE void deleteLast();
signals:
    void textChanged();
};

#endif // LISTSTRING_H
