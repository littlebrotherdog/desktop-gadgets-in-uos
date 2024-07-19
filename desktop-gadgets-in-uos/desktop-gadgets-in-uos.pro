# 配置Qt Quick模块
QT += quick

# 使用C++11标准
CONFIG += c++11

# 定义弃用警告
DEFINES += QT_DEPRECATED_WARNINGS

# 指定源文件
SOURCES += \
main.cpp \
timer.cpp

# 指定资源文件
RESOURCES += qml.qrc

# Qt Creator的代码模型使用的额外导入路径
QML_IMPORT_PATH =

# Qt Quick Designer使用的额外导入路径
QML_DESIGNER_IMPORT_PATH =

# 部署默认规则
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# 指定头文件
HEADERS += \
timer.h

DISTFILES +=
