//
//  Models.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/09/01.
//

import Foundation

struct SubmittedChatMessage: Encodable {
    let message: String
    let user: String
    let userID: UUID
}

struct ReceivingChatMessage: Decodable, Identifiable {
    let date: Date
    let id: UUID
    let message: String
    let user: String
    let userID: UUID
}
