import QtQuick
import QtQuick.Controls

// 1.核心控件 窗口布局 登陆事件处理

// 2. 样式优化 颜色渐变

// 窗口
ApplicationWindow {
    id: app
    width: 1280
    height: 800
    title: "Login UI"
    visible: true // 默认窗口为不显示的

    Rectangle { // 主体矩形
        height: parent.height
        width: parent.width

        // 背景渐变 线性
        gradient: Gradient {
            // 水平渐变
            orientation: Gradient.Horizontal

            // 渐变起始
            GradientStop {
                color: "#4158d0"
                position: 0
            }

            // 渐变结束
            GradientStop {
                color: "#c850c0"
                position: 1
            }
        }

        Rectangle { // 中间矩形
            width: 800
            height: 500
            // 居中
            anchors.centerIn: parent
            // 圆角
            radius: 10
            color: "white"

            // 插入图片
            Image {
                x: 57
                y: 100
                source: "res/img-01.png"
            }

            Text {
                x: 530
                y: 130
                height: 30
                width: 120
                font.pixelSize: 24
                text: qsTr("登陆系统")
                color: "#333333"
            }

            // 用户名
            TextField {
                id: username
                x: 440
                y: 200
                height: 50
                width: 300
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
                placeholderText: qsTr("请输入用户名")
                placeholderTextColor: "#999999"
                color: "#666666"
                // 偏移输入框内容
                leftPadding: 60
                // 设置圆角边框
                background: Rectangle {
                    color: "#e6e6e6"
                    border.color: "#e6e6e6"
                    radius: 25
                }

                // 图标插入
                Image {
                    // 动态切换图片
                    source: username.activeFocus ? "res/u2.png" : "res/u1.png"
                    width: 20
                    height: 20
                    x: 30
                    y: 15
                }
            }

            // 密码
            TextField {
                id: password
                x: username.x
                y: username.y + username.height + 10
                height: username.height
                width: username.width
                font.pixelSize: username.font.pixelSize
                color: "#333333"
                placeholderText: qsTr("请输入密码")
                placeholderTextColor: "#999999"
                verticalAlignment: Text.AlignVCenter
                leftPadding: username.leftPadding
                echoMode: TextInput.Password
                // 设置圆角边框
                background: Rectangle {
                    color: username.background.color
                    border.color: username.background.border.color
                    radius: 25
                }

                // 图标插入
                Image {
                    // 动态切换图片
                    source: password.activeFocus ? "res/p2.png" : "res/p1.png"
                    width: 20
                    height: 20
                    x: 30
                    y: 15
                }
            }

            RoundButton { // 登录按钮
                id: submit
                x: username.x
                y: password.y + password.height + 10
                height: username.height
                width: username.width
                font.pixelSize: username.font.pixelSize
                text: qsTr("登录")

                // 定义函数 点击事件
                onClicked: {
                    print("登陆" + username.text + ":" + password.text);
                }

                background: Rectangle {
                    radius: 25
                    color: {
                        // 当按钮点击时
                        if (submit.down){
                            return "#b01919"
                        }

                        // 当鼠标悬浮 时
                        if (submit.hovered) {
                            return "#333333"
                        }

                        // 常态颜色
                        return "#57b846"
                    }

                    border.color: submit.backgroud.color

                }
            }
        }

        Rectangle { // 关闭窗口按钮
            x: app.width - 35
            y: 5
            width: 30
            height: 30
            color: "#00000000"

            Text {
                text: "X"
                font.pixelSize: 20
                anchors.centerIn: parent
            }

            // 定义鼠标区域
            MouseArea {
                // 鼠标区域范围
                anchors.fill: parent
                hoverEnabled: true
                // 鼠标进入时
                onEntered: parent.color = "#18FFFFFF"
                onExited:  parent.color = "#00000000"
                onClicked: app.close()
            }
        }

    }
}
