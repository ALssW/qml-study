import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML import")

    // 直接使用同一个目录下的类型
    MyType {
        x: 300
        y: 100
    }

}
