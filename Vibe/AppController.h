#pragma once

#include <QObject>

class QGuiApplication;
class QQmlApplicationEngine;

class AppController : public QObject
{
    Q_OBJECT

public:
    explicit AppController(QGuiApplication &app, QObject *parent = nullptr);

private:
    void initializeApplicationMetadata();
    void initializeQmlEngine();

private:
    QGuiApplication &m_app;
    QQmlApplicationEngine *m_engine;
};