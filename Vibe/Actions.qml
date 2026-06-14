pragma Singleton
import QtQuick

QtObject {
    function formatTime(ms) {
        if (isNaN(ms) || ms < 0)
            return "00:00"
        var totalSeconds = Math.floor(ms / 1000)
        var minutes = Math.floor(totalSeconds / 60)
        var seconds = totalSeconds % 60
        return (minutes < 10 ? "0" : "") + minutes + ":"
             + (seconds < 10 ? "0" : "") + seconds
    }

    function fileNameFromUrl(url) {
        if (!url || url.toString() === "")
            return "未打开文件"
        var path = decodeURIComponent(url.toString())
        var idx = path.lastIndexOf("/")
        if (idx < 0)
            idx = path.lastIndexOf("\\")
        if (idx >= 0)
            path = path.substring(idx + 1)
        if (path.startsWith("file:///"))
            path = path.substring(8)
        return path || "未打开文件"
    }
}