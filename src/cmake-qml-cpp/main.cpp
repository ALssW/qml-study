//
// Created by ALsW on 2026/2/24
//

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickWindow>
#include "MyClass.h"

// 递归打印 qml 节点
void printQmlObj(const QObject* obj, const int level = 0)
{
    if (!obj) return;
    QString tab = "";
    for (int i = 0; i < level; ++i)
    {
        tab += "-";
    }

    QString str = tab + "className:";
    str += obj->metaObject()->className();
    str += " [";
    str += obj->property("width").toString() + "x";
    str += obj->property("height").toString();
    str += "]";
    qDebug() << str;
    for (const auto child : obj->children())
    {
        printQmlObj(child, level + 1);
    }
}

int main(int argc, char* argv[])
{

    // --- 加载 QML ---
    QGuiApplication app(argc, argv);
    // 加载资源文件
    // QQmlApplicationEngine appEng("qrc:/main.qml");
    QQmlEngine eng;
    QQmlComponent com(&eng);
    com.loadUrl(QUrl("qrc:/main.qml"));
    const std::unique_ptr<QQuickWindow> ct(static_cast<QQuickWindow*>(com.create()));
    // ct->dumpObjectTree();

    // printQmlObj(ct.get());

    // 调用 qml 函数
    // 无参无返
    QMetaObject::invokeMethod(ct.get(), "qmlFunc1");
    // 有参无返
    QMetaObject::invokeMethod(ct.get(), "qmlFunc2", 100, QString("hello cpp"), QVariant::fromValue(123));
    // 有返 未指定返回值类型
    QVariant ret;
    QMetaObject::invokeMethod(ct.get(), "qmlFunc3", qReturnArg(ret));
    qDebug() << "qmlFunc3 return value: " << ret;

    // 有返 指定返回值类型为 string
    QString ret2;
    QMetaObject::invokeMethod(ct.get(), "qmlFunc4", qReturnArg(ret2));
    qDebug() << "qmlFunc4 return value: " << ret2;

    // c++ 接收 qml 自定义信号
    const MyClass my;
    QObject::connect(ct.get(), SIGNAL(signalForCpp(QString)),
        &my, SLOT(cppSlot(QString)));

    // 绑定控件自带信号
    QObject::connect(ct->findChild<QObject*>("myButton"), SIGNAL(clicked()),
        &my, SLOT(qmlButtonClick()));

    // 传递 list
    // QVariantList qvList = { 11, 22, 33, 44, 55 };
    std::vector<QString> qvList = { "1", "2", "3", "4", "5" };
    QMetaObject::invokeMethod(ct.get(), "readArray", QVariant::fromValue(qvList));

    // 传递 map
    QVariantMap qvMap = { {"name", "al"}, {"age", 18}};
    QMetaObject::invokeMethod(ct.get(), "readMap", QVariant::fromValue(qvMap));


    return app.exec();
}
