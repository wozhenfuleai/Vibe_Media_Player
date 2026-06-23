
//组件：音量控制条

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtMultimedia 5.15

RowLayout {
    id: root

    // 接受任意对象作为 audioOutput（shim 环境下为 QtObject）
    property var audioOutput

    // 新增紧凑模式：嵌入底部单行控制栏时使用
    property bool compact: false

// <<<<<<< HEAD
//     property real savedVolume: 0.7
//     // 组成是：按钮，滑动条，以及一个普通的 Item 用作填充物（注释保留，旧实现已弃用）
//     property var player

//     // 开启紧凑模式
//     spacing: compact ? 4 : 8

//     Button {
//         // 静音按钮
//         id: muteButton
//         Layout.preferredWidth: compact ? 28 : 36
//         Layout.preferredHeight: compact ? 28 : 36
//         ToolTip.visible: hovered
//         //M快捷键逻辑
//         /*ToolTip.text: root.audioOutput.volume > 0 ? "静音 (M)" : "取消静音 (M)"
//         onClicked: {
//             if (root.audioOutput.volume > 0) {
//                 root.savedVolume = root.audioOutput.volume
//                 root.audioOutput.volume = 0
//             } else {
//                 root.audioOutput.volume = root.savedVolume > 0 ? root.savedVolume : 0.7
//             }
//         }*/
//         background: Rectangle {
//             radius: compact ? 14 : 18
//             color: muteButton.down ? "#40FFFFFF" : (muteButton.hovered ? "#25FFFFFF" : "transparent")
//         }
//     }
// =======
    property real savedVolume: 70
    property var player

    spacing: compact ? 4 : 8
// >>>>>>> feature/core

    // 音量滚动slider
    Slider {
        Layout.preferredWidth: compact ? 70 : 200
        Layout.fillWidth: !compact
        from: 0
        to: 100
        value: audioOutput ? Math.round(audioOutput.volume * 100) : (player ? player.volume : 0)
        onMoved: {
            if (player && typeof player.volume !== 'undefined') {
                player.volume = Math.round(value)
            } else if (audioOutput) {
                audioOutput.volume = Math.round(value) / 100
            }
        }
    }

    Button {
        id: volumeButton
        implicitWidth: 36
        implicitHeight: 32
        padding: 8
        palette.buttonText: "#FFFFFF"
        text: {
            if (player && typeof player.volume !== "undefined")
                return player.volume > 0 ? "🔉" : "🔇"
            if (audioOutput)
                return audioOutput.volume > 0 ? "🔉" : "🔇"
            return "🔉"
        }
        contentItem: Text {
            text: volumeButton.text
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
            radius: 4
            color: volumeButton.down ? "#55FFFFFF"
                                     : (volumeButton.hovered ? "#30FFFFFF" : "#20FFFFFF")
            border.color: volumeButton.hovered || volumeButton.down ? "#90FFFFFF" : "#45FFFFFF"
            border.width: 1
        }
        onClicked: {
            if (player && typeof player.volume !== "undefined") {
                if (player.volume > 0) {
                    root.savedVolume = player.volume
                    player.volume = 0
                } else {
                    player.volume = root.savedVolume > 0 ? root.savedVolume : 70
                }
            } else if (audioOutput) {
                if (audioOutput.volume > 0) {
                    root.savedVolume = Math.round(audioOutput.volume * 100)
                    audioOutput.volume = 0
                } else {
                    audioOutput.volume = (root.savedVolume > 0 ? root.savedVolume : 70) / 100
                }
            }
        }
    }

    // 紧凑模式下隐藏百分比文字，节省横向空间
    Label {
        visible: !root.compact
        text: root.audioOutput ? Math.round(root.audioOutput.volume * 100) + "%" : (player && typeof player.volume !== 'undefined' ? Math.round(player.volume) + "%" : "0%")
        // color: Actions.textPrimary
        color: "white"
        font.family: "monospace"
        font.pixelSize: 12
        Layout.preferredWidth: 40
        horizontalAlignment: Text.AlignHCenter
    }

    // ljh  logic insertion  ----- need view
    Item {
        Layout.fillWidth: true
        Rectangle {
                anchors.fill: parent   // 让矩形充满整个 Item
        }
    }
}





