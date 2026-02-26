//
// Created by ALsW on 2026/2/24
//

#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickStyle>
#include <QQuickWindow>

int main(int argc, char* argv[])
{

    // --- 加载 QML ---
    QGuiApplication app(argc, argv);
    // 加载资源文件
    // QQmlApplicationEngine appEng("qrc:/main.qml");
    QQmlEngine eng;

    // 设置 Control 样式 #include <QQuickStyle>
    QQuickStyle::setStyle("Fusion");

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
