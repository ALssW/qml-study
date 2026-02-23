import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rect1
        width: 200
        height: 200
        color: "red"

        // 给该组件设置多个不同的状态用于切换 list<State>
        states: [
            State {
                // 状态名称
                name: "Entered"
                // 改变属性
                /*
                // 另一种写法
                PropertyChanges {
                    target: rect1
                    color: "green"
                    rotation: 45
                }
                 */
                PropertyChanges {
                    // 改变的目标
                    rect1 {
                        color: "green"
                        rotation: 45
                    }
                }
            },

            // 保持上一个状态进入另一个状态
            State {
                name: "Pressed"
                extend: "Entered" // 继承 Entered 状态
                PropertyChanges {
                    rect1 {
                        scale: 0.5
                    }
                }
            },

            State {
                name: "Released"
                extend: "Pressed" // 继承 Entered 状态
                PropertyChanges {
                    rect1 {
                        scale: 0.8
                    }
                }
            },
        ]

        // 在鼠标事件中修改状态
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            // 鼠标进入时修改状态
            onEntered: rect1.state = "Entered"
            // 鼠标移出后恢复状态
            onExited: rect1.state = ""
            onPressed: rect1.state = "Pressed"
            onReleased: rect1.state = "Released"
        }

    }

    Rectangle {
        id: rect2
        y: 250
        width: 200
        height: 200
        color: "red"

        // 给该组件设置多个不同的状态用于切换 list<State>
        states: [
            // 使用 when 触发状态修改
            State {
                // 当 mouseArea 被按住时
                when: mousearea.pressed
                PropertyChanges {
                    rect2 {
                        color: "yellow"
                    }
                }
            },

            State {
                name: "state2"
                // 脚本
                StateChangeScript {
                    name: "myScript"
                    script: {
                        print("my script")
                    }
                }
            }

        ]


        MouseArea {
            id: mousearea
            anchors.fill: parent
        }

        Button  {
            text: "myScript"
        }

    }

}
