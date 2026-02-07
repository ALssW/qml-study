# QML 的多文件结构

自定义的 qml 类型需要**首字母大写**

## 导入同一个目录下 qml

在当前 qml 中可以直接导入与其同目录下的其它 qml 文件

```
qml_import.qml // 在文件中直接使用 MyType
MyType.qml
```



**MyType.qml**

```qml
import QtQuick

// 自定义 qml
Text {
    text: "MyType"
}

```

**qml_import.qml**

```qml
import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML import")

    // 直接使用同一个目录下的类型
    MyType {
        x: 300
        y: 100
    }

}
```



## 访问外部库

`import <ModuleIdentifier> [<version.Number>] [as <Qualifier>]`

* `import QtQuick.Controls as cont`
* `Cont.Button {}`



## 版本号

最小兼容版本，请求的版本号小于或等于模块的实际版本号，那么则认为他是兼容的