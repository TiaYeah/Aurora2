#ifndef TOKENGENERATOR_H
#define TOKENGENERATOR_H

#include <QObject>

class TokenGenerator : public QObject
{
    Q_OBJECT
private:
    QList<QString> tokenList;
public:
    explicit TokenGenerator(QObject *parent = nullptr);
    Q_INVOKABLE QString genToken();
signals:

};

#endif // TOKENGENERATOR_H
