import Foundation

protocol DataBase {}
class SimpleDB: DataBase {}

struct Section {
    let no: Int
    let isUsed: Bool
}

class PaymentMachine {
    typealias PaymentID = Int

    private let id: Int
    private let floorID: Int
    private let db: DataBase
    private var paymentingNo: Int?
    private var isPaymenting = false

    init(id: Int, floorID: Int, db: DataBase) {
        self.id = id
        self.floorID = floorID
        self.db = db
    }

    func startPayment(floorID: Int, sectionNo: Int) {}
    func pay(value: Int) -> PaymentID { 0 }
}

class Floor {
    private let id: Int
    private let sections: [Section]
    private let paymentMachines: [PaymentMachine]

    init(id: Int, sections: [Section], paymentMachines: [PaymentMachine]) {
        self.id = id
        self.sections = sections
        self.paymentMachines = paymentMachines
    }
}

class Gate {
    private let db: DataBase
    private var isClosed = true

    init(db: DataBase) {
        self.db = db
    }

    func insertPaymentCard(id: PaymentMachine.PaymentID) -> Bool { false }
}

class Parking {
    private let floors: [Floor]
    private let gate: Gate

    init(floors: [Floor], gate: Gate) {
        self.floors = floors
        self.gate = gate
    }

    func startPark(floor: Floor, section: Section) {}
    func endPark(floor: Floor, section: Section) {}
}

