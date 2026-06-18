import QtQuick.Controls
import QtQuick
import QtQuick.Layouts


// 底部控制栏BcakControlBar
ColumnLayout {
    property var player
    spacing: 8

//               anchors.margins: 8

    PlaySlider {
        player: parent.player
    }
    // 音量控制行  should be extraceted as a document
    VolumeSlider {
        player: parent.player
    }
}

//TopTitleBar
