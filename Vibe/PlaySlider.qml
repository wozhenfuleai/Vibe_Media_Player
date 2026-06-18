import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
RowLayout {
    property var player

    // 播放功能
    Button {
        text: player && player.isPlaying ? "⏸" : "▶"
        background: Rectangle { color: "transparent" }
        onClicked: {
            if (player) {
                player.playPause()
            }
        }
    }

    // 设置当前播放进度， 可以删除，因为滑动条更加直观
    Label {
        text: player ? player.positionString : "00:00"
        color: "white"
    }

    // 设置当前播放进度对应上的滑动条，和上方的label可能需要做关联
    Slider {
        Layout.fillWidth: true
        from: 0
        to: 100
        value: player ? player.positionPercent : 0
        onMoved: {
            if (player) {
                player.positionPercent = Math.round(value)
            }
        }
    }

    // 显示当前播放进度
    Label {
        text: player ? player.durationString : "00:00"
        color: "white"
    }

    Button {
        text: "-10s"
        background: Rectangle { color: "transparent" }
        onClicked: if (player) player.rewind(10000)
    }

    Button {
        text: "+10s"
        background: Rectangle { color: "transparent" }
        onClicked: if (player) player.fastForward(10000)
    }

    Button {
        text: "■"
        background: Rectangle { color: "transparent" }
        onClicked: if (player) player.stop()
    }

    // 这个是全屏按钮功能，提供 点击事件 需要优化全屏功能
    Button {
        text: "⛶"
        background: Rectangle { color: "transparent" }
        onClicked: {
               // 切换全屏 / 退出全屏
               if (visibility === Window.FullScreen) {
                   visibility = Window.Windowed;  // 退出全屏
               } else {
                   visibility = Window.FullScreen; // 进入全屏
               }
        }
    }
}
