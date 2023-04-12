#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
// 设置Qt应用程序的属性
QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

// 创建QGuiApplication实例
QGuiApplication app(argc, argv);
// 设置应用程序名称
QGuiApplication::setApplicationName("desktop-gadgets-in-uos");
// 设置组织名称
QGuiApplication::setOrganizationName("QtProject");

// 创建QQmlApplicationEngine实例
QQmlApplicationEngine engine;
// 加载qml文件
const QUrl url(QStringLiteral("qrc:/main.qml"));
// 连接对象创建信号与应用程序退出槽函数
QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
&app, [url](QObject *obj, const QUrl &objUrl) {
if (!obj && url == objUrl)
QCoreApplication::exit(-1);
}, Qt::QueuedConnection);
// 启动qml文件
engine.load(url);

// 启动应用程序的主事件循环，并返回应用程序的退出码
return app.exec();
}
