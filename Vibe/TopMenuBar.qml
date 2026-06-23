//组件：顶部菜单栏（纯 UI，Action 定义与响应逻辑由外部提供）
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: root

    property string currentTitle: ""
    property Actions actions: null

    // 无 Actions 时的兼容回退（如独立 QML 预览）
    signal openFileRequested()

    spacing: 0

    MenuBar {
        id: menuBar
        Layout.fillWidth: false
        focusPolicy: Qt.NoFocus

        palette.window: "#1a1a1a"
        palette.windowText: "#ffffff"
        palette.button: "#1a1a1a"
        palette.buttonText: "#ffffff"
        palette.highlight: "#404040"
        palette.highlightedText: "#ffffff"

        background: Rectangle {
            color: "#1a1a1a"
        }

        Menu {
            id: fileMenu
            title: qsTr("文件(&F)")

            MenuItem {
                action: root.actions ? root.actions.open : null
                text: root.actions ? action.text : qsTr("打开(&O)...")
                onTriggered: { if (!root.actions) root.openFileRequested() }
            }

            MenuItem {
                action: root.actions ? root.actions.newAction : null
            }

            MenuItem {
                action: root.actions ? root.actions.quit : null
            }
        }

        Menu {
            id: helpMenu
            visible: root.actions !== null
            title: qsTr("帮助(&H)")

            MenuItem {
                action: root.actions ? root.actions.about : null
            }
        }
    }

    // 确保启动时菜单处于关闭状态
    Timer {
        interval: 200
        running: true
        repeat: false
        onTriggered: {
            helpMenu.close()
            fileMenu.close()
        }
    }

    Label {
        Layout.fillWidth: true
        text: currentTitle
        color: "white"
        elide: Text.ElideMiddle
        horizontalAlignment: Text.AlignHCenter
    }
}
