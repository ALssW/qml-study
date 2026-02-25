import QtQuick
import QtQuick.Controls
// 导入 c++扩展类型
import Cpp.CppType

Window {
    width: 400
    height: 400
    visible: true

    // c++扩展类型
    CppType {
        id: cppType1
        objectName: "cppObject"
        name: "cppType1-name"
        // 绑定信号
        onNameChanged: print("onNameChanged cppType1.name: " + name)
        onUrlChanged: print("onUrlChanged: " + url)

        // 绑定信号
        onPlayed: print("cpp signal emit")
    }

    Column {
        Button {
            property int count: 0
            text: "print(cppType1.name)"
            onClicked: {
                print(cppType1.name)
                cppType1.name = "tmp1" + count++
            }
        }

        Button {
            text: "print(cppType1.url)"
            onClicked: {
                cppType1.url = "123"
            }
        }

        Button {
            text: "call cpp function"
            onClicked: {
                cppType1.cppFunction()
                // let ret = cppType1.getData(1, [1, 2, 3], {"1": "123", "2": "32"});
                // print("ret: " + ret);
            }
        }
    }


}
