#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>

static const unsigned char qt_resource_tree[] = {
0,
0,0,0,0,2,0,0,0,22,0,0,0,1,0,0,0,
212,0,0,0,0,0,1,0,0,0,0,0,0,1,166,0,
0,0,0,0,1,0,0,0,0,0,0,2,30,0,0,0,
0,0,1,0,0,0,0,0,0,2,132,0,0,0,0,0,
1,0,0,0,0,0,0,2,54,0,0,0,0,0,1,0,
0,0,0,0,0,2,108,0,0,0,0,0,1,0,0,0,
0,0,0,0,94,0,0,0,0,0,1,0,0,0,0,0,
0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,1,
132,0,0,0,0,0,1,0,0,0,0,0,0,1,28,0,
2,0,0,0,3,0,0,0,23,0,0,0,30,0,0,0,
0,0,1,0,0,0,0,0,0,2,78,0,0,0,0,0,
1,0,0,0,0,0,0,1,222,0,0,0,0,0,1,0,
0,0,0,0,0,1,110,0,0,0,0,0,1,0,0,0,
0,0,0,0,238,0,0,0,0,0,1,0,0,0,0,0,
0,0,152,0,0,0,0,0,1,0,0,0,0,0,0,0,
60,0,0,0,0,0,1,0,0,0,0,0,0,1,190,0,
0,0,0,0,1,0,0,0,0,0,0,0,8,0,0,0,
0,0,1,0,0,0,0,0,0,1,252,0,0,0,0,0,
1,0,0,0,0,0,0,0,176,0,0,0,0,0,1,0,
0,0,0,0,0,0,118,0,0,0,0,0,1,0,0,0,
0,0,0,1,68,0,0,0,0,0,1,0,0,0,0,0,
0,1,88,0,0,0,0,0,1,0,0,0,0,0,0,1,
46,0,0,0,0,0,1,0,0,0,0};
static const unsigned char qt_resource_names[] = {
0,
1,0,0,0,47,0,47,0,8,12,47,97,28,0,67,0,
101,0,108,0,108,0,46,0,113,0,109,0,108,0,12,7,
224,69,252,0,87,0,101,0,97,0,116,0,104,0,101,0,
114,0,52,0,46,0,113,0,109,0,108,0,14,10,125,230,
220,0,67,0,97,0,114,0,100,0,87,0,105,0,110,0,
100,0,111,0,119,0,46,0,113,0,109,0,108,0,9,4,
39,243,188,0,77,0,101,0,109,0,111,0,52,0,46,0,
113,0,109,0,108,0,14,13,19,107,188,0,67,0,108,0,
111,0,99,0,107,0,95,0,114,0,101,0,99,0,116,0,
46,0,113,0,109,0,108,0,9,8,135,198,156,0,66,0,
111,0,97,0,114,0,100,0,46,0,113,0,109,0,108,0,
15,13,11,250,220,0,71,0,97,0,109,0,101,0,79,0,
118,0,101,0,114,0,87,0,110,0,100,0,46,0,113,0,
109,0,108,0,10,3,113,208,156,0,77,0,121,0,50,0,
48,0,52,0,56,0,46,0,113,0,109,0,108,0,8,8,
135,97,28,0,67,0,97,0,114,0,100,0,46,0,113,0,
109,0,108,0,9,4,191,253,60,0,80,0,97,0,110,0,
101,0,108,0,46,0,113,0,109,0,108,0,6,7,154,144,
116,0,115,0,99,0,114,0,105,0,112,0,116,0,8,10,
236,91,211,0,111,0,116,0,104,0,101,0,114,0,46,0,
106,0,115,0,7,4,245,149,243,0,109,0,121,0,95,0,
102,0,46,0,106,0,115,0,8,5,223,107,115,0,108,0,
111,0,103,0,105,0,99,0,46,0,106,0,115,0,8,8,
1,90,92,0,109,0,97,0,105,0,110,0,46,0,113,0,
109,0,108,0,14,5,39,138,188,0,79,0,112,0,116,0,
105,0,111,0,110,0,115,0,87,0,110,0,100,0,46,0,
113,0,109,0,108,0,9,3,132,226,60,0,84,0,105,0,
109,0,101,0,49,0,46,0,113,0,109,0,108,0,13,12,
36,61,60,0,67,0,117,0,115,0,116,0,111,0,109,0,
66,0,116,0,110,0,46,0,113,0,109,0,108,0,12,7,
231,69,252,0,87,0,101,0,97,0,116,0,104,0,101,0,
114,0,49,0,46,0,113,0,109,0,108,0,14,12,86,116,
252,0,83,0,99,0,111,0,114,0,101,0,66,0,111,0,
97,0,114,0,100,0,46,0,113,0,109,0,108,0,9,3,
133,226,60,0,84,0,105,0,109,0,101,0,50,0,46,0,
113,0,109,0,108,0,9,4,36,243,188,0,77,0,101,0,
109,0,111,0,49,0,46,0,113,0,109,0,108,0,12,7,
226,69,252,0,87,0,101,0,97,0,116,0,104,0,101,0,
114,0,50,0,46,0,113,0,109,0,108,0,9,4,37,243,
188,0,77,0,101,0,109,0,111,0,50,0,46,0,113,0,
109,0,108,0,9,3,135,226,60,0,84,0,105,0,109,0,
101,0,52,0,46,0,113,0,109,0,108};
static const unsigned char qt_resource_empty_payout[] = { 0, 0, 0, 0, 0 };
QT_BEGIN_NAMESPACE
extern Q_CORE_EXPORT bool qRegisterResourceData(int, const unsigned char *, const unsigned char *, const unsigned char *);
QT_END_NAMESPACE
namespace QmlCacheGeneratedCode {
namespace _0x5f__Time4_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Memo2_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Weather2_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Memo1_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Time2_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__ScoreBoard_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Weather1_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__CustomBtn_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Time1_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__OptionsWnd_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__main_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _script_logic_js { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Panel_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Card_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _script_my_f_js { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__My2048_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__GameOverWnd_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Board_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _script_other_js { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Clock_rect_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Memo4_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__CardWindow_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Weather4_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Cell_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
        resourcePathToCachedUnit.insert(QStringLiteral("/Time4.qml"), &QmlCacheGeneratedCode::_0x5f__Time4_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Memo2.qml"), &QmlCacheGeneratedCode::_0x5f__Memo2_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Weather2.qml"), &QmlCacheGeneratedCode::_0x5f__Weather2_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Memo1.qml"), &QmlCacheGeneratedCode::_0x5f__Memo1_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Time2.qml"), &QmlCacheGeneratedCode::_0x5f__Time2_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/ScoreBoard.qml"), &QmlCacheGeneratedCode::_0x5f__ScoreBoard_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Weather1.qml"), &QmlCacheGeneratedCode::_0x5f__Weather1_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/CustomBtn.qml"), &QmlCacheGeneratedCode::_0x5f__CustomBtn_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Time1.qml"), &QmlCacheGeneratedCode::_0x5f__Time1_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/OptionsWnd.qml"), &QmlCacheGeneratedCode::_0x5f__OptionsWnd_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/main.qml"), &QmlCacheGeneratedCode::_0x5f__main_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/script/logic.js"), &QmlCacheGeneratedCode::_script_logic_js::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Panel.qml"), &QmlCacheGeneratedCode::_0x5f__Panel_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Card.qml"), &QmlCacheGeneratedCode::_0x5f__Card_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/script/my_f.js"), &QmlCacheGeneratedCode::_script_my_f_js::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/My2048.qml"), &QmlCacheGeneratedCode::_0x5f__My2048_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/GameOverWnd.qml"), &QmlCacheGeneratedCode::_0x5f__GameOverWnd_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Board.qml"), &QmlCacheGeneratedCode::_0x5f__Board_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/script/other.js"), &QmlCacheGeneratedCode::_script_other_js::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Clock_rect.qml"), &QmlCacheGeneratedCode::_0x5f__Clock_rect_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Memo4.qml"), &QmlCacheGeneratedCode::_0x5f__Memo4_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/CardWindow.qml"), &QmlCacheGeneratedCode::_0x5f__CardWindow_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Weather4.qml"), &QmlCacheGeneratedCode::_0x5f__Weather4_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Cell.qml"), &QmlCacheGeneratedCode::_0x5f__Cell_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.version = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
QT_PREPEND_NAMESPACE(qRegisterResourceData)(/*version*/0x01, qt_resource_tree, qt_resource_names, qt_resource_empty_payout);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qml)() {
    ::unitRegistry();
    Q_INIT_RESOURCE(qml_qmlcache);
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qml))
int QT_MANGLE_NAMESPACE(qCleanupResources_qml)() {
    Q_CLEANUP_RESOURCE(qml_qmlcache);
    return 1;
}
