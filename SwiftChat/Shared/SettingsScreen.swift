//
//  SettingsScreen.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/09/01.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject private var userInfo: UserInfo
    
    private var isUsernameValid: Bool{
        !userInfo.username.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View{
        Form{
            Section(header: Text("Username")){
                TextField("Soorim Choi", text: $userInfo.username)
                
                NavigationLink("Continue", destination: ChatScreen()).disabled(!isUsernameValid)
            }
        }.navigationTitle("Settings")
    }
}
