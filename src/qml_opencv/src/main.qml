import QtQuick
import XVideo
import QtQuick.Controls

Window {
    width: 1280 / 5
    height: 720 / 5
    visible: true

    XVideo {
        id: xvideo
        anchors.fill: parent

        onReadEnd: {
            print("read end");
            // 停止定时器
            xvideoTimer.stop();
        }
        Timer {
            id: xvideoTimer
            interval: 1 // 40 毫秒
            running: false
            repeat: true
            property int count: 0
            onTriggered: {
                count++;
                // print(`xvideoTimer run times: ${count}`);
                // 读取一帧视频并渲染
                var frame = xvideo.readFrame();
                if(!frame) {
                    return;
                }

                xvideo.paintFrame(frame);
            }
        }

        Button {
            text: "open"
            onClicked: {
                // 打开视频
                print("open video: " + xvideo.open("test.mp4"));
                // 启动定时器
                xvideoTimer.start();
            }
        }
    }
}
