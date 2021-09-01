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
                
            }.onAppear(perform:
                onAppear
            ).onDisappear(perform: onDisappear)
            
            //you can just use .onAppear(model.connect) too but this way is easier to find
            
            HStack{
                TextField("Message", text: $message)
                    .padding(10)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(5)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Image(systemName: "arrowshape.turn.up.right").font(.system(size: 20))
                }
            .padding()
            .disabled(message.isEmpty)
            }
            .padding()
        }
    }

}
