import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
RowLayout {

    // 播放功能
    Button {
        text: "▶"
        background: Rectangle { color: "transparent" }
    }

    // 设置当前播放进度， 可以删除，因为滑动条更加直观
    Label {
        text: "00:00"
        color: "white"
    }

    // 设置当前播放进度对应上的滑动条，和上方的label可能需要做关联
    Slider {
        Layout.fillWidth: true
        value: 0.3
    }

    // 显示当前播放进度
    Label {
        text: "04:20"
        color: "white"
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
