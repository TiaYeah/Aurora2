#include "counter.h"

Counter::Counter() : QObject()
{
    value = 0;
}

int Counter::get()
{
    return value;
}

void Counter::set(int value)
{
    this->value = value;
    emit valueChanged();
}

void Counter::reset()
{
    set(0);
}

void Counter::inc()
{
    set(value + 1);
}
