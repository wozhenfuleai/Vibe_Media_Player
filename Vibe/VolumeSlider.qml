import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

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
}

