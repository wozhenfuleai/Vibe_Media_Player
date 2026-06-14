import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
RowLayout {
    id: root

    required property MediaPlayer mediaPlayer
    required property Window window

    // 播放功能
    Button {
        text: root.mediaPlayer.playbackState === MediaPlayer.PlayingState ? "⏸" : "▶"
        enabled: root.mediaPlayer.source.toString() !== ""
        onClicked: {
            if (root.mediaPlayer.playbackState === MediaPlayer.PlayingState)
                root.mediaPlayer.pause()
            else
                root.mediaPlayer.play()
        }
        background: Rectangle { color: "transparent" }
        contentItem: Text {
            text: parent.text
            color: parent.enabled ? "white" : "#666666"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    // 设置当前播放进度， 可以删除，因为滑动条更加直观
    Label {
        text: Actions.formatTime(root.mediaPlayer.position)
        color: "white"
        font.family: "monospace"
    }

    // 设置当前播放进度对应上的滑动条，和上方的label可能需要做关联
    Slider {
        id: progressSlider
        Layout.fillWidth: true
        from: 0
        to: Math.max(root.mediaPlayer.duration, 1)
        enabled: root.mediaPlayer.duration > 0

        property real displayValue: 0

        value: displayValue

        onMoved: displayValue = value

        onPressedChanged: {
            if (!pressed)
                root.mediaPlayer.position = displayValue
        }

        Connections {
            target: root.mediaPlayer
            function onPositionChanged() {
                if (!progressSlider.pressed)
                    progressSlider.displayValue = root.mediaPlayer.position
            }
            function onDurationChanged() {
                progressSlider.to = Math.max(root.mediaPlayer.duration, 1)
            }
        }
    }

    // 显示当前播放进度
    Label {
        text: Actions.formatTime(root.mediaPlayer.duration)
        color: "white"
        font.family: "monospace"
    }

    // 这个是全屏按钮功能，提供 点击事件 需要优化全屏功能
    Button {
        text: "⛶"
        onClicked: {
            if (root.window.visibility === Window.FullScreen)
                root.window.showNormal()
            else
                root.window.showFullScreen()
        }
        background: Rectangle { color: "transparent" }
        contentItem: Text {
            text: parent.text
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
