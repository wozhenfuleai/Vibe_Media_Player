import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Dialog {
    id: root

    modal: true
    focus: true
    padding: 20
    standardButtons: Dialog.Ok
    title: qsTr("关于 %1").arg(appName)

    readonly property string appName: Qt.application.name.length > 0
                                      ? Qt.application.name
                                      : "Vibe Media Player"

    onAccepted: close()
    onRejected: close()

    contentItem: ColumnLayout {
        spacing: 14
        implicitWidth: 400

        RowLayout {
            spacing: 16
            Layout.fillWidth: true

            Rectangle {
                width: 64
                height: 64
                radius: 8
                color: "#333333"
                Layout.alignment: Qt.AlignTop

                Label {
                    anchors.centerIn: parent
                    text: "▶"
                    font.pixelSize: 28
                    color: "#FFFFFF"
                }
            }

            ColumnLayout {
                spacing: 6
                Layout.fillWidth: true

                Label {
                    text: root.appName
                    font.bold: true
                    font.pixelSize: 18
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("版本 %1").arg(
                              Qt.application.version.length > 0
                              ? Qt.application.version
                              : "0.1")
                    opacity: 0.85
                }

                Label {
                    text: qsTr("基于 Qt 开发的轻量级音视频播放器。")
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    opacity: 0.85
                }
            }
        }

        Label {
            text: qsTr("支持多种常见音视频格式，提供流畅的播放体验。")
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            opacity: 0.75
            font.pixelSize: 12
        }

        Label {
            text: qsTr("Copyright © 2026 张训甫、林建华、吴永超")
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            opacity: 0.65
            font.pixelSize: 11
        }

        Label {
            text: qsTr("基于 GNU Lesser General Public License v2.1 许可发布。")
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            opacity: 0.65
            font.pixelSize: 11
        }

        Label {
            text: qsTr("构建于 Qt %1").arg(Qt.version)
            opacity: 0.55
            font.pixelSize: 11
        }
    }
}
