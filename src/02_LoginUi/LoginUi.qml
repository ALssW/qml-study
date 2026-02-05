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


    // 主体
    Rectangle {
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

        // 中间矩形
        Rectangle {
            width: 800
            height: 500
            // 居中
            anchors.centerIn: parent
            // 圆角
            radius: 10
            color: "white"

            // 插入图片
            Image {
                source: "res/image1.jpg"
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
                leftPadding: username.leftPadding
                echoMode: TextInput.Password
                // 设置圆角边框
                background: Rectangle {
                    color: username.background.color
                    border.color: username.background.border.color
                    radius: 25
                }
            }

            // 登陆
            Button {
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
            }
        }

    }
}
