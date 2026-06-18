import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
/*
//   组成是 ： 按钮，滑动条，以及一个普通的Item用作填充物
RowLayout {
    id: root

    required property AudioOutput audioOutput

    property real savedVolume: 0.7

    Button {
        text: root.audioOutput.volume > 0 ? "🔊" : "🔇"
        onClicked: {
            if (root.audioOutput.volume > 0) {
                root.savedVolume = root.audioOutput.volume
                root.audioOutput.volume = 0
            } else {
                root.audioOutput.volume = root.savedVolume > 0 ? root.savedVolume : 0.7
            }
        }
        background: Rectangle { color: "transparent" }
        contentItem: Text {
            text: parent.text
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Slider {
        Layout.preferredWidth: 200
        from: 0
        to: 1
        stepSize: 0.01
        value: root.audioOutput.volume
        onMoved: root.audioOutput.volume = value
    }

    Label {
        text: Math.round(root.audioOutput.volume * 100) + "%"
        color: "white"
        font.family: "monospace"
        Layout.preferredWidth: 40
        horizontalAlignment: Text.AlignHCenter
    }

    Item {
        Layout.fillWidth: true
    }
}*/
RowLayout {
    id: root

    required property AudioOutput audioOutput

    // 新增紧凑模式：嵌入底部单行控制栏时使用
    property bool compact: false

    property real savedVolume: 0.7

    spacing: compact ? 4 : 8

    Button {
        id: muteButton
        Layout.preferredWidth: compact ? 28 : 36
        Layout.preferredHeight: compact ? 28 : 36
        ToolTip.visible: hovered
        //M快捷键逻辑
        /*ToolTip.text: root.audioOutput.volume > 0 ? "静音 (M)" : "取消静音 (M)"
        onClicked: {
            if (root.audioOutput.volume > 0) {
                root.savedVolume = root.audioOutput.volume
                root.audioOutput.volume = 0
            } else {
                root.audioOutput.volume = root.savedVolume > 0 ? root.savedVolume : 0.7
            }
        }*/
        background: Rectangle {
            radius: compact ? 14 : 18
            color: muteButton.down ? "#40FFFFFF" : (muteButton.hovered ? "#25FFFFFF" : "transparent")
        }
        contentItem: Text {
            text: root.audioOutput.volume > 0 ? "🔊" : "🔇"
            color: Actions.textPrimary
            font.pixelSize: compact ? 14 : 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Slider {
        Layout.preferredWidth: compact ? 70 : 200
        Layout.fillWidth: !compact
        from: 0
        to: 1
        stepSize: 0.01
        value: root.audioOutput.volume
        onMoved: root.audioOutput.volume = value
    }

    // 紧凑模式下隐藏百分比文字，节省横向空间
    Label {
        visible: !root.compact
        text: Math.round(root.audioOutput.volume * 100) + "%"
        color: Actions.textPrimary
        font.family: "monospace"
        font.pixelSize: 12
        Layout.preferredWidth: 40
        horizontalAlignment: Text.AlignHCenter
    }
}


