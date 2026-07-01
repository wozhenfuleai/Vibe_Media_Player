
//组件：音量控制条

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtMultimedia 5.15

RowLayout {
    id: root

    required property var player

    // 新增紧凑模式：嵌入底部单行控制栏时使用
    property bool compact: false
    property real savedVolume: 70

    spacing: compact ? 4 : 8

    // 音量滚动slider
    Slider {
        Layout.preferredWidth: compact ? 70 : 200
        Layout.fillWidth: !compact
        from: 0
        to: 100
        value: player ? player.volume : 0
        onMoved: {
            if (player && typeof player.volume !== 'undefined') {
                player.volume = Math.round(value)
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
            }
        }
    }

    // 紧凑模式下隐藏百分比文字，节省横向空间
    Label {
        visible: !root.compact
        text: player && typeof player.volume !== 'undefined' ? Math.round(player.volume) + "%" : "0%"
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





