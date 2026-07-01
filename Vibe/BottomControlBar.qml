
// 组件：底部控制栏BcakControlBar

import QtQuick.Controls 2.15
import QtQuick 2.15
import QtQuick.Layouts
import QtMultimedia





ColumnLayout {
    required property var player
    property var window
    spacing: 8

    PlaySlider {
        player: parent.player
        window: parent.window
    }

    VolumeSlider {
        player: parent.player
    }

}

