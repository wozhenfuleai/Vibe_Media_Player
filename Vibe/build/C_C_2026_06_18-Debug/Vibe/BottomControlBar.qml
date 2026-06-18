import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import QtMultimedia

// 底部控制栏
ColumnLayout {

//               anchors.margins: 8
    id: root

    required property MediaPlayer mediaPlayer
    required property AudioOutput audioOutput
    required property Window window

    spacing: 8

    PlaySlider {
        Layout.fillWidth: true
        mediaPlayer: root.mediaPlayer
        window: root.window
    }
    // 音量控制行  should be extraceted as a document
    VolumeSlider {
        Layout.fillWidth: true
        audioOutput: root.audioOutput
    }
}
/*
// 【修改】底部控制栏：由双行 ColumnLayout 合并为单行 RowLayout
RowLayout {
    id: root

    required property MediaPlayer mediaPlayer
    required property AudioOutput audioOutput
    required property Window window

    spacing: 0

    PlaySlider {
        Layout.fillWidth: true
        mediaPlayer: root.mediaPlayer
        audioOutput: root.audioOutput
        window: root.window
    }
}*/