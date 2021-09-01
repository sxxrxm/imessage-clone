//
//  ChatScreen.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/08/27.
//

import SwiftUI

struct ChatScreen: View{
    @State private var message = ""
    
    var body: some View{
        VStack{
            //Chat history.
            ScrollView{
                
            }
            
            HStack{
                TextField("Message", text: $message)
                    .padding(10)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(5)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
            }
        }
    }
}
