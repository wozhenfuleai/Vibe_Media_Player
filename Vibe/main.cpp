#include <QGuiApplication>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQuickWindow>
#include <QIcon>

int main(int argc, char *argv[]) {
        QGuiApplication app(argc, argv);
        // 一些简单的项目名字
        QCoreApplication::setApplicationName(QStringLiteral("Vibe Media Player"));
        QCoreApplication::setApplicationVersion(QStringLiteral("0.1"));
        QCoreApplication::setOrganizationName(QStringLiteral("Vibe"));
        QCoreApplication::setOrganizationDomain(QStringLiteral("vibe.player"));
        // 设置logo
        app.setWindowIcon(QIcon(":/res/icons/logo_higher_res.png"));

        // 引擎和组件设置
        QQmlEngine engine;
        QQmlComponent component(&engine);
        component.loadFromModule("Vibe", "Window");

        // 异常处理
        if (component.isError()) {
                qWarning() << component.errors();
                return -1;
        }

        QObject *obj = component.create();
        if (!obj) {
                qWarning() << "Failed to create component";
                return -1;
        }

        return app.exec();
}