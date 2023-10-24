//
//  SocketManager.swift
//  ChatApp
//
//  Created by Shweta Gupta on 13/10/23.
//

import UIKit
import Foundation
import Starscream

class WebSocketManager {
    static let shared = WebSocketManager()
    let messages : Array = [Any]()
    private var socket: WebSocket?
    
    private init() {
        // Initialize WebSocket connection here
        if let url = URL(string: "wss://io.pixelsoftwares.com:5542") {
            socket = WebSocket(request: URLRequest(url: url))
            socket?.delegate = self
        }
    }
    
    func connect() {
        socket?.connect()
    }
    
    func disconnect() {
        socket?.disconnect()
    }
    
    func sendMessage(message: String) {
        let messageData = ["message_id": "123",
                           "sender_id": "409",
                           "message_type": "1",
                           "receiver_id": "10",
                           "chat_type": "1",
                           "message": message,
                           "self": "true",
                           "chat_token": "PERSONEL_CHAT_5109461693311458785"]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: messageData)
            let jsonString = String(data: jsonData, encoding: .utf8)
            
            if let messageString = jsonString {
                socket?.write(string: messageString)
                
            }
        } catch {
            print("Error sending message: \(error)")
        }
    }
}

extension WebSocketManager: WebSocketDelegate {
    
    func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {
        switch event {
        case .connected(_):
            // Handle the connection event
            break
            
        case .disconnected(let reason, _):
            // Handle the disconnection event
            print("Disconnected: \(reason)")
            break
            
        case .text(let message):
            // Handle incoming messages here
            print("Received message: \(message)")
            break
            
        default:
            break
        }
    }
    
}
