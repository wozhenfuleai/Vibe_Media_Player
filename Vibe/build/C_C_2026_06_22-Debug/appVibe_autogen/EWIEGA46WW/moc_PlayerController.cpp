/****************************************************************************
** Meta object code from reading C++ file 'PlayerController.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.9.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../PlayerController.h"
#include <QtNetwork/QSslPreSharedKeyAuthenticator>
#include <QtNetwork/QSslError>
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'PlayerController.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.9.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN16PlayerControllerE_t {};
} // unnamed namespace

template <> constexpr inline auto PlayerController::qt_create_metaobjectdata<qt_meta_tag_ZN16PlayerControllerE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "PlayerController",
        "QML.Element",
        "auto",
        "playingChanged",
        "",
        "mediaLoaded",
        "positionChanged",
        "volumeChanged",
        "durationChanged",
        "mediaInfoChanged",
        "errorChanged",
        "onPlaybackStateChanged",
        "QMediaPlayer::PlaybackState",
        "state",
        "onPositionChanged",
        "position",
        "onDurationChanged",
        "duration",
        "onMediaStatusChanged",
        "QMediaPlayer::MediaStatus",
        "status",
        "onProbeFinished",
        "exitCode",
        "QProcess::ExitStatus",
        "exitStatus",
        "onProbeErrorOccurred",
        "QProcess::ProcessError",
        "error",
        "setVolume",
        "vol",
        "setPosition",
        "ms",
        "setPositionPercent",
        "pct",
        "seekBy",
        "deltaMs",
        "fastForward",
        "rewind",
        "probeFile",
        "url",
        "setProbeProgram",
        "program",
        "loadFile",
        "loadAndPlay",
        "play",
        "pause",
        "stop",
        "playPause",
        "adjustVolume",
        "delta",
        "volumeUp",
        "volumeDown",
        "setVideoOutput",
        "output",
        "openNewWindow",
        "isPlaying",
        "durationString",
        "currentFileName",
        "isMediaLoaded",
        "positionString",
        "positionPercent",
        "volume",
        "mediaInfoJson",
        "lastError"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'playingChanged'
        QtMocHelpers::SignalData<void()>(3, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'mediaLoaded'
        QtMocHelpers::SignalData<void()>(5, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'positionChanged'
        QtMocHelpers::SignalData<void()>(6, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'volumeChanged'
        QtMocHelpers::SignalData<void()>(7, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'durationChanged'
        QtMocHelpers::SignalData<void()>(8, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'mediaInfoChanged'
        QtMocHelpers::SignalData<void()>(9, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'errorChanged'
        QtMocHelpers::SignalData<void()>(10, 4, QMC::AccessPublic, QMetaType::Void),
        // Slot 'onPlaybackStateChanged'
        QtMocHelpers::SlotData<void(QMediaPlayer::PlaybackState)>(11, 4, QMC::AccessPrivate, QMetaType::Void, {{
            { 0x80000000 | 12, 13 },
        }}),
        // Slot 'onPositionChanged'
        QtMocHelpers::SlotData<void(qint64)>(14, 4, QMC::AccessPrivate, QMetaType::Void, {{
            { QMetaType::LongLong, 15 },
        }}),
        // Slot 'onDurationChanged'
        QtMocHelpers::SlotData<void(qint64)>(16, 4, QMC::AccessPrivate, QMetaType::Void, {{
            { QMetaType::LongLong, 17 },
        }}),
        // Slot 'onMediaStatusChanged'
        QtMocHelpers::SlotData<void(QMediaPlayer::MediaStatus)>(18, 4, QMC::AccessPrivate, QMetaType::Void, {{
            { 0x80000000 | 19, 20 },
        }}),
        // Slot 'onProbeFinished'
        QtMocHelpers::SlotData<void(int, QProcess::ExitStatus)>(21, 4, QMC::AccessPrivate, QMetaType::Void, {{
            { QMetaType::Int, 22 }, { 0x80000000 | 23, 24 },
        }}),
        // Slot 'onProbeErrorOccurred'
        QtMocHelpers::SlotData<void(QProcess::ProcessError)>(25, 4, QMC::AccessPrivate, QMetaType::Void, {{
            { 0x80000000 | 26, 27 },
        }}),
        // Method 'setVolume'
        QtMocHelpers::MethodData<void(int)>(28, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 29 },
        }}),
        // Method 'setPosition'
        QtMocHelpers::MethodData<void(int)>(30, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 31 },
        }}),
        // Method 'setPositionPercent'
        QtMocHelpers::MethodData<void(int)>(32, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 33 },
        }}),
        // Method 'seekBy'
        QtMocHelpers::MethodData<void(int)>(34, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 35 },
        }}),
        // Method 'fastForward'
        QtMocHelpers::MethodData<void(int)>(36, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 35 },
        }}),
        // Method 'fastForward'
        QtMocHelpers::MethodData<void()>(36, 4, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void),
        // Method 'rewind'
        QtMocHelpers::MethodData<void(int)>(37, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 35 },
        }}),
        // Method 'rewind'
        QtMocHelpers::MethodData<void()>(37, 4, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void),
        // Method 'probeFile'
        QtMocHelpers::MethodData<void(const QUrl &)>(38, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QUrl, 39 },
        }}),
        // Method 'setProbeProgram'
        QtMocHelpers::MethodData<void(const QString &)>(40, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 41 },
        }}),
        // Method 'loadFile'
        QtMocHelpers::MethodData<void(const QUrl &)>(42, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QUrl, 39 },
        }}),
        // Method 'loadAndPlay'
        QtMocHelpers::MethodData<void(const QUrl &)>(43, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QUrl, 39 },
        }}),
        // Method 'play'
        QtMocHelpers::MethodData<void()>(44, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'pause'
        QtMocHelpers::MethodData<void()>(45, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'stop'
        QtMocHelpers::MethodData<void()>(46, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'playPause'
        QtMocHelpers::MethodData<void()>(47, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'adjustVolume'
        QtMocHelpers::MethodData<void(int)>(48, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 49 },
        }}),
        // Method 'volumeUp'
        QtMocHelpers::MethodData<void(int)>(50, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 49 },
        }}),
        // Method 'volumeUp'
        QtMocHelpers::MethodData<void()>(50, 4, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void),
        // Method 'volumeDown'
        QtMocHelpers::MethodData<void(int)>(51, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 49 },
        }}),
        // Method 'volumeDown'
        QtMocHelpers::MethodData<void()>(51, 4, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void),
        // Method 'setVideoOutput'
        QtMocHelpers::MethodData<void(QObject *)>(52, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QObjectStar, 53 },
        }}),
        // Method 'openNewWindow'
        QtMocHelpers::MethodData<void()>(54, 4, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'isPlaying'
        QtMocHelpers::PropertyData<bool>(55, QMetaType::Bool, QMC::DefaultPropertyFlags, 0),
        // property 'duration'
        QtMocHelpers::PropertyData<int>(17, QMetaType::Int, QMC::DefaultPropertyFlags, 4),
        // property 'durationString'
        QtMocHelpers::PropertyData<QString>(56, QMetaType::QString, QMC::DefaultPropertyFlags, 4),
        // property 'currentFileName'
        QtMocHelpers::PropertyData<QString>(57, QMetaType::QString, QMC::DefaultPropertyFlags, 1),
        // property 'isMediaLoaded'
        QtMocHelpers::PropertyData<bool>(58, QMetaType::Bool, QMC::DefaultPropertyFlags, 1),
        // property 'position'
        QtMocHelpers::PropertyData<int>(15, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 2),
        // property 'positionString'
        QtMocHelpers::PropertyData<QString>(59, QMetaType::QString, QMC::DefaultPropertyFlags, 2),
        // property 'positionPercent'
        QtMocHelpers::PropertyData<int>(60, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 2),
        // property 'volume'
        QtMocHelpers::PropertyData<int>(61, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 3),
        // property 'mediaInfoJson'
        QtMocHelpers::PropertyData<QString>(62, QMetaType::QString, QMC::DefaultPropertyFlags, 5),
        // property 'lastError'
        QtMocHelpers::PropertyData<QString>(63, QMetaType::QString, QMC::DefaultPropertyFlags, 6),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    2 },
    });
    return QtMocHelpers::metaObjectData<PlayerController, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject PlayerController::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN16PlayerControllerE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN16PlayerControllerE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN16PlayerControllerE_t>.metaTypes,
    nullptr
} };

void PlayerController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<PlayerController *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->playingChanged(); break;
        case 1: _t->mediaLoaded(); break;
        case 2: _t->positionChanged(); break;
        case 3: _t->volumeChanged(); break;
        case 4: _t->durationChanged(); break;
        case 5: _t->mediaInfoChanged(); break;
        case 6: _t->errorChanged(); break;
        case 7: _t->onPlaybackStateChanged((*reinterpret_cast< std::add_pointer_t<QMediaPlayer::PlaybackState>>(_a[1]))); break;
        case 8: _t->onPositionChanged((*reinterpret_cast< std::add_pointer_t<qint64>>(_a[1]))); break;
        case 9: _t->onDurationChanged((*reinterpret_cast< std::add_pointer_t<qint64>>(_a[1]))); break;
        case 10: _t->onMediaStatusChanged((*reinterpret_cast< std::add_pointer_t<QMediaPlayer::MediaStatus>>(_a[1]))); break;
        case 11: _t->onProbeFinished((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QProcess::ExitStatus>>(_a[2]))); break;
        case 12: _t->onProbeErrorOccurred((*reinterpret_cast< std::add_pointer_t<QProcess::ProcessError>>(_a[1]))); break;
        case 13: _t->setVolume((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 14: _t->setPosition((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 15: _t->setPositionPercent((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 16: _t->seekBy((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 17: _t->fastForward((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 18: _t->fastForward(); break;
        case 19: _t->rewind((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 20: _t->rewind(); break;
        case 21: _t->probeFile((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1]))); break;
        case 22: _t->setProbeProgram((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 23: _t->loadFile((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1]))); break;
        case 24: _t->loadAndPlay((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1]))); break;
        case 25: _t->play(); break;
        case 26: _t->pause(); break;
        case 27: _t->stop(); break;
        case 28: _t->playPause(); break;
        case 29: _t->adjustVolume((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 30: _t->volumeUp((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 31: _t->volumeUp(); break;
        case 32: _t->volumeDown((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 33: _t->volumeDown(); break;
        case 34: _t->setVideoOutput((*reinterpret_cast< std::add_pointer_t<QObject*>>(_a[1]))); break;
        case 35: _t->openNewWindow(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (PlayerController::*)()>(_a, &PlayerController::playingChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (PlayerController::*)()>(_a, &PlayerController::mediaLoaded, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (PlayerController::*)()>(_a, &PlayerController::positionChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (PlayerController::*)()>(_a, &PlayerController::volumeChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (PlayerController::*)()>(_a, &PlayerController::durationChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (PlayerController::*)()>(_a, &PlayerController::mediaInfoChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (PlayerController::*)()>(_a, &PlayerController::errorChanged, 6))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<bool*>(_v) = _t->isPlaying(); break;
        case 1: *reinterpret_cast<int*>(_v) = _t->duration(); break;
        case 2: *reinterpret_cast<QString*>(_v) = _t->durationString(); break;
        case 3: *reinterpret_cast<QString*>(_v) = _t->currentFileName(); break;
        case 4: *reinterpret_cast<bool*>(_v) = _t->isMediaLoaded(); break;
        case 5: *reinterpret_cast<int*>(_v) = _t->position(); break;
        case 6: *reinterpret_cast<QString*>(_v) = _t->positionString(); break;
        case 7: *reinterpret_cast<int*>(_v) = _t->positionPercent(); break;
        case 8: *reinterpret_cast<int*>(_v) = _t->volume(); break;
        case 9: *reinterpret_cast<QString*>(_v) = _t->mediaInfoJson(); break;
        case 10: *reinterpret_cast<QString*>(_v) = _t->lastError(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 5: _t->setPosition(*reinterpret_cast<int*>(_v)); break;
        case 7: _t->setPositionPercent(*reinterpret_cast<int*>(_v)); break;
        case 8: _t->setVolume(*reinterpret_cast<int*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *PlayerController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *PlayerController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN16PlayerControllerE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int PlayerController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 36)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 36;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 36)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 36;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    return _id;
}

// SIGNAL 0
void PlayerController::playingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void PlayerController::mediaLoaded()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void PlayerController::positionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void PlayerController::volumeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void PlayerController::durationChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void PlayerController::mediaInfoChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void PlayerController::errorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}
QT_WARNING_POP
