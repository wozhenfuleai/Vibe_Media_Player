import QtQuick
import QtQuick.Controls
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

    DisplayArea {
        anchors.fill: parent
        mediaPlayer: content.player
        audioOutput: content.audioOutput
        window: window
        fileName: content.fileName
        onOpenFile: fileDialog.open()
    }
}
