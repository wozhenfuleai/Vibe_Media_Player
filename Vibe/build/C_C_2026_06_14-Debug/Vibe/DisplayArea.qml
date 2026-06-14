import QtQuick
import QtQuick.Controls
import QtMultimedia

// 视频显示区域
Rectangle {
    id: root

    required property MediaPlayer mediaPlayer

    color: "#1a1a1a"
    border.color: "#ffffff"
    border.width: 1

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        anchors.margins: 2
        fillMode: VideoOutput.PreserveAspectFit
        visible: root.mediaPlayer.hasVideo

        Component.onCompleted: root.mediaPlayer.videoOutput = videoOutput
        Component.onDestruction: {
            if (root.mediaPlayer.videoOutput === videoOutput)
                root.mediaPlayer.videoOutput = null
        }
    }

    // 意义不明可以删除
    Label {
        anchors.centerIn: parent
        visible: !root.mediaPlayer.hasVideo
               && root.mediaPlayer.source.toString() !== ""
               && root.mediaPlayer.playbackState !== MediaPlayer.StoppedState
        text: "🎵 正在播放音频"
        color: "#FFFFFF"
        font.pixelSize: 24
    }

    Label {
        anchors.centerIn: parent
        visible: root.mediaPlayer.source.toString() === ""
        text: "请打开媒体文件"
        color: "#888888"
        font.pixelSize: 18
    }
}
