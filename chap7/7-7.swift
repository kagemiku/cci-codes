/*
Spec
* Send message to server
* Get message from server
*/

import Foundation

struct User {
    let id: Int
    let name: String
}

struct Message {
    let id: Int
    let user: User
    let text: String
    let time: Date
}

struct Room {
    let id: Int
    let users: [User]
    let name: String
}

class ChatServer {
    func sendMessage(_ message: Message, to roomID: Int) {}
    func retrieveMessages(from roomID: Int) -> [Message] { [] }
}

