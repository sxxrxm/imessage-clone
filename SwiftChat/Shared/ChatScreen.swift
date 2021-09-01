//
//  ChatScreen.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/08/27.
//

import SwiftUI

struct ChatScreen: View{
    @EnvironmentObject private var userInfo: UserInfo
    @StateObject private var model = ChatScreenModel()
    @State private var message = ""
    
    private func onAppear(){
        model.connect(username: userInfo.username, userID: userInfo.userID)
    }
    
    private func onDisappear(){
        model.disconnect()
    }
    
    var body: some View{
        VStack{
            //Chat history.
            ScrollView{
                ScrollViewReader{ proxy in
                LazyVStack(spacing: 8){
                    ForEach(model.messages){ message in
                        ChatMessageRow(message: message, isUser: message.userID == userInfo.userID)
                            .id(message.id)
                    }
                }
                .onChange(of: model.messages.count){ _ in
                    scrollToLastMessage(proxy: proxy)
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
    
    struct ChatMessageRow: View {
        static private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            return formatter
        }()
        
        let message: ReceivingChatMessage
        let isUser: Bool
        
        var body: some View{
            HStack{
                if isUser{
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack{
                        Text(message.user).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 12))
                        
                        Text(Self.dateFormatter.string(from: message.date)).font(.system(size: 10)).opacity(0.7)
                    }
                    Text(message.message)
                }
                .foregroundColor(isUser ? .white : .black)
                .padding(10)
                .background(isUser ? Color.blue : Color(white: 0.95))
                .cornerRadius(5)
                .padding(.leading, 20)
                
                if !isUser{
                    Spacer()
                }
            }.padding( .trailing, 20)
        }
    }
    
    private func onCommit(){
        if !message.isEmpty{
            model.send(text: message)
            message = ""
        }
    }
    
    private func scrollToLastMessage(proxy: ScrollViewProxy){
        if let lastMessage = model.messages.last {
            withAnimation( .easeOut(duration: 0.4)){
                proxy.scrollTo(lastMessage.id, anchor: .bottom)
            }
        }
    }

}
