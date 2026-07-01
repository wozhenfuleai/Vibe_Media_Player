#include "AppController.h"

#include <QCoreApplication>
#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QDebug>

AppController::AppController(QGuiApplication &app, QObject *parent)
    : QObject(parent)
    , m_app(app)
    , m_engine(new QQmlApplicationEngine(this))
{
    initializeApplicationMetadata();
    initializeQmlEngine();
}

void AppController::initializeApplicationMetadata()
{
    QCoreApplication::setApplicationName(QStringLiteral("Vibe Media Player"));
    QCoreApplication::setApplicationVersion(QStringLiteral("0.1"));
    QCoreApplication::setOrganizationName(QStringLiteral("Vibe"));
    QCoreApplication::setOrganizationDomain(QStringLiteral("vibe.player"));
    m_app.setWindowIcon(QIcon(QStringLiteral(":/res/icons/logo_higher_res.png")));
}

void AppController::initializeQmlEngine()
{
    m_engine->loadFromModule("Vibe", "Window");

    if (m_engine->rootObjects().isEmpty()) {
        qCritical() << "Failed to load QML root component from module Vibe";
        m_app.exit(-1);
    }
}