import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import QtMultimedia
// Content.qml    zxf comment
// 这个是内容qml文件

Item {
    id:content
    anchors.fill: parent

    // 这个取别名是为了方便外边访问，外边就不用使用id嵌套访问了
    // root.mediaPlayer 直接就是player即可
    property alias player: mediaPlayer
    property alias audioOutput: audioOut

    // 【只读属性】 文件名字
    // 若 ActionsLib 未注册为模块，提供回退实现以避免 qmlscene 报错
    readonly property string fileName: (typeof ActionsLib !== 'undefined' && typeof ActionsLib.fileNameFromUrl === 'function') ? ActionsLib.fileNameFromUrl(mediaPlayer.source) : (function() {
        var s = mediaPlayer && mediaPlayer.source ? mediaPlayer.source.toString() : ""
        try {
            s = decodeURIComponent(s)
        } catch(e) {}
        var idx = s.lastIndexOf("/")
        if (idx < 0) idx = s.lastIndexOf("\\")
        if (idx >= 0) s = s.substring(idx + 1)
        if (s.startsWith("file:///")) s = s.substring(8)
        return s || "未打开文件"
    }())

    // 媒体播放器对象     来源于 QtMultiMedia
    MediaPlayer {
        id: mediaPlayer
        // Note: in some runtimes QML `AudioOutput` type may be unavailable.
        // 在 shim 环境下不绑定实际 AudioOutput，以便 qmlscene 能运行。
    }

    // 简单的 audio 输出占位对象（保留 volume 接口供 UI 使用）
    QtObject {
        id: audioOut
        property real volume: 0.7
    }
    // deprecated: 旧的实现/测试代码，保留作为参考，已停用
    // =======
    //     property alias dialogs: _dialogs
    //     property alias player: _player
    //     property alias songMetaData: _meteData
    //
    //     TextField{
    //         id:_meteData
    //         property url songUrl
    //         TapHandler{
    //             onTapped:{
    //                 player.play()
    //             }
    //         }
    //     }
    //
    //     Dialogs{
    //         id:_dialogs
    //         fileOpen.onRejected: {
    //             return;
    //         }
    //         // fileOpen is a group property
    //         fileOpen{
    //             onAccepted: {
    //                 let filePath = fileOpen.selectedFile;
    //                 player.source = filePath; //触发player加载mp3文件，然后读取元数据
    //                 songMetaData.songUrl=filePath; //添加mp3文件路径到元数据对象中
    //                 console.log("Mp3 path: ",songMetaData.songUrl)
    //             }
    //         }
    //     }
    //
    //     VibePlayer{
    //         id:_player
    //
    //         onMediaStatusChanged: {
    //             if (player.mediaStatus === MediaPlayer.LoadedMedia) {
    //                 console.log("Audio loaded successfully")
    //                 songMetaData.text = metaData.value("Title")
    //             } else if (player.mediaStatus === MediaPlayer.InvalidMedia) {
    //                 console.log("Failed to load audio:", errorString)
    //             }
    //         }
    //     }
}
