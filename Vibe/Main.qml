import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
<<<<<<< HEAD
=======
import Vibe 1.0
>>>>>>> feature/core
import "./" as Local

ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 800
    title: "Vibe Media Player"
    color: "#121212"

<<<<<<< HEAD
=======
    Actions {
        id: actions
    }

    AboutDialog {
        id: aboutDialog
    }

    Connections {
        target: actions.open
        function onTriggered() { fileDialog.open() }
    }

    Connections {
        target: actions.about
        function onTriggered() { aboutDialog.open() }
    }

>>>>>>> feature/core
    // 内容：音乐播放器（逻辑核心位置）
    Local.Content {
        id: content
    }

    // 简要的文件对话框 (Dialog.qml中可以进行优化)
    //    FileDialog 开始不可见，出发open的时候可见，并且会
    //    带来一些返回值
    FileDialog {
        id: fileDialog
        title: "打开媒体文件"
        nameFilters: [
            "媒体文件 (*.mp4 *.mkv *.avi *.mov *.wmv *.flv *.webm *.mp3 *.wav *.flac *.aac *.ogg *.m4a *.wma)",
            "所有文件 (*)"
        ]
        // 点击打开就是将对应路径传入给我们内容中播放器的source
        onAccepted: content.player.source = selectedFile
    }

    // 显示区域对象
    DisplayArea {
        anchors.fill: parent
        mediaPlayer: content.player
        audioOutput: content.audioOutput
        window: window
        fileName: content.fileName
<<<<<<< HEAD
        // 信号处理槽（openFile信号发出的时候调用open函数）
        onOpenFile: fileDialog.open()
=======
        actions: actions
>>>>>>> feature/core
    }
}
