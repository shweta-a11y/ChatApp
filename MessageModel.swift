//
//  MessageModel.swift
//  ChatApp
//
//  Created by Shweta Gupta on 13/10/23.
//

import UIKit

import Foundation

struct Message {
    let messageID: String
    let senderID: String
    let messageType: String
    let receiverID: String
    let chatType: String
    let message: String
    let isSelf: Bool
    let chatToken: String

    func toJSONObject() -> [String: Any] {
        return [
            "message_id": messageID,
            "sender_id": senderID,
            "message_type": messageType,
            "receiver_id": receiverID,
            "chat_type": chatType,
            "message": message,
            "self": isSelf,
            "chat_token": chatToken
        ]
    }

    static func fromJSONObject(_ jsonObject: [String: Any]) -> Message? {
        // Implement the logic to parse the JSON data and create a Message object
        return nil
    }
}

