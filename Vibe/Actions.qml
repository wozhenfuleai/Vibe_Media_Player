pragma Singleton
import QtQuick
// Action.qml  comment zxf
// 主要是一个单例js库
// 用于一些数据处理
//
// 格式化时间
// 提取文件名


QtObject {
    // 函数：格式化时间显示--用于时间戳的时间显示
    function formatTime(ms) {
        if (isNaN(ms) || ms < 0)
            return "00:00"
        var totalSeconds = Math.floor(ms / 1000)
        var minutes = Math.floor(totalSeconds / 60)
        var seconds = totalSeconds % 60
        return (minutes < 10 ? "0" : "") + minutes + ":"
             + (seconds < 10 ? "0" : "") + seconds
    }

    // 函数： 从Url中提取文件
    function fileNameFromUrl(url) {
        if (!url || url.toString() === "")
            return "未打开文件"
        // 这个是做到那个URI解码，就是浏览器中有些浏览器中文输入
        // 会出现%22 那种类似的东西，但是实际上是对应了一些特殊字符
        // 所以需要解码
        var path = decodeURIComponent(url.toString())
        // 得到真实路径之后，我们找到最后一个/ 提取出来对应的子串
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
