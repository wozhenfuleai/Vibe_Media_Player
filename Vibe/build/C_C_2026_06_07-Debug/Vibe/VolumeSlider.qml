import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//   组成是 ： 按钮，滑动条，以及一个普通的Item用作填充物
RowLayout {
    spacing: 10

    Button {
        text: "🔊"
        background: Rectangle { color: "transparent" }
    }

    Slider {
        Layout.preferredWidth: 200
        value: 0.7
    }

    Item {
        Layout.fillWidth: true
        Rectangle {
                anchors.fill: parent   // 让矩形充满整个 Item
        }
    }
}
