import QtQuick
import QtMultimedia
// Content.qml    zxf comment
// 这个是内容qml文件

Item {
    id: root

    // 这个取别名是为了方便外边访问，外边就不用使用id嵌套访问了
    // root.mediaPlayer 直接就是player即可
    property alias player: mediaPlayer
    property alias audioOutput: audioOut

    // 【只读属性】 文件名字
    readonly property string fileName: Actions.fileNameFromUrl(mediaPlayer.source)

    // 媒体播放器对象     来源于 QtMultiMedia
    MediaPlayer {
        id: mediaPlayer
        // 音频输出对象     来源于 QtMultiMedia
        audioOutput: AudioOutput {
            id: audioOut
            volume: 0.7
        }
    }
}
