//
//  ChatScreen.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/08/27.
//

import SwiftUI

struct ChatScreen: View{
    @StateObject private var model = ChatScreenModel()
    @State private var message = ""
    
    private func onAppear(){
        model.connect()
    }
    
    private func onDisappear(){
        model.disconnect()
    }
    
    var body: some View{
        VStack{
            //Chat history.
            ScrollView{
                LazyVStack(spacing: 8){
                    ForEach(model.messages){ message in
                        Text(message.message)
                    }
                }
            }.onAppear(perform:
                onAppear
            ).onDisappear(perform: onDisappear)
            
            //you can just use .onAppear(model.connect) too but this way is easier to find
            
            HStack{
                TextField("Message", text: $message, onEditingChanged:{ _ in },
                          onCommit: onCommit)
                
                Button(action: onCommit){
                    
                }
            }
            .padding()
        }
    }
    
    private func onCommit(){
        if !message.isEmpty{
            model.send(text: message)
            message = ""
        }
    }

}
