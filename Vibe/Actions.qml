import QtQuick
import QtQuick.Controls

Item {
    property alias open: _open
    property alias quit: _quit
    property alias about: _about

    Action {
        id: _open
        text: qsTr("&Open...")
        icon.name: "document-open"
        shortcut: StandardKey.Open
    }

    Action {
        id: _quit
        text: qsTr("&Quit")
        shortcut: StandardKey.Quit
        icon.name: "application-quit"

        onTriggered: Qt.quit()
    }

    Action {
        id: _about
        text: qsTr("&About")
        icon.name: "help-about"
    }
}
