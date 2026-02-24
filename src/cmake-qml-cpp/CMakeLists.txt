# cmake 最低版本
cmake_minimum_required(VERSION 3.20)
project(cmake_qml_cpp)

# QT6 sdk
find_package(Qt6 COMPONENTS
        Quick)

# 设置支持构建 QT 信号槽和自由
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# 生成执行库
add_executable(${PROJECT_NAME}
        main.cpp
        qml.qrc
)

# 导入库 Qt Quick
target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Quick)
