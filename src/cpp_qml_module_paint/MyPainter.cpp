#include "MyPainter.h"

MyPainter::MyPainter(QObject *parent)
    : QObject{parent}
{
    qDebug() << "Create MyPainter";
}
