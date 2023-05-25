#include "tokengenerator.h"

TokenGenerator::TokenGenerator(QObject *parent) : QObject(parent)
{

}

QString TokenGenerator::genToken(){
    QString str;
    str.resize(16);
    do {
        for (int s = 0; s < 16 ; ++s)
            str[s] = QChar('A' + char(qrand() % ('Z' - 'A')));
    } while (tokenList.contains(str));
    tokenList.append(str);
    return str;
}
