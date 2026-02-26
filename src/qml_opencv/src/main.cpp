//
// Created by ALsW on 2026/2/26
//


#include <qguiapplication.h>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQuickWindow>
#include <opencv2/opencv.hpp>

int main(int argc, char* argv[])
{
    cv::VideoCapture video;

    // --- 加载 QML ---
    QGuiApplication app(argc, argv);
    // 加载资源文件
    // QQmlApplicationEngine appEng("qrc:/main.qml");
    QQmlEngine eng;
    QQmlComponent com(&eng);
    com.loadUrl(QUrl("qrc:/main.qml"));

    if (com.isError())
    {
        qDebug() << com.errors();
    }

    const std::unique_ptr<QQuickWindow> ct(static_cast<QQuickWindow*>(com.create()));
    if (com.isError())
    {
        qDebug() << com.errors();
    }

    return app.exec();
}
