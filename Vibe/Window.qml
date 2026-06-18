import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtMultimedia
import Vibe

ApplicationWindow {
    visible: true
    width: 1000
    height: 800
    title: "Vibe Media Player"
    color: "#121212"

    PlayerController {
        id: playerController
    }

    FileDialog {
        id: openMediaDialog
        title: "选择一个媒体文件"
        nameFilters: ["媒体文件 (*.mp4 *.mkv *.avi *.mov *.wmv *.mp3 *.wav *.flac)", "所有文件 (*)"]
        onAccepted: {
            playerController.probeFile(selectedFile)
            playerController.loadFile(selectedFile)
            playerController.play()
        }
    }

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
                currentTitle: playerController.currentFileName === "" ? "视频播放" : playerController.currentFileName
                onOpenFileRequested: openMediaDialog.open()
            }
            // 视频显示区域
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#645757"
                border.color: "#ffffff"
                border.width: 1

                VideoOutput {
                    id: videoOutput
                    anchors.fill: parent
                    fillMode: VideoOutput.PreserveAspectFit
                }

                Component.onCompleted: playerController.setVideoOutput(videoOutput)
            }

            BottomControlBar {
                Layout.fillWidth: true
                spacing: 20
                player: playerController
            }

            Label {
                Layout.fillWidth: true
                color: "#d0d0d0"
                elide: Label.ElideRight
                text: playerController.lastError === ""
                      ? (playerController.mediaInfoJson === "" ? "FFmpeg 解析结果：等待文件..." : "FFmpeg 解析结果已更新（JSON 长度: " + playerController.mediaInfoJson.length + "）")
                      : ("FFmpeg 解析失败: " + playerController.lastError)
            }


        }
    }
}
