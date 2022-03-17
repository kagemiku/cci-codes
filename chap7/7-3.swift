import Foundation

struct Record {
    let id: Int
    let title: String
    let music: Data
}

class Player {
    private var record: Record?
    private var isPlaying = false
    private var currentTime = 0

    init() {}

    func setRecord(_ record: Record?) {}
    func play() {}
    func stop() {}
}

class Display {
    init() {}

    func showText(_ text: String) {}
}

class JukeBok {
    private let records: [Record]
    private let player = Player()
    private let display = Display()

    init(records: [Record]) {
        self.records = records
    }

    func displayList() {}
    func selectRecord(id: Int) {}
    func play() {}
    func stop() {}
}

