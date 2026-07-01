import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Item {
    id: root
    anchors.fill: parent

    required property var player
    required property var window

    Component.onCompleted: Qt.callLater(function() { videoArea.forceActiveFocus() })

    Rectangle {
        anchors.fill: parent
        color: "#000000"

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            Rectangle {
                id: videoArea
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#363636"
                border.width: 0
                radius: 8
                clip: true
                focus: true

                VideoOutput {
                    id: videoOutput
                    anchors.fill: parent
                    anchors.margins: 0
                    fillMode: VideoOutput.PreserveAspectFit
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onDoubleClicked: root.window.toggleFullscreen()
                }

                Component.onCompleted: root.player.setVideoOutput(videoOutput)
            }

            BottomControlBar {
                Layout.fillWidth: true
                spacing: 20
                visible: !root.window.isFullscreen
                player: root.player
                window: root.window
            }

            Label {
                Layout.fillWidth: true
                visible: !root.window.isFullscreen
                color: "#d0d0d0"
                elide: Text.ElideMiddle
                text: root.player.lastError === ""
                      ? (root.player.mediaInfoJson === ""
                         ? qsTr("FFmpeg 解析结果：等待文件...")
                         : qsTr("FFmpeg 解析结果已更新（JSON 长度: %1）").arg(root.player.mediaInfoJson.length))
                      : qsTr("FFmpeg 解析失败: %1").arg(root.player.lastError)
            }
        }
    }
}
