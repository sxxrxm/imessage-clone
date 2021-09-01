//
//  UserInfo.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/09/01.
//

import Combine
import Foundation

class UserInfo: ObservableObject{
    let userID = UUID()
    @Published var username = ""
}
