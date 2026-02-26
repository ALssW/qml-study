import QtQuick
import QtQuick.Controls
// 导入 c++扩展类型
import Cpp.MyPainter
import QtQuick.Dialogs

Window {
    width: 800
    height: 600
    visible: true

    MyPainter {
        id: myPainter
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            // 鼠标按下 记录开始位置
            onPressed: {
                myPainter.beginPaint(Qt.point(mouse.x, mouse.y))
            }

            onPositionChanged: {
                // 按下左键
                if (!mouse.buttons & Qt.LeftButton) {
                    return;
                }

                myPainter.movePaint(Qt.point(mouse.x, mouse.y))
            }
        }

        Row {
            spacing: 10
            Slider {
                from: 1
                to: 100
                value: myPainter.penSize
                onValueChanged: myPainter.penSize = value
            }
            Text {
                text: "画笔大小: " + myPainter.penSize
            }

            ColorDialog {
                id: colorDialog
                selectedColor: "lightblue"
                onAccepted: myPainter.penColor = selectedColor
            }
            Rectangle {
                width: 30
                height: 30
                color: colorDialog.selectedColor
                MouseArea {
                    anchors.fill: parent
                    onClicked: colorDialog.open()
                }
            }
        }

    }
}
