# cpp_qml_module/CmakeList.txt
cmake_minimum_required(VERSION 3.20)
project(cpp_qml_module)

find_package(Qt6 COMPONENTS
        Quick)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

add_executable(${PROJECT_NAME}
        main.cpp
        qml.qrc
        CppType.h CppType.cpp)

# 添加 c++扩展 qml 库
qt_add_qml_module(
        ${PROJECT_NAME}
        URI Cpp.CppType
)

# 指定 qml 加载库的路径
set(QML_IMPORT_PATH ${CMAKE_BINARY_DIR})

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Quick)
