#include "liststring.h"

ListString::ListString(): QObject()
{
}

void ListString::addString(QString string) {
    list.append(string);
    emit textChanged();
}

void ListString::deleteLast() {
    list.takeLast();
    emit textChanged();
}

QString ListString::getAllStrings() const {
    if(list.size() == 0){
        return "list is empty";
    }
    QString result = "";
    for(int i = 0; i < list.size(); i++){
        result += list.at(i);
        if (i != list.size() - 1){
            result += ", ";
        }
    }
    result[0] = result[0].toUpper();
    return result;
}
