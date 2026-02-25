#include "CppType.h"

CppType::CppType(QObject *parent)
    : QObject{parent}
{
    qDebug() << "Create CppType";
}
