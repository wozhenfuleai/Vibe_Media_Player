#include <QCoreApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>  // 加这个头文件

int main(int argc, char *argv[])
{
        QGuiApplication app(argc, argv);
        QCoreApplication::setApplicationName(QStringLiteral("Vibe Media Player"));
        QCoreApplication::setApplicationVersion(QStringLiteral("0.1"));
        QCoreApplication::setOrganizationName(QStringLiteral("Vibe"));
        QCoreApplication::setOrganizationDomain(QStringLiteral("vibe.player"));

        app.setWindowIcon(QIcon(":/res/icons/logo_higher_res.png"));  // 加这一行

        QQmlApplicationEngine engine;
        QObject::connect(
                &engine,
                &QQmlApplicationEngine::objectCreationFailed,
                &app,
                []() { QCoreApplication::exit(-1); },
                Qt::QueuedConnection);
        engine.loadFromModule("Vibe", "Window");
        return app.exec();
}