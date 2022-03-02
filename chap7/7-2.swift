enum Role {
    case responder
    case manager
    case director

    // responder: 0, manager: 1, director: 2
    var priority: Int { ... }
}

struct Employee {
    let id: String
    let role: Role
    var isAvailable: Bool
}

class CallCenter {
    let employeeGroups: [[Employee]]

    func dispatchCall() -> Employee? {
        for employeeGroup in employeeGroups {
            if let employee = employeeGroup.first(where: { $0.isAvailable }) {
                employee.isAvailable.toggle()
                return employee
            }
        }

        return nil
    }
}
