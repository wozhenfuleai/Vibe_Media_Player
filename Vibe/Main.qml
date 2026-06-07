import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 1000
    height: 800
    title: "Vibe Media Player"
    color: "#121212"

    // 播放器主体背景
    Rectangle {
        anchors.fill: parent
        anchors.margins: 0
        color: "#000000"
        border.color: "#ffffff"
        border.width: 1
        // 整体布局
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 0


            TopTitleBar {
                Layout.preferredHeight: 30
                Layout.fillWidth: true
            }

            DisplayArea {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            BottomControlBar {
                Layout.fillWidth: true
                spacing: 20
            }


        }
    }
}
