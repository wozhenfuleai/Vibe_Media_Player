import QtCore
import QtQuick 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.15

Item {
    property alias fileOpen: _fileOpen
    property alias about: _about

    FileDialog {
        id: _fileOpen
        title: "Select some files"
        currentFolder: StandardPaths.standardLocations
                        (StandardPaths.DocumentLocation)[0]
        fileMode: FileDialog.OpenFiles
        nameFilters: ["Audio File (*.mp3 *.wav *.ogg)"]
    }

    MessageDialog {
        id: _about
        modality: Qt.WindowModal
        buttons: MessageDialog.Ok
        text: "vibe-player"
        informativeText: qsTr("vibe-player is a free software")
        detailedText: "Copyright©2026 Xunfu Zhang Jianhua Lin Yongchao Wu"
    }
}
