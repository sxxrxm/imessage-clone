//
//  ChatScreenModel.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/09/01.
//

import Combine
import Foundation

final class ChatScreenModel: ObservableObject{
    private var webSocketTask: URLSessionWebSocketTask?
    
    func connect (){
            let url = URL(string: "ws://127.0.0.1:8080/chat")!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.receive(completionHandler: onReceive)
        webSocketTask?.resume()
    }
    
    func disconnect(){
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
    }
    
    private func onReceive(incoming:Result<URLSessionWebSocketTask.Message, Error>){
        
    }
    
    deinit {
        disconnect()
    }
    
}

