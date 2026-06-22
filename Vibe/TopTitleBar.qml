import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: root

    signal openFileRequested()
    signal newWindowRequested()

    property string currentTitle: qsTr("视频播放")
    property Action aboutAction: null
    property Action quitAction: null

    spacing: 4

    Button {
        text: qsTr("打开")
        palette.buttonText: "#FFFFFF"
        ToolTip.visible: hovered
        ToolTip.text: qsTr("打开媒体文件 (Ctrl+O)")
        background: Rectangle { color: parent.down ? "#40FFFFFF" : (parent.hovered ? "#25FFFFFF" : "transparent") }
        onClicked: openFileRequested()
    }

    Button {
        text: qsTr("新窗口")
        palette.buttonText: "#FFFFFF"
        ToolTip.visible: hovered
        ToolTip.text: qsTr("打开新的播放器窗口")
        background: Rectangle { color: parent.down ? "#40FFFFFF" : (parent.hovered ? "#25FFFFFF" : "transparent") }
        onClicked: newWindowRequested()
    }

    Label {
        Layout.fillWidth: true
        text: currentTitle
        color: "white"
        elide: Text.ElideMiddle
        horizontalAlignment: Text.AlignHCenter
    }

    ToolButton {
        id: menuButton
        text: "☰"
        palette.buttonText: "#FFFFFF"
        ToolTip.visible: hovered
        ToolTip.text: qsTr("菜单")
        background: Rectangle { color: parent.down ? "#40FFFFFF" : (parent.hovered ? "#25FFFFFF" : "transparent") }
        onClicked: overflowMenu.open(menuButton)

        Menu {
            id: overflowMenu

            MenuItem {
                action: root.aboutAction
                enabled: root.aboutAction !== null
            }

            MenuSeparator {
                visible: root.quitAction !== null
            }

            MenuItem {
                action: root.quitAction
                visible: root.quitAction !== null
            }
        }
    }
}
