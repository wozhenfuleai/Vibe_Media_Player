import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 800
    title: "Vibe Media Player"
    color: "#121212"

    Content {
        id: content
    }

    FileDialog {
        id: fileDialog
        title: "打开媒体文件"
        nameFilters: [
            "媒体文件 (*.mp4 *.mkv *.avi *.mov *.wmv *.flv *.webm *.mp3 *.wav *.flac *.aac *.ogg *.m4a *.wma)",
            "所有文件 (*)"
        ]
        onAccepted: content.player.source = selectedFile
    }
    // 播放器主体背景
    Rectangle {
        anchors.fill: parent
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
                fileName: content.fileName
                onOpenFile: fileDialog.open()
            }

            DisplayArea {
                Layout.fillWidth: true
                Layout.fillHeight: true
                mediaPlayer: content.player
            }

            BottomControlBar {
                Layout.fillWidth: true
                mediaPlayer: content.player
                audioOutput: content.audioOutput
                window: window
            }
        }
    }
}
