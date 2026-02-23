import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Item Pos")

    Rectangle {
        width: 200
        height: 200
        color: "blue"
        // 手动指定坐标
        x: 5
        y: 5

        Rectangle {
            width: 50
            height: 50
            color: "green"
            // 相对父节点坐标
            x: 100
            y: 100
            z:2
        }
    }

    Rectangle {
        width: 200
        height: 200
        color: "red"
        // 手动指定坐标
        x: 100
        y: 100
        z:1
    }
}
