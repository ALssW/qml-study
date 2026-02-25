//
// Created by ALsW on 2026/2/25
//

#ifndef CMAKE_QML_CPP_MYCLASS_H
#define CMAKE_QML_CPP_MYCLASS_H
#include <QDebug>
#include <QObject>

class MyClass : public QObject
{
    Q_OBJECT

public:
    explicit MyClass(QObject* parent = nullptr);

signals:

public slots:
    static void cppSlot(const QString& msg)
    {
        qDebug() << "cpp slot: " << msg;
    }

    static void qmlButtonClick()
    {
        qDebug() << "cpp slot2";
    }

};


#endif //CMAKE_QML_CPP_MYCLASS_H
