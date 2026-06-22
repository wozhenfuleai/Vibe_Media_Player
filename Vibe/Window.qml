import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtMultimedia
import "./" as Local

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

    Local.Actions {
        id: actions
    }

    AboutDialog {
        id: aboutDialog
    }

    menuBar: MenuBar {
        visible: !window.isFullscreen
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
            MenuItem { action: actions.open }
            MenuItem { action: actions.newAction }
            MenuSeparator {}
            MenuItem { action: actions.quit }
        }

        Menu {
            title: qsTr("帮助(&H)")
            MenuItem { action: actions.about }
        }
    }

    Connections {
        target: actions.open
        function onTriggered() { openMediaDialog.open() }
    }

    Connections {
        target: actions.newAction
        function onTriggered() { playerController.openNewWindow() }
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

    Local.PlayerController {
        id: playerController
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

    Rectangle {
        anchors.fill: parent
        color: "#000000"
        border.color: window.isFullscreen ? "transparent" : "#ffffff"
        border.width: window.isFullscreen ? 0 : 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: window.isFullscreen ? 0 : 16
            spacing: 0

            TopTitleBar {
                Layout.preferredHeight: 36
                Layout.fillWidth: true
                visible: !window.isFullscreen
                currentTitle: playerController.currentFileName === ""
                              ? qsTr("视频播放")
                              : playerController.currentFileName
                aboutAction: actions.about
                quitAction: actions.quit
                onOpenFileRequested: openMediaDialog.open()
                onNewWindowRequested: playerController.openNewWindow()
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#000000"
                border.color: window.isFullscreen ? "transparent" : "#ffffff"
                border.width: window.isFullscreen ? 0 : 1

                VideoOutput {
                    id: videoOutput
                    anchors.fill: parent
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
