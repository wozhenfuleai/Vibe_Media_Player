import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtMultimedia

Item {
    id:content
    anchors.fill: parent

    property alias dialogs: _dialogs
    property alias player: _player
    property alias songMetaData: _meteData

    TextField{
        id:_meteData
        property url songUrl
        TapHandler{
            onTapped:{
                player.play()
            }
        }
    }

    Dialogs{
        id:_dialogs
        fileOpen.onRejected: {
            return;
        }
        // fileOpen is a group property
        fileOpen{
            onAccepted: {
                let filePath = fileOpen.selectedFile;
                player.source = filePath; //触发player加载mp3文件，然后读取元数据
                songMetaData.songUrl=filePath; //添加mp3文件路径到元数据对象中
                console.log("Mp3 path: ",songMetaData.songUrl)
            }
        }
    }

    VibePlayer{
        id:_player

        onMediaStatusChanged: {
            if (player.mediaStatus === MediaPlayer.LoadedMedia) {
                console.log("Audio loaded successfully")
                songMetaData.text = metaData.value("Title")
            } else if (player.mediaStatus === MediaPlayer.InvalidMedia) {
                console.log("Failed to load audio:", errorString)
            }
        }
    }
}
