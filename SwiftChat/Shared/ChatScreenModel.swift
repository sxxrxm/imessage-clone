//
//  ChatScreenModel.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/09/01.
//
import Combine
import Foundation

final class ChatScreenModel: ObservableObject{
    @Published private(set) var messages: [ReceivingChatMessage] = []
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
        webSocketTask?.receive(completionHandler: onReceive)
        
        if case .success(let message) = incoming{
            onMessage(message: message)
        }
        else if case .failure(let error) = incoming{
            print("Error", error)
        }
    }
    
    private func onMessage(message: URLSessionWebSocketTask.Message){
        if case .string(let text) = message{
            guard let data = text.data(using: .utf8),
                  let chatMessage = try? JSONDecoder().decode(ReceivingChatMessage.self, from: data)
            else{
                return
            }
            
            DispatchQueue.main.async {
                self.messages.append(chatMessage)
            }
        }
    }
    
    deinit {
        disconnect()
    }
    
    func send(text: String){
        let message = SubmittedChatMessage(message: text)
        guard let json = try? JSONEncoder().encode(message),
              let jsonString = String(data: json, encoding: .utf8)
        else {
            return
        }
        
        webSocketTask?.send(.string(jsonString)){ error in
            if let error = error{
                print("Error sending message", error)
            }
        }
    }
    
    
}

