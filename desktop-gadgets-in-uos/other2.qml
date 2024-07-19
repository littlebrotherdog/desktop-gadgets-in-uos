#ifndef DEMODIRECT_H
#define DEMODIRECT_H

#include <QObject>

class DemoDirect : public QObject
{
    Q_OBJECT
    // 声明 cppStr 为只读属性. NOTIFY 信号是必须的.
    Q_PROPERTY(QString cppStr READ readCppStr NOTIFY cppStrChanged)
public:
    explicit DemoDirect(QObject *parent = nullptr);

    // 使用 Q_INVOKABLE 向 QML 声明函数方法.
    Q_INVOKABLE void writeCppStr(QString str);
    Q_INVOKABLE QString readCppStr();

signals:
    void cppStrChanged(QString str);

protected:
    QString cppStr;

};

#endif // DEMODIRECT_H
