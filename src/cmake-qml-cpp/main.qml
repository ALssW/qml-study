import QtQuick
import QtQuick.Controls

Window {
    width: 400
    height: 300
    title: "main"
    visible: true

    id: root

    // c++ 调用信号
    signal signalForCpp(msg: string)

    Column {
        Button {
            width: 100
            height: 20
            text: "test qml"
            property int count: 0
            onClicked: {
                count++;
                // 发送信号
                root.signalForCpp("signal from qml: " + count)
            }
        }
        // 绑定 click 信号
        Button {
            objectName: "myButton"
            text: "c++ call"
        }

        Rectangle {
            color: "lightblue"
            width: 100
            height: 100
            Text {
                objectName: "text"
                text: "Hello World"

            }
        }


    }

    function qmlFunc1() {
        console.log("called qmlFunc1")
    }

    // qmlFunc2(int,QString,QVariant)
    function qmlFunc2(index: int, str: string, para) {
        console.log("called qmlFunc2: " + index + "-" + str + "-" + para);
    }

    // 返回值为 QVariant
    function qmlFunc3() {
        console.log("called qmlFunc3 and return");
        return "qmlFunc3 return value";
    }

    function qmlFunc4(): string {
        console.log("called qmlFunc3 and return");
        return "qmlFunc4 return value";
    }

    // 读取 js 数组
    function readArray(arr) {
        print("=== readArray ===")
        let str = "";
        arr.forEach((item) => {
            str += item + " ";
        });
        print(str);
    }

    // 读取 js map
    function readMap(map) {
        print("=== readMap ===")
        var str = "";
        for (const key in map) {
            str += key + ":" + map[key] + " ";
        }
        print(str);
    }

}
