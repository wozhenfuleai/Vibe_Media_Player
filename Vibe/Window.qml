
//// This is the application's main window应用主窗口
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtMultimedia



ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 800


    title: Qt.application.name.length > 0 ? Qt.application.name : qsTr("Vibe Media Player")
    color: "#000000"

    readonly property bool isFullscreen: visibility === Window.FullScreen

    function toggleFullscreen() {
        visibility = isFullscreen ? Window.Windowed : Window.FullScreen
    }

    Actions {
        id: actions
    }

    AboutDialog {
        id: aboutDialog
    }

    Connections {
        target: actions.open
        function onTriggered() { openMediaDialog.open() }
    }

    Connections {
        target: actions.newAction
        function onTriggered() { appController.openNewWindow() }
    }

    Connections {
        target: actions.about
        function onTriggered() { aboutDialog.open() }
    }

    Shortcut {
        sequence: "Escape"
        enabled: window.isFullscreen
        onActivated: window.visibility = Window.Windowed
    }

    FileDialog {
        id: openMediaDialog

        title: qsTr("打开媒体文件")
        nameFilters: [
            qsTr("媒体文件 (*.mp4 *.mkv *.avi *.mov *.wmv *.mp3 *.wav *.flac *.aac *.ogg *.m4a *.wma)"),
            qsTr("所有文件 (*)")
        ]

        onAccepted: {
            playerController.probeFile(selectedFile)
            playerController.loadFile(selectedFile)
            playerController.play()
        }
    }

    Component.onCompleted: Qt.callLater(function() { videoArea.forceActiveFocus() })

    Rectangle {
        anchors.fill: parent

        color: "#000000"
        border.color: window.isFullscreen ? "transparent" : "#ffffff"
        border.width: window.isFullscreen ? 0 : 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: window.isFullscreen ? 0 : 16
            spacing: 0

            TopMenuBar {
                Layout.preferredHeight: 36
                Layout.fillWidth: true
                visible: !window.isFullscreen
                actions: actions
                currentTitle: playerController.currentFileName === ""
                              ? qsTr("未选择音视频文件")
                              : qsTr("正在播放：")+playerController.currentFileName
            }



            Rectangle {
                id: videoArea
                Layout.fillWidth: true
                Layout.fillHeight: true
//<<<<<<< HEAD
                color: "#363636"
                //border.color: "#9999CC"
                border.width: 0
                radius: 8
                clip: true
//=======
                focus: true
//                color: "#000000"
                border.color: window.isFullscreen ? "transparent" : "#ffffff"
//                border.width: window.isFullscreen ? 0 : 1
//>>>>>>> feature/core

                VideoOutput {
                    id: videoOutput
                    anchors.fill: parent
                    anchors.margins: 0
                    fillMode: VideoOutput.PreserveAspectFit
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onDoubleClicked: window.toggleFullscreen()
                }

                Component.onCompleted: playerController.setVideoOutput(videoOutput)
            }

            BottomControlBar {
                Layout.fillWidth: true
                spacing: 20
                visible: !window.isFullscreen
                player: playerController
                window: window
            }

            Label {
                Layout.fillWidth: true
                visible: !window.isFullscreen
                color: "#d0d0d0"
                elide: Text.ElideMiddle
                text: playerController.lastError === ""
                      ? (playerController.mediaInfoJson === ""
                         ? qsTr("FFmpeg 解析结果：等待文件...")
                         : qsTr("FFmpeg 解析结果已更新（JSON 长度: %1）").arg(playerController.mediaInfoJson.length))
                      : qsTr("FFmpeg 解析失败: %1").arg(playerController.lastError)
            }

        }
    }
}
