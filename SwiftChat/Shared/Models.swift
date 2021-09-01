//
//  Models.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/09/01.
//

import Foundation

struct SubmittedChatMessage: Decodable {
    let message: String
}

struct ReceivingChatMessage: Encodable, Identifiable {
    let date = Date()
    let id = UUID()
    let message: String
}
