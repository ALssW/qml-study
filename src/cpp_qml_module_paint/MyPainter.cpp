#include "MyPainter.h"

MyPainter::MyPainter(QQuickPaintedItem* parent)
    : QQuickPaintedItem { parent }
{
    qDebug() << "Create MyPainter";
}
