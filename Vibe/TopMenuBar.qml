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
        Layout.fillWidth: false
        focusPolicy: Qt.ClickFocus

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
            title: qsTr("文件(&F)")

            MenuItem {
                visible: root.actions !== null
                action: root.actions ? root.actions.open : null
            }

            MenuItem {
                visible: root.actions === null
                text: qsTr("打开(&O)...")
                onTriggered: root.openFileRequested()
            }

            MenuItem {
                visible: root.actions !== null
                action: root.actions ? root.actions.newAction : null
            }


            MenuItem {
                visible: root.actions !== null
                action: root.actions ? root.actions.quit : null
            }
        }

        Menu {
            visible: root.actions !== null
            title: qsTr("帮助(&H)")

            MenuItem {
                action: root.actions ? root.actions.about : null
            }
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
