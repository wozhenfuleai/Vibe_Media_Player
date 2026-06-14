import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtCore
import QtMultimedia

ApplicationWindow {
    id: window
    width: 1280
    height: 800
    visible: true
    color: "#090b10"
    title: player.isMediaLoaded ? qsTr("%1 - Vibe Video Player").arg(player.currentFileName) : qsTr("Vibe Video Player")

    PlayerController {
        id: player
    }

    FileDialog {
        id: openDialog
        title: qsTr("Open Video")
        currentFolder: StandardPaths.standardLocations(StandardPaths.MoviesLocation)[0]
        fileMode: FileDialog.OpenFile
        nameFilters: [
            qsTr("Video files (*.mp4 *.mkv *.avi *.mov *.webm *.m4v *.flv)"),
            qsTr("All files (*)")
        ]

        onAccepted: player.loadAndPlay(selectedFile)
    }

    Shortcut {
        sequences: [StandardKey.Open]
        onActivated: openDialog.open()
    }

    Shortcut {
        sequence: "Space"
        onActivated: player.playPause()
    }

    Shortcut {
        sequence: "Media Play"
        onActivated: player.playPause()
    }

    Shortcut {
        sequence: "Media Pause"
        onActivated: player.playPause()
    }

    Shortcut {
        sequence: "Media Stop"
        onActivated: player.stop()
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Open Video...")
                onTriggered: openDialog.open()
            }
            MenuItem {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: qsTr("Playback")
            MenuItem {
                text: player.isPlaying ? qsTr("Pause") : qsTr("Play")
                onTriggered: player.playPause()
            }
            MenuItem {
                text: qsTr("Stop")
                onTriggered: player.stop()
            }
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            spacing: 12

            ToolButton {
                text: qsTr("Open")
                icon.name: "document-open"
                display: AbstractButton.TextBesideIcon
                onClicked: openDialog.open()
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 2

                Label {
                    text: qsTr("Vibe Video Player")
                    font.pixelSize: 18
                    font.bold: true
                    color: "#f3f5f9"
                }

                Label {
                    Layout.fillWidth: true
                    text: player.isMediaLoaded ? player.currentFileName : qsTr("Open a video to start playback")
                    color: "#9aa6b2"
                    elide: Text.ElideRight
                }
            }

            Rectangle {
                radius: 999
                color: player.isPlaying ? "#1f5f3a" : "#2a313d"
                border.color: player.isPlaying ? "#33d17a" : "#465163"
                border.width: 1
                implicitWidth: 112
                implicitHeight: 34

                Label {
                    anchors.centerIn: parent
                    text: player.isPlaying ? qsTr("Playing") : qsTr("Paused")
                    color: "#f3f5f9"
                    font.pixelSize: 13
                    font.bold: true
                }
            }

            ToolButton {
                text: qsTr("Quit")
                icon.name: "application-exit"
                display: AbstractButton.TextBesideIcon
                onClicked: Qt.quit()
            }
        }
    }

    background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0f141c" }
            GradientStop { position: 0.55; color: "#090b10" }
            GradientStop { position: 1.0; color: "#05070a" }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 18
        spacing: 14

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 28
            color: "#000000"
            border.color: "#253142"
            border.width: 1
            clip: true

            VideoOutput {
                id: videoOutput
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectFit
            }

            Component.onCompleted: player.setVideoOutput(videoOutput)

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: openDialog.open()
            }

            Column {
                anchors.centerIn: parent
                spacing: 14
                visible: !player.isMediaLoaded

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 88
                    height: 88
                    radius: 44
                    color: "#18202b"
                    border.color: "#2f3b4d"
                    border.width: 1

                    Text {
                        anchors.centerIn: parent
                        text: "▶"
                        color: "#f3f5f9"
                        font.pixelSize: 32
                    }
                }

                Text {
                    width: 420
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    text: qsTr("Open a video file to start playback. Supported formats include MP4, MKV, AVI, MOV, and WebM.")
                    color: "#d5dbe3"
                    font.pixelSize: 18
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 110
            radius: 22
            color: "#111722"
            border.color: "#243041"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 10

                Slider {
                    id: progressSlider
                    Layout.fillWidth: true
                    from: 0
                    to: 100
                    stepSize: 1
                    enabled: player.duration > 0
                    onMoved: player.positionPercent = Math.round(value)
                }

                Binding {
                    target: progressSlider
                    property: "value"
                    value: player.positionPercent
                    when: !progressSlider.pressed
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    ToolButton {
                        text: player.isPlaying ? qsTr("Pause") : qsTr("Play")
                        icon.name: player.isPlaying ? "media-playback-pause" : "media-playback-start"
                        display: AbstractButton.TextBesideIcon
                        onClicked: player.playPause()
                    }

                    ToolButton {
                        text: qsTr("Stop")
                        icon.name: "media-playback-stop"
                        display: AbstractButton.TextBesideIcon
                        onClicked: player.stop()
                    }

                    ToolButton {
                        text: qsTr("Open")
                        icon.name: "document-open"
                        display: AbstractButton.TextBesideIcon
                        onClicked: openDialog.open()
                    }

                    Rectangle {
                        radius: 999
                        color: "#202733"
                        border.color: "#314055"
                        border.width: 1
                        implicitHeight: 30
                        implicitWidth: 146

                        Label {
                            anchors.centerIn: parent
                            text: player.positionString + " / " + player.durationString
                            color: "#eef2f7"
                            font.pixelSize: 13
                        }
                    }

                    Item { Layout.fillWidth: true }

                    Label {
                        text: qsTr("Volume")
                        color: "#9aa6b2"
                    }

                    Slider {
                        id: volumeSlider
                        width: 160
                        from: 0
                        to: 100
                        onMoved: player.volume = Math.round(value)
                    }

                    Binding {
                        target: volumeSlider
                        property: "value"
                        value: player.volume
                        when: !volumeSlider.pressed
                    }
                }
            }
        }
    }
}
