import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

ApplicationWindow {
    id: window
    width: 400
    height: 500
    visible: true
    title: "用户登录"

    // 定义当前页面状态
    property string currentPage: "login"

    // 定义颜色主题
    property color primaryColor: "#2196F3"
    property color secondaryColor: "#757575"
    property color backgroundColor: "#F5F5F5"

    Rectangle {
        anchors.fill: parent
        color: backgroundColor

        ColumnLayout {
            anchors.centerIn: parent
            width: Math.min(parent.width * 0.8, 350)
            spacing: 20

            // 应用标题
            Text {
                id: titleText
                Layout.alignment: Qt.AlignHCenter
                text: currentPage === "login" ? "用户登录" : "用户注册"
                font.pixelSize: 28
                font.bold: true
                color: primaryColor
            }

            // 登录表单（默认显示）
            ColumnLayout {
                id: loginForm
                Layout.fillWidth: true
                spacing: 15
                visible: currentPage === "login"

                TextField {
                    id: loginUsername
                    Layout.fillWidth: true
                    placeholderText: "用户名"
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 8
                        border.width: 1
                        border.color: secondaryColor
                    }
                }

                TextField {
                    id: loginPassword
                    Layout.fillWidth: true
                    placeholderText: "密码"
                    echoMode: TextField.Password
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 8
                        border.width: 1
                        border.color: secondaryColor
                    }
                }

                // 记住密码选项
                CheckBox {
                    id: rememberMe
                    text: "记住密码"
                    font.pixelSize: 14
                }

                // 登录按钮
                Button {
                    id: loginButton
                    Layout.fillWidth: true
                    text: "登录"
                    font.pixelSize: 16
                    font.bold: true
                    background: Rectangle {
                        radius: 8
                        color: primaryColor
                    }
                    contentItem: Text {
                        text: loginButton.text
                        font: loginButton.font
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: {
                        console.log("登录尝试 - 用户名:", loginUsername.text)
                        // 这里添加实际的登录逻辑
                    }
                }
            }

            // 注册表单（默认隐藏）
            ColumnLayout {
                id: registerForm
                Layout.fillWidth: true
                spacing: 15
                visible: currentPage === "register"

                TextField {
                    id: registerUsername
                    Layout.fillWidth: true
                    placeholderText: "用户名"
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 8
                        border.width: 1
                        border.color: secondaryColor
                    }
                }

                TextField {
                    id: registerEmail
                    Layout.fillWidth: true
                    placeholderText: "电子邮箱"
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 8
                        border.width: 1
                        border.color: secondaryColor
                    }
                }

                TextField {
                    id: registerPassword
                    Layout.fillWidth: true
                    placeholderText: "密码"
                    echoMode: TextField.Password
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 8
                        border.width: 1
                        border.color: secondaryColor
                    }
                }

                TextField {
                    id: registerConfirmPassword
                    Layout.fillWidth: true
                    placeholderText: "确认密码"
                    echoMode: TextField.Password
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 8
                        border.width: 1
                        border.color: secondaryColor
                    }
                }

                // 注册按钮
                Button {
                    id: registerButton
                    Layout.fillWidth: true
                    text: "注册"
                    font.pixelSize: 16
                    font.bold: true
                    background: Rectangle {
                        radius: 8
                        color: primaryColor
                    }
                    contentItem: Text {
                        text: registerButton.text
                        font: registerButton.font
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: {
                        console.log("注册尝试 - 用户名:", registerUsername.text, "邮箱:", registerEmail.text)
                        // 这里添加实际的注册逻辑
                    }
                }
            }

            // 切换链接
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: currentPage === "login" ? "没有账号？立即注册" : "已有账号？立即登录"
                font.pixelSize: 14
                color: primaryColor

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (currentPage === "login") {
                            currentPage = "register"
                            window.title = "用户注册"
                        } else {
                            currentPage = "login"
                            window.title = "用户登录"
                        }
                    }
                }
            }

            // 分隔线
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "#E0E0E0"
            }

            // 其他登录方式
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "其他登录方式"
                font.pixelSize: 14
                color: secondaryColor
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 20

                Button {
                    text: "微信"
                    flat: true
                    onClicked: console.log("微信登录")
                }

                Button {
                    text: "QQ"
                    flat: true
                    onClicked: console.log("QQ登录")
                }
            }
        }
    }
}