import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Anchors")

    Rectangle {
        id: container
        width: 200
        height: 150
        color: "gray"

        Rectangle {
            id: rect1
            width: 50
            height: 50
            color: "red"
            Text {
                text: "rect1"
            }
        }

        Rectangle {
            id: rect2
            width: 50
            height: 50
            color: "blue"
            Text {
                text: "rect2"
            }
            // 指定锚点位置 在rect1的右侧
            anchors.left: rect1.right
            // 指定锚点位置 在parent的右侧
            // anchors.right: parent.right
        }

        Rectangle {
            id: rect3
            width: 50
            height: 50
            color: "green"
            Text {
                text: "rect3"
            }
            anchors.top: rect1.bottom
        }

        // 通过锚点设定动态大小
        Rectangle {
            id: rect4
            color: "white"
            Text {
                text: "rect4"
            }
            // widght 为 rect2
            anchors.top: rect2.bottom
            anchors.right: rect2.right
            anchors.left: rect3.right
            // height 为rect2底部至父容器底部
            anchors.bottom: container.bottom
        }
    }
}