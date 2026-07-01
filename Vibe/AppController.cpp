#include "AppController.h"

#include "MediaProbeService.h"
#include "PlayerController.h"

#include <QCoreApplication>
#include <QGuiApplication>
#include <QIcon>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>

AppController::AppController(QGuiApplication &app, QObject *parent)
    : QObject(parent)
    , m_app(app)
    , m_engine(new QQmlApplicationEngine(this))
    , m_probeService(new MediaProbeService(this))
    , m_playerController(new PlayerController(this))
{
    m_playerController->setProbeService(m_probeService);
    initializeApplicationMetadata();
    initializeQmlEngine();
}

void AppController::initializeApplicationMetadata()
{
    QCoreApplication::setApplicationName(tr("Vibe Media Player"));
    QCoreApplication::setApplicationVersion(tr("0.1"));
    QCoreApplication::setOrganizationName(tr("Vibe"));
    QCoreApplication::setOrganizationDomain(tr("vibe.player"));
    m_app.setWindowIcon(QIcon(tr(":/res/icons/logo_higher_res.png")));
}

void AppController::initializeQmlEngine()
{
    m_engine->rootContext()->setContextProperty(tr("playerController"), m_playerController);
    m_engine->rootContext()->setContextProperty(tr("appController"), this);
    m_engine->loadFromModule("Vibe", "Window");

    if (m_engine->rootObjects().isEmpty()) {
        qCritical() << "Failed to load QML root component from module Vibe";
        m_app.exit(-1);
    }
}

void AppController::openNewWindow()
{
    QProcess::startDetached(QCoreApplication::applicationFilePath());
}