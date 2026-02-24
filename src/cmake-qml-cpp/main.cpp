//
// Created by ALsW on 2026/2/24
//

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{

    // --- 加载 QML ---
    QGuiApplication app(argc, argv);
    // 加载资源文件
    QQmlApplicationEngine appEng("qrc:/main.qml");

    return app.exec();
}
