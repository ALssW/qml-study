#ifndef CPPTYPE_H
#define CPPTYPE_H

#include <QObject>
#include <QQmlEngine>

class CppType : public QObject
{
    Q_OBJECT

    // 定义属性
    Q_PROPERTY(QString name READ name WRITE setName REQUIRED NOTIFY nameChanged)
    // 设置 url 与该类已有的成员属性 url_ 绑定 MEMBER 的 READER 生成时以及自动进行幂等判断
    Q_PROPERTY(QString url MEMBER url_ NOTIFY urlChanged)

    QML_ELEMENT

public:
    explicit CppType(QObject* parent = nullptr);
    // READ
    QString name() const
    {
        qDebug() << "CppType name() called";
        return objectName();
    }

    // WRITE
    void setName(const QString& name)
    {
        // 防止重复触发 幂等判断
        if (name == objectName())
        {
            return;
        }

        qDebug() << "CppType setName() called old name:" << objectName().toUtf8().data()
            << ", new name set to:" << name.toUtf8().data();
        setObjectName(name);
        // 手动调用信号
        emit nameChanged();
    }

    // 开放给 qml 的函数
    Q_INVOKABLE void cppFunction()
    {
        qDebug() << "CppType cppFunction() called";
        emit played();
    }

    // 传递三种类型 基础类型、数组类型、js对象
    Q_INVOKABLE static QString getData(int index, const std::vector<int>& vec, const QVariantMap& map)
    {
        QString str = QString("CppType getDate() called, index:%1").arg(index);

        str += ", vec:";
        for (const int v : vec)
        {
            str += QString::number(v);
            str += " ";
        }

        str += ", map:";
        for (const auto& key : map.keys())
        {
            str += key + ":";
            str += map[key].toString() + " ";
        }

        qDebug() << str;
        return str;
    }

signals:
    // 定义信号
    void nameChanged();
    void urlChanged();
    // 在 qml 接收信号
    void played();

private:
    QString url_;
};

#endif // CPPTYPE_H
