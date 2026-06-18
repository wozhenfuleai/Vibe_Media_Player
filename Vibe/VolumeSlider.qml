import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//   组成是 ： 按钮，滑动条，以及一个普通的Item用作填充物
RowLayout {
    property var player
    spacing: 10

    Button {
        text: "🔊"
        background: Rectangle { color: "transparent" }
        onClicked: if (player) player.volumeUp(5)
    }

    Slider {
        Layout.preferredWidth: 200
        from: 0
        to: 100
        value: player ? player.volume : 0
        onMoved: {
            if (player) {
                player.volume = Math.round(value)
            }
        }
    }

    Button {
        text: "🔉"
        background: Rectangle { color: "transparent" }
        onClicked: if (player) player.volumeDown(5)
    }

    Item {
        Layout.fillWidth: true
        Rectangle {
                anchors.fill: parent   // 让矩形充满整个 Item
        }
    }
}
