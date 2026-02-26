set QT_PATH=D:\Software\QT
set QT_SDK_PATH=%QT_PATH%\6.10.1\msvc2022_64
set CMAKE_PATH=%QT_PATH%\Tools\CMake_64\bin\cmake.exe
set OUTPUT_PATH=..\rel\msvc\
set PROJECT_NAME=qml_opencv

echo "cmake to VS2022"
%CMAKE_PATH% -S . -B build/install -DCMAKE_PREFIX_PATH=%QT_SDK_PATH%

echo "cmake build"
%CMAKE_PATH% --build build/install

echo "install application"
md ..\rel\msvc
copy ..\bin\msvc\* %OUTPUT_PATH%

%QT_SDK_PATH%\bin\windeployqt.exe %OUTPUT_PATH%\qml_opencv.exe --qmldir .


