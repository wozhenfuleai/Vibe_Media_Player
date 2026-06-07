import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {


    //todo  将这个提升到垂直区域，并且设置为工具栏，内部包含文件打开功能
    Button {
        text: "<"
        background: Rectangle { color: "transparent" }
    }

    // todo 将这个标签删除， 或者将这个标签显示为当前文件名字
    Label {
        Layout.fillWidth: true
        text: "视频播放"
        color: "white"
        horizontalAlignment: Qt.AlignHCenter
    }
    // 提供相应的功能接口，可以预留用作装饰
    Button {
        text: "⋮"
        background: Rectangle { color: "transparent" }
    }
}
