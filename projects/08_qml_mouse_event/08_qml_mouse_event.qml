import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 100
        height: 100
        color: "green"

        // 添加鼠标区域
        MouseArea {
            // 锚点
            anchors.fill: parent

            // 设置响应的按键，默认为左键
            acceptedButtons: Qt.AllButtons // 所有鼠标按键都响应
            onClicked: (event) => {
                print("MouseArea onClicked: " + event)
                print("click button: " + event.button)
                print("click buttons: " + event.buttons)
            }

        }
    }

    Rectangle {
        id: container
        y: 200
        width: 480
        height: 100
        color: "red"

        Rectangle {
            width: 50
            height: 50
            x: 5
            MouseArea {
                anchors.fill: parent
                drag.target: parent
                // 限制X轴
                drag.axis: Drag.XAxis
                // 限制拖动区域
                drag.minimumX: 5
                drag.maximumX: container.width - parent.width - 5
            }
        }
    }
}
