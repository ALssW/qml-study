cmake_minimum_required(VERSION 3.20)

project(qml_opencv)

### Qt
find_package(Qt6 COMPONENTS Quick REQUIRED)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

### --- begin opencv
# 初始化 opencv lib path
set(OPEN_CV_LIB_PATH "${CMAKE_CURRENT_LIST_DIR}/lib/opencv/")
# 判断构建工具类型
if (MINGW)
    set(BUILD_TOOL "mingw")
    string(APPEND OPEN_CV_LIB_PATH "mingw")
endif ()
if (MSVC)
    set(BUILD_TOOL "msvc")
    string(APPEND OPEN_CV_LIB_PATH "msvc/lib")
endif ()

message("-- Ues build tool: ${BUILD_TOOL}")
message("-- OpenCV lib path: ${OPEN_CV_LIB_PATH}")
find_package(OpenCV REQUIRED PATHS ${OPEN_CV_LIB_PATH})
### --- end opencv

add_executable(${PROJECT_NAME}
        main.cpp
        qml.qrc
        XVideo.cpp XVideo.h
)

qt_add_qml_module(${PROJECT_NAME}
        URI XVideo)

set(QML_IMPORT_PATH "${CMAKE_BINARY_DIR}"
        CACHE STRING "Qt Creator 18.0.1 extra qml import paths")

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        Qt6::Quick
        # 引入 OpenCV 库
        ${OpenCV_LIBS})

# 项目输出路径
set(RUNTIME ${CMAKE_CURRENT_LIST_DIR}/../bin/${BUILD_TOOL})
set_target_properties(${PROJECT_NAME}
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${RUNTIME}
        RUNTIME_OUTPUT_DIRECTORY_DEBUT ${RUNTIME}
        RUNTIME_OUTPUT_DIRECTORY_RELEASE ${RUNTIME})
