import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs
import QtMultimedia
import "./" as Local

ApplicationWindow {
    visible: true
    width: 1000
    height: 800
    title: "Vibe Media Player"
    color: "#363636"
    // 内容：音乐播放器（逻辑核心位置）
    Local.Content {
        id: content
    }
    // 使用本地 shim（真实逻辑由 C++ 提供）
    Local.PlayerController {
        id: playerController
    }

    FileDialog {
        id: openMediaDialog
        title: "选择一个媒体文件"

        nameFilters: ["媒体文件 (*.mp4 *.mkv *.avi *.mov *.wmv *.mp3 *.wav *.flac *)", "所有文件 (*)"]

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

        color: "#1E1E1E"
        //border.color: "#9999CC"
        //border.width: 1
        //radius: 10
        //clip: true
        // 整体布局
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 4
            spacing: 0


            TopTitleBar {
                Layout.preferredHeight: 20
                Layout.fillWidth: true
                currentTitle: playerController.currentFileName === "" ? "视频播放" : playerController.currentFileName
                onOpenFileRequested: openMediaDialog.open()
                onNewWindowRequested: playerController.openNewWindow()
            }
            // 视频显示区域
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#363636"
                //border.color: "#9999CC"
                border.width: 0
                radius: 8
                clip: true

                VideoOutput {
                    id: videoOutput
                    anchors.fill: parent
                    anchors.margins: 0
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
