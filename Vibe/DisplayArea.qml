import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtMultimedia 5.15

Rectangle {
    id: root

    // 必需属性 播放器
    required property MediaPlayer mediaPlayer
    // 必须属性 音频输出（在 shim 环境下可为任意对象）
    property var audioOutput
    // 必须属性 窗口（在 shim 环境下可为任意对象）
    property var window

    // 文件名字
    property string fileName: "未打开文件"
    // 打开文件📄的信号
    signal openFile()

    color: "#000000"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // 顶部标题栏
        TopTitleBar {
            Layout.preferredHeight: 30
            Layout.fillWidth: true
            currentTitle: root.fileName
            // 内部信号传递过来【想要打开文件】信号
            // 类似一种链式的感觉
            onOpenFileRequested: root.openFile()
        }

        // 中间矩形的播放区域
        Rectangle {
            id: videoArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1a1a1a"

            // 输出视频 📹》  来源于QtMultiMedia
            VideoOutput {
                id: videoOutput
                anchors.fill: parent
                // 视频输出格式：保持长宽比
                fillMode: VideoOutput.PreserveAspectFit
                visible: root.mediaPlayer.hasVideo   // 视频 可见性

                // 加载完毕的时候直接将播放器的视频输出  绑定到本文件中的视频输出
                // 内部实现逻辑书写，外部只需要简单调用
                Component.onCompleted: root.mediaPlayer.videoOutput = videoOutput

                // 析构的时候解除绑定，绑定置空
                Component.onDestruction: {
                    if (root.mediaPlayer.videoOutput === videoOutput)
                        root.mediaPlayer.videoOutput = null
                }
            }
            // 标签： 播放音频的标签
            Label {
                anchors.centerIn: parent
                visible: !root.mediaPlayer.hasVideo
                       && root.mediaPlayer.source.toString() !== ""
                       && root.mediaPlayer.playbackState !== MediaPlayer.StoppedState
                text: "🎵 正在播放音频"
                color: "#FFFFFF"
                font.pixelSize: 24
            }

            // 未打开文件时的占位提示与打开按钮
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 16
                visible: root.mediaPlayer.source.toString() === ""

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "请打开媒体文件"
                    color: "#888888"
                    font.pixelSize: 18
                }

                Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: "打开"
                    background: Rectangle { color: "transparent" }
                    onClicked: root.openFile()
                }
            }

            // 鼠标区域（有媒体文件的时候激活）—— 用于暂停和播放
            MouseArea {
                id: playAreaMouse
                anchors.fill: parent
                z: 1
                hoverEnabled: true
                enabled: root.mediaPlayer.source.toString() !== ""
                onClicked: {
                    if (root.mediaPlayer.playbackState === MediaPlayer.PlayingState)
                        root.mediaPlayer.pause()
                    else
                        root.mediaPlayer.play()
                }
            }

            // 关于播放有媒体文件的补充
            //   就是对playAreaMouse的图标补充
            Item {
                anchors.centerIn: parent
                visible: playAreaMouse.containsMouse
                width: 72
                height: 72

                Rectangle {
                    anchors.fill: parent
                    radius: width / 2
                    color: "#80000000"
                }

                Text {
                    anchors.centerIn: parent
                    text: root.mediaPlayer.playbackState === MediaPlayer.PlayingState ? "⏸" : "▶"
                    color: "white"
                    font.pixelSize: 36
                }
            }
        }

        // 底部栏
        BottomControlBar {
            Layout.fillWidth: true
            mediaPlayer: root.mediaPlayer
            audioOutput: root.audioOutput
            window: root.window
        }
    }
}
