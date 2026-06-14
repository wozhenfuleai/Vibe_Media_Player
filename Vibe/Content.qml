import QtQuick
import QtMultimedia

Item {
    id: root

    property alias player: mediaPlayer
    property alias audioOutput: audioOut
    readonly property string fileName: Actions.fileNameFromUrl(mediaPlayer.source)

    MediaPlayer {
        id: mediaPlayer
        audioOutput: AudioOutput {
            id: audioOut
            volume: 0.7
        }
    }
}
