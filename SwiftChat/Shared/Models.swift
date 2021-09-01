//
//  Models.swift
//  SwiftChat
//
//  Created by sxxrxm on 2021/09/01.
//

import Foundation

struct SubmittedChatMessage: Encodable {
    let message: String
}

struct ReceivingChatMessage: Decodable, Identifiable {
    let date: Date
    let id: UUID
    let message: String
}
