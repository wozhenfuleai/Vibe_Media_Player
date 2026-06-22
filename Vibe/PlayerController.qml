import QtQuick 2.15

// PlayerController.qml — QML shim for local testing
// Deprecated: 真实逻辑由 C++ `PlayerController` 提供，
// 这里仅作 qmlscene 运行时占位，实现最小交互逻辑以便 UI 调试。
QtObject {
    id: self

    // properties (简单模拟，与 C++ 接口保持一致)
    property bool isPlaying: false
    property int duration: 0
    property string durationString: "00:00"
    property string currentFileName: ""
    property bool isMediaLoaded: false
    property int position: 0
    property string positionString: "00:00"
    property int positionPercent: 0
    property int volume: 70
    property string mediaInfoJson: ""
    property string lastError: ""

    // minimal methods so QML code can call them without error
    function setVolume(vol) {
        vol = Math.max(0, Math.min(100, vol))
        self.volume = vol
    }
    function setPosition(ms) { self.position = ms }
    function setPositionPercent(pct) {
        if (self.duration > 0) self.position = Math.round(self.duration * pct / 100)
    }
    function seekBy(deltaMs) { self.position = Math.max(0, self.position + deltaMs) }
    function fastForward(deltaMs) { seekBy(Math.abs(deltaMs)) }
    function rewind(deltaMs) { seekBy(-Math.abs(deltaMs)) }
    function probeFile(url) {
        // stub: simulate async probe result
        console.log("(shim) probeFile called", url)
        self.mediaInfoJson = "{\"shim\":true}"
    }
    function setProbeProgram(p) { console.log("(shim) setProbeProgram", p) }
    function loadFile(url) {
        self.currentFileName = (url && url.toString) ? url.toString() : String(url)
        self.isMediaLoaded = true
        self.duration = 180000
        self.position = 0
    }
    function loadAndPlay(url) { loadFile(url); play() }
    function play() { self.isPlaying = true }
    function pause() { self.isPlaying = false }
    function stop() { self.isPlaying = false; self.position = 0 }
    function playPause() { self.isPlaying = !self.isPlaying }
    function adjustVolume(delta) { setVolume(self.volume + delta) }
    function volumeUp(delta) { adjustVolume(Math.abs(delta || 5)) }
    function volumeDown(delta) { adjustVolume(-Math.abs(delta || 5)) }
    function setVideoOutput(output) { /* no-op in shim */ }
    function openNewWindow() { console.log("(shim) openNewWindow") }
}
